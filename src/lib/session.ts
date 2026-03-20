/**
 * Anonymous Session Helper for CAP v1
 * Provides a stable, persistent identity for basic interaction tracking and anti-spam.
 */

const SESSION_KEY = 'cap_anonymous_session_id';

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
 * Retrieves the existing session ID from localStorage or creates a new one.
 */
export function getOrCreateAnonymousSessionId(): string {
    if (typeof window === 'undefined') return 'server-side';

    let sessionId = localStorage.getItem(SESSION_KEY);

    if (!sessionId) {
        sessionId = generateUUID();
        localStorage.setItem(SESSION_KEY, sessionId);
        console.log('[Session] New anonymous identity created:', sessionId);
    } else {
        // console.log('[Session] Using existing identity:', sessionId);
    }

    return sessionId;
}
