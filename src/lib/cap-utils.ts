import type {
  HistoryEntry,
  InvestigationKind,
  InvestigationResult,
  TopCapEntry,
} from '@/src/types';

export function createId(prefix = 'cap') {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return `${prefix}-${crypto.randomUUID()}`;
  }

  return `${prefix}-${Date.now()}-${Math.random().toString(36).slice(2, 10)}`;
}

export function clamp(value: number, min: number, max: number) {
  return Math.min(max, Math.max(min, value));
}

export function normalizeText(value: string) {
  return value
    .toLowerCase()
    .replace(/^https?:\/\//, '')
    .replace(/^www\./, '')
    .replace(/[^a-z0-9]+/g, ' ')
    .trim();
}

export function ensureUrlProtocol(value: string) {
  return /^https?:\/\//i.test(value) ? value : `https://${value}`;
}

export function isHttpUrl(value: string) {
  try {
    const url = new URL(value);
    return url.protocol === 'http:' || url.protocol === 'https:';
  } catch {
    return false;
  }
}

export function looksLikeUrlIntent(value: string) {
  const trimmed = value.trim();
  return /^(https?:\/\/|www\.)/i.test(trimmed) || /^[^\s]+\.[^\s]+$/.test(trimmed);
}

export function detectInvestigationKind(value: string): InvestigationKind | 'invalid-url' {
  const trimmed = value.trim();
  if (!trimmed) {
    return 'claim';
  }

  if (isHttpUrl(trimmed)) {
    return 'url';
  }

  if (/^www\./i.test(trimmed)) {
    return 'url';
  }

  return looksLikeUrlIntent(trimmed) ? 'invalid-url' : 'claim';
}

export function formatCompactNumber(value: number) {
  return value >= 1000 ? `${(value / 1000).toFixed(1)}k` : value.toString();
}

export function formatDateTime(value: string) {
  return new Intl.DateTimeFormat(undefined, {
    dateStyle: 'medium',
    timeStyle: 'short',
  }).format(new Date(value));
}

export function formatRelativeTime(value: string) {
  const target = new Date(value).getTime();
  const diffMs = target - Date.now();
  const diffMinutes = Math.round(diffMs / 60000);
  const formatter = new Intl.RelativeTimeFormat(undefined, {numeric: 'auto'});

  if (Math.abs(diffMinutes) < 60) {
    return formatter.format(diffMinutes, 'minute');
  }

  const diffHours = Math.round(diffMinutes / 60);
  if (Math.abs(diffHours) < 24) {
    return formatter.format(diffHours, 'hour');
  }

  const diffDays = Math.round(diffHours / 24);
  return formatter.format(diffDays, 'day');
}

export function getHostnameLabel(urlValue: string) {
  try {
    return new URL(urlValue).hostname.replace(/^www\./, '');
  } catch {
    return urlValue;
  }
}

export function buildShareText(result: InvestigationResult) {
  const headline = `${result.verdict} (${result.confidence}% confidence)`;
  const subject = result.input.kind === 'url' ? result.input.value : `"${result.title}"`;
  const modeLabel = result.mode === 'live' ? 'live web-grounded' : 'local fallback';
  return [
    `CAP CORE verdict: ${headline}`,
    subject,
    result.summary,
    `Mode: ${modeLabel}`,
  ].join('\n');
}

export function mapResultToTopCapEntry(
  result: InvestigationResult,
  addedAt = new Date().toISOString(),
): TopCapEntry {
  return {
    resultId: result.id,
    claim: result.title,
    category: result.category,
    verdict: result.verdict,
    summary: result.summary,
    confidence: result.confidence,
    shares: result.shares,
    laughedAt: result.laughedAt,
    addedAt,
    mode: result.mode,
  };
}

export function mapResultToHistoryEntry(result: InvestigationResult): HistoryEntry {
  return {
    id: createId('history'),
    resultId: result.id,
    label: result.title,
    verdict: result.verdict,
    category: result.category,
    checkedAt: result.analyzedAt,
    kind: result.input.kind,
    mode: result.mode,
  };
}

export function resolveResultSaved(result: InvestigationResult, topCaps: TopCapEntry[]) {
  return topCaps.some((entry) => normalizeText(entry.claim) === normalizeText(result.title));
}
