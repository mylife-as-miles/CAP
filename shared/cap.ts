export const CAP_DEFAULT_QUESTION = 'Is this true?';

export type CapCheckMode = 'voice' | 'manual';
export type CapApiVerdict = 'CAP' | 'NO_CAP' | 'HALF_CAP' | 'UNVERIFIED';
export type CapUiVerdict = 'CAP' | 'NO CAP' | 'HALF CAP' | 'UNVERIFIED';

export interface CheckClaimInput {
  question: string;
  claimText?: string;
  url?: string;
  mode?: CapCheckMode;
  visitorId?: string;
  metadata?: Record<string, unknown>;
  persistResult?: boolean;
}

export interface CapSource {
  title: string;
  url: string;
  snippet: string;
}

export interface CheckClaimResponse {
  verdict: CapApiVerdict;
  confidence: number;
  spokenSummary: string;
  reasons: string[];
  sources: CapSource[];
  normalizedQuery?: string;
  rawSearchSummary?: string;
  persistedClaimId?: string;
}

export interface PublishClaimAnalysisCard {
  id: string;
  title: string;
  text: string;
}

export interface PublishClaimSource {
  name: string;
  url: string;
  text: string;
}

export interface PublishClaimSnapshot {
  claimText: string;
  verdict: CapUiVerdict;
  confidence: number;
  verdictExplanation: string;
  summary: string;
  analysisCards: PublishClaimAnalysisCard[];
  sources: PublishClaimSource[];
}

export interface PublishClaimInput {
  visitorId: string;
  checkedAt: string;
  mode: CapCheckMode;
  question: string;
  claimText: string;
  url?: string;
  result: PublishClaimSnapshot;
}

export interface PublishClaimMetrics {
  laughCount: number;
  shareCount: number;
  viewCount: number;
}

export interface PublishClaimResponse {
  claimId: string;
  created: boolean;
  metrics: PublishClaimMetrics;
}

export interface CheckClaimErrorDetail {
  code: 'VALIDATION_ERROR' | 'UPSTREAM_ERROR' | 'TIMEOUT' | 'NO_EVIDENCE';
  message: string;
  retryable: boolean;
}

export interface CheckClaimError {
  error: CheckClaimErrorDetail;
}

export interface ElevenLabsSignedUrlResponse {
  signedUrl: string;
}

export const API_TO_UI_VERDICT: Record<CapApiVerdict, CapUiVerdict> = {
  CAP: 'CAP',
  NO_CAP: 'NO CAP',
  HALF_CAP: 'HALF CAP',
  UNVERIFIED: 'UNVERIFIED',
};

export const UI_TO_API_VERDICT: Record<CapUiVerdict, CapApiVerdict> = {
  CAP: 'CAP',
  'NO CAP': 'NO_CAP',
  'HALF CAP': 'HALF_CAP',
  UNVERIFIED: 'UNVERIFIED',
};

export function toUiVerdict(verdict: CapApiVerdict | CapUiVerdict): CapUiVerdict {
  return verdict in API_TO_UI_VERDICT
    ? API_TO_UI_VERDICT[verdict as CapApiVerdict]
    : (verdict as CapUiVerdict);
}

export function toApiVerdict(verdict: CapApiVerdict | CapUiVerdict): CapApiVerdict {
  return verdict in UI_TO_API_VERDICT
    ? UI_TO_API_VERDICT[verdict as CapUiVerdict]
    : (verdict as CapApiVerdict);
}

export function isCheckClaimError(value: unknown): value is CheckClaimError {
  if (!value || typeof value !== 'object') {
    return false;
  }

  const candidate = value as Record<string, unknown>;
  if (!candidate.error || typeof candidate.error !== 'object') {
    return false;
  }

  const detail = candidate.error as Record<string, unknown>;
  return (
    typeof detail.code === 'string' &&
    typeof detail.message === 'string' &&
    typeof detail.retryable === 'boolean'
  );
}

export function isCheckClaimResponse(value: unknown): value is CheckClaimResponse {
  if (!value || typeof value !== 'object') {
    return false;
  }

  const candidate = value as Record<string, unknown>;
  return (
    typeof candidate.verdict === 'string' &&
    typeof candidate.confidence === 'number' &&
    typeof candidate.spokenSummary === 'string' &&
    Array.isArray(candidate.reasons) &&
    Array.isArray(candidate.sources)
  );
}

export function isPublishClaimResponse(value: unknown): value is PublishClaimResponse {
  if (!value || typeof value !== 'object') {
    return false;
  }

  const candidate = value as Record<string, unknown>;
  const metrics = candidate.metrics as Record<string, unknown> | undefined;

  return (
    typeof candidate.claimId === 'string' &&
    typeof candidate.created === 'boolean' &&
    !!metrics &&
    typeof metrics.laughCount === 'number' &&
    typeof metrics.shareCount === 'number' &&
    typeof metrics.viewCount === 'number'
  );
}

export function isElevenLabsSignedUrlResponse(value: unknown): value is ElevenLabsSignedUrlResponse {
  return !!value && typeof value === 'object' && typeof (value as ElevenLabsSignedUrlResponse).signedUrl === 'string';
}

export function clampConfidence(value: number): number {
  return Math.max(0, Math.min(100, Math.round(value)));
}

export function createClaimSlug(input: string): string {
  const slug = input
    .toLowerCase()
    .replace(/https?:\/\//g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80);

  return slug || 'cap-check';
}
