-- CAP v1 Analytics Queries
-- Use these in the Supabase SQL Editor to track growth and engagement.

-- 1. Total Unique Visitors (Anyone who loaded the app)
SELECT count(distinct session_id) as total_unique_visitors
FROM public.app_sessions;

-- 2. Activated Users (Strongest metric: people who actually checked a claim)
SELECT count(distinct session_id) as activated_users
FROM public.analytics_events
WHERE event_name = 'claim_checked';

-- 3. Daily Active Users (DAU) - Engagement-based
-- Counts unique sessions with any meaningful activity in the last 24h
SELECT count(distinct session_id) as dau
FROM public.analytics_events
WHERE created_at > now() - interval '24 hours'
AND event_name IN ('claim_checked', 'verdict_viewed', 'share_clicked', 'laugh_clicked');

-- 4. Conversion Rate (Visitors -> Checked Claim)
WITH summary AS (
  SELECT 
    count(distinct session_id) as total_v,
    count(distinct session_id) FILTER (WHERE session_id IN (
      SELECT session_id FROM public.analytics_events WHERE event_name = 'claim_checked'
    )) as checkers
  FROM public.app_sessions
)
SELECT 
  total_v,
  checkers,
  round((checkers::float / total_v::float) * 100, 2) || '%' as conversion_rate
FROM summary;

-- 5. Top Engaging Claims (Most shared/laughed)
SELECT 
  c.title,
  c.claim_text,
  m.laugh_count,
  m.share_count,
  m.view_count
FROM public.claims c
JOIN public.claim_metrics m ON c.id = m.claim_id
ORDER BY (m.laugh_count + m.share_count) DESC
LIMIT 10;

-- 6. User Retention Preview (Sessions seen on more than one day)
SELECT count(*) as returning_users
FROM (
  SELECT session_id
  FROM public.analytics_events
  GROUP BY session_id
  HAVING max(created_at)::date > min(created_at)::date
) as sub;
