/**
 * Anonymous Visitor Identity Helper for CAP v1
 * Provides a stable, persistent identity for basic interaction tracking and anti-spam.
 * Renamed from "session" to reflect that this is a long-lived browser identity.
 */

const VISITOR_KEY = 'cap_anonymous_visitor_id';

/**
 * Generates a standard UUID v4
 */
function generateUUID(): string {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
        const r = (Math.random() * 16) | 0;
        const v = c === 'x' ? r : (r & 0x3) | 0x8;
        return v.toString(16);
    });
}

/**
 * Retrieves the existing visitor ID from localStorage or creates a new one.
 */
export function getOrCreateVisitorId(): string {
    if (typeof window === 'undefined') return 'server-side';

    let visitorId = localStorage.getItem(VISITOR_KEY);

    if (!visitorId) {
        visitorId = generateUUID();
        localStorage.setItem(VISITOR_KEY, visitorId);
        console.log('[Identity] New anonymous visitor created:', visitorId);
    }

    return visitorId;
}
