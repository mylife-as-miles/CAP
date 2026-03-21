import { supabase } from '@/src/lib/supabase';
import type { RankedClaim, RankedClaimRpcRow, TopCapsBoardMode } from '@/shared/leaderboard';

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

export async function getTrendingCaps(limit = 20): Promise<RankedClaim[]> {
  const { data, error } = await supabase.rpc('get_trending_caps', {
    p_limit: limit,
  });

  if (error) {
    throw error;
  }

  return ((data ?? []) as RankedClaimRpcRow[]).map(mapRankedClaim);
}

export async function getTopCapsBoard(
  mode: TopCapsBoardMode,
  category?: string,
  limit = 100,
): Promise<RankedClaim[]> {
  const { data, error } = await supabase.rpc('get_top_caps_board', {
    p_category: category && category !== 'All' ? category : null,
    p_limit: limit,
    p_mode: mode,
  });

  if (error) {
    throw error;
  }

  return ((data ?? []) as RankedClaimRpcRow[]).map(mapRankedClaim);
}

export async function getCapOfDay(): Promise<RankedClaim | null> {
  const { data, error } = await supabase.rpc('get_cap_of_day');

  if (error) {
    throw error;
  }

  const rows = (data ?? []) as RankedClaimRpcRow[];
  return rows[0] ? mapRankedClaim(rows[0]) : null;
}
