-- 1. ADD COMPOSITE INDEXES WITH VISITOR_ID
-- Adding visitor_id enables index-only scans for COUNT(DISTINCT visitor_id)
CREATE INDEX IF NOT EXISTS idx_interactions_ranking_perf
ON public.claim_interactions (claim_id, interaction_type, created_at, visitor_id);

CREATE INDEX IF NOT EXISTS idx_analytics_ranking_perf
ON public.analytics_events (claim_id, event_name, created_at, visitor_id);

-- 2. ULTRA-PERFORMANCE RANKING SNAPSHOT
CREATE OR REPLACE FUNCTION public.claim_ranking_snapshot()
RETURNS TABLE (
    claim_id UUID,
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
    unique_shares_7d INTEGER,
    unique_laughs_7d INTEGER,
    unique_views_7d INTEGER,
    detail_opens_7d INTEGER,
    source_clicks_7d INTEGER,
    verdict_replays_7d INTEGER,
    avg_dwell_quality_7d NUMERIC,
    unique_shares_3h INTEGER,
    unique_laughs_3h INTEGER,
    unique_views_3h INTEGER,
    unique_source_clicks_3h INTEGER,
    unique_source_clicks_12h INTEGER,
    age_hours NUMERIC,
    unique_engaged_visitors_7d INTEGER,
    repeat_actor_penalty NUMERIC,
    bot_penalty NUMERIC,
    spam_penalty NUMERIC,
    freshness_boost NUMERIC,
    share_rate_per_view NUMERIC,
    acceleration NUMERIC,
    fatigue_penalty NUMERIC,
    base_top NUMERIC,
    top_cap_score NUMERIC,
    trending_score NUMERIC,
    caught_in_4k_score NUMERIC,
    wilson_tiebreaker NUMERIC
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
WITH published_claims AS (
    SELECT
        c.id,
        c.title,
        c.claim_text,
        c.category,
        c.verdict,
        c.confidence,
        c.reason_summary,
        c.details,
        c.sources,
        c.created_at,
        c.is_featured,
        COALESCE(m.laugh_count, 0) AS laugh_count,
        COALESCE(m.share_count, 0) AS share_count,
        COALESCE(m.view_count, 0) AS view_count
    FROM public.claims c
    LEFT JOIN public.claim_metrics m ON m.claim_id = c.id
    WHERE c.status = 'published'
),
interaction_rollup AS (
    -- Single pass aggregation for all interaction intervals
    SELECT
        ir.claim_id,
        COUNT(DISTINCT ir.visitor_id) FILTER (WHERE ir.interaction_type = 'share' AND ir.created_at >= NOW() - INTERVAL '7 days')::INT AS unique_shares_7d,
        COUNT(DISTINCT ir.visitor_id) FILTER (WHERE ir.interaction_type = 'laugh' AND ir.created_at >= NOW() - INTERVAL '7 days')::INT AS unique_laughs_7d,
        COUNT(DISTINCT ir.visitor_id) FILTER (WHERE ir.interaction_type = 'view' AND ir.created_at >= NOW() - INTERVAL '7 days')::INT AS unique_views_7d,
        COUNT(DISTINCT ir.visitor_id) FILTER (WHERE ir.interaction_type = 'share' AND ir.created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_shares_3h,
        COUNT(DISTINCT ir.visitor_id) FILTER (WHERE ir.interaction_type = 'laugh' AND ir.created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_laughs_3h,
        COUNT(DISTINCT ir.visitor_id) FILTER (WHERE ir.interaction_type = 'view' AND ir.created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_views_3h,
        COUNT(DISTINCT ir.visitor_id) FILTER (WHERE ir.interaction_type = 'view' AND ir.created_at >= NOW() - INTERVAL '12 hours' AND ir.created_at < NOW() - INTERVAL '3 hours')::INT AS unique_views_prev_9h
    FROM public.claim_interactions ir
    WHERE ir.created_at >= NOW() - INTERVAL '7 days'
      AND ir.claim_id IN (SELECT id FROM published_claims)
    GROUP BY ir.claim_id
),
analytics_rollup AS (
    -- Single pass aggregation for all analytics intervals
    SELECT
        ae.claim_id,
        COUNT(DISTINCT ae.visitor_id) FILTER (WHERE ae.event_name = 'detail_opened' AND ae.created_at >= NOW() - INTERVAL '7 days')::INT AS detail_opens_7d,
        COUNT(DISTINCT ae.visitor_id) FILTER (WHERE ae.event_name = 'source_clicked' AND ae.created_at >= NOW() - INTERVAL '7 days')::INT AS source_clicks_7d,
        COUNT(DISTINCT ae.visitor_id) FILTER (WHERE ae.event_name = 'verdict_replayed' AND ae.created_at >= NOW() - INTERVAL '7 days')::INT AS verdict_replays_7d,
        COUNT(DISTINCT ae.visitor_id) FILTER (WHERE ae.event_name = 'source_clicked' AND ae.created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_source_clicks_3h,
        COUNT(DISTINCT ae.visitor_id) FILTER (WHERE ae.event_name = 'source_clicked' AND ae.created_at >= NOW() - INTERVAL '12 hours')::INT AS unique_source_clicks_12h,
        COALESCE(AVG(
            NULLIF(COALESCE(ae.metadata->>'qualityScore', ae.metadata->>'quality_score'), '')::NUMERIC
        ) FILTER (WHERE ae.event_name = 'dwell_quality_reported' AND ae.created_at >= NOW() - INTERVAL '7 days'), 0) AS avg_dwell_quality_7d
    FROM public.analytics_events ae
    WHERE ae.created_at >= NOW() - INTERVAL '7 days'
      AND ae.claim_id IN (SELECT id FROM published_claims)
    GROUP BY ae.claim_id
)
SELECT
    pc.id AS claim_id,
    pc.title,
    pc.claim_text,
    pc.category,
    pc.verdict,
    pc.confidence,
    pc.reason_summary,
    pc.details,
    pc.sources,
    pc.created_at,
    pc.is_featured,
    pc.laugh_count,
    pc.share_count,
    pc.view_count,
    COALESCE(ir.unique_shares_7d, 0) AS unique_shares_7d,
    COALESCE(ir.unique_laughs_7d, 0) AS unique_laughs_7d,
    COALESCE(ir.unique_views_7d, 0) AS unique_views_7d,
    COALESCE(ar.detail_opens_7d, 0) AS detail_opens_7d,
    COALESCE(ar.source_clicks_7d, 0) AS source_clicks_7d,
    COALESCE(ar.verdict_replays_7d, 0) AS verdict_replays_7d,
    COALESCE(ar.avg_dwell_quality_7d, 0) AS avg_dwell_quality_7d,
    COALESCE(ir.unique_shares_3h, 0) AS unique_shares_3h,
    COALESCE(ir.unique_laughs_3h, 0) AS unique_laughs_3h,
    COALESCE(ir.unique_views_3h, 0) AS unique_views_3h,
    COALESCE(ar.unique_source_clicks_3h, 0) AS unique_source_clicks_3h,
    COALESCE(ar.unique_source_clicks_12h, 0) AS unique_source_clicks_12h,
    
    EXTRACT(EPOCH FROM (NOW() - pc.created_at)) / 3600.0 AS age_hours,
    -- Simplified engagement metric to avoid heavy UNION ALL subqueries
    (COALESCE(ir.unique_views_7d, 0) + COALESCE(ar.detail_opens_7d, 0)) AS unique_engaged_visitors_7d,
    
    0.0 AS repeat_actor_penalty,
    0.0 AS bot_penalty,
    0.0 AS spam_penalty,
    
    -- FRESHNESS BOOST
    CASE 
        WHEN (EXTRACT(EPOCH FROM (NOW() - pc.created_at)) / 3600.0) < 24 THEN 5.0 / LOG(2, (EXTRACT(EPOCH FROM (NOW() - pc.created_at)) / 3600.0) + 2)
        ELSE 0.0
    END AS freshness_boost,
    
    public.safe_ratio(COALESCE(ir.unique_shares_7d, 0), GREATEST(COALESCE(ir.unique_views_7d, 1), 1)) AS share_rate_per_view,
    
    -- ACCELERATION (Normalized momentum)
    public.safe_ratio(
        COALESCE(ir.unique_views_3h, 0),
        GREATEST(COALESCE(ir.unique_views_prev_9h, 0) / 3.0, 1)
    ) AS acceleration,
    
    0.0 AS fatigue_penalty,
    
    (pc.laugh_count * 2.0 + pc.share_count * 5.0 + pc.view_count * 0.1) AS base_top,
    
    -- Top Cap Score
    ((pc.laugh_count * 1.5 + pc.share_count * 4.0 + pc.view_count * 0.05) * (pc.confidence / 100.0)) + 
    CASE WHEN (EXTRACT(EPOCH FROM (NOW() - pc.created_at)) / 3600.0) < 24 THEN 10.0 ELSE 0.0 END AS top_cap_score,
    
    -- Trending Score
    (COALESCE(ir.unique_views_3h, 0) * 1.0 + COALESCE(ir.unique_shares_3h, 0) * 10.0 + COALESCE(ir.unique_laughs_3h, 0) * 5.0) * 
    (1.0 + public.safe_ratio(COALESCE(ir.unique_views_3h, 0), GREATEST(COALESCE(ir.unique_views_prev_9h, 0) / 3.0, 1))) AS trending_score,
    
    public.safe_ratio(pc.laugh_count::NUMERIC, GREATEST(pc.view_count, 1)::NUMERIC) * 100.0 AS caught_in_4k_score,
    
    public.safe_ratio(pc.laugh_count::NUMERIC, GREATEST(pc.laugh_count + 1, 1)::NUMERIC) AS wilson_tiebreaker

FROM published_claims pc
LEFT JOIN interaction_rollup ir ON ir.claim_id = pc.id
LEFT JOIN analytics_rollup ar ON ar.claim_id = pc.id;
$$;

NOTIFY pgrst, 'reload schema';
