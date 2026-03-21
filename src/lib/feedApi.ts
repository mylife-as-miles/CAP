import { supabase } from '@/src/lib/supabase';
import type { RankedClaim, RankedClaimRpcRow, TopCapsBoardMode } from '@/shared/leaderboard';

const disabledRankingRpcNames = new Set<string>();

function normalizeSources(
  value: RankedClaimRpcRow['sources'],
): RankedClaim['sources'] {
  if (!Array.isArray(value)) {
    return [];
  }

  return value
    .filter((source): source is NonNullable<typeof source> => Boolean(source?.url))
    .map((source) => ({
      name: source.name?.trim() || 'Source',
      text: source.text?.trim() || undefined,
      url: source.url!.trim(),
    }));
}

function mapRankedClaim(row: RankedClaimRpcRow): RankedClaim {
  return {
    board_rank: row.board_rank,
    category: row.category,
    caught_in_4k_score: Number(row.caught_in_4k_score ?? 0),
    claim_metrics: {
      laugh_count: row.laugh_count ?? 0,
      share_count: row.share_count ?? 0,
      view_count: row.view_count ?? 0,
    },
    claim_text: row.claim_text,
    confidence: row.confidence ?? 0,
    created_at: row.created_at,
    details: row.details?.trim() || undefined,
    id: row.id,
    is_featured: Boolean(row.is_featured),
    momentum_label: row.momentum_label ?? null,
    reason_summary: row.reason_summary,
    sources: normalizeSources(row.sources),
    status_tier: row.status_tier ?? null,
    title: row.title,
    top_cap_score: Number(row.top_cap_score ?? 0),
    trending_score: Number(row.trending_score ?? 0),
    verdict: row.verdict,
  };
}

function sortLegacyClaims(claims: RankedClaim[], mode: TopCapsBoardMode) {
  return [...claims].sort((left, right) => {
    if (mode === 'caught_in_4k') {
      const laughDiff = right.claim_metrics.laugh_count - left.claim_metrics.laugh_count;
      if (laughDiff !== 0) {
        return laughDiff;
      }

      const shareDiff = right.claim_metrics.share_count - left.claim_metrics.share_count;
      if (shareDiff !== 0) {
        return shareDiff;
      }
    } else if (mode === 'date_added') {
      return new Date(right.created_at).getTime() - new Date(left.created_at).getTime();
    } else {
      const shareDiff = right.claim_metrics.share_count - left.claim_metrics.share_count;
      if (shareDiff !== 0) {
        return shareDiff;
      }

      const laughDiff = right.claim_metrics.laugh_count - left.claim_metrics.laugh_count;
      if (laughDiff !== 0) {
        return laughDiff;
      }
    }

    return new Date(right.created_at).getTime() - new Date(left.created_at).getTime();
  }).map((claim, index) => ({
    ...claim,
    board_rank: index + 1,
  }));
}

async function getLegacyClaims(category?: string): Promise<RankedClaim[]> {
  let query = supabase
    .from('claims')
    .select('id, title, claim_text, category, verdict, confidence, reason_summary, details, sources, created_at, is_featured, claim_metrics(laugh_count, share_count, view_count)')
    .eq('status', 'published')
    .order('created_at', { ascending: false });

  if (category && category !== 'All') {
    query = query.eq('category', category);
  }

  const { data, error } = await query;

  if (error) {
    throw error;
  }

  return ((data ?? []) as any[]).map((row, index) => {
    const rawMetrics = Array.isArray(row.claim_metrics) ? row.claim_metrics[0] : row.claim_metrics;

    return {
      board_rank: index + 1,
      category: row.category,
      caught_in_4k_score: 0,
      claim_metrics: {
        laugh_count: rawMetrics?.laugh_count ?? 0,
        share_count: rawMetrics?.share_count ?? 0,
        view_count: rawMetrics?.view_count ?? 0,
      },
      claim_text: row.claim_text,
      confidence: row.confidence ?? 0,
      created_at: row.created_at,
      details: row.details ?? undefined,
      id: row.id,
      is_featured: Boolean(row.is_featured),
      momentum_label: null,
      reason_summary: row.reason_summary,
      sources: normalizeSources(row.sources),
      status_tier: null,
      title: row.title,
      top_cap_score: 0,
      trending_score: 0,
      verdict: row.verdict,
    } satisfies RankedClaim;
  });
}

function shouldUseLegacyFallback(error: any) {
  const code = error?.code;
  const status = Number(error?.status ?? 0);
  const message = String(error?.message ?? '').toLowerCase();
  const details = String(error?.details ?? '').toLowerCase();
  const hint = String(error?.hint ?? '').toLowerCase();
  const combined = `${message} ${details} ${hint}`;

  return (
    code === '2201F'
    || code === 'PGRST202'
    || code === 'PGRST116'
    || status === 404
    || combined.includes('404')
    || combined.includes('function')
    || combined.includes('schema cache')
    || combined.includes('square root of a negative number')
  );
}

function shouldDisableAllRankingRpcs(error: any) {
  const code = error?.code;
  const message = String(error?.message ?? '').toLowerCase();

  return code === '2201F' || message.includes('square root of a negative number');
}

async function withLegacyFallback<T>(
  rpcName: string,
  runRpc: () => Promise<T>,
  runFallback: () => Promise<T>,
) {
  if (disabledRankingRpcNames.has('*') || disabledRankingRpcNames.has(rpcName)) {
    return runFallback();
  }

  try {
    return await runRpc();
  } catch (error) {
    if (!shouldUseLegacyFallback(error)) {
      throw error;
    }

    disabledRankingRpcNames.add(shouldDisableAllRankingRpcs(error) ? '*' : rpcName);
    console.warn(`[feedApi] Falling back to legacy claims query for ${rpcName}:`, error);
    return runFallback();
  }
}

export async function getTrendingCaps(limit = 20): Promise<RankedClaim[]> {
  return withLegacyFallback('get_trending_caps', async () => {
    const { data, error } = await supabase.rpc('get_trending_caps', {
      p_limit: limit,
    });

    if (error) {
      throw error;
    }

    return ((data ?? []) as RankedClaimRpcRow[]).map(mapRankedClaim);
  }, async () => {
    const claims = await getLegacyClaims();
    return sortLegacyClaims(claims, 'top_caps').slice(0, limit);
  });
}

export async function getTopCapsBoard(
  mode: TopCapsBoardMode,
  category?: string,
  limit = 100,
): Promise<RankedClaim[]> {
  return withLegacyFallback('get_top_caps_board', async () => {
    const { data, error } = await supabase.rpc('get_top_caps_board', {
      p_category: category && category !== 'All' ? category : null,
      p_limit: limit,
      p_mode: mode,
    });

    if (error) {
      throw error;
    }

    return ((data ?? []) as RankedClaimRpcRow[]).map(mapRankedClaim);
  }, async () => {
    const claims = await getLegacyClaims(category);
    return sortLegacyClaims(claims, mode).slice(0, limit);
  });
}

export async function getCapOfDay(): Promise<RankedClaim | null> {
  return withLegacyFallback('get_cap_of_day', async () => {
    const { data, error } = await supabase.rpc('get_cap_of_day');

    if (error) {
      throw error;
    }

    const rows = (data ?? []) as RankedClaimRpcRow[];
    return rows[0] ? mapRankedClaim(rows[0]) : null;
  }, async () => {
    const claims = await getLegacyClaims();
    const [first] = sortLegacyClaims(claims, 'top_caps');
    return first ?? null;
  });
}
