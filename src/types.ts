export type Verdict = 'CAP' | 'FACTS' | 'MIXED';

export type Screen =
  | 'home'
  | 'listening'
  | 'checking'
  | 'results'
  | 'top'
  | 'history'
  | 'profile'
  | 'notifications'
  | 'trends';

export type InvestigationKind = 'url' | 'claim';
export type InvestigationSource = 'manual' | 'hero-chip' | 'trend' | 'mic' | 'history';
export type ResultMode = 'live' | 'fallback';
export type NotificationType = 'analysis' | 'follow' | 'share' | 'save' | 'flag' | 'system';

export interface InvestigationInput {
  kind: InvestigationKind;
  value: string;
  source: InvestigationSource;
  submittedAt: string;
}

export interface Discrepancy {
  title: string;
  text: string;
}

export interface SourceLink {
  name: string;
  url: string;
  text?: string;
  status?: string;
}

export interface InvestigationResult {
  id: string;
  input: InvestigationInput;
  title: string;
  verdict: Verdict;
  confidence: number;
  summary: string;
  category: string;
  mode: ResultMode;
  discrepancies: Discrepancy[];
  evidence: string[];
  sources: SourceLink[];
  citations: SourceLink[];
  sourceCount: number;
  queryLog: string[];
  analyzedAt: string;
  shares: number;
  laughedAt: number;
  isFlagged: boolean;
  savedToTopCaps: boolean;
  note?: string;
}

export interface TopCapEntry {
  resultId: string;
  claim: string;
  category: string;
  verdict: Verdict;
  summary: string;
  confidence: number;
  shares: number;
  laughedAt: number;
  addedAt: string;
  mode: ResultMode;
}

export interface HistoryEntry {
  id: string;
  resultId: string;
  label: string;
  verdict: Verdict;
  category: string;
  checkedAt: string;
  kind: InvestigationKind;
  mode: ResultMode;
}

export interface NotificationItem {
  id: string;
  type: NotificationType;
  title: string;
  message: string;
  createdAt: string;
  isRead: boolean;
  category?: string;
  resultId?: string;
}

export interface ProfileSettings {
  displayName: string;
  avatarSeed: string;
  enableAlerts: boolean;
  preferNativeShare: boolean;
  reduceMotion: boolean;
}

export interface PersistedState {
  investigations: InvestigationResult[];
  history: HistoryEntry[];
  topCaps: TopCapEntry[];
  notifications: NotificationItem[];
  followedCategories: string[];
  profile: ProfileSettings;
}
