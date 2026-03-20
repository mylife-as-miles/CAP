-- Create claims table for content and metadata
CREATE TABLE IF NOT EXISTS public.claims (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    claim_text TEXT NOT NULL,
    source_url TEXT,
    category TEXT DEFAULT 'Uncategorized', -- Required for UI filters
    verdict TEXT NOT NULL CHECK (verdict IN ('CAP', 'NO CAP', 'HALF CAP')),
    confidence INTEGER DEFAULT 0 CHECK (confidence >= 0 AND confidence <= 100),
    reason_summary TEXT, -- Short reason for tooltip/preview
    details TEXT, -- Full detailed explanation
    sources JSONB DEFAULT '[]'::jsonb, -- Supporting evidence
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

-- Enable Row Level Security
ALTER TABLE public.claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_metrics ENABLE ROW LEVEL SECURITY;

-- Set up RLS Policies
-- Allow public read access to published claims
DROP POLICY IF EXISTS "Allow public read access to published claims" ON public.claims;
CREATE POLICY "Allow public read access to published claims" 
ON public.claims FOR SELECT 
USING (status = 'published');

-- Allow public read access to metrics for published claims
DROP POLICY IF EXISTS "Allow public read access to metrics" ON public.claim_metrics;
CREATE POLICY "Allow public read access to metrics" 
ON public.claim_metrics FOR SELECT 
USING (
    EXISTS (
        SELECT 1 FROM public.claims 
        WHERE public.claims.id = public.claim_metrics.claim_id 
        AND status = 'published'
    )
);

-- RPC for incrementing laugh_count securely
CREATE OR REPLACE FUNCTION public.increment_laugh_count(target_claim_id UUID)
RETURNS void AS $$
BEGIN
    INSERT INTO public.claim_metrics (claim_id, laugh_count)
    VALUES (target_claim_id, 1)
    ON CONFLICT (claim_id) DO UPDATE
    SET laugh_count = public.claim_metrics.laugh_count + 1,
        updated_at = NOW();
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC for incrementing share_count securely
CREATE OR REPLACE FUNCTION public.increment_share_count(target_claim_id UUID)
RETURNS void AS $$
BEGIN
    INSERT INTO public.claim_metrics (claim_id, share_count)
    VALUES (target_claim_id, 1)
    ON CONFLICT (claim_id) DO UPDATE
    SET share_count = public.claim_metrics.share_count + 1,
        updated_at = NOW();
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Automatically create metrics row when a claim is created
CREATE OR REPLACE FUNCTION public.handle_new_claim_metrics()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.claim_metrics (claim_id) VALUES (NEW.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_claim_created ON public.claims;
CREATE TRIGGER on_claim_created
    AFTER INSERT ON public.claims
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_claim_metrics();

-- Seed data for testing
INSERT INTO public.claims (title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
VALUES 
(
  'Moon Landing Logic', 
  'The moon landing was faked using early CGI from a time-traveling filmmaker.', 
  'Science', 
  'CAP', 
  99, 
  'CGI tech was non-existent in 1969. Filmmakers of the era were too young.',
  'Commercial CGI required to fake such footage did not exist until the 1980s. Physical evidence and lunar samples confirm the missions.',
  '[{"name": "NASA", "url": "https://nasa.gov", "text": "Lunar samples and telemetry verify Apollo 11."}]'::jsonb,
  TRUE, 
  'published'
),
(
  'Salt Water Fatigue', 
  'Drinking 4L of salt water cures all winter fatigue instantly.', 
  'Health', 
  'CAP', 
  95, 
  'Excessive salt intake causes dehydration and hypernatremia.',
  'Medical professionals warn that consuming excessive salt water can lead to severe dehydration and dangerous electrolyte imbalances.',
  '[{"name": "WHO", "url": "https://who.int", "text": "Excessive sodium is linked to adverse health outcomes."}]'::jsonb,
  FALSE, 
  'published'
),
(
  'Market Rally', 
  'New tech stocks hit an all-time high today amid AI growth reports.', 
  'Economics', 
  'NO CAP', 
  85, 
  'Verified by exchange data and quarterly reports.',
  'The surge in tech stock evaluations is substantiated by latest market data and several high-profile AI integration successes.',
  '[{"name": "Nasdaq", "url": "https://nasdaq.com", "text": "Tech index reached record levels this session."}]'::jsonb,
  FALSE, 
  'published'
);
