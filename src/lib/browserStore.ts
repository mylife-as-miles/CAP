import type { CapCheckMode } from '@/shared/cap';
import type { ResultViewModel } from '@/src/lib/resultView';

const DB_NAME = 'cap-browser-data';
const DB_VERSION = 1;
const HISTORY_STORE = 'history';
const ALERTS_STORE = 'alerts';
const DISCLAIMER_KEY = 'cap_disclaimer_dismissed';

export interface ClaimMetricBaseline {
  laughCount: number;
  shareCount: number;
  updatedAt: string;
}

export interface HistoryEntry {
  id: string;
  createdAt: string;
  result: ResultViewModel;
  context: {
    mode: CapCheckMode;
    question: string;
    checkedAt: string;
    claimText?: string;
    metadata?: Record<string, unknown>;
    url?: string;
  };
  publishedClaimId?: string;
  addedToTopCapsAt?: string;
  metricBaseline?: ClaimMetricBaseline;
}

export type AlertEntryType = 'laugh' | 'share';

export interface AlertEntry {
  id: string;
  claimId: string;
  claimText: string;
  type: AlertEntryType;
  delta: number;
  createdAt: string;
  read: boolean;
}

function createStorageId(prefix: string) {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return `${prefix}-${crypto.randomUUID()}`;
  }

  return `${prefix}-${Date.now()}-${Math.random().toString(16).slice(2)}`;
}

function isIndexedDbAvailable() {
  return typeof window !== 'undefined' && 'indexedDB' in window;
}

function requestToPromise<T>(request: IDBRequest<T>) {
  return new Promise<T>((resolve, reject) => {
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

function transactionToPromise(transaction: IDBTransaction) {
  return new Promise<void>((resolve, reject) => {
    transaction.oncomplete = () => resolve();
    transaction.onerror = () => reject(transaction.error);
    transaction.onabort = () => reject(transaction.error);
  });
}

async function openDatabase() {
  if (!isIndexedDbAvailable()) {
    return null;
  }

  return new Promise<IDBDatabase>((resolve, reject) => {
    const request = window.indexedDB.open(DB_NAME, DB_VERSION);

    request.onupgradeneeded = () => {
      const database = request.result;

      if (!database.objectStoreNames.contains(HISTORY_STORE)) {
        database.createObjectStore(HISTORY_STORE, { keyPath: 'id' });
      }

      if (!database.objectStoreNames.contains(ALERTS_STORE)) {
        database.createObjectStore(ALERTS_STORE, { keyPath: 'id' });
      }
    };

    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

async function withStore<T>(
  storeName: typeof HISTORY_STORE | typeof ALERTS_STORE,
  mode: IDBTransactionMode,
  run: (store: IDBObjectStore) => Promise<T>,
) {
  const database = await openDatabase();
  if (!database) {
    return null;
  }

  try {
    const transaction = database.transaction(storeName, mode);
    const store = transaction.objectStore(storeName);
    const result = await run(store);
    await transactionToPromise(transaction);
    return result;
  } finally {
    database.close();
  }
}

export function createHistoryEntry(input: Omit<HistoryEntry, 'id' | 'createdAt'>): HistoryEntry {
  return {
    ...input,
    createdAt: input.context.checkedAt,
    id: createStorageId('history'),
  };
}

export function createAlertEntry(input: Omit<AlertEntry, 'id'>): AlertEntry {
  return {
    ...input,
    id: createStorageId('alert'),
  };
}

export async function getHistoryEntries(): Promise<HistoryEntry[]> {
  const entries = await withStore(HISTORY_STORE, 'readonly', async (store) => {
    return requestToPromise(store.getAll() as IDBRequest<HistoryEntry[]>);
  });

  return (entries ?? []).sort((left, right) => (
    new Date(right.createdAt).getTime() - new Date(left.createdAt).getTime()
  ));
}

export async function saveHistoryEntry(entry: HistoryEntry): Promise<HistoryEntry> {
  await withStore(HISTORY_STORE, 'readwrite', async (store) => {
    await requestToPromise(store.put(entry));
    return undefined;
  });

  return entry;
}

export async function getAlertEntries(): Promise<AlertEntry[]> {
  const entries = await withStore(ALERTS_STORE, 'readonly', async (store) => {
    return requestToPromise(store.getAll() as IDBRequest<AlertEntry[]>);
  });

  return (entries ?? []).sort((left, right) => (
    new Date(right.createdAt).getTime() - new Date(left.createdAt).getTime()
  ));
}

export async function saveAlertEntry(entry: AlertEntry): Promise<AlertEntry> {
  await withStore(ALERTS_STORE, 'readwrite', async (store) => {
    await requestToPromise(store.put(entry));
    return undefined;
  });

  return entry;
}

export async function saveAlertEntries(entries: AlertEntry[]): Promise<AlertEntry[]> {
  if (entries.length === 0) {
    return entries;
  }

  await withStore(ALERTS_STORE, 'readwrite', async (store) => {
    for (const entry of entries) {
      await requestToPromise(store.put(entry));
    }

    return undefined;
  });

  return entries;
}

export function getDisclaimerDismissed() {
  if (typeof window === 'undefined') {
    return false;
  }

  return window.localStorage.getItem(DISCLAIMER_KEY) === 'true';
}

export function setDisclaimerDismissed(dismissed: boolean) {
  if (typeof window === 'undefined') {
    return;
  }

  window.localStorage.setItem(DISCLAIMER_KEY, dismissed ? 'true' : 'false');
}
