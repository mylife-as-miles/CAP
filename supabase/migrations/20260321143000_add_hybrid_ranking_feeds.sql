CREATE TABLE IF NOT EXISTS public.claim_editorial_overrides (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    claim_id UUID NOT NULL REFERENCES public.claims(id) ON DELETE CASCADE,
    slot TEXT NOT NULL CHECK (slot IN ('cap_of_day')),
    active_date DATE NOT NULL,
    editorial_priority NUMERIC(6, 2) DEFAULT 0 CHECK (editorial_priority >= 0 AND editorial_priority <= 100),
    hard_override BOOLEAN DEFAULT FALSE,
    note TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE (slot, active_date, claim_id)
);

CREATE TABLE IF NOT EXISTS public.claim_visitor_badges (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    claim_id UUID NOT NULL REFERENCES public.claims(id) ON DELETE CASCADE,
    visitor_id TEXT NOT NULL,
    badge TEXT NOT NULL CHECK (badge IN ('early_spotter')),
    metadata JSONB DEFAULT '{}'::jsonb,
    awarded_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE (claim_id, visitor_id, badge)
);

CREATE TABLE IF NOT EXISTS public.claim_feed_milestones (
    claim_id UUID PRIMARY KEY REFERENCES public.claims(id) ON DELETE CASCADE,
    first_trending_top10_at TIMESTAMPTZ
);

ALTER TABLE IF EXISTS public.claim_editorial_overrides ADD COLUMN IF NOT EXISTS editorial_priority NUMERIC(6, 2) DEFAULT 0;
ALTER TABLE IF EXISTS public.claim_editorial_overrides ADD COLUMN IF NOT EXISTS hard_override BOOLEAN DEFAULT FALSE;
ALTER TABLE IF EXISTS public.claim_editorial_overrides ADD COLUMN IF NOT EXISTS note TEXT;
ALTER TABLE IF EXISTS public.claim_editorial_overrides ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW();
ALTER TABLE IF EXISTS public.claim_editorial_overrides ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();

ALTER TABLE IF EXISTS public.claim_visitor_badges ADD COLUMN IF NOT EXISTS metadata JSONB DEFAULT '{}'::jsonb;
ALTER TABLE IF EXISTS public.claim_visitor_badges ADD COLUMN IF NOT EXISTS awarded_at TIMESTAMPTZ DEFAULT NOW();

DROP INDEX IF EXISTS idx_claim_editorial_hard_override;
CREATE UNIQUE INDEX idx_claim_editorial_hard_override
ON public.claim_editorial_overrides (slot, active_date)
WHERE hard_override;

CREATE INDEX IF NOT EXISTS idx_claim_editorial_lookup
ON public.claim_editorial_overrides (slot, active_date, claim_id);

CREATE INDEX IF NOT EXISTS idx_claim_badges_lookup
ON public.claim_visitor_badges (visitor_id, badge, awarded_at DESC);

CREATE INDEX IF NOT EXISTS idx_claim_feed_milestones_lookup
ON public.claim_feed_milestones (first_trending_top10_at DESC);

CREATE INDEX IF NOT EXISTS idx_claim_interactions_claim_type_created
ON public.claim_interactions (claim_id, interaction_type, created_at DESC, visitor_id);

CREATE INDEX IF NOT EXISTS idx_analytics_claim_event_created
ON public.analytics_events (claim_id, event_name, created_at DESC, visitor_id);

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'analytics_events_event_name_check'
          AND conrelid = 'public.analytics_events'::regclass
    ) THEN
        ALTER TABLE public.analytics_events DROP CONSTRAINT analytics_events_event_name_check;
    END IF;
END $$;

ALTER TABLE public.analytics_events
ADD CONSTRAINT analytics_events_event_name_check CHECK (
    event_name IN (
        'session_started',
        'claim_checked',
        'verdict_viewed',
        'laugh_clicked',
        'share_clicked',
        'top_caps_viewed',
        'voice_session_started',
        'voice_session_completed',
        'detail_opened',
        'source_clicked',
        'verdict_replayed',
        'dwell_quality_reported'
    )
);

DROP TRIGGER IF EXISTS set_claim_editorial_overrides_updated_at ON public.claim_editorial_overrides;
CREATE TRIGGER set_claim_editorial_overrides_updated_at BEFORE UPDATE ON public.claim_editorial_overrides
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

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

CREATE OR REPLACE FUNCTION public.wilson_lower_bound(positive_count NUMERIC, total_count NUMERIC, z NUMERIC DEFAULT 1.96)
RETURNS NUMERIC
LANGUAGE sql
IMMUTABLE
AS $$
    SELECT CASE
        WHEN total_count IS NULL OR total_count <= 0 THEN 0
        ELSE (
            (
                public.safe_ratio(positive_count, total_count)
                + ((z * z) / (2 * total_count))
                - z * sqrt(
                    (
                        public.safe_ratio(positive_count, total_count)
                        * (1 - public.safe_ratio(positive_count, total_count))
                        + ((z * z) / (4 * total_count))
                    ) / total_count
                )
            ) / (1 + ((z * z) / total_count))
        )
    END;
$$;

CREATE OR REPLACE FUNCTION public.derive_status_tier(
    p_mode TEXT,
    p_board_rank BIGINT,
    p_top_rank BIGINT,
    p_top_percentile DOUBLE PRECISION,
    p_age_hours NUMERIC
)
RETURNS TEXT
LANGUAGE sql
IMMUTABLE
AS $$
    SELECT CASE
        WHEN p_mode = 'caught_in_4k' AND p_board_rank BETWEEN 1 AND 10 THEN 'Caught in 4K'
        WHEN p_top_rank = 1 THEN 'Nuclear Cap'
        WHEN p_top_rank BETWEEN 2 AND 10 THEN 'Hall of Shame'
        WHEN p_age_hours >= 336 AND COALESCE(p_top_percentile, 0) >= 0.9 THEN 'Historically Delusional'
        ELSE NULL
    END;
$$;

CREATE OR REPLACE FUNCTION public.derive_momentum_label(
    p_trend_rank BIGINT,
    p_trend_percentile DOUBLE PRECISION,
    p_age_hours NUMERIC,
    p_source_clicks_3h INTEGER,
    p_share_rate_per_view NUMERIC,
    p_laughs_3h INTEGER,
    p_shares_3h INTEGER,
    p_acceleration NUMERIC
)
RETURNS TEXT
LANGUAGE sql
IMMUTABLE
AS $$
    SELECT CASE
        WHEN p_trend_rank = 1 AND COALESCE(p_acceleration, 0) > 0 THEN 'Fastest-rising cap'
        WHEN p_age_hours < 6 AND COALESCE(p_source_clicks_3h, 0) > 0 THEN 'Under investigation'
        WHEN COALESCE(p_share_rate_per_view, 0) >= 0.08 THEN 'This one''s spreading'
        WHEN COALESCE(p_laughs_3h, 0) >= COALESCE(p_shares_3h, 0) AND COALESCE(p_laughs_3h, 0) >= 10 THEN 'People are losing it'
        WHEN COALESCE(p_trend_percentile, 0) >= 0.9 THEN 'Blowing up'
        ELSE NULL
    END;
$$;

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
    SELECT
        claim_id,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'share' AND created_at >= NOW() - INTERVAL '7 days')::INT AS unique_shares_7d,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'laugh' AND created_at >= NOW() - INTERVAL '7 days')::INT AS unique_laughs_7d,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'view' AND created_at >= NOW() - INTERVAL '7 days')::INT AS unique_views_7d,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'share' AND created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_shares_3h,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'laugh' AND created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_laughs_3h,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'view' AND created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_views_3h,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'share' AND created_at >= NOW() - INTERVAL '12 hours')::INT AS unique_shares_12h,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'laugh' AND created_at >= NOW() - INTERVAL '12 hours')::INT AS unique_laughs_12h,
        COUNT(DISTINCT visitor_id) FILTER (WHERE interaction_type = 'view' AND created_at >= NOW() - INTERVAL '12 hours')::INT AS unique_views_12h,
        COUNT(DISTINCT visitor_id) FILTER (
            WHERE interaction_type = 'share'
              AND created_at >= NOW() - INTERVAL '12 hours'
              AND created_at < NOW() - INTERVAL '3 hours'
        )::INT AS unique_shares_prev_9h,
        COUNT(DISTINCT visitor_id) FILTER (
            WHERE interaction_type = 'laugh'
              AND created_at >= NOW() - INTERVAL '12 hours'
              AND created_at < NOW() - INTERVAL '3 hours'
        )::INT AS unique_laughs_prev_9h,
        COUNT(DISTINCT visitor_id) FILTER (
            WHERE interaction_type = 'view'
              AND created_at >= NOW() - INTERVAL '12 hours'
              AND created_at < NOW() - INTERVAL '3 hours'
        )::INT AS unique_views_prev_9h
    FROM public.claim_interactions
    GROUP BY claim_id
),
analytics_rollup AS (
    SELECT
        claim_id,
        COUNT(DISTINCT visitor_id) FILTER (WHERE event_name = 'detail_opened' AND created_at >= NOW() - INTERVAL '7 days')::INT AS detail_opens_7d,
        COUNT(DISTINCT visitor_id) FILTER (WHERE event_name = 'source_clicked' AND created_at >= NOW() - INTERVAL '7 days')::INT AS source_clicks_7d,
        COUNT(DISTINCT visitor_id) FILTER (WHERE event_name = 'verdict_replayed' AND created_at >= NOW() - INTERVAL '7 days')::INT AS verdict_replays_7d,
        COUNT(DISTINCT visitor_id) FILTER (WHERE event_name = 'source_clicked' AND created_at >= NOW() - INTERVAL '3 hours')::INT AS unique_source_clicks_3h,
        COUNT(DISTINCT visitor_id) FILTER (WHERE event_name = 'source_clicked' AND created_at >= NOW() - INTERVAL '12 hours')::INT AS unique_source_clicks_12h,
        COUNT(DISTINCT visitor_id) FILTER (
            WHERE event_name = 'source_clicked'
              AND created_at >= NOW() - INTERVAL '12 hours'
              AND created_at < NOW() - INTERVAL '3 hours'
        )::INT AS unique_source_clicks_prev_9h,
        COALESCE(AVG(
            NULLIF(COALESCE(metadata->>'qualityScore', metadata->>'quality_score'), '')::NUMERIC
        ) FILTER (WHERE event_name = 'dwell_quality_reported' AND created_at >= NOW() - INTERVAL '7 days'), 0) AS avg_dwell_quality_7d
    FROM public.analytics_events
    WHERE claim_id IS NOT NULL
    GROUP BY claim_id
),
combined_events AS (
    SELECT claim_id, visitor_id, created_at
    FROM public.claim_interactions
    WHERE interaction_type IN ('share', 'laugh', 'view')
      AND created_at >= NOW() - INTERVAL '7 days'
    UNION ALL
    SELECT claim_id, visitor_id, created_at
    FROM public.analytics_events
    WHERE claim_id IS NOT NULL
      AND event_name IN ('detail_opened', 'source_clicked', 'verdict_replayed')
      AND created_at >= NOW() - INTERVAL '7 days'
),
repeat_rollup AS (
    SELECT
        claim_id,
        COUNT(DISTINCT visitor_id)::INT AS unique_engaged_visitors_7d,
        COUNT(*)::INT AS weighted_events_7d,
        GREATEST(COUNT(*) - COUNT(DISTINCT visitor_id), 0)::NUMERIC * 1.5 AS repeat_actor_penalty
    FROM combined_events
    GROUP BY claim_id
),
suspicious_buckets AS (
    SELECT
        claim_id,
        COUNT(*)::INT AS suspicious_clusters_7d,
        COUNT(*) FILTER (WHERE bucket_start >= NOW() - INTERVAL '12 hours')::INT AS suspicious_clusters_12h
    FROM (
        SELECT
            claim_id,
            visitor_id,
            to_timestamp(FLOOR(EXTRACT(EPOCH FROM created_at) / 600) * 600) AS bucket_start
        FROM combined_events
        GROUP BY claim_id, visitor_id, bucket_start
        HAVING COUNT(*) > 5
    ) suspicious
    GROUP BY claim_id
),
scored AS (
    SELECT
        p.id AS claim_id,
        p.title,
        p.claim_text,
        p.category,
        p.verdict,
        p.confidence,
        p.reason_summary,
        p.details,
        p.sources,
        p.created_at,
        p.is_featured,
        p.laugh_count,
        p.share_count,
        p.view_count,
        COALESCE(i.unique_shares_7d, 0) AS unique_shares_7d,
        COALESCE(i.unique_laughs_7d, 0) AS unique_laughs_7d,
        COALESCE(i.unique_views_7d, 0) AS unique_views_7d,
        COALESCE(a.detail_opens_7d, 0) AS detail_opens_7d,
        COALESCE(a.source_clicks_7d, 0) AS source_clicks_7d,
        COALESCE(a.verdict_replays_7d, 0) AS verdict_replays_7d,
        COALESCE(a.avg_dwell_quality_7d, 0) AS avg_dwell_quality_7d,
        COALESCE(i.unique_shares_3h, 0) AS unique_shares_3h,
        COALESCE(i.unique_laughs_3h, 0) AS unique_laughs_3h,
        COALESCE(i.unique_views_3h, 0) AS unique_views_3h,
        COALESCE(a.unique_source_clicks_3h, 0) AS unique_source_clicks_3h,
        COALESCE(a.unique_source_clicks_12h, 0) AS unique_source_clicks_12h,
        ROUND(EXTRACT(EPOCH FROM (NOW() - p.created_at)) / 3600.0, 2) AS age_hours,
        COALESCE(r.unique_engaged_visitors_7d, 0) AS unique_engaged_visitors_7d,
        COALESCE(r.repeat_actor_penalty, 0) AS repeat_actor_penalty,
        COALESCE(s.suspicious_clusters_7d, 0)::NUMERIC * 4 AS bot_penalty,
        COALESCE(s.suspicious_clusters_12h, 0)::NUMERIC * 4 AS spam_penalty,
        GREATEST(0::NUMERIC, 20 - (EXTRACT(EPOCH FROM (NOW() - p.created_at)) / 3600.0) / 6.0) AS freshness_boost,
        public.safe_ratio(COALESCE(i.unique_shares_3h, 0)::NUMERIC, GREATEST(COALESCE(i.unique_views_3h, 0), 1)::NUMERIC) AS share_rate_per_view,
        (
            4 * COALESCE(i.unique_shares_3h, 0)
            + 3 * COALESCE(i.unique_laughs_3h, 0)
            + 2 * COALESCE(i.unique_views_3h, 0)
            + 2 * COALESCE(a.unique_source_clicks_3h, 0)
        )::NUMERIC AS engagement_3h,
        (
            4 * COALESCE(i.unique_shares_12h, 0)
            + 3 * COALESCE(i.unique_laughs_12h, 0)
            + 2 * COALESCE(i.unique_views_12h, 0)
            + 2 * COALESCE(a.unique_source_clicks_12h, 0)
        )::NUMERIC AS engagement_12h,
        (
            4 * COALESCE(i.unique_shares_prev_9h, 0)
            + 3 * COALESCE(i.unique_laughs_prev_9h, 0)
            + 2 * COALESCE(i.unique_views_prev_9h, 0)
            + 2 * COALESCE(a.unique_source_clicks_prev_9h, 0)
        )::NUMERIC AS engagement_prev_9h
    FROM published_claims p
    LEFT JOIN interaction_rollup i ON i.claim_id = p.id
    LEFT JOIN analytics_rollup a ON a.claim_id = p.id
    LEFT JOIN repeat_rollup r ON r.claim_id = p.id
    LEFT JOIN suspicious_buckets s ON s.claim_id = p.id
),
scored_with_base AS (
    SELECT
        scored.*,
        ((engagement_3h / 3.0) - (engagement_prev_9h / 9.0)) AS acceleration,
        GREATEST(0::NUMERIC, ((engagement_prev_9h / 9.0) - (engagement_3h / 3.0)) * 2.0) AS fatigue_penalty,
        (
            5 * unique_shares_7d
            + 3 * unique_laughs_7d
            + 2 * detail_opens_7d
            + 2 * source_clicks_7d
            + 1.5 * verdict_replays_7d
            + freshness_boost
            - repeat_actor_penalty
            - bot_penalty
        )::NUMERIC AS base_top_raw,
        (
            5 * unique_laughs_7d
            + 4 * unique_shares_7d
            + 2 * detail_opens_7d
            + 2 * source_clicks_7d
            - repeat_actor_penalty
            - bot_penalty
        )::NUMERIC AS caught_in_4k_score_raw
    FROM scored
),
global_stats AS (
    SELECT COALESCE(AVG(base_top_raw), 0) AS global_avg_base_top
    FROM scored_with_base
)
SELECT
    s.claim_id,
    s.title,
    s.claim_text,
    s.category,
    s.verdict,
    s.confidence,
    s.reason_summary,
    s.details,
    s.sources,
    s.created_at,
    s.is_featured,
    s.laugh_count,
    s.share_count,
    s.view_count,
    s.unique_shares_7d,
    s.unique_laughs_7d,
    s.unique_views_7d,
    s.detail_opens_7d,
    s.source_clicks_7d,
    s.verdict_replays_7d,
    s.avg_dwell_quality_7d,
    s.unique_shares_3h,
    s.unique_laughs_3h,
    s.unique_views_3h,
    s.unique_source_clicks_3h,
    s.unique_source_clicks_12h,
    s.age_hours,
    s.unique_engaged_visitors_7d,
    s.repeat_actor_penalty,
    s.bot_penalty,
    s.spam_penalty,
    s.freshness_boost,
    s.share_rate_per_view,
    s.acceleration,
    s.fatigue_penalty,
    s.base_top_raw AS base_top,
    (
        public.safe_ratio(s.unique_engaged_visitors_7d::NUMERIC, s.unique_engaged_visitors_7d::NUMERIC + 15)
            * s.base_top_raw
        + public.safe_ratio(15, s.unique_engaged_visitors_7d::NUMERIC + 15)
            * g.global_avg_base_top
    ) AS top_cap_score,
    (
        s.engagement_3h
        + (s.engagement_12h * 0.35)
        + (s.acceleration * 2.0)
        + (s.share_rate_per_view * 3.0)
        + CASE WHEN s.age_hours <= 24 THEN 8 ELSE 0 END
        - s.fatigue_penalty
        - s.spam_penalty
    ) AS trending_score,
    s.caught_in_4k_score_raw AS caught_in_4k_score,
    public.wilson_lower_bound((s.unique_shares_7d + s.source_clicks_7d)::NUMERIC, GREATEST(s.unique_views_7d, 1)::NUMERIC) AS wilson_tiebreaker
FROM scored_with_base s
CROSS JOIN global_stats g;
$$;

CREATE OR REPLACE FUNCTION public.sync_trending_top10_milestones()
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    INSERT INTO public.claim_feed_milestones (claim_id, first_trending_top10_at)
    SELECT ranked.claim_id, NOW()
    FROM (
        SELECT
            claim_id,
            ROW_NUMBER() OVER (
                ORDER BY trending_score DESC, acceleration DESC, share_rate_per_view DESC, created_at DESC
            ) AS trend_rank
        FROM public.claim_ranking_snapshot()
    ) ranked
    WHERE ranked.trend_rank <= 10
    ON CONFLICT (claim_id) DO UPDATE
    SET first_trending_top10_at = COALESCE(public.claim_feed_milestones.first_trending_top10_at, EXCLUDED.first_trending_top10_at);
END;
$$;

CREATE OR REPLACE FUNCTION public.claim_is_currently_trending_top10(p_claim_id UUID)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM (
            SELECT
                claim_id,
                ROW_NUMBER() OVER (
                    ORDER BY trending_score DESC, acceleration DESC, share_rate_per_view DESC, created_at DESC
                ) AS trend_rank
            FROM public.claim_ranking_snapshot()
        ) ranked
        WHERE ranked.claim_id = p_claim_id
          AND ranked.trend_rank <= 10
    );
$$;

CREATE OR REPLACE FUNCTION public.maybe_award_early_spotter(
    p_claim_id UUID,
    p_visitor_id TEXT,
    p_event_name TEXT
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    milestone_at TIMESTAMPTZ;
    in_top10 BOOLEAN;
BEGIN
    IF p_claim_id IS NULL OR p_visitor_id IS NULL THEN
        RETURN;
    END IF;

    IF p_event_name NOT IN ('share_clicked', 'laugh_clicked', 'source_clicked') THEN
        RETURN;
    END IF;

    in_top10 := public.claim_is_currently_trending_top10(p_claim_id);

    SELECT first_trending_top10_at
    INTO milestone_at
    FROM public.claim_feed_milestones
    WHERE claim_id = p_claim_id;

    IF in_top10 THEN
        INSERT INTO public.claim_feed_milestones (claim_id, first_trending_top10_at)
        VALUES (p_claim_id, COALESCE(milestone_at, NOW()))
        ON CONFLICT (claim_id) DO UPDATE
        SET first_trending_top10_at = COALESCE(public.claim_feed_milestones.first_trending_top10_at, EXCLUDED.first_trending_top10_at);
        RETURN;
    END IF;

    IF milestone_at IS NULL THEN
        INSERT INTO public.claim_visitor_badges (claim_id, visitor_id, badge, metadata)
        VALUES (
            p_claim_id,
            p_visitor_id,
            'early_spotter',
            jsonb_build_object('awarded_from_event', p_event_name)
        )
        ON CONFLICT (claim_id, visitor_id, badge) DO NOTHING;
    END IF;
END;
$$;

DROP FUNCTION IF EXISTS public.log_analytics_event(TEXT, TEXT, UUID, JSONB, TEXT, TEXT, TEXT);
CREATE OR REPLACE FUNCTION public.log_analytics_event(
    p_visitor_id TEXT,
    p_event_name TEXT,
    p_claim_id UUID DEFAULT NULL,
    p_metadata JSONB DEFAULT '{}'::jsonb,
    p_path TEXT DEFAULT NULL,
    p_ua TEXT DEFAULT NULL,
    p_ref TEXT DEFAULT NULL
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    INSERT INTO public.app_visitors (visitor_id, first_seen_path, user_agent, referrer)
    VALUES (p_visitor_id, p_path, p_ua, p_ref)
    ON CONFLICT (visitor_id) DO UPDATE SET
        last_seen_at = NOW(),
        user_agent = COALESCE(p_ua, public.app_visitors.user_agent),
        referrer = COALESCE(p_ref, public.app_visitors.referrer);

    INSERT INTO public.analytics_events (visitor_id, event_name, claim_id, metadata)
    VALUES (p_visitor_id, p_event_name, p_claim_id, COALESCE(p_metadata, '{}'::jsonb));

    IF p_event_name = 'claim_checked' THEN
        UPDATE public.app_visitors
        SET claims_checked_count = claims_checked_count + 1
        WHERE visitor_id = p_visitor_id;
    ELSIF p_event_name = 'share_clicked' THEN
        UPDATE public.app_visitors
        SET shares_count = shares_count + 1
        WHERE visitor_id = p_visitor_id;
    ELSIF p_event_name = 'laugh_clicked' THEN
        UPDATE public.app_visitors
        SET laughs_count = laughs_count + 1
        WHERE visitor_id = p_visitor_id;
    END IF;

    IF p_claim_id IS NOT NULL THEN
        PERFORM public.maybe_award_early_spotter(p_claim_id, p_visitor_id, p_event_name);
    END IF;
END;
$$;

CREATE OR REPLACE FUNCTION public.get_trending_caps(p_limit INTEGER DEFAULT 20)
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

CREATE OR REPLACE FUNCTION public.get_top_caps_board(
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

CREATE OR REPLACE FUNCTION public.get_cap_of_day()
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

ALTER TABLE public.claim_editorial_overrides ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_visitor_badges ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_feed_milestones ENABLE ROW LEVEL SECURITY;

GRANT EXECUTE ON FUNCTION public.log_analytics_event(TEXT, TEXT, UUID, JSONB, TEXT, TEXT, TEXT) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_trending_caps(INTEGER) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_top_caps_board(TEXT, TEXT, INTEGER) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_cap_of_day() TO anon, authenticated;
