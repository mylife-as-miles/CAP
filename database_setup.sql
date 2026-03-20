-- Create claims table
CREATE TABLE IF NOT EXISTS public.claims (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    claim_text TEXT NOT NULL,
    source_url TEXT,
    category TEXT DEFAULT 'Uncategorized',
    verdict TEXT NOT NULL, -- 'CAP', 'NO CAP', 'HALF CAP'
    confidence INTEGER DEFAULT 0, -- 0-100
    reason_summary TEXT, -- Short reason
    details TEXT, -- Full detailed reason (Why it's Cap)
    sources JSONB DEFAULT '[]'::jsonb, -- Array of {name: string, url: string, text: string}
    is_featured BOOLEAN DEFAULT FALSE,
    status TEXT DEFAULT 'published', -- 'draft', 'published', 'archived'
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create claim_metrics table
CREATE TABLE IF NOT EXISTS public.claim_metrics (
    claim_id UUID REFERENCES public.claims(id) ON DELETE CASCADE PRIMARY KEY,
    laugh_count INTEGER DEFAULT 0,
    share_count INTEGER DEFAULT 0,
    view_count INTEGER DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE public.claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.claim_metrics ENABLE ROW LEVEL SECURITY;

-- Set up RLS Policies
-- Allow public read access to published claims
CREATE POLICY "Allow public read access to published claims" 
ON public.claims FOR SELECT 
USING (status = 'published');

-- Allow public read access to metrics for published claims
CREATE POLICY "Allow public read access to metrics" 
ON public.claim_metrics FOR SELECT 
USING (
    EXISTS (
        SELECT 1 FROM public.claims 
        WHERE public.claims.id = public.claim_metrics.claim_id 
        AND status = 'published'
    )
);

-- RPC for incrementing laugh_count
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

-- RPC for incrementing share_count
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

CREATE TRIGGER on_claim_created
    AFTER INSERT ON public.claims
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_claim_metrics();

-- Seed data for testing
INSERT INTO public.claims (title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
VALUES 
(
  'Moon Landing Fake', 
  'The moon landing was faked using early CGI from a time-traveling James Cameron.', 
  'Science', 
  'CAP', 
  99, 
  'James Cameron was 14 years old in 1969. CGI tech was non-existent then.',
  'James Cameron was 14 years old during the 1969 moon landing. The CGI required to fake that footage also did not exist until much later.',
  '[{"name": "NASA", "url": "https://nasa.gov", "text": "Historical records and telemetry verify the Apollo 11 mission success."}]'::jsonb,
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
  'This claim originated from a viral TikTok video. Medical professionals warn that consuming excessive salt water can lead to severe dehydration and hypernatremia.',
  '[{"name": "WHO", "url": "https://who.int", "text": "Excessive sodium intake is linked to adverse health outcomes."}, {"name": "Mayo Clinic", "url": "https://mayoclinic.org", "text": "Salt water can cause dangerous electrolyte imbalances."}]'::jsonb,
  FALSE, 
  'published'
),
(
  'New Housing High', 
  'New housing starts in the metro area hit a 10-year high this June.', 
  'Economics', 
  'NO CAP', 
  85, 
  'Confirmed by census data and regional economic reports.',
  'Confirmed by census data and regional economic reports. Actual growth matches the reported numbers.',
  '[{"name": "Census Bureau", "url": "https://census.gov", "text": "June housing starts exceeded previous decade peaks."}]'::jsonb,
  FALSE, 
  'published'
),
(
  'AI Coding Efficiency', 
  'The new AI model is 400% more efficient at coding than last year.', 
  'Tech', 
  'HALF CAP', 
  70, 
  'Benchmarks show 4x improvement in specific tasks, but overall workflow gain is ~30%.',
  'Benchmarks show 4x improvement in specific tasks, but overall workflow gain is ~30% due to integration and review times.',
  '[{"name": "OpenAI", "url": "https://openai.com", "text": "Gains are task-specific and vary by complexity."}]'::jsonb,
  FALSE, 
  'published'
);

-- Initial metric updates for seed data
SELECT public.increment_laugh_count(id) FROM public.claims WHERE is_featured = TRUE;
SELECT public.increment_share_count(id) FROM public.claims WHERE is_featured = TRUE;
