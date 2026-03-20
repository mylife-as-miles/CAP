/**
 * Anonymous Analytics Tracker for CAP v1
 * Enables unique user measurement and engagement tracking without authentication.
 */

import { supabase } from './supabase';
import { getOrCreateAnonymousSessionId } from './session';

export type AnalyticsEvent =
    | 'session_started'
    | 'claim_checked'
    | 'verdict_viewed'
    | 'laugh_clicked'
    | 'share_clicked'
    | 'top_caps_viewed';

interface EventMetadata {
    [key: string]: any;
}

/**
 * Tracks a meaningful user interaction.
 * Silently handles session association and server-side counter updates.
 */
export async function trackEvent(
    name: AnalyticsEvent,
    claimId?: string,
    metadata: EventMetadata = {}
) {
    const sessionId = getOrCreateAnonymousSessionId();

    // Capture context for initial session tracking
    const path = window.location.pathname;
    const ua = navigator.userAgent;
    const ref = document.referrer;

    try {
        const { error } = await supabase.rpc('log_analytics_event', {
            p_session_id: sessionId,
            p_event_name: name,
            p_claim_id: claimId,
            p_metadata: metadata,
            p_path: path,
            p_ua: ua,
            p_ref: ref
        });

        if (error) {
            console.warn('[Analytics] Failed to log event:', name, error.message);
        } else {
            // console.log('[Analytics] Event logged:', name);
        }
    } catch (err) {
        // Fail silently to never block user experience
        console.warn('[Analytics] Silent error:', err);
    }
}

/**
 * Initializer to be called on app load. 
 * Logs session start once per reload.
 */
export function initAnalytics() {
    // We track every "load" as a session start event 
    // The database RPC handles the upsert logic for the persistent session_id
    trackEvent('session_started');
}
