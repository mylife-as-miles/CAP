CREATE OR REPLACE FUNCTION public.safe_ratio(numerator NUMERIC, denominator NUMERIC)
RETURNS NUMERIC
LANGUAGE sql
IMMUTABLE
AS $$
    SELECT CASE
        WHEN denominator IS NULL OR denominator = 0 THEN 0
        ELSE numerator / denominator
    END;
$$;

CREATE OR REPLACE FUNCTION public.wilson_lower_bound(
    positive_count NUMERIC,
    total_count NUMERIC,
    z NUMERIC DEFAULT 1.96
)
RETURNS NUMERIC
LANGUAGE sql
IMMUTABLE
AS $$
    WITH bounded AS (
        SELECT
            GREATEST(COALESCE(total_count, 0), 0) AS bounded_total,
            LEAST(
                GREATEST(COALESCE(positive_count, 0), 0),
                GREATEST(COALESCE(total_count, 0), 0)
            ) AS bounded_positive,
            COALESCE(z, 1.96) AS bounded_z
    )
    SELECT CASE
        WHEN bounded_total <= 0 THEN 0
        ELSE (
            (
                public.safe_ratio(bounded_positive, bounded_total)
                + ((bounded_z * bounded_z) / (2 * bounded_total))
                - bounded_z * sqrt(
                    GREATEST(
                        0::NUMERIC,
                        (
                            public.safe_ratio(bounded_positive, bounded_total)
                            * (1 - public.safe_ratio(bounded_positive, bounded_total))
                            + ((bounded_z * bounded_z) / (4 * bounded_total))
                        ) / bounded_total
                    )
                )
            ) / (1 + ((bounded_z * bounded_z) / bounded_total))
        )
    END
    FROM bounded;
$$;

DROP FUNCTION IF EXISTS public.get_trending_caps(INTEGER);
CREATE FUNCTION public.get_trending_caps(p_limit INTEGER DEFAULT 20)
RETURNS TABLE (
    id UUID,
    title TEXT,
    claim_text TEXT,
    category TEXT,
    verdict TEXT,
    confidence INTEGER,
    reason_summary TEXT,
    details TEXT,
    sources JSONB,
    created_at TIMESTAMPTZ,
    is_featured BOOLEAN,
    laugh_count INTEGER,
    share_count INTEGER,
    view_count INTEGER,
    status_tier TEXT,
    momentum_label TEXT,
    board_rank BIGINT,
    top_cap_score NUMERIC,
    trending_score NUMERIC,
    caught_in_4k_score NUMERIC
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    PERFORM public.sync_trending_top10_milestones();

    RETURN QUERY
    WITH ranked AS (
        SELECT
            snapshot.*,
            ROW_NUMBER() OVER (
                ORDER BY snapshot.top_cap_score DESC, snapshot.wilson_tiebreaker DESC, snapshot.created_at DESC
            ) AS top_rank,
            PERCENT_RANK() OVER (ORDER BY snapshot.top_cap_score) AS top_percentile,
            ROW_NUMBER() OVER (
                ORDER BY snapshot.trending_score DESC, snapshot.acceleration DESC, snapshot.share_rate_per_view DESC, snapshot.created_at DESC
            ) AS trend_rank,
            PERCENT_RANK() OVER (ORDER BY snapshot.trending_score) AS trend_percentile
        FROM public.claim_ranking_snapshot() snapshot
    )
    SELECT
        ranked.claim_id AS id,
        ranked.title,
        ranked.claim_text,
        ranked.category,
        ranked.verdict,
        ranked.confidence,
        ranked.reason_summary,
        ranked.details,
        ranked.sources,
        ranked.created_at,
        ranked.is_featured,
        ranked.laugh_count,
        ranked.share_count,
        ranked.view_count,
        public.derive_status_tier('top_caps', ranked.trend_rank, ranked.top_rank, ranked.top_percentile, ranked.age_hours) AS status_tier,
        public.derive_momentum_label(
            ranked.trend_rank,
            ranked.trend_percentile,
            ranked.age_hours,
            ranked.unique_source_clicks_3h,
            ranked.share_rate_per_view,
            ranked.unique_laughs_3h,
            ranked.unique_shares_3h,
            ranked.acceleration
        ) AS momentum_label,
        ranked.trend_rank AS board_rank,
        ranked.top_cap_score,
        ranked.trending_score,
        ranked.caught_in_4k_score
    FROM ranked
    ORDER BY ranked.trend_rank
    LIMIT GREATEST(COALESCE(p_limit, 20), 1);
END;
$$;

DROP FUNCTION IF EXISTS public.get_top_caps_board(TEXT, TEXT, INTEGER);
CREATE FUNCTION public.get_top_caps_board(
    p_mode TEXT DEFAULT 'top_caps',
    p_category TEXT DEFAULT NULL,
    p_limit INTEGER DEFAULT 100
)
RETURNS TABLE (
    id UUID,
    title TEXT,
    claim_text TEXT,
    category TEXT,
    verdict TEXT,
    confidence INTEGER,
    reason_summary TEXT,
    details TEXT,
    sources JSONB,
    created_at TIMESTAMPTZ,
    is_featured BOOLEAN,
    laugh_count INTEGER,
    share_count INTEGER,
    view_count INTEGER,
    status_tier TEXT,
    momentum_label TEXT,
    board_rank BIGINT,
    top_cap_score NUMERIC,
    trending_score NUMERIC,
    caught_in_4k_score NUMERIC
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    resolved_mode TEXT := CASE
        WHEN p_mode IN ('top_caps', 'caught_in_4k', 'date_added') THEN p_mode
        ELSE 'top_caps'
    END;
BEGIN
    RETURN QUERY
    WITH ranked AS (
        SELECT
            snapshot.*,
            ROW_NUMBER() OVER (
                ORDER BY snapshot.top_cap_score DESC, snapshot.wilson_tiebreaker DESC, snapshot.created_at DESC
            ) AS top_rank,
            PERCENT_RANK() OVER (ORDER BY snapshot.top_cap_score) AS top_percentile,
            ROW_NUMBER() OVER (
                ORDER BY snapshot.trending_score DESC, snapshot.acceleration DESC, snapshot.share_rate_per_view DESC, snapshot.created_at DESC
            ) AS trend_rank,
            PERCENT_RANK() OVER (ORDER BY snapshot.trending_score) AS trend_percentile,
            ROW_NUMBER() OVER (
                ORDER BY snapshot.caught_in_4k_score DESC, snapshot.wilson_tiebreaker DESC, snapshot.created_at DESC
            ) AS funny_rank,
            ROW_NUMBER() OVER (ORDER BY snapshot.created_at DESC) AS recent_rank
        FROM public.claim_ranking_snapshot() snapshot
        WHERE p_category IS NULL OR p_category = 'All' OR snapshot.category = p_category
    )
    SELECT
        ranked.claim_id AS id,
        ranked.title,
        ranked.claim_text,
        ranked.category,
        ranked.verdict,
        ranked.confidence,
        ranked.reason_summary,
        ranked.details,
        ranked.sources,
        ranked.created_at,
        ranked.is_featured,
        ranked.laugh_count,
        ranked.share_count,
        ranked.view_count,
        public.derive_status_tier(
            CASE WHEN resolved_mode = 'caught_in_4k' THEN 'caught_in_4k' ELSE 'top_caps' END,
            CASE
                WHEN resolved_mode = 'caught_in_4k' THEN ranked.funny_rank
                WHEN resolved_mode = 'date_added' THEN ranked.recent_rank
                ELSE ranked.top_rank
            END,
            ranked.top_rank,
            ranked.top_percentile,
            ranked.age_hours
        ) AS status_tier,
        public.derive_momentum_label(
            ranked.trend_rank,
            ranked.trend_percentile,
            ranked.age_hours,
            ranked.unique_source_clicks_3h,
            ranked.share_rate_per_view,
            ranked.unique_laughs_3h,
            ranked.unique_shares_3h,
            ranked.acceleration
        ) AS momentum_label,
        CASE
            WHEN resolved_mode = 'caught_in_4k' THEN ranked.funny_rank
            WHEN resolved_mode = 'date_added' THEN ranked.recent_rank
            ELSE ranked.top_rank
        END AS board_rank,
        ranked.top_cap_score,
        ranked.trending_score,
        ranked.caught_in_4k_score
    FROM ranked
    ORDER BY
        CASE
            WHEN resolved_mode = 'caught_in_4k' THEN ranked.funny_rank
            WHEN resolved_mode = 'date_added' THEN ranked.recent_rank
            ELSE ranked.top_rank
        END
    LIMIT GREATEST(COALESCE(p_limit, 100), 1);
END;
$$;

DROP FUNCTION IF EXISTS public.get_cap_of_day();
CREATE FUNCTION public.get_cap_of_day()
RETURNS TABLE (
    id UUID,
    title TEXT,
    claim_text TEXT,
    category TEXT,
    verdict TEXT,
    confidence INTEGER,
    reason_summary TEXT,
    details TEXT,
    sources JSONB,
    created_at TIMESTAMPTZ,
    is_featured BOOLEAN,
    laugh_count INTEGER,
    share_count INTEGER,
    view_count INTEGER,
    status_tier TEXT,
    momentum_label TEXT,
    board_rank BIGINT,
    top_cap_score NUMERIC,
    trending_score NUMERIC,
    caught_in_4k_score NUMERIC
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    PERFORM public.sync_trending_top10_milestones();

    RETURN QUERY
    WITH hard_override AS (
        SELECT override.claim_id
        FROM public.claim_editorial_overrides override
        WHERE override.slot = 'cap_of_day'
          AND override.active_date = CURRENT_DATE
          AND override.hard_override = TRUE
        ORDER BY override.editorial_priority DESC, override.created_at DESC
        LIMIT 1
    ),
    ranked AS (
        SELECT
            snapshot.*,
            ROW_NUMBER() OVER (
                ORDER BY snapshot.top_cap_score DESC, snapshot.wilson_tiebreaker DESC, snapshot.created_at DESC
            ) AS top_rank,
            PERCENT_RANK() OVER (ORDER BY snapshot.top_cap_score) AS top_percentile,
            ROW_NUMBER() OVER (
                ORDER BY snapshot.trending_score DESC, snapshot.acceleration DESC, snapshot.share_rate_per_view DESC, snapshot.created_at DESC
            ) AS trend_rank,
            PERCENT_RANK() OVER (ORDER BY snapshot.trending_score) AS trend_percentile,
            MIN(snapshot.trending_score) OVER () AS min_trending_score,
            MAX(snapshot.trending_score) OVER () AS max_trending_score,
            COALESCE(override.editorial_priority, 0) AS editorial_priority
        FROM public.claim_ranking_snapshot() snapshot
        LEFT JOIN public.claim_editorial_overrides override
            ON override.claim_id = snapshot.claim_id
           AND override.slot = 'cap_of_day'
           AND override.active_date = CURRENT_DATE
    ),
    scored AS (
        SELECT
            ranked.*,
            CASE
                WHEN ranked.max_trending_score = ranked.min_trending_score THEN 0
                ELSE public.safe_ratio(
                    ranked.trending_score - ranked.min_trending_score,
                    ranked.max_trending_score - ranked.min_trending_score
                )
            END AS normalized_trending_score,
            (
                0.7 * CASE
                    WHEN ranked.max_trending_score = ranked.min_trending_score THEN 0
                    ELSE public.safe_ratio(
                        ranked.trending_score - ranked.min_trending_score,
                        ranked.max_trending_score - ranked.min_trending_score
                    )
                END
                + 0.3 * public.safe_ratio(ranked.editorial_priority, 100)
            ) AS cap_of_day_score
        FROM ranked
    )
    SELECT
        scored.claim_id AS id,
        scored.title,
        scored.claim_text,
        scored.category,
        scored.verdict,
        scored.confidence,
        scored.reason_summary,
        scored.details,
        scored.sources,
        scored.created_at,
        scored.is_featured,
        scored.laugh_count,
        scored.share_count,
        scored.view_count,
        'Cap of the Day' AS status_tier,
        public.derive_momentum_label(
            scored.trend_rank,
            scored.trend_percentile,
            scored.age_hours,
            scored.unique_source_clicks_3h,
            scored.share_rate_per_view,
            scored.unique_laughs_3h,
            scored.unique_shares_3h,
            scored.acceleration
        ) AS momentum_label,
        1 AS board_rank,
        scored.top_cap_score,
        scored.trending_score,
        scored.caught_in_4k_score
    FROM scored
    ORDER BY
        CASE WHEN EXISTS (SELECT 1 FROM hard_override WHERE hard_override.claim_id = scored.claim_id) THEN 0 ELSE 1 END,
        CASE
            WHEN EXISTS (SELECT 1 FROM hard_override) THEN scored.editorial_priority
            ELSE scored.cap_of_day_score
        END DESC,
        scored.trending_score DESC,
        scored.top_cap_score DESC
    LIMIT 1;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_trending_caps(INTEGER) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_top_caps_board(TEXT, TEXT, INTEGER) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_cap_of_day() TO anon, authenticated;

NOTIFY pgrst, 'reload schema';
