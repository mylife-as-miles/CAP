import type { CheckClaimResponse, CapUiVerdict } from '@/shared/cap';
import { toUiVerdict } from '@/shared/cap';

export interface StoredClaimLike {
  id: string;
  title: string;
  claim_text: string;
  category: string;
  verdict: 'CAP' | 'NO CAP' | 'HALF CAP';
  confidence: number;
  reason_summary: string;
  details?: string;
  sources?: { name: string; url: string; text?: string }[];
  created_at: string;
}

export interface ResultViewModel {
  claimId?: string;
  claimText: string;
  verdict: CapUiVerdict;
  confidence: number;
  confidenceLabel: string;
  verdictExplanation: string;
  summary: string;
  analysisCards: { id: string; title: string; text: string }[];
  sources: { name: string; url: string; text: string }[];
  meta: {
    sourceCount: string;
    auditSpeed: string;
    lastChecked: string;
    refId: string;
    reportNote: string;
  };
  share: {
    footer: string;
    shareText: string;
    shareTitle: string;
    verdict: string;
    claimText: string;
  };
}

const ANALYSIS_TITLES = [
  'Primary Signal',
  'Evidence Check',
  'Context Gap',
  'Cross-Source Read',
];

const MAX_RESULT_SOURCES = 15;

function confidenceLabel(confidence: number) {
  if (confidence >= 75) {
    return 'High';
  }

  if (confidence >= 45) {
    return 'Medium';
  }

  return 'Low';
}

function createRefId(seed: string) {
  let hash = 0;
  for (let index = 0; index < seed.length; index += 1) {
    hash = (hash * 31 + seed.charCodeAt(index)) >>> 0;
  }

  return `${hash.toString(16).toUpperCase().slice(0, 4)}-${seed.length.toString().padStart(2, '0')}`;
}

function formatTimestamp(value: string | number | Date) {
  const date = new Date(value);
  return date.toLocaleString([], {
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
}

function verdictExplanation(verdict: CapUiVerdict, fallback?: string) {
  if (fallback) {
    return fallback;
  }

  switch (verdict) {
    case 'NO CAP':
      return 'The strongest sources line up with the claim closely enough to back it.';
    case 'HALF CAP':
      return 'The claim has a real anchor, but the strongest sources add important missing context.';
    case 'UNVERIFIED':
      return 'There was not enough reliable evidence to call this confidently either way.';
    case 'CAP':
    default:
      return 'The strongest sources do not back the claim cleanly, or they contradict it outright.';
  }
}

function toAnalysisCards(reasons: string[]) {
  return reasons.slice(0, 3).map((text, index) => ({
    id: `${index + 1}`.padStart(2, '0'),
    title: ANALYSIS_TITLES[index] ?? `Reason ${index + 1}`,
    text,
  }));
}

function normalizeSourceName(title: string, url: string) {
  if (title?.trim()) {
    return title.trim();
  }

  try {
    return new URL(url).hostname.replace(/^www\./, '').toUpperCase();
  } catch {
    return 'Source';
  }
}

export function buildResultViewFromCheck(
  claimText: string,
  response: CheckClaimResponse,
  durationMs: number,
): ResultViewModel {
  const verdict = toUiVerdict(response.verdict);
  const displayText = claimText || response.normalizedQuery || response.spokenSummary;
  const cards = toAnalysisCards(
    response.reasons.length > 0
      ? response.reasons
      : ['Cap found weak evidence and could not build a stronger verdict explanation.'],
  );
  const sources = response.sources.slice(0, MAX_RESULT_SOURCES).map((source) => ({
    name: normalizeSourceName(source.title, source.url),
    url: source.url,
    text: source.snippet,
  }));
  const auditSeconds = durationMs > 0 ? `${(durationMs / 1000).toFixed(1)} Seconds` : '< 1 Second';

  return {
    claimId: response.persistedClaimId,
    claimText: displayText,
    verdict,
    confidence: response.confidence,
    confidenceLabel: confidenceLabel(response.confidence),
    verdictExplanation: verdictExplanation(verdict),
    summary: response.spokenSummary,
    analysisCards: cards,
    sources,
    meta: {
      sourceCount: `${response.sources.length || sources.length} Reviewed`,
      auditSpeed: auditSeconds,
      lastChecked: formatTimestamp(Date.now()),
      refId: createRefId(displayText),
      reportNote: 'This report was generated using live Firecrawl search and Cap edge heuristics.',
    },
    share: {
      footer: 'Checked with Firecrawl • Spoken by Cap on ElevenLabs',
      shareText: `${verdict}\n"${response.spokenSummary}"`,
      shareTitle: 'CAP',
      verdict: verdict,
      claimText: response.spokenSummary,
    },
  };
}

export function buildResultViewFromClaim(claim: StoredClaimLike): ResultViewModel {
  const cards = toAnalysisCards(
    [claim.reason_summary, claim.details].filter((value): value is string => Boolean(value?.trim())),
  );
  const sources = (claim.sources ?? []).slice(0, MAX_RESULT_SOURCES).map((source) => ({
    name: source.name || normalizeSourceName('', source.url),
    url: source.url,
    text: source.text ?? 'No snippet available for this published claim.',
  }));

  return {
    claimId: claim.id,
    claimText: claim.claim_text,
    verdict: claim.verdict,
    confidence: claim.confidence,
    confidenceLabel: confidenceLabel(claim.confidence),
    verdictExplanation: verdictExplanation(claim.verdict, claim.reason_summary),
    summary: claim.reason_summary,
    analysisCards:
      cards.length > 0
        ? cards
        : [
          {
            id: '01',
            title: 'Published Claim',
            text: 'This claim was saved earlier and does not have expanded discrepancy notes yet.',
          },
        ],
    sources,
    meta: {
      sourceCount: `${sources.length} Verified`,
      auditSpeed: 'Leaderboard',
      lastChecked: formatTimestamp(claim.created_at),
      refId: createRefId(claim.id),
      reportNote: 'This report was loaded from the CAP leaderboard without changing the existing result layout.',
    },
    share: {
      footer: 'Checked with Firecrawl • Spoken by Cap on ElevenLabs',
      shareText: `${claim.verdict}\n"${claim.claim_text}"`,
      shareTitle: 'CAP',
      verdict: claim.verdict,
      claimText: claim.claim_text,
    },
  };
}
