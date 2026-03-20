-- Create claims table for content and metadata
CREATE TABLE IF NOT EXISTS public.claims (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
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

-- Create claim_metrics table for engagement counters
CREATE TABLE IF NOT EXISTS public.claim_metrics (
    claim_id UUID REFERENCES public.claims(id) ON DELETE CASCADE PRIMARY KEY,
    laugh_count INTEGER DEFAULT 0,
    share_count INTEGER DEFAULT 0,
    view_count INTEGER DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create claim_interactions for anti-spam and deduplication
CREATE TABLE IF NOT EXISTS public.claim_interactions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    claim_id UUID REFERENCES public.claims(id) ON DELETE CASCADE,
    session_id TEXT NOT NULL,
    interaction_type TEXT NOT NULL CHECK (interaction_type IN ('laugh', 'share', 'view')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add indexes for fast interaction lookup
CREATE INDEX IF NOT EXISTS idx_interactions_lookup ON public.claim_interactions (claim_id, session_id, interaction_type);

-- Create app_sessions for high-level user lifecycle tracking
CREATE TABLE IF NOT EXISTS public.app_sessions (
    session_id TEXT PRIMARY KEY,
    first_seen_at TIMESTAMPTZ DEFAULT NOW(),
    last_seen_at TIMESTAMPTZ DEFAULT NOW(),
    first_seen_path TEXT,
    user_agent TEXT,
    referrer TEXT,
    claims_checked_count INTEGER DEFAULT 0,
    shares_count INTEGER DEFAULT 0,
    laughs_count INTEGER DEFAULT 0
);

-- Create analytics_events for granular event logging
CREATE TABLE IF NOT EXISTS public.analytics_events (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    session_id TEXT NOT NULL REFERENCES public.app_sessions(session_id) ON DELETE CASCADE,
    event_name TEXT NOT NULL,
    claim_id UUID REFERENCES public.claims(id) ON DELETE SET NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add indexes for analytics performance
CREATE INDEX IF NOT EXISTS idx_analytics_session ON public.analytics_events (session_id);
CREATE INDEX IF NOT EXISTS idx_analytics_event_name ON public.analytics_events (event_name);
CREATE INDEX IF NOT EXISTS idx_analytics_created_at ON public.analytics_events (created_at);
CREATE INDEX IF NOT EXISTS idx_analytics_claim_id ON public.analytics_events (claim_id);

-- Enable Row Level Security
ALTER TABLE public.claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_metrics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_interactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.app_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.analytics_events ENABLE ROW LEVEL SECURITY;

-- Set up RLS Policies
DROP POLICY IF EXISTS "Allow public read access to published claims" ON public.claims;
CREATE POLICY "Allow public read access to published claims" ON public.claims FOR SELECT USING (status = 'published');

DROP POLICY IF EXISTS "Allow public read access to metrics" ON public.claim_metrics;
CREATE POLICY "Allow public read access to metrics" ON public.claim_metrics FOR SELECT 
USING (EXISTS (SELECT 1 FROM public.claims WHERE public.claims.id = public.claim_metrics.claim_id AND status = 'published'));

-- Deny direct client writes to interactions/analytics (only allowed via RPC)
DROP POLICY IF EXISTS "Allow public interaction entry" ON public.claim_interactions;
DROP POLICY IF EXISTS "Allow public session entry" ON public.app_sessions;
DROP POLICY IF EXISTS "Allow public event entry" ON public.analytics_events;

-- RPC for incrementing laugh_count with anti-spam
CREATE OR REPLACE FUNCTION public.increment_laugh_count(target_claim_id UUID, user_session_id TEXT)
RETURNS TEXT AS $$
DECLARE
    counted BOOLEAN;
BEGIN
    SELECT EXISTS (SELECT 1 FROM public.claim_interactions WHERE claim_id = target_claim_id AND session_id = user_session_id AND interaction_type = 'laugh') INTO counted;
    IF counted THEN RETURN 'already_counted'; END IF;

    INSERT INTO public.claim_interactions (claim_id, session_id, interaction_type) VALUES (target_claim_id, user_session_id, 'laugh');
    UPDATE public.claim_metrics SET laugh_count = laugh_count + 1, updated_at = NOW() WHERE claim_id = target_claim_id;
    RETURN 'counted';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC for incrementing share_count with rate-limit
CREATE OR REPLACE FUNCTION public.increment_share_count(target_claim_id UUID, user_session_id TEXT)
RETURNS TEXT AS $$
DECLARE
    last_share TIMESTAMPTZ;
BEGIN
    SELECT created_at FROM public.claim_interactions WHERE claim_id = target_claim_id AND session_id = user_session_id AND interaction_type = 'share' ORDER BY created_at DESC LIMIT 1 INTO last_share;
    IF last_share IS NOT NULL AND (NOW() - last_share) < INTERVAL '1 minute' THEN RETURN 'rate_limited'; END IF;

    INSERT INTO public.claim_interactions (claim_id, session_id, interaction_type) VALUES (target_claim_id, user_session_id, 'share');
    UPDATE public.claim_metrics SET share_count = share_count + 1, updated_at = NOW() WHERE claim_id = target_claim_id;
    RETURN 'counted';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC for incrementing view_count with deduplication
CREATE OR REPLACE FUNCTION public.increment_view_count(target_claim_id UUID, user_session_id TEXT)
RETURNS TEXT AS $$
DECLARE
    last_view TIMESTAMPTZ;
BEGIN
    SELECT created_at FROM public.claim_interactions WHERE claim_id = target_claim_id AND session_id = user_session_id AND interaction_type = 'view' ORDER BY created_at DESC LIMIT 1 INTO last_view;
    IF last_view IS NOT NULL AND (NOW() - last_view) < INTERVAL '10 minutes' THEN RETURN 'already_counted'; END IF;

    INSERT INTO public.claim_interactions (claim_id, session_id, interaction_type) VALUES (target_claim_id, user_session_id, 'view');
    UPDATE public.claim_metrics SET view_count = view_count + 1, updated_at = NOW() WHERE claim_id = target_claim_id;
    RETURN 'counted';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC for logging analytics events
CREATE OR REPLACE FUNCTION public.log_analytics_event(
    p_session_id TEXT,
    p_event_name TEXT,
    p_claim_id UUID DEFAULT NULL,
    p_metadata JSONB DEFAULT '{}'::jsonb,
    p_path TEXT DEFAULT NULL,
    p_ua TEXT DEFAULT NULL,
    p_ref TEXT DEFAULT NULL
)
RETURNS void AS $$
BEGIN
    INSERT INTO public.app_sessions (session_id, first_seen_path, user_agent, referrer)
    VALUES (p_session_id, p_path, p_ua, p_ref)
    ON CONFLICT (session_id) DO UPDATE SET last_seen_at = NOW(), user_agent = COALESCE(p_ua, public.app_sessions.user_agent), referrer = COALESCE(p_ref, public.app_sessions.referrer);

    INSERT INTO public.analytics_events (session_id, event_name, claim_id, metadata) VALUES (p_session_id, p_event_name, p_claim_id, p_metadata);

    IF p_event_name = 'claim_checked' THEN
        UPDATE public.app_sessions SET claims_checked_count = claims_checked_count + 1 WHERE session_id = p_session_id;
    ELSIF p_event_name = 'share_clicked' THEN
        UPDATE public.app_sessions SET shares_count = shares_count + 1 WHERE session_id = p_session_id;
    ELSIF p_event_name = 'laugh_clicked' THEN
        UPDATE public.app_sessions SET laughs_count = laughs_count + 1 WHERE session_id = p_session_id;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Auto-create metrics for new claims
CREATE OR REPLACE FUNCTION public.handle_new_claim_metrics() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.claim_metrics (claim_id) VALUES (NEW.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_claim_created ON public.claims;
CREATE TRIGGER on_claim_created AFTER INSERT ON public.claims FOR EACH ROW EXECUTE FUNCTION public.handle_new_claim_metrics();

-- Seed data
INSERT INTO public.claims (title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
VALUES 
('Moon Landing Logic', 'The moon landing was faked using early CGI from a time-traveling filmmaker.', 'Science', 'CAP', 99, 'CGI tech was non-existent in 1969. Filmmakers of the era were too young.', 'Commercial CGI required to fake such footage did not exist until the 1980s. Physical evidence and lunar samples confirm the missions.', '[{"name": "NASA", "url": "https://nasa.gov", "text": "Lunar samples and telemetry verify Apollo 11."}]'::jsonb, TRUE, 'published'),
('Salt Water Fatigue', 'Drinking 4L of salt water cures all winter fatigue instantly.', 'Health', 'CAP', 95, 'Excessive salt intake causes dehydration and hypernatremia.', 'Medical professionals warn that consuming excessive salt water can lead to severe dehydration and dangerous electrolyte imbalances.', '[{"name": "WHO", "url": "https://who.int", "text": "Excessive sodium is linked to adverse health outcomes."}]'::jsonb, FALSE, 'published');
