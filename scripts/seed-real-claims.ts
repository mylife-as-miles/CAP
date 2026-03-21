/// <reference types="node" />

import dotenv from 'dotenv';
import { existsSync, readFileSync } from 'node:fs';

import { createClient } from '@supabase/supabase-js';
import {
  CAP_DEFAULT_QUESTION,
  isCheckClaimError,
  isCheckClaimResponse,
  isPublishClaimResponse,
  toUiVerdict,
  type CheckClaimInput,
  type CheckClaimResponse,
  type PublishClaimInput,
} from '../shared/cap';

type SourcePlatform = 'hackernews' | 'reddit';

interface ClaimCandidate {
  category: string;
  claimText: string;
  externalId: string;
  platform: SourcePlatform;
  question: string;
  title: string;
  url?: string;
}

interface SeedOptions {
  delayMs: number;
  dryRun: boolean;
  hnLimit: number;
  limit: number;
  redditLimit: number;
  redditSubreddits: string[];
}

interface ManagementConfig {
  projectRef: string;
  token: string;
}

const HN_FEEDS = ['topstories', 'beststories', 'newstories'] as const;
const DEFAULT_REDDIT_SUBREDDITS = [
  'technology',
  'worldnews',
  'news',
  'science',
  'politics',
  'OutOfTheLoop',
  'facepalm',
] as const;
const DEFAULT_LIMIT = 40;

dotenv.config({ path: '.env.local', quiet: true });
dotenv.config({ quiet: true });

function parseArgs(argv: string[]): SeedOptions {
  const options: SeedOptions = {
    delayMs: 900,
    dryRun: false,
    hnLimit: 0,
    limit: DEFAULT_LIMIT,
    redditLimit: 80,
    redditSubreddits: [...DEFAULT_REDDIT_SUBREDDITS],
  };

  for (const arg of argv) {
    if (arg === '--dry-run') {
      options.dryRun = true;
      continue;
    }

    const [flag, rawValue] = arg.split('=');
    const value = rawValue?.trim();
    if (!value) {
      continue;
    }

    if (flag === '--limit') {
      options.limit = Math.max(1, Number.parseInt(value, 10) || DEFAULT_LIMIT);
    } else if (flag === '--hn-limit') {
      options.hnLimit = Math.max(0, Number.parseInt(value, 10) || 0);
    } else if (flag === '--reddit-limit') {
      options.redditLimit = Math.max(0, Number.parseInt(value, 10) || 0);
    } else if (flag === '--delay-ms') {
      options.delayMs = Math.max(0, Number.parseInt(value, 10) || 0);
    } else if (flag === '--reddit-subreddits') {
      options.redditSubreddits = value
        .split(',')
        .map((item) => item.trim())
        .filter(Boolean);
    }
  }

  return options;
}

function sleep(ms: number) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

function getEnv(name: string) {
  return process.env[name]?.trim();
}

function escapeSqlLiteral(value: string) {
  return value.replace(/'/g, "''");
}

function escapeSqlNullable(value?: string | null) {
  if (!value) {
    return 'NULL';
  }

  return `'${escapeSqlLiteral(value)}'`;
}

function createSupabaseClient() {
  const url = getEnv('SUPABASE_URL') || getEnv('VITE_SUPABASE_URL');
  const key = getEnv('SUPABASE_ANON_KEY')
    || getEnv('VITE_SUPABASE_ANON_KEY')
    || getEnv('VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY');

  if (!url || !key) {
    throw new Error('Missing Supabase URL or anon key. Set SUPABASE_URL/SUPABASE_ANON_KEY or the VITE_ equivalents.');
  }

  return createClient(url, key, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}

function collapseWhitespace(value: string) {
  return value.replace(/\s+/g, ' ').trim();
}

function buildClaimTitle(claimText: string) {
  return claimText.length > 96 ? `${claimText.slice(0, 93)}...` : claimText;
}

function buildReasonSummary(result: CheckClaimResponse) {
  return collapseWhitespace(result.reasons[0] || result.spokenSummary);
}

function buildDetails(result: CheckClaimResponse) {
  return [...new Set([
    ...result.reasons.map((reason) => collapseWhitespace(reason)),
    collapseWhitespace(result.spokenSummary),
  ].filter(Boolean))].join(' ');
}

function stripHtml(value: string) {
  return collapseWhitespace(value.replace(/<[^>]+>/g, ' '));
}

function looksClaimLike(title: string) {
  const normalized = collapseWhitespace(title);
  if (normalized.length < 24 || normalized.length > 240) {
    return false;
  }

  const lower = normalized.toLowerCase();
  if (
    lower.startsWith('ask hn:')
    || lower.startsWith('show hn:')
    || lower.startsWith('who is hiring')
    || lower.startsWith('tell hn:')
    || lower.includes('weekly thread')
    || lower.includes('monthly thread')
    || lower.includes('[meta]')
  ) {
    return false;
  }

  return normalized.split(' ').length >= 5;
}

async function fetchJson<T>(url: string, init?: RequestInit) {
  const response = await fetch(url, init);
  if (!response.ok) {
    throw new Error(`HTTP ${response.status} from ${url}`);
  }

  return response.json() as Promise<T>;
}

async function describeFunctionError(error: unknown) {
  const response = (error as { context?: Response } | null)?.context;
  if (!(response instanceof Response)) {
    return null;
  }

  try {
    const payload = await response.clone().json();
    return JSON.stringify(payload);
  } catch {
    try {
      return await response.text();
    } catch {
      return `${response.status}`;
    }
  }
}

function readManagementConfig(): ManagementConfig | null {
  const directToken = getEnv('SUPABASE_MANAGEMENT_TOKEN');
  const directProjectRef = getEnv('SUPABASE_MANAGEMENT_PROJECT_REF');
  if (directToken && directProjectRef) {
    return {
      projectRef: directProjectRef,
      token: directToken,
    };
  }

  const helperFiles = ['apply_seed.js', 'apply_seed.py'];
  for (const helperFile of helperFiles) {
    if (!existsSync(helperFile)) {
      continue;
    }

    const content = readFileSync(helperFile, 'utf8');
    const projectMatch = content.match(/projects\/([a-z0-9]+)\/database\/query/i);
    const tokenMatch = content.match(/Bearer\s+([A-Za-z0-9_\-]+)/);
    if (projectMatch?.[1] && tokenMatch?.[1]) {
      return {
        projectRef: projectMatch[1],
        token: tokenMatch[1],
      };
    }
  }

  const supabaseUrl = getEnv('SUPABASE_URL') || getEnv('VITE_SUPABASE_URL');
  const derivedProjectRef = supabaseUrl?.match(/^https:\/\/([a-z0-9]+)\.supabase\.co/i)?.[1];
  if (derivedProjectRef && directToken) {
    return {
      projectRef: derivedProjectRef,
      token: directToken,
    };
  }

  return null;
}

async function upsertClaimViaManagementApi(
  config: ManagementConfig,
  candidate: ClaimCandidate,
  result: CheckClaimResponse,
) {
  const slug = candidate.claimText
    .toLowerCase()
    .replace(/https?:\/\//g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80);

  const title = buildClaimTitle(candidate.claimText);
  const reasonSummary = buildReasonSummary(result);
  const details = buildDetails(result);
  const sourceUrl = candidate.url || result.sources[0]?.url || null;
  const sourcesJson = JSON.stringify(result.sources.map((source) => ({
    name: collapseWhitespace(source.title) || candidate.platform,
    text: collapseWhitespace(source.snippet),
    url: source.url,
  })));

  const query = `
WITH existing AS (
  SELECT id
  FROM public.claims
  WHERE slug = '${escapeSqlLiteral(slug)}'
  ORDER BY created_at DESC NULLS LAST
  LIMIT 1
),
updated AS (
  UPDATE public.claims
  SET
    title = EXCLUDED.title,
    claim_text = EXCLUDED.claim_text,
    source_url = EXCLUDED.source_url,
    category = EXCLUDED.category,
    verdict = EXCLUDED.verdict,
    confidence = EXCLUDED.confidence,
    reason_summary = EXCLUDED.reason_summary,
    details = EXCLUDED.details,
    sources = EXCLUDED.sources,
    status = EXCLUDED.status,
    updated_at = NOW()
  FROM (
    SELECT
      '${escapeSqlLiteral(title)}'::TEXT AS title,
      '${escapeSqlLiteral(candidate.claimText)}'::TEXT AS claim_text,
      ${escapeSqlNullable(sourceUrl)}::TEXT AS source_url,
      '${escapeSqlLiteral(candidate.category)}'::TEXT AS category,
      '${escapeSqlLiteral(toUiVerdict(result.verdict))}'::TEXT AS verdict,
      ${result.confidence}::INTEGER AS confidence,
      '${escapeSqlLiteral(reasonSummary)}'::TEXT AS reason_summary,
      '${escapeSqlLiteral(details)}'::TEXT AS details,
      '${escapeSqlLiteral(sourcesJson)}'::jsonb AS sources,
      'published'::TEXT AS status
  ) AS EXCLUDED
  WHERE public.claims.id IN (SELECT id FROM existing)
  RETURNING public.claims.id
),
inserted AS (
  INSERT INTO public.claims (
    slug,
    title,
    claim_text,
    source_url,
    category,
    verdict,
    confidence,
    reason_summary,
    details,
    sources,
    is_featured,
    status
  )
  SELECT
    '${escapeSqlLiteral(slug)}',
    '${escapeSqlLiteral(title)}',
    '${escapeSqlLiteral(candidate.claimText)}',
    ${escapeSqlNullable(sourceUrl)},
    '${escapeSqlLiteral(candidate.category)}',
    '${escapeSqlLiteral(toUiVerdict(result.verdict))}',
    ${result.confidence},
    '${escapeSqlLiteral(reasonSummary)}',
    '${escapeSqlLiteral(details)}',
    '${escapeSqlLiteral(sourcesJson)}'::jsonb,
    false,
    'published'
  WHERE NOT EXISTS (SELECT 1 FROM existing)
  RETURNING id
),
upserted AS (
  SELECT id FROM updated
  UNION ALL
  SELECT id FROM inserted
)
INSERT INTO public.claim_metrics (claim_id, laugh_count, share_count, view_count)
SELECT id, 0, 0, 0
FROM upserted
ON CONFLICT (claim_id) DO NOTHING;
`.trim();

  const response = await fetch(`https://api.supabase.com/v1/projects/${config.projectRef}/database/query`, {
    body: JSON.stringify({ query }),
    headers: {
      Authorization: `Bearer ${config.token}`,
      'Content-Type': 'application/json',
    },
    method: 'POST',
  });

  if (!response.ok) {
    const text = await response.text();
    throw new Error(`Management API insert failed (${response.status}): ${text}`);
  }
}

async function fetchHackerNewsCandidates(limit: number): Promise<ClaimCandidate[]> {
  const itemTarget = Math.max(limit * 2, limit);
  const candidates: ClaimCandidate[] = [];
  const seen = new Set<number>();

  for (const feed of HN_FEEDS) {
    if (candidates.length >= itemTarget) {
      break;
    }

    const ids = await fetchJson<number[]>(`https://hacker-news.firebaseio.com/v0/${feed}.json`);
    for (const id of ids) {
      if (seen.has(id) || candidates.length >= itemTarget) {
        continue;
      }

      seen.add(id);
      const item = await fetchJson<{
        by?: string;
        id: number;
        text?: string;
        title?: string;
        type?: string;
        url?: string;
      }>(`https://hacker-news.firebaseio.com/v0/item/${id}.json`);

      const title = collapseWhitespace(item.title || stripHtml(item.text || ''));
      if (!title || !looksClaimLike(title)) {
        continue;
      }

      candidates.push({
        category: 'Hacker News',
        claimText: title,
        externalId: String(item.id),
        platform: 'hackernews',
        question: 'Is this Hacker News claim accurate?',
        title,
        url: item.url || `https://news.ycombinator.com/item?id=${item.id}`,
      });
    }
  }

  return candidates;
}

async function fetchRedditCandidates(limit: number, subreddits: string[]): Promise<ClaimCandidate[]> {
  const perSubreddit = Math.max(10, Math.ceil(limit / Math.max(subreddits.length, 1)) + 5);
  const candidates: ClaimCandidate[] = [];

  for (const subreddit of subreddits) {
    if (candidates.length >= limit * 2) {
      break;
    }

    const url = `https://www.reddit.com/r/${subreddit}/hot.json?limit=${perSubreddit}&raw_json=1`;
    const payload = await fetchJson<{
      data?: {
        children?: Array<{
          data?: {
            id?: string;
            is_self?: boolean;
            over_18?: boolean;
            permalink?: string;
            stickied?: boolean;
            title?: string;
            url?: string;
          };
        }>;
      };
    }>(url, {
      headers: {
        'User-Agent': 'cap-seed-script/1.0',
      },
    });

    const posts = payload.data?.children ?? [];
    for (const entry of posts) {
      const post = entry.data;
      const title = collapseWhitespace(post?.title || '');
      if (!post?.id || !title || post.stickied || post.over_18 || !looksClaimLike(title)) {
        continue;
      }

      candidates.push({
        category: `Reddit / r/${subreddit}`,
        claimText: title,
        externalId: post.id,
        platform: 'reddit',
        question: 'Is this Reddit claim accurate?',
        title,
        url: post.url || (post.permalink ? `https://www.reddit.com${post.permalink}` : undefined),
      });
    }
  }

  return candidates;
}

function buildAnalysisCards(result: CheckClaimResponse) {
  return result.reasons
    .map((reason, index) => ({
      id: `reason-${index + 1}`,
      text: collapseWhitespace(reason),
      title: index === 0 ? 'Primary signal' : `Signal ${index + 1}`,
    }))
    .filter((card) => card.text.length > 0);
}

function buildPublishPayload(candidate: ClaimCandidate, result: CheckClaimResponse): PublishClaimInput {
  const analysisCards = buildAnalysisCards(result);

  return {
    category: candidate.category,
    checkedAt: new Date().toISOString(),
    claimText: candidate.claimText,
    mode: 'manual',
    question: candidate.question || CAP_DEFAULT_QUESTION,
    result: {
      analysisCards,
      claimText: candidate.claimText,
      confidence: result.confidence,
      sources: result.sources.map((source) => ({
        name: collapseWhitespace(source.title) || candidate.platform,
        text: collapseWhitespace(source.snippet),
        url: source.url,
      })),
      summary: analysisCards[0]?.text || collapseWhitespace(result.spokenSummary),
      verdict: toUiVerdict(result.verdict),
      verdictExplanation: collapseWhitespace(result.spokenSummary),
    },
    url: candidate.url,
    visitorId: `seed-script:${candidate.platform}`,
  };
}

async function readExistingSlugs(client: ReturnType<typeof createSupabaseClient>) {
  const { data, error } = await client
    .from('claims')
    .select('slug')
    .eq('status', 'published');

  if (error) {
    throw new Error(`Could not read existing claims: ${error.message}`);
  }

  return new Set(
    (data ?? [])
      .map((row) => String((row as { slug?: string }).slug || '').trim())
      .filter(Boolean),
  );
}

async function main() {
  const options = parseArgs(process.argv.slice(2));
  const supabase = createSupabaseClient();
  const managementConfig = readManagementConfig();

  console.log(`Fetching source candidates (target publishes: ${options.limit})...`);

  const [hnCandidates, redditCandidates, existingSlugs] = await Promise.all([
    options.hnLimit > 0 ? fetchHackerNewsCandidates(options.hnLimit) : Promise.resolve([]),
    options.redditLimit > 0 ? fetchRedditCandidates(options.redditLimit, options.redditSubreddits) : Promise.resolve([]),
    readExistingSlugs(supabase),
  ]);

  const combined = [...hnCandidates, ...redditCandidates];
  const deduped: ClaimCandidate[] = [];
  const seenSlugs = new Set(existingSlugs);

  for (const candidate of combined) {
    const slug = candidate.claimText
      .toLowerCase()
      .replace(/https?:\/\//g, '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .slice(0, 80);

    if (!slug || seenSlugs.has(slug)) {
      continue;
    }

    seenSlugs.add(slug);
    deduped.push(candidate);
  }

  console.log(`Fetched ${combined.length} candidates, ${deduped.length} unique after slug dedupe.`);

  let published = 0;
  let skipped = 0;
  let failed = 0;

  for (const candidate of deduped) {
    if (published >= options.limit) {
      break;
    }

    console.log(`[check] ${candidate.platform} :: ${candidate.title}`);

    try {
      const checkPayload: CheckClaimInput = {
        claimText: candidate.claimText,
        metadata: {
          externalId: candidate.externalId,
          seededFrom: candidate.platform,
          seedScript: 'seed-real-claims',
        },
        mode: 'manual',
        persistResult: false,
        question: candidate.question,
        url: candidate.url,
        visitorId: `seed-check:${candidate.platform}`,
      };

      const { data: checked, error: checkError } = await supabase.functions.invoke('check-claim', {
        body: checkPayload,
      });

      if (checkError) {
        failed += 1;
        const detail = await describeFunctionError(checkError);
        console.error(`  check failed: ${checkError.message}${detail ? ` :: ${detail}` : ''}`);
        continue;
      }

      if (isCheckClaimError(checked)) {
        failed += 1;
        console.error(`  check rejected: ${checked.error.message}`);
        continue;
      }

      if (!isCheckClaimResponse(checked) || checked.verdict === 'UNVERIFIED' || checked.sources.length === 0) {
        skipped += 1;
        console.log('  skipped: Cap could not verify this cleanly enough to publish.');
        continue;
      }

      const publishPayload = buildPublishPayload(candidate, checked);

      if (options.dryRun) {
        published += 1;
        console.log(`  dry-run ready: ${publishPayload.result.verdict} with ${publishPayload.result.sources.length} sources`);
        continue;
      }

      const { data: publishedResult, error: publishError } = await supabase.functions.invoke('publish-claim', {
        body: publishPayload,
      });

      if (publishError) {
        const detail = await describeFunctionError(publishError);
        if (!managementConfig) {
          failed += 1;
          console.error(`  publish failed: ${publishError.message}${detail ? ` :: ${detail}` : ''}`);
          continue;
        }

        try {
          await upsertClaimViaManagementApi(managementConfig, candidate, checked);
          published += 1;
          console.log(`  published via management fallback (${publishPayload.result.verdict})`);
        } catch (fallbackError) {
          failed += 1;
          console.error(
            `  publish failed: ${publishError.message}${detail ? ` :: ${detail}` : ''} :: fallback ${fallbackError instanceof Error ? fallbackError.message : String(fallbackError)}`,
          );
        }
        continue;
      }

      if (!isPublishClaimResponse(publishedResult)) {
        failed += 1;
        console.error('  publish failed: malformed publish response');
        continue;
      }

      published += 1;
      console.log(`  published: ${publishedResult.claimId} (${publishPayload.result.verdict})`);
    } catch (error) {
      failed += 1;
      console.error(`  failed: ${error instanceof Error ? error.message : String(error)}`);
    }

    if (options.delayMs > 0) {
      await sleep(options.delayMs);
    }
  }

  console.log('');
  console.log(`Complete. published=${published} skipped=${skipped} failed=${failed} dryRun=${options.dryRun}`);
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : String(error));
  process.exitCode = 1;
});
