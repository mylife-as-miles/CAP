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
        'voice_session_completed'
    )
);
