import {GoogleGenAI} from '@google/genai';
import {SEED_RESULTS} from '@/src/lib/cap-data';
import {
  clamp,
  createId,
  getHostnameLabel,
  normalizeText,
} from '@/src/lib/cap-utils';
import type {
  Discrepancy,
  InvestigationInput,
  InvestigationResult,
  SourceLink,
  Verdict,
} from '@/src/types';

const GEMINI_API_KEY = process.env.GEMINI_API_KEY;
const MODEL_ID = 'gemini-2.5-flash';

let client: GoogleGenAI | null = null;

function getClient() {
  if (!GEMINI_API_KEY) {
    return null;
  }

  client ??= new GoogleGenAI({apiKey: GEMINI_API_KEY});
  return client;
}

function cleanJsonBlock(rawText: string) {
  const trimmed = rawText.trim();
  const withoutFence = trimmed.replace(/^```json\s*/i, '').replace(/^```\s*/i, '').replace(/\s*```$/, '');
  const firstBrace = withoutFence.indexOf('{');
  const lastBrace = withoutFence.lastIndexOf('}');
  if (firstBrace === -1 || lastBrace === -1) {
    return withoutFence;
  }

  return withoutFence.slice(firstBrace, lastBrace + 1);
}

function normalizeVerdict(value: string | undefined): Verdict {
  const upper = (value ?? '').toUpperCase();
  if (upper === 'FACTS' || upper === 'MIXED') {
    return upper;
  }

  return 'CAP';
}

function normalizeCategory(value: string | undefined, fallback = 'General') {
  const cleaned = (value ?? fallback).trim();
  return cleaned ? cleaned[0].toUpperCase() + cleaned.slice(1) : fallback;
}

function toSourceLink(entry: unknown): SourceLink | null {
  if (!entry || typeof entry !== 'object') {
    return null;
  }

  const candidate = entry as {
    name?: string;
    url?: string;
    text?: string;
    status?: string;
    title?: string;
    uri?: string;
    retrievedUrl?: string;
    urlRetrievalStatus?: string;
  };

  const url = candidate.url ?? candidate.uri ?? candidate.retrievedUrl;
  if (!url || typeof url !== 'string') {
    return null;
  }

  return {
    name:
      candidate.name ??
      candidate.title ??
      getHostnameLabel(url),
    url,
    text: typeof candidate.text === 'string' ? candidate.text : undefined,
    status:
      typeof candidate.status === 'string'
        ? candidate.status
        : typeof candidate.urlRetrievalStatus === 'string'
          ? candidate.urlRetrievalStatus
          : undefined,
  };
}

function dedupeSources(sources: SourceLink[]) {
  const seen = new Set<string>();
  return sources.filter((source) => {
    if (seen.has(source.url)) {
      return false;
    }

    seen.add(source.url);
    return true;
  });
}

function extractGroundingSources(candidate: any) {
  const chunks = candidate?.groundingMetadata?.groundingChunks;
  if (!Array.isArray(chunks)) {
    return [];
  }

  return dedupeSources(
    chunks
      .map((chunk: any) => toSourceLink(chunk?.web ?? chunk))
      .filter((item: SourceLink | null): item is SourceLink => item !== null),
  );
}

function extractUrlSources(candidate: any) {
  const metadata = candidate?.urlContextMetadata?.urlMetadata;
  if (!Array.isArray(metadata)) {
    return [];
  }

  return dedupeSources(
    metadata
      .map((entry: any) => toSourceLink(entry))
      .filter((item: SourceLink | null): item is SourceLink => item !== null),
  );
}

function extractQueryLog(candidate: any) {
  const queries = candidate?.groundingMetadata?.webSearchQueries;
  return Array.isArray(queries)
    ? queries.filter((value: unknown): value is string => typeof value === 'string')
    : [];
}

function sanitizeDiscrepancies(value: unknown): Discrepancy[] {
  if (!Array.isArray(value)) {
    return [];
  }

  return value
    .map((entry) => {
      if (!entry || typeof entry !== 'object') {
        return null;
      }

      const candidate = entry as {title?: unknown; text?: unknown};
      if (typeof candidate.title !== 'string' || typeof candidate.text !== 'string') {
        return null;
      }

      return {
        title: candidate.title.trim(),
        text: candidate.text.trim(),
      };
    })
    .filter((item): item is Discrepancy => item !== null)
    .slice(0, 4);
}

function sanitizeStrings(value: unknown, limit = 4) {
  if (!Array.isArray(value)) {
    return [];
  }

  return value
    .filter((entry): entry is string => typeof entry === 'string')
    .map((entry) => entry.trim())
    .filter(Boolean)
    .slice(0, limit);
}

function looksPrivateUrl(value: string) {
  try {
    const url = new URL(value);
    const host = url.hostname.toLowerCase();
    if (host === 'localhost' || host.endsWith('.local')) {
      return true;
    }

    if (/^(127|10)\./.test(host) || /^192\.168\./.test(host)) {
      return true;
    }

    if (/^172\.(1[6-9]|2\d|3[0-1])\./.test(host)) {
      return true;
    }

    return false;
  } catch {
    return false;
  }
}

function fallbackCategory(text: string) {
  const lower = text.toLowerCase();

  if (/(allerg|vision|fatigue|salt|water|onion|health|doctor|cure)/.test(lower)) {
    return 'Health';
  }

  if (/(5g|phone|app|ai|model|software|microwave|tech)/.test(lower)) {
    return 'Tech';
  }

  if (/(law|legislation|government|ban|policy|election|congress)/.test(lower)) {
    return 'Politics';
  }

  if (/(earth|moon|space|planet|sun|science|astronom)/.test(lower)) {
    return 'Science';
  }

  if (/(housing|market|economic|inflation|consumer|price)/.test(lower)) {
    return 'Economics';
  }

  return 'General';
}

function genericSourcesForCategory(category: string): SourceLink[] {
  switch (category) {
    case 'Health':
      return [
        {name: 'World Health Organization', url: 'https://www.who.int'},
        {name: 'Mayo Clinic', url: 'https://www.mayoclinic.org'},
      ];
    case 'Tech':
      return [
        {name: 'Reuters Technology', url: 'https://www.reuters.com/technology/'},
        {name: 'FCC', url: 'https://www.fcc.gov'},
      ];
    case 'Politics':
      return [
        {name: 'GovTrack', url: 'https://www.govtrack.us'},
        {name: 'Reuters Politics', url: 'https://www.reuters.com/world/us/'},
      ];
    case 'Science':
      return [
        {name: 'NASA', url: 'https://www.nasa.gov'},
        {name: 'ESA', url: 'https://www.esa.int'},
      ];
    case 'Economics':
      return [
        {name: 'Reuters Markets', url: 'https://www.reuters.com/markets/'},
        {name: 'US Census Bureau', url: 'https://www.census.gov'},
      ];
    default:
      return [
        {name: 'Reuters', url: 'https://www.reuters.com'},
        {name: 'Associated Press', url: 'https://apnews.com'},
      ];
  }
}

function heuristicVerdict(text: string) {
  const lower = text.toLowerCase();
  const capSignals = [
    'all',
    'instantly',
    'secret',
    'hoax',
    'cure',
    'flat earth',
    '5g',
    'microwave',
    'staring at the sun',
  ];
  const mixedSignals = ['proposal', 'report', 'could', 'may', 'suggest', 'new legislation'];
  const factsSignals = ['study', 'confirmed', 'according to', 'announced', 'official'];

  if (capSignals.some((signal) => lower.includes(signal))) {
    return {verdict: 'CAP' as const, confidence: 88};
  }

  if (mixedSignals.some((signal) => lower.includes(signal))) {
    return {verdict: 'MIXED' as const, confidence: 71};
  }

  if (factsSignals.some((signal) => lower.includes(signal))) {
    return {verdict: 'FACTS' as const, confidence: 66};
  }

  return {verdict: 'MIXED' as const, confidence: 64};
}

function buildFallbackResult(input: InvestigationInput, reason: string): InvestigationResult {
  const matchedSeed = SEED_RESULTS.find(
    (result) =>
      normalizeText(result.title) === normalizeText(input.value) ||
      normalizeText(result.input.value) === normalizeText(input.value),
  );

  if (matchedSeed) {
    return {
      ...matchedSeed,
      id: createId('result'),
      input,
      title: input.value,
      analyzedAt: new Date().toISOString(),
      shares: 0,
      laughedAt: 0,
      isFlagged: false,
      savedToTopCaps: false,
      note: `Fallback result. ${reason}`,
    };
  }

  const category = fallbackCategory(input.value);
  const verdictSignal = heuristicVerdict(input.value);
  const subject =
    input.kind === 'url'
      ? `The URL ${getHostnameLabel(input.value)}`
      : 'This claim';
  const genericSources = genericSourcesForCategory(category);

  return {
    id: createId('result'),
    input,
    title: input.value,
    verdict: verdictSignal.verdict,
    confidence: verdictSignal.confidence,
    summary:
      verdictSignal.verdict === 'CAP'
        ? `${subject} shows classic misinformation signals such as absolute phrasing, weak sourcing, or implausible mechanics.`
        : verdictSignal.verdict === 'FACTS'
          ? `${subject} looks plausible, but this local fallback estimate should still be checked against primary sources.`
          : `${subject} may contain a real hook, but the framing likely needs more context than the visible claim provides.`,
    category,
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Primary-source gap',
        text: 'No directly verifiable source document, study, or official release was confirmed during this local-only pass.',
      },
      {
        title: 'Context risk',
        text: 'The visible claim may compress a larger story, which is a common way misleading summaries spread.',
      },
    ],
    evidence: [
      'Look for a primary source rather than reposted screenshots or quote cards.',
      'Compare the headline language with the underlying article or official release.',
      'Treat this verdict as a fallback estimate because live verification was unavailable.',
    ],
    sources: genericSources,
    citations: genericSources,
    sourceCount: genericSources.length,
    queryLog: [reason],
    analyzedAt: new Date().toISOString(),
    shares: 0,
    laughedAt: 0,
    isFlagged: false,
    savedToTopCaps: false,
    note: `Fallback result. ${reason}`,
  };
}

function buildPrompt(input: InvestigationInput) {
  const subject =
    input.kind === 'url'
      ? `Analyze the public URL ${input.value}. Use URL context to inspect the page and Google Search to verify the core claim.`
      : `Analyze this claim: "${input.value}". Use Google Search to verify it.`;

  return [
    'You are CAP CORE, a terse fact-checking system.',
    subject,
    'Return only valid JSON with no markdown fences.',
    'Schema:',
    JSON.stringify({
      verdict: 'CAP | FACTS | MIXED',
      confidence: 0,
      summary: 'string',
      category: 'string',
      discrepancies: [{title: 'string', text: 'string'}],
      evidence: ['string'],
      note: 'string',
    }),
    'Rules:',
    '- confidence must be an integer from 0 to 100.',
    '- discrepancies must contain 2 to 4 concise items.',
    '- evidence must contain 2 to 4 concise items.',
    '- CAP means contradicted, implausible, or clearly misleading.',
    '- FACTS means strongly supported.',
    '- MIXED means partially supported, overframed, or unclear without more context.',
  ].join('\n');
}

export async function analyzeInvestigation(input: InvestigationInput): Promise<InvestigationResult> {
  const apiClient = getClient();
  if (!apiClient) {
    return buildFallbackResult(input, 'Live analysis unavailable because GEMINI_API_KEY is not configured.');
  }

  if (input.kind === 'url' && looksPrivateUrl(input.value)) {
    return buildFallbackResult(input, 'Private or local URLs cannot be verified through Gemini URL context.');
  }

  try {
    const response = await apiClient.models.generateContent({
      model: MODEL_ID,
      contents: buildPrompt(input),
      config: {
        temperature: 0.2,
        tools:
          input.kind === 'url'
            ? [{googleSearch: {}}, {urlContext: {}}]
            : [{googleSearch: {}}],
      },
    });

    const candidate = response.candidates?.[0] as any;
    const urlSources = extractUrlSources(candidate);
    const allUrlStatusesFailed =
      input.kind === 'url' &&
      urlSources.length > 0 &&
      urlSources.every((source) => source.status && source.status !== 'URL_RETRIEVAL_STATUS_SUCCESS');

    if (allUrlStatusesFailed) {
      throw new Error(urlSources[0]?.status ?? 'URL retrieval failed');
    }

    if (!response.text) {
      throw new Error('Empty model response');
    }

    const parsed = JSON.parse(cleanJsonBlock(response.text)) as {
      verdict?: string;
      confidence?: number;
      summary?: string;
      category?: string;
      discrepancies?: unknown;
      evidence?: unknown;
      note?: string;
      sources?: unknown;
    };

    const groundingSources = extractGroundingSources(candidate);
    const modelSources = Array.isArray(parsed.sources)
      ? parsed.sources
          .map((entry) => toSourceLink(entry))
          .filter((item: SourceLink | null): item is SourceLink => item !== null)
      : [];
    const combinedSources = dedupeSources([...groundingSources, ...urlSources, ...modelSources]);

    return {
      id: createId('result'),
      input,
      title: input.value,
      verdict: normalizeVerdict(parsed.verdict),
      confidence: clamp(Math.round(Number(parsed.confidence ?? 0)), 0, 100),
      summary:
        typeof parsed.summary === 'string' && parsed.summary.trim()
          ? parsed.summary.trim()
          : 'Live analysis completed, but the summary was incomplete.',
      category: normalizeCategory(parsed.category, fallbackCategory(input.value)),
      mode: 'live',
      discrepancies:
        sanitizeDiscrepancies(parsed.discrepancies).length > 0
          ? sanitizeDiscrepancies(parsed.discrepancies)
          : [
              {
                title: 'Evidence review',
                text: 'Live analysis completed, but the model did not return structured discrepancy details.',
              },
            ],
      evidence:
        sanitizeStrings(parsed.evidence).length > 0
          ? sanitizeStrings(parsed.evidence)
          : ['Live analysis completed, but the model returned limited structured evidence.'],
      sources: combinedSources,
      citations: combinedSources.slice(0, 5),
      sourceCount: combinedSources.length,
      queryLog: extractQueryLog(candidate),
      analyzedAt: new Date().toISOString(),
      shares: 0,
      laughedAt: 0,
      isFlagged: false,
      savedToTopCaps: false,
      note:
        typeof parsed.note === 'string' && parsed.note.trim()
          ? parsed.note.trim()
          : 'Grounded with Google Search.',
    };
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Live analysis failed.';
    return buildFallbackResult(input, message);
  }
}
