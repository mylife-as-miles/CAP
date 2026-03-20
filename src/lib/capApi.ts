import { supabase } from '@/src/lib/supabase';
import {
  CAP_DEFAULT_QUESTION,
  type CheckClaimError,
  type CheckClaimErrorDetail,
  type CheckClaimInput,
  type CheckClaimResponse,
  type ElevenLabsSignedUrlResponse,
  isCheckClaimError,
  isCheckClaimResponse,
  isElevenLabsSignedUrlResponse,
} from '@/shared/cap';

export class CapFunctionError extends Error {
  code: CheckClaimErrorDetail['code'];
  retryable: boolean;

  constructor(detail: CheckClaimErrorDetail) {
    super(detail.message);
    this.name = 'CapFunctionError';
    this.code = detail.code;
    this.retryable = detail.retryable;
  }
}

async function readStructuredFunctionError(error: any): Promise<CheckClaimError | null> {
  const response = error?.context;
  if (!(response instanceof Response)) {
    return null;
  }

  try {
    const payload = await response.clone().json();
    return isCheckClaimError(payload) ? payload : null;
  } catch {
    return null;
  }
}

function toFunctionError(error: CheckClaimErrorDetail | null, fallbackMessage: string): CapFunctionError {
  return new CapFunctionError(
    error ?? {
      code: 'UPSTREAM_ERROR',
      message: fallbackMessage,
      retryable: true,
    },
  );
}

export async function checkClaim(input: CheckClaimInput): Promise<CheckClaimResponse> {
  const payload: CheckClaimInput = {
    ...input,
    question: input.question?.trim() || CAP_DEFAULT_QUESTION,
    persistResult: Boolean(input.persistResult),
  };

  const { data, error } = await supabase.functions.invoke('check-claim', {
    body: payload,
  });

  if (error) {
    const structured = await readStructuredFunctionError(error);
    throw toFunctionError(structured?.error ?? null, 'Cap could not verify that right now.');
  }

  if (isCheckClaimError(data)) {
    throw new CapFunctionError(data.error);
  }

  if (!isCheckClaimResponse(data)) {
    throw toFunctionError(null, 'Cap returned a malformed verification response.');
  }

  return data;
}

export async function getElevenLabsSignedUrl(visitorId?: string): Promise<ElevenLabsSignedUrlResponse> {
  const { data, error } = await supabase.functions.invoke('elevenlabs-signed-url', {
    body: { visitorId },
  });

  if (error) {
    const structured = await readStructuredFunctionError(error);
    throw toFunctionError(structured?.error ?? null, 'Cap could not start the voice session.');
  }

  if (!isElevenLabsSignedUrlResponse(data)) {
    throw toFunctionError(null, 'Cap received an invalid voice session payload.');
  }

  return data;
}

export function buildErrorFallbackResponse(message: string): CheckClaimResponse {
  return {
    verdict: 'UNVERIFIED',
    confidence: 22,
    spokenSummary: "I couldn't verify that cleanly right now.",
    reasons: [message],
    sources: [],
  };
}
