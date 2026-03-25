import { useCallback, useState } from 'react';
import { useConversation } from '@elevenlabs/react';
import type { CheckClaimInput, CheckClaimResponse } from '@/shared/cap';
import { CAP_DEFAULT_QUESTION } from '@/shared/cap';
import { getElevenLabsSignedUrl } from '@/src/lib/capApi';

type VoiceToolPayload = Partial<CheckClaimInput>;

interface UseCapVoiceSessionOptions {
  visitorId: string;
  onCheckClaim: (input: CheckClaimInput) => Promise<CheckClaimResponse>;
  onDisconnect?: () => void;
  onError?: (message: string) => void;
}

function toVoiceToolResponse(response: CheckClaimResponse) {
  return {
    confidence: response.confidence,
    reason: response.reasons[0] ?? '',
    sourceCount: response.sources.length,
    spokenSummary: response.spokenSummary,
    verdict: response.verdict,
  };
}

export function useCapVoiceSession({
  visitorId,
  onCheckClaim,
  onDisconnect,
  onError,
}: UseCapVoiceSessionOptions) {
  const [conversationId, setConversationId] = useState<string | null>(null);
  const [lastError, setLastError] = useState<string | null>(null);
  const [messages, setMessages] = useState<{ text: string; role: 'user' | 'ai' }[]>([]);

  const conversation = useConversation({
    clientTools: {
      check_claim: (async (parameters: VoiceToolPayload) => {
        const response = await onCheckClaim({
          question: parameters.question?.trim() || CAP_DEFAULT_QUESTION,
          claimText: parameters.claimText?.trim(),
          url: parameters.url?.trim(),
          mode: 'voice',
          visitorId,
          metadata: parameters.metadata,
          persistResult: false,
        });
        return toVoiceToolResponse(response);
      }) as any,
    },
    onMessage: (message: any) => {
      setMessages((prev) => [...prev, {
        text: message.message || message.text || "",
        role: message.role || message.source || "ai"
      }]);
    },
    onDisconnect: () => {
      setConversationId(null);
      onDisconnect?.();
    },
    onError: (event: unknown) => {
      const message = event instanceof Error ? event.message : 'Cap hit a voice session error.';
      setLastError(message);
      onError?.(message);
    },
  });

  const startVoiceSession = useCallback(async () => {
    setLastError(null);
    await navigator.mediaDevices.getUserMedia({ audio: true });
    const { signedUrl } = await getElevenLabsSignedUrl(visitorId);
    const nextConversationId = await conversation.startSession({
      signedUrl,
      connectionType: 'websocket',
      userId: visitorId,
    });
    setConversationId(nextConversationId);
    return nextConversationId;
  }, [conversation, visitorId]);

  const endVoiceSession = useCallback(async () => {
    await conversation.endSession();
    setConversationId(null);
  }, [conversation]);

  return {
    conversationId,
    endVoiceSession,
    isSpeaking: conversation.isSpeaking,
    lastError,
    messages,
    sendUserMessage: conversation.sendUserMessage,
    startVoiceSession,
    status: conversation.status,
  };
}
