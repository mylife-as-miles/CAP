import React, {startTransition, useEffect, useRef, useState} from 'react';
import {AnimatePresence, MotionConfig, motion} from 'motion/react';
import {
  Bell,
  BellRing,
  Camera,
  Check,
  ChevronDown,
  ChevronUp,
  Download,
  ExternalLink,
  Flame,
  Flag,
  Info,
  RefreshCw,
  Search,
  Share2,
  Sparkles,
  Star,
  Trash2,
  Volume2,
  X,
} from 'lucide-react';
import {toPng} from 'html-to-image';
import {Header, MobileNav} from '@/src/components/Navigation';
import {MicOrb} from '@/src/components/MicOrb';
import {TrendCard} from '@/src/components/TrendCard';
import {
  createDefaultPersistedState,
  HERO_CHIPS,
  LISTENING_TAGS,
  TOP_CAP_CATEGORIES,
  TOP_CAP_SORT_OPTIONS,
} from '@/src/lib/cap-data';
import {analyzeInvestigation} from '@/src/lib/analysis';
import {
  buildShareText,
  createId,
  detectInvestigationKind,
  ensureUrlProtocol,
  formatCompactNumber,
  formatDateTime,
  formatRelativeTime,
  mapResultToHistoryEntry,
  mapResultToTopCapEntry,
  normalizeText,
  resolveResultSaved,
} from '@/src/lib/cap-utils';
import {clearPersistedState, loadPersistedState, savePersistedState} from '@/src/lib/storage';
import {cn} from '@/src/lib/utils';
import type {
  InvestigationInput,
  InvestigationResult,
  NotificationItem,
  NotificationType,
  ProfileSettings,
  Screen,
} from '@/src/types';

type SortOption = (typeof TOP_CAP_SORT_OPTIONS)[number];
type ToastTone = 'default' | 'success' | 'warning';

interface ToastState {
  message: string;
  tone: ToastTone;
}

interface SpeechRecognitionEventLike {
  results: ArrayLike<ArrayLike<{transcript: string}>>;
}

interface SpeechRecognitionLike {
  continuous: boolean;
  interimResults: boolean;
  lang: string;
  maxAlternatives: number;
  start(): void;
  stop(): void;
  abort(): void;
  onresult: ((event: SpeechRecognitionEventLike) => void) | null;
  onerror: ((event: {error: string}) => void) | null;
  onend: (() => void) | null;
}

declare global {
  interface Window {
    SpeechRecognition?: new () => SpeechRecognitionLike;
    webkitSpeechRecognition?: new () => SpeechRecognitionLike;
  }
}

const initialState = loadPersistedState();

export default function App() {
  const [screen, setScreen] = useState<Screen>('home');
  const [inputValue, setInputValue] = useState('');
  const [inputError, setInputError] = useState<string | null>(null);
  const [toast, setToast] = useState<ToastState | null>(null);
  const [isAnalyzing, setIsAnalyzing] = useState(false);
  const [micTranscript, setMicTranscript] = useState('');
  const [isListening, setIsListening] = useState(false);
  const [activeResultId, setActiveResultId] = useState<string | null>(null);
  const [shareCardResultId, setShareCardResultId] = useState<string | null>(null);
  const [isDownloading, setIsDownloading] = useState(false);
  const [topCapsSortBy, setTopCapsSortBy] = useState<SortOption>('Shares');
  const [topCapsFilterCategory, setTopCapsFilterCategory] = useState<string>('All');
  const [expandedCards, setExpandedCards] = useState<string[]>([]);
  const [isCategoryDropdownOpen, setIsCategoryDropdownOpen] = useState(false);
  const [isSortDropdownOpen, setIsSortDropdownOpen] = useState(false);

  const [investigations, setInvestigations] = useState(initialState.investigations);
  const [history, setHistory] = useState(initialState.history);
  const [topCaps, setTopCaps] = useState(initialState.topCaps);
  const [notifications, setNotifications] = useState(initialState.notifications);
  const [followedCategories, setFollowedCategories] = useState(initialState.followedCategories);
  const [profile, setProfile] = useState(initialState.profile);

  const shareCardRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);
  const toastTimerRef = useRef<number | null>(null);
  const recognitionRef = useRef<SpeechRecognitionLike | null>(null);
  const finalTranscriptRef = useRef('');
  const categoryMenuRef = useRef<HTMLDivElement>(null);
  const sortMenuRef = useRef<HTMLDivElement>(null);

  const activeResult = investigations.find((result) => result.id === activeResultId) ?? null;
  const shareCardResult = shareCardResultId
    ? investigations.find((result) => result.id === shareCardResultId) ?? null
    : null;
  const unreadNotifications = notifications.filter((item) => !item.isRead).length;
  const trendResults = [...investigations].sort(
    (left, right) => new Date(right.analyzedAt).getTime() - new Date(left.analyzedAt).getTime(),
  );
  const filteredTopCaps = [...topCaps]
    .filter((entry) => topCapsFilterCategory === 'All' || entry.category === topCapsFilterCategory)
    .sort((left, right) => {
      if (topCapsSortBy === 'Shares') {
        return right.shares - left.shares;
      }
      if (topCapsSortBy === 'Laughed At') {
        return right.laughedAt - left.laughedAt;
      }
      return new Date(right.addedAt).getTime() - new Date(left.addedAt).getTime();
    });
  const capOfTheDay = filteredTopCaps[0] ?? topCaps[0] ?? null;
  const resultIsSaved = activeResult ? resolveResultSaved(activeResult, topCaps) : false;

  useEffect(() => {
    savePersistedState({
      investigations,
      history,
      topCaps,
      notifications,
      followedCategories,
      profile,
    });
  }, [followedCategories, history, investigations, notifications, profile, topCaps]);

  useEffect(() => {
    return () => {
      if (toastTimerRef.current) {
        window.clearTimeout(toastTimerRef.current);
      }
    };
  }, []);

  useEffect(() => {
    const handlePointerDown = (event: MouseEvent) => {
      const target = event.target as Node;
      if (isCategoryDropdownOpen && categoryMenuRef.current && !categoryMenuRef.current.contains(target)) {
        setIsCategoryDropdownOpen(false);
      }
      if (isSortDropdownOpen && sortMenuRef.current && !sortMenuRef.current.contains(target)) {
        setIsSortDropdownOpen(false);
      }
    };

    const handleEscape = (event: KeyboardEvent) => {
      if (event.key !== 'Escape') {
        return;
      }
      setIsCategoryDropdownOpen(false);
      setIsSortDropdownOpen(false);
      if (shareCardResultId) {
        setShareCardResultId(null);
      }
      if (screen === 'listening') {
        stopListening('Voice input cancelled.');
      }
    };

    document.addEventListener('mousedown', handlePointerDown);
    document.addEventListener('keydown', handleEscape);
    return () => {
      document.removeEventListener('mousedown', handlePointerDown);
      document.removeEventListener('keydown', handleEscape);
    };
  }, [isCategoryDropdownOpen, isSortDropdownOpen, screen, shareCardResultId]);

  useEffect(() => {
    if (typeof window === 'undefined') {
      return;
    }

    const SpeechRecognitionCtor = window.SpeechRecognition ?? window.webkitSpeechRecognition;
    if (!SpeechRecognitionCtor) {
      return;
    }

    const recognition = new SpeechRecognitionCtor();
    recognition.lang = 'en-US';
    recognition.interimResults = true;
    recognition.continuous = false;
    recognition.maxAlternatives = 1;

    recognition.onresult = (event) => {
      let transcript = '';
      for (const result of Array.from(event.results)) {
        transcript += result[0]?.transcript ?? '';
      }
      finalTranscriptRef.current = transcript.trim();
      setMicTranscript(transcript.trim());
    };

    recognition.onerror = (event) => {
      stopListening(`Voice input failed: ${event.error}. Type the claim instead.`);
    };

    recognition.onend = () => {
      setIsListening(false);
      if (finalTranscriptRef.current) {
        const spokenText = finalTranscriptRef.current;
        finalTranscriptRef.current = '';
        setMicTranscript('');
        setInputValue(spokenText);
        void submitInput(spokenText, 'mic');
        return;
      }
      if (screen === 'listening') {
        startTransition(() => setScreen('home'));
        showToast('No speech captured. Type the claim or paste a URL instead.', 'warning');
        inputRef.current?.focus();
      }
    };

    recognitionRef.current = recognition;
    return () => {
      recognition.abort();
      recognitionRef.current = null;
    };
  }, [screen]);

  function showToast(message: string, tone: ToastTone = 'default') {
    setToast({message, tone});
    if (toastTimerRef.current) {
      window.clearTimeout(toastTimerRef.current);
    }
    toastTimerRef.current = window.setTimeout(() => setToast(null), 3200);
  }

  function pushNotification(
    type: NotificationType,
    title: string,
    message: string,
    options?: {category?: string; resultId?: string},
  ) {
    if (!profile.enableAlerts && type !== 'system') {
      return;
    }
    setNotifications((previous) => [
      {
        id: createId('alert'),
        type,
        title,
        message,
        createdAt: new Date().toISOString(),
        isRead: false,
        category: options?.category,
        resultId: options?.resultId,
      },
      ...previous,
    ]);
  }

  function updateInvestigation(resultId: string, updater: (result: InvestigationResult) => InvestigationResult) {
    let nextResult: InvestigationResult | null = null;
    setInvestigations((previous) =>
      previous.map((result) => {
        if (result.id !== resultId) {
          return result;
        }
        nextResult = updater(result);
        return nextResult;
      }),
    );

    if (nextResult) {
      setTopCaps((previous) =>
        previous.map((entry) =>
          entry.resultId === resultId ? mapResultToTopCapEntry(nextResult!, entry.addedAt) : entry,
        ),
      );
    }
  }

  function recordHistory(result: InvestigationResult) {
    setHistory((previous) => [
      mapResultToHistoryEntry(result),
      ...previous.filter((entry) => entry.resultId !== result.id).slice(0, 39),
    ]);
  }

  function syncResultSavedState(result: InvestigationResult) {
    return {...result, savedToTopCaps: resolveResultSaved(result, topCaps)};
  }

  function setActiveResult(result: InvestigationResult) {
    const synced = syncResultSavedState(result);
    setActiveResultId(synced.id);
    startTransition(() => setScreen('results'));
    recordHistory(synced);
    setNotifications((previous) =>
      previous.map((item) => (item.resultId === synced.id ? {...item, isRead: true} : item)),
    );
  }

  function stopListening(message?: string) {
    recognitionRef.current?.stop();
    recognitionRef.current?.abort();
    finalTranscriptRef.current = '';
    setMicTranscript('');
    setIsListening(false);
    startTransition(() => setScreen('home'));
    if (message) {
      showToast(message, 'warning');
    }
  }

  function beginVoiceCapture() {
    if (!recognitionRef.current) {
      showToast("Voice input isn't available in this browser. Type the claim or paste a URL instead.", 'warning');
      startTransition(() => setScreen('home'));
      inputRef.current?.focus();
      return;
    }
    try {
      finalTranscriptRef.current = '';
      setMicTranscript('');
      setIsListening(true);
      startTransition(() => setScreen('listening'));
      recognitionRef.current.start();
    } catch {
      showToast('Voice input is already active. Finish or cancel the current capture first.', 'warning');
    }
  }

  async function submitInput(rawValue = inputValue, source: InvestigationInput['source'] = 'manual') {
    const trimmed = rawValue.trim();
    setInputError(null);

    if (!trimmed) {
      setInputError('Paste a public URL or type a claim to investigate.');
      return;
    }

    const kind = detectInvestigationKind(trimmed);
    if (kind === 'invalid-url') {
      setInputError('That looks like a URL, but it is not valid. Include the full public link.');
      return;
    }

    const normalizedValue = kind === 'url' ? ensureUrlProtocol(trimmed) : trimmed;
    const input: InvestigationInput = {
      kind,
      value: normalizedValue,
      source,
      submittedAt: new Date().toISOString(),
    };

    setInputValue(normalizedValue);
    setIsAnalyzing(true);
    startTransition(() => setScreen('checking'));

    try {
      const analyzed = await analyzeInvestigation(input);
      const synced = syncResultSavedState(analyzed);
      setInvestigations((previous) => [synced, ...previous.filter((entry) => entry.id !== synced.id)]);
      setActiveResultId(synced.id);
      recordHistory(synced);

      if (followedCategories.includes(synced.category)) {
        pushNotification('follow', `${synced.category} match`, `A new ${synced.mode === 'live' ? 'live' : 'fallback'} investigation landed in ${synced.category}.`, {category: synced.category, resultId: synced.id});
      } else {
        pushNotification('analysis', `${synced.verdict} verdict ready`, `${synced.mode === 'live' ? 'Live' : 'Fallback'} analysis finished for ${synced.title}.`, {category: synced.category, resultId: synced.id});
      }

      startTransition(() => setScreen('results'));
      showToast(synced.mode === 'live' ? 'Live verification complete.' : 'Fallback analysis complete. Live tools were unavailable for this check.', synced.mode === 'live' ? 'success' : 'warning');
    } finally {
      setIsAnalyzing(false);
    }
  }

  function handleTrendOpen(resultId: string) {
    const result = investigations.find((entry) => entry.id === resultId);
    if (result) {
      setActiveResult(result);
    }
  }

  function handleLaugh(resultId: string) {
    updateInvestigation(resultId, (result) => ({...result, laughedAt: result.laughedAt + 1}));
    showToast('Added one laugh to this claim.', 'success');
  }

  async function handleShare(resultId: string) {
    const result = investigations.find((entry) => entry.id === resultId);
    if (!result) {
      return;
    }

    const shareText = buildShareText(result);
    let sharedNatively = false;

    if (profile.preferNativeShare && navigator.share) {
      try {
        await navigator.share({
          title: `CAP CORE: ${result.verdict}`,
          text: shareText,
          url: result.input.kind === 'url' ? result.input.value : undefined,
        });
        sharedNatively = true;
      } catch (error) {
        if (error instanceof DOMException && error.name === 'AbortError') {
          return;
        }
      }
    }

    if (!sharedNatively) {
      try {
        if (navigator.clipboard?.writeText) {
          await navigator.clipboard.writeText(shareText);
          showToast('Share summary copied to clipboard.', 'success');
        } else {
          showToast('Share card opened. Clipboard support is unavailable here.', 'warning');
        }
      } catch {
        showToast('Share card opened because clipboard access failed.', 'warning');
      }
      setShareCardResultId(resultId);
    } else {
      showToast('Shared successfully.', 'success');
    }

    updateInvestigation(resultId, (entry) => ({...entry, shares: entry.shares + 1}));
    pushNotification('share', 'Result shared', `You shared ${result.title}.`, {
      category: result.category,
      resultId,
    });
  }

  function handleAddToTopCaps(resultId: string) {
    const result = investigations.find((entry) => entry.id === resultId);
    if (!result) {
      return;
    }

    const alreadySaved = topCaps.some((entry) => normalizeText(entry.claim) === normalizeText(result.title));
    if (alreadySaved) {
      updateInvestigation(resultId, (entry) => ({...entry, savedToTopCaps: true}));
      showToast('This claim is already in Top Caps.', 'warning');
      return;
    }

    const savedResult = {...result, savedToTopCaps: true};
    setInvestigations((previous) => previous.map((entry) => (entry.id === resultId ? savedResult : entry)));
    setTopCaps((previous) => [mapResultToTopCapEntry(savedResult), ...previous]);
    pushNotification('save', 'Saved to Top Caps', `${result.title} was added to the leaderboard.`, {
      category: result.category,
      resultId,
    });
    showToast('Saved to Top Caps.', 'success');
  }

  function handleFlag(resultId: string) {
    const result = investigations.find((entry) => entry.id === resultId);
    if (!result || result.isFlagged) {
      return;
    }

    updateInvestigation(resultId, (entry) => ({...entry, isFlagged: true}));
    pushNotification('flag', 'Result flagged', `You flagged ${result.title} for follow-up.`, {
      category: result.category,
      resultId,
    });
    showToast('Flagged for follow-up.', 'success');
  }

  function toggleFollowCategory(category: string) {
    setFollowedCategories((previous) => {
      const isFollowing = previous.includes(category);
      const next = isFollowing ? previous.filter((entry) => entry !== category) : [...previous, category];
      pushNotification(
        'follow',
        isFollowing ? `Unfollowed ${category}` : `Following ${category}`,
        isFollowing
          ? `You will stop getting alerts for ${category} investigations.`
          : `You will get alerts when new ${category} investigations appear.`,
        {category},
      );
      showToast(isFollowing ? `Unfollowed ${category}.` : `Now following ${category}.`, 'success');
      return next;
    });
  }

  function resetFilters() {
    setTopCapsSortBy('Shares');
    setTopCapsFilterCategory('All');
    setIsCategoryDropdownOpen(false);
    setIsSortDropdownOpen(false);
  }

  function toggleExpand(resultId: string) {
    setExpandedCards((previous) =>
      previous.includes(resultId) ? previous.filter((entry) => entry !== resultId) : [...previous, resultId],
    );
  }

  async function handleDownloadImage() {
    if (!shareCardRef.current || !shareCardResult) {
      return;
    }

    try {
      setIsDownloading(true);
      const dataUrl = await toPng(shareCardRef.current, {
        cacheBust: true,
        pixelRatio: 2,
        backgroundColor: '#0A0A0A',
      });
      const link = document.createElement('a');
      link.download = `${normalizeText(shareCardResult.title).replace(/\s+/g, '-') || 'cap'}-card.png`;
      link.href = dataUrl;
      link.click();
      showToast('Share card saved as an image.', 'success');
    } catch {
      showToast('Saving the share card failed.', 'warning');
    } finally {
      setIsDownloading(false);
    }
  }

  function openNotification(notification: NotificationItem) {
    setNotifications((previous) =>
      previous.map((entry) => (entry.id === notification.id ? {...entry, isRead: true} : entry)),
    );
    if (notification.resultId) {
      handleTrendOpen(notification.resultId);
      return;
    }
    startTransition(() => setScreen('notifications'));
  }

  function removeHistoryEntry(historyId: string) {
    setHistory((previous) => previous.filter((entry) => entry.id !== historyId));
    showToast('Removed that history item.', 'success');
  }

  function removeNotification(notificationId: string) {
    setNotifications((previous) => previous.filter((entry) => entry.id !== notificationId));
  }

  function markAllNotificationsRead() {
    setNotifications((previous) => previous.map((entry) => ({...entry, isRead: true})));
    showToast('All alerts marked as read.', 'success');
  }

  function resetForAnotherCheck() {
    setInputValue('');
    setInputError(null);
    setActiveResultId(null);
    setShareCardResultId(null);
    startTransition(() => setScreen('home'));
    inputRef.current?.focus();
  }

  function handleProfileChange<Key extends keyof ProfileSettings>(key: Key, value: ProfileSettings[Key]) {
    setProfile((previous) => ({...previous, [key]: value}));
  }

  function clearUserData() {
    const defaults = createDefaultPersistedState();
    clearPersistedState();
    setInvestigations(defaults.investigations);
    setHistory(defaults.history);
    setTopCaps(defaults.topCaps);
    setNotifications(defaults.notifications);
    setFollowedCategories(defaults.followedCategories);
    setProfile(defaults.profile);
    setInputValue('');
    setInputError(null);
    setActiveResultId(null);
    setShareCardResultId(null);
    setExpandedCards([]);
    startTransition(() => setScreen('home'));
    showToast('Local CAP CORE data was reset.', 'success');
  }

  return (
    <MotionConfig reducedMotion={profile.reduceMotion ? 'always' : 'never'}>
      <div className="min-h-screen bg-background text-white selection:bg-primary selection:text-black">
        <Header activeTab={screen} onNavigate={setScreen} unreadCount={unreadNotifications} profile={profile} />
        <main className="mx-auto w-full max-w-7xl px-4 pb-[calc(8rem+env(safe-area-inset-bottom))] pt-24 sm:px-6 lg:px-8">
          {/* UI sections inserted below */}
        </main>
        <MobileNav
          activeTab={screen === 'results' || screen === 'checking' || screen === 'listening' ? 'home' : screen}
          onNavigate={setScreen}
          unreadCount={unreadNotifications}
        />
      </div>
    </MotionConfig>
  );
}

function Pill({children, className}: {children: React.ReactNode; className?: string}) {
  return (
    <span
      className={cn(
        'inline-flex items-center rounded-full border border-white/8 bg-surface-high px-3 py-1.5 font-label text-[10px] uppercase tracking-[0.24em] text-outline',
        className,
      )}
    >
      {children}
    </span>
  );
}

function SectionTitle({title}: {title: string}) {
  return (
    <div className="flex items-center gap-3">
      <span className="h-px w-8 bg-outline" />
      <h2 className="font-headline text-xl font-black uppercase tracking-[-0.04em] text-outline">{title}</h2>
    </div>
  );
}

function StatCard({label, value, helper}: {label: string; value: string; helper: string}) {
  return (
    <div className="rounded-[1.5rem] border border-white/5 bg-surface-high p-4">
      <p className="font-label text-[10px] uppercase tracking-[0.24em] text-outline">{label}</p>
      <p className="mt-3 break-words font-headline text-xl font-black uppercase tracking-[-0.04em] text-white">{value}</p>
      <p className="mt-2 text-sm text-outline">{helper}</p>
    </div>
  );
}

function EmptyPanel({title, description}: {title: string; description: string}) {
  return (
    <div className="rounded-[1.75rem] border border-dashed border-white/10 bg-surface p-8 text-center">
      <p className="font-headline text-2xl font-black uppercase tracking-[-0.04em]">{title}</p>
      <p className="mx-auto mt-3 max-w-xl text-outline">{description}</p>
    </div>
  );
}

function ActionButton({
  icon: Icon,
  label,
  onClick,
  disabled,
  primary,
  inverse,
  compact,
}: {
  icon: React.ComponentType<{size?: number; className?: string}>;
  label: string;
  onClick: () => void;
  disabled?: boolean;
  primary?: boolean;
  inverse?: boolean;
  compact?: boolean;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={disabled}
      className={cn(
        'inline-flex items-center justify-center gap-2 rounded-full border px-4 py-3 font-headline text-sm font-black uppercase tracking-[0.18em] transition',
        compact ? 'min-h-[44px] px-4 py-2.5 text-xs' : 'min-h-[52px]',
        primary
          ? 'border-primary bg-primary text-black hover:bg-primary-dim'
          : inverse
            ? 'border-white/10 bg-white text-black hover:opacity-90'
            : 'border-white/10 bg-surface-high text-white hover:border-primary/50 hover:text-primary',
        disabled && 'cursor-not-allowed opacity-55 hover:border-white/10 hover:text-current',
      )}
    >
      <Icon size={compact ? 14 : 16} />
      <span>{label}</span>
    </button>
  );
}

function FormField({label, children}: {label: string; children: React.ReactNode}) {
  return (
    <label className="block">
      <span className="mb-2 block font-label text-xs uppercase tracking-[0.24em] text-outline">{label}</span>
      {children}
    </label>
  );
}

function ToggleRow({
  title,
  description,
  checked,
  onChange,
}: {
  title: string;
  description: string;
  checked: boolean;
  onChange: (value: boolean) => void;
}) {
  return (
    <div className="flex flex-col gap-4 rounded-[1.5rem] border border-white/5 bg-surface-high px-4 py-4 sm:flex-row sm:items-center sm:justify-between">
      <div>
        <p className="font-headline text-lg font-bold uppercase tracking-[-0.04em]">{title}</p>
        <p className="mt-1 max-w-2xl text-sm text-outline">{description}</p>
      </div>
      <button
        type="button"
        onClick={() => onChange(!checked)}
        className={cn(
          'relative inline-flex h-10 w-20 shrink-0 items-center rounded-full border transition',
          checked ? 'border-secondary/40 bg-secondary/30' : 'border-white/10 bg-background',
        )}
        aria-pressed={checked}
      >
        <span
          className={cn(
            'inline-block h-8 w-8 rounded-full shadow transition',
            checked ? 'translate-x-10 bg-secondary' : 'translate-x-1 bg-white',
          )}
        />
      </button>
    </div>
  );
}
