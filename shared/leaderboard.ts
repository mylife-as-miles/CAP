import type { CapUiVerdict } from './cap';

export type TopCapsBoardMode = 'top_caps' | 'caught_in_4k' | 'date_added';
export type PublishedCapVerdict = Exclude<CapUiVerdict, 'UNVERIFIED'>;

export interface RankedClaimRpcRow {
  id: string;
  title: string;
  claim_text: string;
  category: string;
  verdict: PublishedCapVerdict;
  confidence: number;
  reason_summary: string;
  details?: string | null;
  sources?: { name?: string; url?: string; text?: string }[] | null;
  created_at: string;
  is_featured: boolean;
  laugh_count: number;
  share_count: number;
  view_count: number;
  status_tier?: string | null;
  momentum_label?: string | null;
  board_rank: number;
  top_cap_score: number;
  trending_score: number;
  caught_in_4k_score: number;
}

export interface RankedClaimMetrics {
  laugh_count: number;
  share_count: number;
  view_count: number;
}

export interface RankedClaim {
  id: string;
  title: string;
  claim_text: string;
  category: string;
  verdict: PublishedCapVerdict;
  confidence: number;
  reason_summary: string;
  details?: string;
  sources?: { name: string; url: string; text?: string }[];
  created_at: string;
  is_featured: boolean;
  claim_metrics: RankedClaimMetrics;
  status_tier?: string | null;
  momentum_label?: string | null;
  board_rank: number;
  top_cap_score: number;
  trending_score: number;
  caught_in_4k_score: number;
}
