import { createClient } from 'npm:@supabase/supabase-js@2';
import {
  clampConfidence,
  createClaimSlug,
  type CapApiVerdict,
  type CapSource,
  type CheckClaimError,
  type CheckClaimResponse,
  toUiVerdict,
} from '../../../shared/cap.ts';
import { createCorsHeaders } from '../_shared/cors.ts';

type ParsedInput = {
  question: string;
  claimText?: string;
  url?: string;
  mode: 'voice' | 'manual';
  visitorId?: string;
  metadata?: Record<string, unknown>;
  persistResult: boolean;
};

type FirecrawlResult = {
  title?: string;
  description?: string;
  snippet?: string;
  url?: string;
  markdown?: string;
  metadata?: {
    title?: string;
    sourceURL?: string;
    url?: string;
  };
};

type FirecrawlPayload = {
  success?: boolean;
  data?: {
    web?: FirecrawlResult[];
    news?: FirecrawlResult[];
  };
  warning?: string | null;
};

type ClaimRiskProfile = {
  advanceFeeCount: number;
  absurdAmount: boolean;
  brandBaitCount: number;
  classicAdvanceFee: boolean;
  paymentBaitCount: number;
  suspiciousScam: boolean;
  suspiciousWindfall: boolean;
  urgencyCount: number;
  windfallCount: number;
};

const CREDIBLE_DOMAINS = [
  'apnews.com',
  'bbc.com',
  'bloomberg.com',
  'cdc.gov',
  'ft.com',
  'nature.com',
  'nih.gov',
  'npr.org',
  'reuters.com',
  'who.int',
  'nytimes.com',
  'theguardian.com',
  'wsj.com',
  'washingtonpost.com',
  'wikipedia.org',
  'espn.com',
  'bleacherreport.com',
  'fifa.com',
  'theathletic.com',
  'theverge.com',
  'wired.com',
  'techcrunch.com',
];

const CONTRADICTION_TERMS = [
  'debunked',
  'denied',
  'false',
  'misleading',
  'no evidence',
  'not true',
  'refuted',
  'unsupported',
  'wrong',
];

const SUPPORT_TERMS = [
  'confirmed',
  'evidence',
  'official',
  'reported',
  'shows',
  'supports',
  'verified',
];

const NUANCE_TERMS = [
  'context',
  'however',
  'lacks context',
  'mixed',
  'nuance',
  'overstates',
  'partly',
  'partially',
];

const SCAM_WINDFALL_TERMS = [
  'airdrop',
  'beneficiary',
  'bonus',
  'claim your prize',
  'credits',
  'donation',
  'free money',
  'fund released',
  'giveaway',
  'gift',
  'grant',
  'inheritance',
  'jackpot',
  'lottery',
  'prize',
  'promo',
  'reward',
  'winner',
  'won',
];

const ADVANCE_FEE_TERMS = [
  'activation fee',
  'admin fee',
  'clearance fee',
  'customs fee',
  'delivery fee',
  'deposit',
  'fee',
  'handling fee',
  'insurance fee',
  'processing fee',
  'release fee',
  'service charge',
  'shipping fee',
  'tax',
  'unlock fee',
];

const PAYMENT_BAIT_TERMS = [
  'bank details',
  'bitcoin',
  'crypto',
  'gift card',
  'send money',
  'transfer',
  'usdt',
  'wallet',
  'wire fee',
];

const BRAND_BAIT_TERMS = [
  'amazon',
  'apple',
  'cash app',
  'elevenlabs',
  'google',
  'meta',
  'microsoft',
  'openai',
  'paypal',
  'tiktok',
];

const URGENCY_TERMS = [
  'act now',
  'asap',
  'expires today',
  'immediately',
  'limited time',
  'right now',
  'urgent',
];

function jsonResponse(body: CheckClaimResponse | CheckClaimError, status: number, origin: string | null) {
  const headers = createCorsHeaders(origin);
  if (!headers) {
    return new Response(
      JSON.stringify({
        error: {
          code: 'UPSTREAM_ERROR',
          message: 'Origin not allowed.',
          retryable: false,
        },
      }),
      {
        status: 403,
        headers: {
          'Content-Type': 'application/json',
        },
      },
    );
  }

  return new Response(JSON.stringify(body), {
    status,
    headers,
  });
}

function parseJsonObject(value: unknown): Record<string, unknown> | undefined {
  return value && typeof value === 'object' && !Array.isArray(value)
    ? (value as Record<string, unknown>)
    : undefined;
}

function normalizeString(value: unknown) {
  return typeof value === 'string' ? value.trim() : '';
}

function parseInput(body: unknown): ParsedInput | CheckClaimError {
  const payload = parseJsonObject(body);
  if (!payload) {
    return {
      error: {
        code: 'VALIDATION_ERROR',
        message: 'Request body must be a JSON object.',
        retryable: false,
      },
    };
  }

  const question = normalizeString(payload.question);
  const claimText = normalizeString(payload.claimText || payload.claim_text);
  const url = normalizeString(payload.url);
  const mode = normalizeString(payload.mode) === 'voice' ? 'voice' : 'manual';
  const visitorId = normalizeString(payload.visitorId || payload.visitor_id);
  const persistResult = Boolean(payload.persistResult || payload.persist_result);
  const metadata = parseJsonObject(payload.metadata);

  // Fallback question if for some reason the agent only sends the claim
  const finalQuestion = question || (claimText ? `Is it true that ${claimText}?` : url ? `Is this URL trustworthy: ${url}?` : '');

  if (!finalQuestion) {
    return {
      error: {
        code: 'VALIDATION_ERROR',
        message: 'question is required.',
        retryable: false,
      },
    };
  }

  // Advanced fallback: If claimText is missing but question is present, use question.
  const finalClaimText = claimText || (url ? '' : finalQuestion);

  if (!finalClaimText && !url) {
    return {
      error: {
        code: 'VALIDATION_ERROR',
        message: 'Provide a claim, question, or url so Cap has something to verify.',
        retryable: false,
      },
    };
  }

  if (url) {
    try {
      new URL(url);
    } catch {
      return {
        error: {
          code: 'VALIDATION_ERROR',
          message: 'url must be a valid absolute URL.',
          retryable: false,
        },
      };
    }
  }

  return {
    question: finalQuestion,
    claimText: finalClaimText,
    url,
    mode,
    visitorId,
    metadata,
    persistResult,
  };
}

function tokenize(text: string) {
  return text
    .toLowerCase()
    .split(/[^a-z0-9]+/)
    .filter((token) => token.length > 2);
}

function uniqueTokens(tokens: string[]) {
  return [...new Set(tokens)];
}

function hostnameOf(url: string) {
  try {
    return new URL(url).hostname.replace(/^www\./, '').toLowerCase();
  } catch {
    return '';
  }
}

function isCredibleDomain(domain: string) {
  return (
    domain.endsWith('.gov') ||
    domain.endsWith('.edu') ||
    domain.endsWith('.int') ||
    CREDIBLE_DOMAINS.some((candidate) => domain === candidate || domain.endsWith(`.${candidate}`))
  );
}

function looksFresh(text: string) {
  return /(today|latest|recent|recently|currently|this week|just announced|breaking|newly|right now)/i.test(text);
}

function extractUrlContext(url?: string) {
  if (!url) {
    return { domain: '', pathTerms: '' };
  }

  try {
    const parsed = new URL(url);
    const pathTerms = parsed.pathname
      .split('/')
      .filter(Boolean)
      .join(' ')
      .replace(/[-_]/g, ' ')
      .trim();

    return {
      domain: parsed.hostname.replace(/^www\./, ''),
      pathTerms,
    };
  } catch {
    return { domain: '', pathTerms: '' };
  }
}

function buildNormalizedQuery(input: ParsedInput) {
  const { domain, pathTerms } = extractUrlContext(input.url);
  const pieces = [input.claimText, input.question, pathTerms].filter((value): value is string => Boolean(value?.trim()));

  if (domain) {
    pieces.push(`site:${domain}`);
  }

  return uniqueTokens(tokenize(pieces.join(' '))).join(' ').slice(0, 400);
}

function extractSnippet(result: FirecrawlResult) {
  const candidate = [result.snippet, result.description, result.markdown]
    .find((value) => typeof value === 'string' && value.trim().length > 0)
    ?.replace(/\s+/g, ' ')
    .trim();

  return candidate ? candidate.slice(0, 240) : 'No summary available.';
}

function normalizeSources(results: FirecrawlResult[]): CapSource[] {
  return results
    .filter((result) => typeof result.url === 'string' && result.url.length > 0)
    .slice(0, 15)
    .map((result) => ({
      title: result.title?.trim() || result.metadata?.title?.trim() || hostnameOf(result.url ?? '') || 'Source',
      url: result.url as string,
      snippet: extractSnippet(result),
    }));
}

function buildSourceSignals(input: ParsedInput, results: FirecrawlResult[]) {
  const combinedInput = [input.question, input.claimText].filter(Boolean).join(' ').toLowerCase();
  const queryTokens = uniqueTokens(tokenize(combinedInput));
  const sourceDomain = extractUrlContext(input.url).domain;

  return results.map((result) => {
    const url = result.url ?? result.metadata?.url ?? result.metadata?.sourceURL ?? '';
    const domain = hostnameOf(url);
    const text = [result.title, result.description, result.snippet, result.markdown]
      .filter((value): value is string => typeof value === 'string')
      .join(' ')
      .toLowerCase();
    const keywordMatches = queryTokens.filter((token) => text.includes(token)).length;
    const contradiction = CONTRADICTION_TERMS.some((term) => text.includes(term));
    const support = SUPPORT_TERMS.some((term) => text.includes(term));
    const nuance = NUANCE_TERMS.some((term) => text.includes(term));
    const credible = isCredibleDomain(domain);
    const selfServing = Boolean(sourceDomain) && domain === sourceDomain;

    let relevance = keywordMatches;
    if (credible) relevance += 4;
    if (support) relevance += 2;
    if (contradiction) relevance += 3;
    if (nuance) relevance += 1;
    if (selfServing) relevance -= 2;

    return {
      contradiction,
      credible,
      nuance,
      relevance,
      result,
      selfServing,
      support,
    };
  });
}

function escapeRegex(value: string) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function countPhraseMatches(text: string, phrases: string[]) {
  return phrases.filter((phrase) => {
    const pattern = `\\b${escapeRegex(phrase).replace(/\\ /g, '\\s+')}\\b`;
    return new RegExp(pattern, 'i').test(text);
  }).length;
}

function buildClaimRiskProfile(input: ParsedInput): ClaimRiskProfile {
  const text = [input.question, input.claimText, input.url]
    .filter((value): value is string => Boolean(value?.trim()))
    .join(' ')
    .toLowerCase();

  const windfallCount = countPhraseMatches(text, SCAM_WINDFALL_TERMS);
  const advanceFeeCount = countPhraseMatches(text, ADVANCE_FEE_TERMS);
  const paymentBaitCount = countPhraseMatches(text, PAYMENT_BAIT_TERMS);
  const brandBaitCount = countPhraseMatches(text, BRAND_BAIT_TERMS);
  const urgencyCount = countPhraseMatches(text, URGENCY_TERMS);
  const absurdAmount =
    /\b\d{1,3}(?:,\d{3})+\b/.test(text) ||
    /\b\d+(?:\.\d+)?\s*(million|billion|trillion|bn)\b/.test(text) ||
    /\b\d{7,}\b/.test(text);

  const classicAdvanceFee = advanceFeeCount > 0 && (windfallCount > 0 || paymentBaitCount > 0 || absurdAmount);
  const suspiciousWindfall =
    windfallCount > 0 && (brandBaitCount > 0 || absurdAmount || urgencyCount > 0 || paymentBaitCount > 0);
  const suspiciousScam =
    classicAdvanceFee || (suspiciousWindfall && paymentBaitCount > 0) || (suspiciousWindfall && absurdAmount);

  return {
    advanceFeeCount,
    absurdAmount,
    brandBaitCount,
    classicAdvanceFee,
    paymentBaitCount,
    suspiciousScam,
    suspiciousWindfall,
    urgencyCount,
    windfallCount,
  };
}

function normalizeReasons(value: unknown, fallback: string) {
  const reasons = Array.isArray(value)
    ? value
      .filter((item): item is string => typeof item === 'string')
      .map((item) => item.trim())
      .filter(Boolean)
    : [];

  return reasons.length > 0 ? reasons : [fallback];
}

function buildSpokenSummary(
  verdict: CapApiVerdict,
  primaryReason: string,
  risk: ClaimRiskProfile,
  preferredSummary?: string,
) {
  const preferred = preferredSummary?.trim();
  if (verdict === 'CAP') {
    if (risk.brandBaitCount > 0 && risk.absurdAmount && risk.windfallCount > 0) {
      return 'Cap. Someone invented a giant giveaway, slapped a fake tax on it, and expected that nonsense to sound premium.';
    }

    if (risk.classicAdvanceFee) {
      return 'Cap. That sounds like someone invented a giveaway, stapled on a fake tax, and hoped common sense was on airplane mode.';
    }

    if (risk.suspiciousWindfall || risk.suspiciousScam) {
      return 'Cap. That payout story sounds like a scam pitch wearing a party hat and fake receipts.';
    }

    if (preferred) {
      return preferred;
    }

    return `Cap. ${primaryReason}`;
  }

  if (preferred) {
    return preferred;
  }

  const variety = {
    CAP: ['That is cap.', 'Absolute cap.', 'Total fiction.', 'Busted.'],
    NO_CAP: ['No cap detected.', 'Verified truth.', 'Legit.'],
    HALF_CAP: ['Half cap.', 'Missing context.', 'Nuanced reality.'],
    UNVERIFIED: ['Evidence inconclusive.', 'Unverified.', 'Jury is still out.'],
  };

  const prefixes = variety[verdict];
  const spokenPrefix = prefixes[Math.floor(Math.random() * prefixes.length)];
  return `${spokenPrefix} ${primaryReason}`;
}

async function callAiSynthesis(
  input: ParsedInput,
  results: FirecrawlResult[],
  normalizedQuery: string
): Promise<CheckClaimResponse | null> {
  const apiKey = Deno.env.get('GEMINI_API_KEY');
  if (!apiKey) return null;
  const claimRisk = buildClaimRiskProfile(input);

  const context = results.slice(0, 10).map((r, i) => `
Source [${i + 1}]: ${r.title || 'Untitled'}
URL: ${r.url || 'N/A'}
Snippet: ${extractSnippet(r)}
`).join('\n');

  const prompt = `
You are CAP, the ultimate Information Verification Oracle. 
Your task is to analyze a claim and search evidence to resolve a definitive verdict.

User Question: "${input.question}"
Core Claim: "${input.claimText || input.question}"
Search Results Context:
${context || 'No direct search matches found.'}

RESOLUTION PROTOCOL:
1. EVIDENCE STRENGTH: How credible and specific are the sources? (Official sites, major news, primary sources > blogs/social).
2. CLAIM PLAUSIBILITY: Based on logic and world knowledge, is this claim physically possible or common misinformation?
3. VERDICT RESOLUTION:
   - NO_CAP: Strong supporting evidence from credible sources.
   - CAP: Direct refutation OR absolute logical nonsense OR a debunked myth.
   - HALF_CAP: Mix of truth and exaggeration, or missing vital nuance.
   - UNVERIFIED: Plausible but completely unsearchable/new, or truly ambiguous.

RULES:
- Default to a skeptical stance. If the claim has the shape of a scam, fake giveaway, fake payout, or classic advance-fee hustle, do not hedge.
- Treat giant surprise windfalls, brand-name giveaways, miracle credits, and any "pay a fee/tax/deposit to unlock it" story as CAP unless strong primary-source evidence proves otherwise.
- If a claim sounds like "I got millions in brand credits / giveaway money," you should assume scam energy and the spoken_summary can openly mock how fake the setup sounds.
- If search results are EMPTY but the claim is LUDICROUS/IMPOSSIBLE (e.g. "gravity stopped"), call CAP immediately.
- If search results are EMPTY but the claim is MUNDANE/SPECIFIC (e.g. "I ate a burger"), call UNVERIFIED.
- If the claim describes a scammy payout with a fake tax or release fee, call it CAP and roast the scam logic, not the victim.
- Be funny, witty, sharp, and dismissive in the spoken_summary when the verdict is CAP.
- Keep the spoken_summary to 1 short sentence.

Output EXACTLY this JSON format:
{
  "verdict": "CAP" | "NO_CAP" | "HALF_CAP" | "UNVERIFIED",
  "confidence": number (0-100),
  "reasons": [string, string, string],
  "plausibility_score": number (0.0-1.0),
  "spoken_summary": "Short witty verdict"
}
`;

  try {
    const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${apiKey}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [{ parts: [{ text: prompt }] }],
        generationConfig: {
          response_mime_type: "application/json",
          temperature: 0.1,
        }
      })
    });

    if (!response.ok) throw new Error('AI Synthesis failed');
    const data = await response.json();
    const text = data.candidates?.[0]?.content?.parts?.[0]?.text;
    if (!text) throw new Error('Empty AI response');

    const result = JSON.parse(text);
    const parsedVerdict: CapApiVerdict =
      result.verdict === 'CAP' || result.verdict === 'NO_CAP' || result.verdict === 'HALF_CAP' || result.verdict === 'UNVERIFIED'
        ? result.verdict
        : 'UNVERIFIED';
    let verdict = parsedVerdict;
    let confidence = clampConfidence(result.confidence);
    let reasons = normalizeReasons(result.reasons, 'Cap could not explain the verdict cleanly.');

    if (claimRisk.classicAdvanceFee) {
      verdict = 'CAP';
      confidence = Math.max(confidence, 88);
      reasons = [
        'This reads like a classic advance-fee scam: the claim invents a huge payout, then adds a fake tax or release fee to squeeze money out of you.',
        ...reasons,
      ];
    } else if (claimRisk.suspiciousWindfall && verdict !== 'NO_CAP') {
      verdict = 'CAP';
      confidence = Math.max(confidence, 78);
      reasons = [
        'The claim has fake-giveaway energy: oversized reward, shaky proof, and no serious evidence that the payout exists.',
        ...reasons,
      ];
    }

    if (claimRisk.brandBaitCount > 0 && (claimRisk.classicAdvanceFee || claimRisk.suspiciousWindfall)) {
      reasons.push('Borrowing a recognizable brand plus an absurd reward is a common scam costume, not real proof.');
    }

    return {
      verdict,
      confidence: clampConfidence(confidence),
      reasons: reasons.slice(0, 3),
      spokenSummary: buildSpokenSummary(verdict, reasons[0], claimRisk, result.spoken_summary),
      sources: normalizeSources(results),
      normalizedQuery,
      rawSearchSummary: `AI Synthesis (Plausibility: ${result.plausibility_score}). Sources reviewed: ${results.length}.`,
    };
  } catch (err) {
    console.error('[check-claim] AI Synthesis error:', err);
    return null;
  }
}

async function synthesizeVerdict(
  input: ParsedInput,
  results: FirecrawlResult[],
  normalizedQuery: string
): Promise<CheckClaimResponse> {
  const aiResult = await callAiSynthesis(input, results, normalizedQuery);
  if (aiResult) {
    return aiResult;
  }

  return synthesizeVerdictFallback(input, results, normalizedQuery);
}

function synthesizeVerdictFallback(input: ParsedInput, results: FirecrawlResult[], normalizedQuery: string): CheckClaimResponse {
  const signals = buildSourceSignals(input, results).sort((left, right) => right.relevance - left.relevance);
  const rankedResults = signals.map((signal) => signal.result);
  const topSources = normalizeSources(rankedResults);
  const credibleCount = signals.filter((signal) => signal.credible).length;
  const supportCount = signals.filter((signal) => signal.credible && signal.support).length;
  const contradictionCount = signals.filter((signal) => signal.credible && signal.contradiction).length;
  const nuanceCount = signals.filter((signal) => signal.credible && signal.nuance).length;
  const selfServingCount = signals.filter((signal) => signal.selfServing).length;
  const claimRisk = buildClaimRiskProfile(input);

  let verdict: CapApiVerdict = 'UNVERIFIED';
  let confidence = 30;
  const reasons: string[] = [];

  if (claimRisk.classicAdvanceFee) {
    verdict = 'CAP';
    confidence = clampConfidence(84 + contradictionCount * 6 + claimRisk.advanceFeeCount * 4);
    reasons.push('This reads like a classic advance-fee scam: a giant payout appears first, then a made-up tax or release fee shows up to milk the target.');
    if (claimRisk.brandBaitCount > 0) {
      reasons.push('Name-dropping a familiar brand next to a ridiculous reward is scam theater, not evidence.');
    }
  } else if (claimRisk.suspiciousWindfall && supportCount === 0) {
    verdict = 'CAP';
    confidence = clampConfidence(74 + contradictionCount * 5 + claimRisk.brandBaitCount * 3 + (claimRisk.absurdAmount ? 6 : 0));
    reasons.push('The claim has the shape of a fake giveaway: oversized reward, weak proof, and no credible confirmation that the payout is real.');
    if (claimRisk.paymentBaitCount > 0) {
      reasons.push('Turning a "reward" into a request for money or wallet details is textbook scam bait.');
    }
  } else if (signals.length === 0 || (credibleCount === 0 && signals.length < 5)) {
    verdict = 'UNVERIFIED';
    confidence = 24;
    reasons.push('Cap did not find enough reliable sources to verify the claim confidently.');
  } else if (
    contradictionCount >= 2 ||
    (contradictionCount >= 1 && supportCount === 0) ||
    (selfServingCount >= 1 && credibleCount <= 1 && contradictionCount >= 1)
  ) {
    verdict = 'CAP';
    confidence = clampConfidence(66 + contradictionCount * 9 + credibleCount * 4);
    reasons.push('Multiple relevant sources push back on the claim instead of supporting it.');
  } else if (supportCount >= 2 && contradictionCount === 0) {
    verdict = 'NO_CAP';
    confidence = clampConfidence(72 + supportCount * 8 + credibleCount * 4);
    reasons.push('Several credible sources align with the core claim.');
  } else if (nuanceCount > 0 || (supportCount > 0 && contradictionCount > 0)) {
    verdict = 'HALF_CAP';
    confidence = clampConfidence(52 + nuanceCount * 7 + credibleCount * 4);
    reasons.push('The evidence points to a real signal, but the strongest sources add missing nuance.');
  } else {
    verdict = 'UNVERIFIED';
    confidence = clampConfidence(32 + credibleCount * 4);
    reasons.push('The available evidence is too thin or too mixed to make a cleaner call.');
  }

  return {
    confidence,
    normalizedQuery,
    rawSearchSummary: `Fallback Heistic. Sources: ${signals.length}.`,
    reasons: reasons.slice(0, 3),
    sources: topSources,
    spokenSummary: buildSpokenSummary(verdict, reasons[0], claimRisk),
    verdict,
  };
}


async function callFirecrawl(input: ParsedInput, normalizedQuery: string) {
  const payload: Record<string, unknown> = {
    limit: 15,
    query: normalizedQuery,
    sources: looksFresh(`${input.question} ${input.claimText ?? ''}`) ? ['web', 'news'] : ['web'],
    timeout: 8000,
  };

  if (looksFresh(`${input.question} ${input.claimText ?? ''}`)) {
    payload.tbs = 'sbd:1,qdr:w';
  }

  const response = await fetch('https://api.firecrawl.dev/v2/search', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${Deno.env.get('FIRECRAWL_API_KEY')}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(payload),
  });

  if (!response.ok) {
    return {
      error: {
        code: response.status === 408 ? 'TIMEOUT' : 'UPSTREAM_ERROR',
        message:
          response.status === 408
            ? 'Firecrawl timed out before Cap got enough evidence back.'
            : 'Firecrawl search failed while Cap was gathering evidence.',
        retryable: response.status >= 500 || response.status === 408,
      },
    } as CheckClaimError;
  }

  const payloadJson = (await response.json()) as FirecrawlPayload;
  const results = [...(payloadJson.data?.web ?? []), ...(payloadJson.data?.news ?? [])].filter(Boolean);
  return {
    results,
    warning: payloadJson.warning ?? null,
  };
}

function buildSupabaseAdminClient() {
  const url = Deno.env.get('SUPABASE_URL');
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');

  if (!url || !serviceRoleKey) {
    return null;
  }

  return createClient(url, serviceRoleKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}

function buildClaimTitle(input: ParsedInput) {
  const seed = input.claimText || input.question || input.url || 'Cap check';
  return seed.length > 96 ? `${seed.slice(0, 93)}...` : seed;
}

async function persistResult(input: ParsedInput, response: CheckClaimResponse) {
  if (!input.persistResult || response.verdict === 'UNVERIFIED') {
    return undefined;
  }

  const client = buildSupabaseAdminClient();
  if (!client) {
    return undefined;
  }

  const claimText = input.claimText || input.url || input.question;
  const slug = createClaimSlug(claimText);
  const existing = await client.from('claims').select('id').eq('slug', slug).maybeSingle();

  if (existing.data?.id) {
    return existing.data.id;
  }

  const { data } = await client
    .from('claims')
    .insert({
      category: input.mode === 'voice' ? 'Voice Check' : 'Manual Check',
      claim_text: claimText,
      confidence: response.confidence,
      details: response.spokenSummary,
      is_featured: false,
      reason_summary: response.reasons.join(' '),
      slug,
      source_url: input.url ?? response.sources[0]?.url ?? null,
      sources: response.sources.map((source) => ({
        name: source.title,
        text: source.snippet,
        url: source.url,
      })),
      status: 'draft',
      title: buildClaimTitle(input),
      verdict: toUiVerdict(response.verdict),
    })
    .select('id')
    .single();

  return data?.id;
}

async function logAnalytics(input: ParsedInput, response: CheckClaimResponse) {
  if (!input.visitorId) {
    return;
  }

  const client = buildSupabaseAdminClient();
  if (!client) {
    return;
  }

  await client.rpc('log_analytics_event', {
    p_claim_id: response.persistedClaimId ?? null,
    p_event_name: 'claim_checked',
    p_metadata: {
      confidence: response.confidence,
      mode: input.mode,
      normalizedQuery: response.normalizedQuery,
      sourceCount: response.sources.length,
      verdict: response.verdict,
      ...(input.metadata ?? {}),
    },
    p_path: null,
    p_ref: null,
    p_ua: 'supabase-edge-function',
    p_visitor_id: input.visitorId,
  });
}

Deno.serve(async (request) => {
  const origin = request.headers.get('origin');

  if (request.method === 'OPTIONS') {
    const headers = createCorsHeaders(origin);
    return headers
      ? new Response('ok', { headers })
      : new Response('Origin not allowed.', { status: 403 });
  }

  if (request.method !== 'POST') {
    return jsonResponse(
      {
        error: {
          code: 'VALIDATION_ERROR',
          message: 'Only POST requests are supported.',
          retryable: false,
        },
      },
      405,
      origin,
    );
  }

  const parsed = parseInput(await request.json().catch(() => null));
  if ('error' in parsed) {
    return jsonResponse(parsed, 400, origin);
  }

  const normalizedQuery = buildNormalizedQuery(parsed);
  console.log('[check-claim] normalized query:', normalizedQuery);

  const firecrawlResult = await callFirecrawl(parsed, normalizedQuery);
  if ('error' in firecrawlResult) {
    return jsonResponse(firecrawlResult, firecrawlResult.error.code === 'TIMEOUT' ? 408 : 502, origin);
  }

  const result = await synthesizeVerdict(parsed, firecrawlResult.results, normalizedQuery);
  if (result.sources.length === 0) {
    result.reasons = ['Cap found too little reliable evidence to verify the claim cleanly.'];
    result.verdict = 'UNVERIFIED';
    result.confidence = 20;
    result.spokenSummary = 'Unverified: Cap could not find enough reliable evidence to call this.';
  }

  // Instead of waiting, we trigger persistence and logging in the background
  // to save precious milliseconds for the strict voice agent timeout limits.
  const response: CheckClaimResponse = {
    ...result,
    persistedClaimId: undefined, // Will be generated asynchronously
  };

  Promise.all([
    persistResult(parsed, result).catch((err) => console.error('Persist failed', err)),
    logAnalytics(parsed, response).catch((err) => console.error('Analytics failed', err))
  ]);

  return jsonResponse(response, 200, origin);
});
