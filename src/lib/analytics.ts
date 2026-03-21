/**
 * Anonymous Analytics Tracker for CAP v1
 * Enables unique user measurement and engagement tracking without authentication.
 */

import { supabase } from './supabase';
import { getOrCreateVisitorId } from './session';

export type AnalyticsEvent =
    | 'session_started'
    | 'claim_checked'
    | 'verdict_viewed'
    | 'laugh_clicked'
    | 'share_clicked'
    | 'top_caps_viewed'
    | 'voice_session_started'
    | 'voice_session_completed'
    | 'detail_opened'
    | 'source_clicked'
    | 'verdict_replayed'
    | 'dwell_quality_reported';

interface EventMetadata {
    [key: string]: any;
}

/**
 * Tracks a meaningful user interaction.
 * Silently handles visitor association and server-side counter updates.
 */
export async function trackEvent(
    name: AnalyticsEvent,
    claimId?: string,
    metadata: EventMetadata = {}
) {
    const visitorId = getOrCreateVisitorId();

    // Capture context for initial visitor tracking
    const path = window.location.pathname;
    const ua = navigator.userAgent;
    const ref = document.referrer;

    try {
        const { error } = await supabase.rpc('log_analytics_event', {
            p_visitor_id: visitorId,
            p_event_name: name,
            p_claim_id: claimId,
            p_metadata: metadata,
            p_path: path,
            p_ua: ua,
            p_ref: ref
        });

        if (error) {
            console.warn('[Analytics] Failed to log event:', name, error.message);
        }
    } catch (err) {
        // Fail silently to never block user experience
        console.warn('[Analytics] Silent error:', err);
    }
}

/**
 * Initializer to be called on app load. 
 */
export function initAnalytics() {
    trackEvent('session_started');
}

function getWindowScopedKey(namespace: string, claimId?: string) {
    return claimId ? `cap:${namespace}:${claimId}` : `cap:${namespace}`;
}

export function hasTrackedInWindow(namespace: string, claimId?: string) {
    if (typeof window === 'undefined') {
        return false;
    }

    return window.sessionStorage.getItem(getWindowScopedKey(namespace, claimId)) === '1';
}

export function markTrackedInWindow(namespace: string, claimId?: string) {
    if (typeof window === 'undefined') {
        return;
    }

    window.sessionStorage.setItem(getWindowScopedKey(namespace, claimId), '1');
}

export async function trackEventOncePerWindow(
    namespace: string,
    name: AnalyticsEvent,
    claimId?: string,
    metadata: EventMetadata = {},
) {
    if (hasTrackedInWindow(namespace, claimId)) {
        return;
    }

    markTrackedInWindow(namespace, claimId);
    await trackEvent(name, claimId, metadata);
}
