-- ==========================================
-- CAP v1 Production-Ready Schema
-- ==========================================

-- 0. MIGRATION LOGIC (Handles transition from previous draft schemas)

-- Rename app_sessions to app_visitors if it exists
DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'app_sessions' AND table_schema = 'public') THEN
        ALTER TABLE public.app_sessions RENAME TO app_visitors;
        ALTER TABLE public.app_visitors RENAME COLUMN session_id TO visitor_id;
    END IF;
END $$;

-- Rename session_id to visitor_id in claim_interactions if needed
DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'claim_interactions' AND column_name = 'session_id' AND table_schema = 'public') THEN
        ALTER TABLE public.claim_interactions RENAME COLUMN session_id TO visitor_id;
    END IF;
END $$;

-- Rename session_id to visitor_id in analytics_events if needed
DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'analytics_events' AND column_name = 'session_id' AND table_schema = 'public') THEN
        ALTER TABLE public.analytics_events RENAME COLUMN session_id TO visitor_id;
    END IF;
END $$;

-- 1. UTILITIES
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. CORE TABLES
CREATE TABLE IF NOT EXISTS public.claims (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    slug TEXT UNIQUE, 
    title TEXT NOT NULL,
    claim_text TEXT NOT NULL,
    source_url TEXT,
    category TEXT DEFAULT 'Uncategorized',
    verdict TEXT NOT NULL CHECK (verdict IN ('CAP', 'NO CAP', 'HALF CAP')),
    confidence INTEGER DEFAULT 0 CHECK (confidence >= 0 AND confidence <= 100),
    reason_summary TEXT,
    details TEXT,
    sources JSONB DEFAULT '[]'::jsonb,
    is_featured BOOLEAN DEFAULT FALSE,
    status TEXT DEFAULT 'published' CHECK (status IN ('draft', 'published', 'archived')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Ensure slug is unique, even if table was created before the UNIQUE keyword was added
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'claims_slug_key'
    ) THEN
        ALTER TABLE public.claims ADD CONSTRAINT claims_slug_key UNIQUE (slug);
    END IF;
END $$;


CREATE TABLE IF NOT EXISTS public.claim_metrics (
    claim_id UUID REFERENCES public.claims(id) ON DELETE CASCADE PRIMARY KEY,
    laugh_count INTEGER DEFAULT 0,
    share_count INTEGER DEFAULT 0,
    view_count INTEGER DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.claim_interactions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    claim_id UUID REFERENCES public.claims(id) ON DELETE CASCADE,
    visitor_id TEXT NOT NULL,
    interaction_type TEXT NOT NULL CHECK (interaction_type IN ('laugh', 'share', 'view')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.app_visitors (
    visitor_id TEXT PRIMARY KEY,
    first_seen_at TIMESTAMPTZ DEFAULT NOW(),
    last_seen_at TIMESTAMPTZ DEFAULT NOW(),
    first_seen_path TEXT,
    user_agent TEXT,
    referrer TEXT,
    claims_checked_count INTEGER DEFAULT 0,
    shares_count INTEGER DEFAULT 0,
    laughs_count INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.analytics_events (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    visitor_id TEXT NOT NULL REFERENCES public.app_visitors(visitor_id) ON DELETE CASCADE,
    event_name TEXT NOT NULL CHECK (
        event_name IN ('session_started', 'claim_checked', 'verdict_viewed', 'laugh_clicked', 'share_clicked', 'top_caps_viewed', 'voice_session_started', 'voice_session_completed')
    ),
    claim_id UUID REFERENCES public.claims(id) ON DELETE SET NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Backfill columns for legacy installs where tables already existed
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS slug TEXT;
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS source_url TEXT;
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS category TEXT DEFAULT 'Uncategorized';
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS confidence INTEGER DEFAULT 0;
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS reason_summary TEXT;
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS details TEXT;
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS sources JSONB DEFAULT '[]'::jsonb;
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS is_featured BOOLEAN DEFAULT FALSE;
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'published';
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW();
ALTER TABLE IF EXISTS public.claims ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();

UPDATE public.claims
SET
    category = COALESCE(category, 'Uncategorized'),
    confidence = COALESCE(confidence, 0),
    sources = COALESCE(sources, '[]'::jsonb),
    is_featured = COALESCE(is_featured, FALSE),
    status = COALESCE(status, 'published'),
    created_at = COALESCE(created_at, NOW()),
    updated_at = COALESCE(updated_at, NOW())
WHERE
    category IS NULL
    OR confidence IS NULL
    OR sources IS NULL
    OR is_featured IS NULL
    OR status IS NULL
    OR created_at IS NULL
    OR updated_at IS NULL;

ALTER TABLE IF EXISTS public.claim_metrics ADD COLUMN IF NOT EXISTS share_count INTEGER DEFAULT 0;
ALTER TABLE IF EXISTS public.claim_metrics ADD COLUMN IF NOT EXISTS view_count INTEGER DEFAULT 0;
ALTER TABLE IF EXISTS public.claim_metrics ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();

UPDATE public.claim_metrics
SET
    share_count = COALESCE(share_count, 0),
    view_count = COALESCE(view_count, 0),
    updated_at = COALESCE(updated_at, NOW())
WHERE share_count IS NULL OR view_count IS NULL OR updated_at IS NULL;

ALTER TABLE IF EXISTS public.claim_interactions ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW();
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS first_seen_at TIMESTAMPTZ DEFAULT NOW();
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS last_seen_at TIMESTAMPTZ DEFAULT NOW();
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS first_seen_path TEXT;
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS user_agent TEXT;
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS referrer TEXT;
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS claims_checked_count INTEGER DEFAULT 0;
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS shares_count INTEGER DEFAULT 0;
ALTER TABLE IF EXISTS public.app_visitors ADD COLUMN IF NOT EXISTS laughs_count INTEGER DEFAULT 0;

UPDATE public.app_visitors
SET
    first_seen_at = COALESCE(first_seen_at, NOW()),
    last_seen_at = COALESCE(last_seen_at, NOW()),
    claims_checked_count = COALESCE(claims_checked_count, 0),
    shares_count = COALESCE(shares_count, 0),
    laughs_count = COALESCE(laughs_count, 0)
WHERE
    first_seen_at IS NULL
    OR last_seen_at IS NULL
    OR claims_checked_count IS NULL
    OR shares_count IS NULL
    OR laughs_count IS NULL;

ALTER TABLE IF EXISTS public.analytics_events ADD COLUMN IF NOT EXISTS metadata JSONB DEFAULT '{}'::jsonb;
ALTER TABLE IF EXISTS public.analytics_events ADD COLUMN IF NOT EXISTS created_at TIMESTAMPTZ DEFAULT NOW();

UPDATE public.analytics_events
SET
    metadata = COALESCE(metadata, '{}'::jsonb),
    created_at = COALESCE(created_at, NOW())
WHERE metadata IS NULL OR created_at IS NULL;

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
    event_name IN ('session_started', 'claim_checked', 'verdict_viewed', 'laugh_clicked', 'share_clicked', 'top_caps_viewed', 'voice_session_started', 'voice_session_completed')
);

-- 3. INDEXES & CONSTRAINTS
CREATE INDEX IF NOT EXISTS idx_interactions_lookup ON public.claim_interactions (claim_id, visitor_id, interaction_type);

CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_laugh_per_visitor
ON public.claim_interactions (claim_id, visitor_id, interaction_type)
WHERE interaction_type = 'laugh';

CREATE INDEX IF NOT EXISTS idx_claims_featured_published
ON public.claims (is_featured, status, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_analytics_visitor ON public.analytics_events (visitor_id);
CREATE INDEX IF NOT EXISTS idx_analytics_created_at ON public.analytics_events (created_at);

-- 4. TRIGGERS
DROP TRIGGER IF EXISTS set_claims_updated_at ON public.claims;
CREATE TRIGGER set_claims_updated_at BEFORE UPDATE ON public.claims
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

DROP TRIGGER IF EXISTS set_metrics_updated_at ON public.claim_metrics;
CREATE TRIGGER set_metrics_updated_at BEFORE UPDATE ON public.claim_metrics
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE OR REPLACE FUNCTION public.handle_new_claim_metrics() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.claim_metrics (claim_id) VALUES (NEW.id) ON CONFLICT DO NOTHING;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

DROP TRIGGER IF EXISTS on_claim_created ON public.claims;
CREATE TRIGGER on_claim_created AFTER INSERT ON public.claims
FOR EACH ROW EXECUTE FUNCTION public.handle_new_claim_metrics();

-- 5. FUNCTIONAL LOGIC (RPCs)
DROP FUNCTION IF EXISTS public.increment_laugh_count(UUID, TEXT);
CREATE OR REPLACE FUNCTION public.increment_laugh_count(target_claim_id UUID, p_visitor_id TEXT)
RETURNS TEXT AS $$
DECLARE
    counted BOOLEAN;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public.claims WHERE id = target_claim_id AND status = 'published') THEN
        RETURN 'not_allowed';
    END IF;

    SELECT EXISTS (SELECT 1 FROM public.claim_interactions WHERE claim_id = target_claim_id AND visitor_id = p_visitor_id AND interaction_type = 'laugh') INTO counted;
    IF counted THEN RETURN 'already_counted'; END IF;

    INSERT INTO public.claim_interactions (claim_id, visitor_id, interaction_type)
    VALUES (target_claim_id, p_visitor_id, 'laugh');

    INSERT INTO public.claim_metrics (claim_id, laugh_count)
    VALUES (target_claim_id, 1)
    ON CONFLICT (claim_id) DO UPDATE SET laugh_count = public.claim_metrics.laugh_count + 1;

    RETURN 'counted';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

DROP FUNCTION IF EXISTS public.increment_share_count(UUID, TEXT);
CREATE OR REPLACE FUNCTION public.increment_share_count(target_claim_id UUID, p_visitor_id TEXT)
RETURNS TEXT AS $$
DECLARE
    last_share TIMESTAMPTZ;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public.claims WHERE id = target_claim_id AND status = 'published') THEN
        RETURN 'not_allowed';
    END IF;

    SELECT created_at FROM public.claim_interactions WHERE claim_id = target_claim_id AND visitor_id = p_visitor_id AND interaction_type = 'share' ORDER BY created_at DESC LIMIT 1 INTO last_share;
    IF last_share IS NOT NULL AND (NOW() - last_share) < INTERVAL '1 minute' THEN RETURN 'rate_limited'; END IF;

    INSERT INTO public.claim_interactions (claim_id, visitor_id, interaction_type)
    VALUES (target_claim_id, p_visitor_id, 'share');

    INSERT INTO public.claim_metrics (claim_id, share_count)
    VALUES (target_claim_id, 1)
    ON CONFLICT (claim_id) DO UPDATE SET share_count = public.claim_metrics.share_count + 1;

    RETURN 'counted';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

DROP FUNCTION IF EXISTS public.increment_view_count(UUID, TEXT);
CREATE OR REPLACE FUNCTION public.increment_view_count(target_claim_id UUID, p_visitor_id TEXT)
RETURNS TEXT AS $$
DECLARE
    last_view TIMESTAMPTZ;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public.claims WHERE id = target_claim_id AND status = 'published') THEN
        RETURN 'not_allowed';
    END IF;

    SELECT created_at FROM public.claim_interactions WHERE claim_id = target_claim_id AND visitor_id = p_visitor_id AND interaction_type = 'view' ORDER BY created_at DESC LIMIT 1 INTO last_view;
    IF last_view IS NOT NULL AND (NOW() - last_view) < INTERVAL '10 minutes' THEN RETURN 'already_counted'; END IF;

    INSERT INTO public.claim_interactions (claim_id, visitor_id, interaction_type)
    VALUES (target_claim_id, p_visitor_id, 'view');

    INSERT INTO public.claim_metrics (claim_id, view_count)
    VALUES (target_claim_id, 1)
    ON CONFLICT (claim_id) DO UPDATE SET view_count = public.claim_metrics.view_count + 1;

    RETURN 'counted';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

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
RETURNS void AS $$
BEGIN
    INSERT INTO public.app_visitors (visitor_id, first_seen_path, user_agent, referrer)
    VALUES (p_visitor_id, p_path, p_ua, p_ref)
    ON CONFLICT (visitor_id) DO UPDATE SET 
        last_seen_at = NOW(),
        user_agent = COALESCE(p_ua, public.app_visitors.user_agent),
        referrer = COALESCE(p_ref, public.app_visitors.referrer);

    INSERT INTO public.analytics_events (visitor_id, event_name, claim_id, metadata)
    VALUES (p_visitor_id, p_event_name, p_claim_id, p_metadata);

    IF p_event_name = 'claim_checked' THEN
        UPDATE public.app_visitors SET claims_checked_count = claims_checked_count + 1 WHERE visitor_id = p_visitor_id;
    ELSIF p_event_name = 'share_clicked' THEN
        UPDATE public.app_visitors SET shares_count = shares_count + 1 WHERE visitor_id = p_visitor_id;
    ELSIF p_event_name = 'laugh_clicked' THEN
        UPDATE public.app_visitors SET laughs_count = laughs_count + 1 WHERE visitor_id = p_visitor_id;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public;

-- 6. SECURITY & ACCESS CONTROL
ALTER TABLE public.claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_metrics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_interactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.app_visitors ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.analytics_events ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public select published claims" ON public.claims;
CREATE POLICY "Allow public select published claims" ON public.claims FOR SELECT USING (status = 'published');

DROP POLICY IF EXISTS "Allow public select metrics" ON public.claim_metrics;
CREATE POLICY "Allow public select metrics" ON public.claim_metrics FOR SELECT 
USING (EXISTS (SELECT 1 FROM public.claims WHERE public.claims.id = public.claim_metrics.claim_id AND status = 'published'));

GRANT EXECUTE ON FUNCTION public.increment_laugh_count(UUID, TEXT) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.increment_share_count(UUID, TEXT) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.increment_view_count(UUID, TEXT) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.log_analytics_event(TEXT, TEXT, UUID, JSONB, TEXT, TEXT, TEXT) TO anon, authenticated;

-- 7. SEED DATA (Idempotent)
UPDATE public.claims
SET
    slug = 'moon-landing-fake',
    title = 'Moon Landing Logic',
    claim_text = 'The moon landing was faked using early CGI from a time-traveling filmmaker.',
    category = 'Science',
    verdict = 'CAP',
    confidence = 99,
    reason_summary = 'CGI tech was non-existent in 1969. Filmmakers of the era were too young.',
    details = 'Commercial CGI required to fake such footage did not exist until the 1980s.',
    sources = '[{"name": "NASA", "url": "https://nasa.gov", "text": "Lunar samples and telemetry verify Apollo 11."}]'::jsonb,
    is_featured = TRUE,
    status = 'published'
WHERE slug = 'moon-landing-fake' OR title = 'Moon Landing Logic';

INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
SELECT
    'moon-landing-fake',
    'Moon Landing Logic',
    'The moon landing was faked using early CGI from a time-traveling filmmaker.',
    'Science',
    'CAP',
    99,
    'CGI tech was non-existent in 1969. Filmmakers of the era were too young.',
    'Commercial CGI required to fake such footage did not exist until the 1980s.',
    '[{"name": "NASA", "url": "https://nasa.gov", "text": "Lunar samples and telemetry verify Apollo 11."}]'::jsonb,
    TRUE,
    'published'
WHERE NOT EXISTS (
    SELECT 1 FROM public.claims WHERE slug = 'moon-landing-fake' OR title = 'Moon Landing Logic'
);

UPDATE public.claims
SET
    slug = 'salt-water-fatigue',
    title = 'Salt Water Fatigue',
    claim_text = 'Drinking 4L of salt water cures all winter fatigue instantly.',
    category = 'Health',
    verdict = 'CAP',
    confidence = 95,
    reason_summary = 'Excessive salt intake causes dehydration and hypernatremia.',
    details = 'Medical professionals warn that consuming excessive salt water can lead to severe dehydration.',
    sources = '[{"name": "WHO", "url": "https://who.int", "text": "Excessive sodium is linked to adverse health outcomes."}]'::jsonb,
    is_featured = FALSE,
    status = 'published'
WHERE slug = 'salt-water-fatigue' OR title = 'Salt Water Fatigue';

INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
SELECT
    'salt-water-fatigue',
    'Salt Water Fatigue',
    'Drinking 4L of salt water cures all winter fatigue instantly.',
    'Health',
    'CAP',
    95,
    'Excessive salt intake causes dehydration and hypernatremia.',
    'Medical professionals warn that consuming excessive salt water can lead to severe dehydration.',
    '[{"name": "WHO", "url": "https://who.int", "text": "Excessive sodium is linked to adverse health outcomes."}]'::jsonb,
    FALSE,
    'published'
WHERE NOT EXISTS (
    SELECT 1 FROM public.claims WHERE slug = 'salt-water-fatigue' OR title = 'Salt Water Fatigue'
);
