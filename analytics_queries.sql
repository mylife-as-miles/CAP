-- CAP v1 Production Analytics Queries
-- Use these in the Supabase SQL Editor to track growth and engagement.

-- 1. Total Unique Visitors (Identified browser instances)
SELECT count(*) as total_unique_visitors
FROM public.app_visitors;

-- 2. Activated Users (Users who actually used the core product: checked a claim)
SELECT count(distinct visitor_id) as activated_users
FROM public.analytics_events
WHERE event_name = 'claim_checked';

-- 3. Daily Active Users (DAU) - Engagement-based
-- Counts unique visitors with meaningful activity in the last 24h
SELECT count(distinct visitor_id) as dau
FROM public.analytics_events
WHERE created_at > now() - interval '24 hours'
AND event_name IN ('claim_checked', 'verdict_viewed', 'share_clicked', 'laugh_clicked');

-- 4. Funnel: Visitors -> Activated (Claim Checkers)
WITH summary AS (
  SELECT 
    (SELECT count(*) FROM public.app_visitors) as total_visitors,
    count(distinct visitor_id) as claim_checkers
  FROM public.analytics_events 
  WHERE event_name = 'claim_checked'
)
SELECT 
  total_visitors,
  claim_checkers,
  round((claim_checkers::float / NULLIF(total_visitors, 0)::float) * 100, 2) || '%' as activation_rate
FROM summary;

-- 5. Top Content (Most "Laughed At" Claims)
SELECT 
  c.title,
  c.claim_text,
  m.laugh_count,
  m.share_count
FROM public.claims c
JOIN public.claim_metrics m ON c.id = m.claim_id
ORDER BY m.laugh_count DESC
LIMIT 10;

-- 6. Engagement per Visitor (Average actions)
SELECT 
  round(avg(claims_checked_count), 2) as avg_checks,
  round(avg(shares_count), 2) as avg_shares,
  round(avg(laughs_count), 2) as avg_laughs
FROM public.app_visitors;
