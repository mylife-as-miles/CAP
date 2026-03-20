import {createDefaultPersistedState} from '@/src/lib/cap-data';
import type {PersistedState} from '@/src/types';

const STORAGE_KEY = 'cap-core-state-v1';

function canUseStorage() {
  return typeof window !== 'undefined' && typeof window.localStorage !== 'undefined';
}

export function loadPersistedState(): PersistedState {
  const defaults = createDefaultPersistedState();

  if (!canUseStorage()) {
    return defaults;
  }

  try {
    const raw = window.localStorage.getItem(STORAGE_KEY);
    if (!raw) {
      return defaults;
    }

    const parsed = JSON.parse(raw) as Partial<PersistedState>;
    return {
      investigations: Array.isArray(parsed.investigations)
        ? parsed.investigations
        : defaults.investigations,
      history: Array.isArray(parsed.history) ? parsed.history : defaults.history,
      topCaps: Array.isArray(parsed.topCaps) ? parsed.topCaps : defaults.topCaps,
      notifications: Array.isArray(parsed.notifications)
        ? parsed.notifications
        : defaults.notifications,
      followedCategories: Array.isArray(parsed.followedCategories)
        ? parsed.followedCategories
        : defaults.followedCategories,
      profile: {
        ...defaults.profile,
        ...(parsed.profile ?? {}),
      },
    };
  } catch {
    return defaults;
  }
}

export function savePersistedState(state: PersistedState) {
  if (!canUseStorage()) {
    return;
  }

  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
  } catch {
    // Ignore quota and serialization issues to keep the app usable.
  }
}

export function clearPersistedState() {
  if (!canUseStorage()) {
    return;
  }

  try {
    window.localStorage.removeItem(STORAGE_KEY);
  } catch {
    // Ignore storage cleanup failures.
  }
}
