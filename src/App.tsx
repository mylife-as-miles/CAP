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
        <AnimatePresence>
          {toast && (
            <motion.div
              initial={{opacity: 0, y: -24, x: '-50%'}}
              animate={{opacity: 1, y: 0, x: '-50%'}}
              exit={{opacity: 0, y: -24, x: '-50%'}}
              className={cn(
                'fixed left-1/2 top-24 z-50 flex max-w-[min(92vw,48rem)] items-center gap-3 rounded-full px-5 py-3 text-sm font-semibold shadow-2xl backdrop-blur-xl',
                toast.tone === 'success'
                  ? 'bg-secondary text-black'
                  : toast.tone === 'warning'
                    ? 'bg-tertiary text-black'
                    : 'bg-surface-high text-white',
              )}
            >
              {toast.tone === 'success' ? <Check size={16} /> : <BellRing size={16} />}
              <span>{toast.message}</span>
            </motion.div>
          )}
        </AnimatePresence>
        <main className="mx-auto w-full max-w-7xl px-4 pb-[calc(8rem+env(safe-area-inset-bottom))] pt-24 sm:px-6 lg:px-8">
          <AnimatePresence mode="wait">
            {screen === 'home' && (
              <motion.section
                key="home"
                initial={{opacity: 0, y: 18}}
                animate={{opacity: 1, y: 0}}
                exit={{opacity: 0, y: -18}}
                className="flex flex-col gap-14"
              >
                <section className="grid gap-8 rounded-[2rem] border border-white/5 bg-[radial-gradient(circle_at_top,_rgba(255,59,48,0.15),_transparent_45%),linear-gradient(180deg,rgba(255,255,255,0.02),rgba(255,255,255,0))] px-4 py-8 sm:px-8 sm:py-10 lg:grid-cols-[1.1fr_0.9fr] lg:items-center">
                  <div className="order-2 flex flex-col items-start gap-6 lg:order-1">
                    <span className="rounded-full border border-white/10 bg-surface-high px-4 py-2 font-label text-[11px] uppercase tracking-[0.28em] text-outline">
                      Gemini grounded when available. Local fallback when not.
                    </span>
                    <div className="space-y-4">
                      <h1 className="max-w-3xl font-headline text-[clamp(2.8rem,7vw,5.9rem)] font-black uppercase leading-[0.9] tracking-[-0.06em]">
                        Check the claim,
                        <br />
                        <span className="text-primary">not the hype.</span>
                      </h1>
                      <p className="max-w-2xl text-base text-outline sm:text-lg">
                        Paste a public URL, type a claim, or use the mic. CAP CORE returns a live Gemini-backed verdict when it can and stays fully usable with deterministic fallback analysis when it cannot.
                      </p>
                    </div>
                    <div className="flex flex-wrap gap-3">
                      {HERO_CHIPS.map((chip) => (
                        <button
                          key={chip}
                          type="button"
                          onClick={() => {
                            setInputValue(chip);
                            void submitInput(chip, 'hero-chip');
                          }}
                          className="rounded-full border border-white/10 bg-surface px-4 py-2.5 text-left font-label text-xs uppercase tracking-[0.24em] text-white transition hover:border-primary/60 hover:bg-surface-high"
                        >
                          {chip}
                        </button>
                      ))}
                    </div>
                  </div>

                  <div className="order-1 flex flex-col items-center gap-5 lg:order-2">
                    <MicOrb isListening={isListening} onClick={beginVoiceCapture} />
                    <div className="text-center">
                      <p className="font-label text-xs uppercase tracking-[0.35em] text-outline">Voice input</p>
                      <p className="mt-2 max-w-sm text-sm text-outline">
                        Browser speech recognition is used when available. Unsupported browsers fall back to typed input automatically.
                      </p>
                    </div>
                  </div>
                </section>

                <section className="rounded-[2rem] border border-white/5 bg-surface/80 p-4 shadow-2xl sm:p-6">
                  <div className="flex flex-col gap-4">
                    <div className="flex flex-col gap-2 sm:flex-row sm:items-end sm:justify-between">
                      <div>
                        <p className="font-label text-xs uppercase tracking-[0.3em] text-outline">Submit a claim</p>
                        <h2 className="mt-2 font-headline text-3xl font-black uppercase tracking-[-0.05em]">
                          Public URL or plain text
                        </h2>
                      </div>
                      <button
                        type="button"
                        onClick={beginVoiceCapture}
                        className="inline-flex items-center gap-2 self-start rounded-full border border-white/10 bg-surface-high px-4 py-2 font-label text-xs uppercase tracking-[0.24em] text-white transition hover:border-primary/50 hover:text-primary"
                      >
                        <Volume2 size={14} />
                        Use Mic
                      </button>
                    </div>

                    <div className="flex flex-col gap-3 lg:flex-row">
                      <div
                        className={cn(
                          'flex flex-1 items-center gap-3 rounded-[1.75rem] border bg-background px-4 py-3 transition',
                          inputError ? 'border-primary' : 'border-white/10 focus-within:border-primary/50',
                        )}
                      >
                        <Search size={20} className="shrink-0 text-outline" />
                        <input
                          ref={inputRef}
                          value={inputValue}
                          onChange={(event) => {
                            setInputValue(event.target.value);
                            if (inputError) {
                              setInputError(null);
                            }
                          }}
                          onKeyDown={(event) => {
                            if (event.key === 'Enter') {
                              void submitInput();
                            }
                          }}
                          className="w-full bg-transparent text-base text-white outline-none placeholder:text-outline/60 sm:text-lg"
                          placeholder="Paste a public URL or type the claim you want to verify"
                          type="text"
                        />
                      </div>
                      <button
                        type="button"
                        onClick={() => void submitInput()}
                        disabled={isAnalyzing}
                        className="inline-flex min-h-[56px] items-center justify-center gap-2 rounded-full bg-primary px-6 font-headline text-sm font-black uppercase tracking-[0.2em] text-black transition hover:bg-primary-dim disabled:cursor-not-allowed disabled:opacity-60"
                      >
                        {isAnalyzing ? <RefreshCw size={18} className="animate-spin" /> : <Sparkles size={18} />}
                        {isAnalyzing ? 'Checking' : 'Check with Cap'}
                      </button>
                    </div>
                    {inputError && <p className="pl-2 text-sm text-primary">{inputError}</p>}
                  </div>
                </section>

                <section className="space-y-6">
                  <div className="flex flex-col gap-3 sm:flex-row sm:items-end sm:justify-between">
                    <div>
                      <p className="font-label text-xs uppercase tracking-[0.3em] text-primary">Trending investigations</p>
                      <h2 className="mt-2 font-headline text-4xl font-black uppercase tracking-[-0.05em]">
                        What people are checking now
                      </h2>
                    </div>
                    <button
                      type="button"
                      onClick={() => setScreen('trends')}
                      className="inline-flex items-center gap-2 font-label text-xs uppercase tracking-[0.22em] text-tertiary transition hover:text-white"
                    >
                      View all trends
                      <ChevronDown size={14} className="-rotate-90" />
                    </button>
                  </div>

                  <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                    {trendResults.slice(0, 3).map((result) => (
                      <TrendCard
                        key={result.id}
                        type={result.verdict}
                        category={result.category}
                        time={formatRelativeTime(result.analyzedAt)}
                        claim={result.title}
                        stats={`${result.mode === 'live' ? 'Live' : 'Fallback'} • ${result.sourceCount} source${result.sourceCount === 1 ? '' : 's'}`}
                        onClick={() => handleTrendOpen(result.id)}
                        onBadgeClick={() => setScreen('top')}
                      />
                    ))}
                  </div>
                </section>
              </motion.section>
            )}

            {screen === 'listening' && (
              <motion.section
                key="listening"
                initial={{opacity: 0}}
                animate={{opacity: 1}}
                exit={{opacity: 0}}
                className="flex min-h-[70vh] flex-col items-center justify-center gap-8 px-2 text-center"
              >
                <div className="flex items-center gap-3 rounded-full border border-secondary/30 bg-secondary/10 px-5 py-2 font-label text-xs uppercase tracking-[0.28em] text-secondary">
                  <span className="relative flex h-3 w-3">
                    <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-secondary opacity-70" />
                    <span className="relative inline-flex h-3 w-3 rounded-full bg-secondary" />
                  </span>
                  Listening
                </div>

                <MicOrb isListening className="scale-95 sm:scale-100" />

                <div className="max-w-3xl space-y-4">
                  <h1 className="font-headline text-[clamp(2.4rem,7vw,4.8rem)] font-black uppercase tracking-[-0.05em]">
                    Say the claim out loud
                  </h1>
                  <p className="text-lg text-outline">
                    {micTranscript ? `"${micTranscript}"` : 'Try a headline, rumor, quote, or public link.'}
                  </p>
                </div>

                <div className="flex flex-wrap justify-center gap-3">
                  {LISTENING_TAGS.map((tag) => (
                    <button
                      key={tag}
                      type="button"
                      onClick={() => {
                        stopListening();
                        setInputValue(tag);
                        void submitInput(tag, 'hero-chip');
                      }}
                      className="rounded-full border border-white/10 bg-surface-high px-4 py-2 font-label text-xs uppercase tracking-[0.24em] text-white transition hover:border-primary/60"
                    >
                      {tag}
                    </button>
                  ))}
                </div>

                <button
                  type="button"
                  onClick={() => stopListening('Voice input cancelled.')}
                  className="inline-flex items-center gap-2 rounded-full border border-white/10 px-5 py-3 font-label text-xs uppercase tracking-[0.26em] text-outline transition hover:border-primary/50 hover:text-primary"
                >
                  <X size={16} />
                  Cancel
                </button>
              </motion.section>
            )}

            {screen === 'checking' && (
              <motion.section
                key="checking"
                initial={{opacity: 0}}
                animate={{opacity: 1}}
                exit={{opacity: 0}}
                className="mx-auto flex w-full max-w-5xl flex-col gap-8"
              >
                <div className="space-y-4">
                  <div className="inline-flex items-center gap-2 rounded-full border border-primary/20 bg-primary/10 px-4 py-2 font-label text-xs uppercase tracking-[0.24em] text-primary">
                    <RefreshCw size={14} className="animate-spin" />
                    Verifying
                  </div>
                  <h1 className="font-headline text-[clamp(2.2rem,6vw,4.4rem)] font-black uppercase leading-[0.96] tracking-[-0.05em]">
                    {inputValue || 'Preparing investigation'}
                  </h1>
                  <p className="max-w-3xl text-outline">
                    CAP CORE is normalizing the input, checking whether live Gemini tooling is available, and collecting evidence for the final verdict.
                  </p>
                </div>

                <div className="grid gap-6 lg:grid-cols-[1.2fr_0.8fr]">
                  <div className="rounded-[2rem] border border-white/5 bg-surface p-6">
                    <h2 className="font-headline text-2xl font-black uppercase tracking-[-0.04em] text-primary">
                      Investigation pipeline
                    </h2>
                    <div className="mt-6 space-y-6">
                      {[
                        {
                          title: 'Normalize the request',
                          text: 'Classify the input as a public URL or free-text claim and decide the tool path.',
                          state: 'done',
                        },
                        {
                          title: 'Query live tools when available',
                          text: 'Gemini uses Google Search, and URL context is added for public URLs.',
                          state: isAnalyzing ? 'active' : 'done',
                        },
                        {
                          title: 'Build the verdict payload',
                          text: 'The final screen is rendered from typed result data, not a static placeholder.',
                          state: isAnalyzing ? 'pending' : 'done',
                        },
                      ].map((step) => (
                        <div key={step.title} className="flex gap-4">
                          <div
                            className={cn(
                              'mt-1 flex h-8 w-8 shrink-0 items-center justify-center rounded-full border',
                              step.state === 'done'
                                ? 'border-secondary/30 bg-secondary text-black'
                                : step.state === 'active'
                                  ? 'border-primary/30 bg-primary text-black'
                                  : 'border-white/10 bg-surface-high text-outline',
                            )}
                          >
                            {step.state === 'done' ? <Check size={16} /> : <Search size={16} />}
                          </div>
                          <div>
                            <h3 className="font-headline text-lg font-bold uppercase tracking-[-0.04em]">{step.title}</h3>
                            <p className="mt-1 text-sm leading-6 text-outline">{step.text}</p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="rounded-[2rem] border border-white/5 bg-surface-high p-6">
                    <h2 className="font-headline text-xl font-black uppercase tracking-[-0.04em] text-white">Current input</h2>
                    <p className="mt-4 break-words text-outline">{inputValue}</p>

                    <div className="mt-8 space-y-3 text-sm text-outline">
                      <div className="flex items-center justify-between rounded-2xl bg-background px-4 py-3">
                        <span>Route</span>
                        <span className="font-label uppercase tracking-[0.2em] text-white">
                          {detectInvestigationKind(inputValue || '') === 'url' ? 'URL + Search' : 'Claim + Search'}
                        </span>
                      </div>
                      <div className="flex items-center justify-between rounded-2xl bg-background px-4 py-3">
                        <span>Fallback ready</span>
                        <span className="font-label uppercase tracking-[0.2em] text-white">Yes</span>
                      </div>
                      <div className="flex items-center justify-between rounded-2xl bg-background px-4 py-3">
                        <span>State</span>
                        <span className="font-label uppercase tracking-[0.2em] text-primary">
                          {isAnalyzing ? 'Running' : 'Finalizing'}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </motion.section>
            )}

            {screen === 'results' && activeResult && (
              <motion.section
                key={`results-${activeResult.id}`}
                initial={{opacity: 0}}
                animate={{opacity: 1}}
                exit={{opacity: 0}}
                className="space-y-10"
              >
                <section className="rounded-[2rem] border border-white/5 bg-surface p-5 shadow-[0_0_60px_-24px_rgba(255,59,48,0.35)] sm:p-8">
                  <div className="flex flex-col gap-6">
                    <div className="flex flex-wrap items-center gap-3">
                      <Pill className={activeResult.verdict === 'CAP' ? 'bg-primary/15 text-primary' : activeResult.verdict === 'FACTS' ? 'bg-secondary/15 text-secondary' : 'bg-tertiary/20 text-tertiary'}>
                        {activeResult.verdict}
                      </Pill>
                      <Pill>{activeResult.confidence}% confidence</Pill>
                      <Pill>{activeResult.mode === 'live' ? 'Live web-grounded' : 'Local fallback'}</Pill>
                      <Pill>{activeResult.category}</Pill>
                    </div>

                    <div className="space-y-4">
                      <h1 className="font-headline text-[clamp(3rem,10vw,8rem)] font-black uppercase leading-[0.88] tracking-[-0.08em] text-primary">
                        {activeResult.verdict}
                      </h1>
                      <p className="max-w-4xl text-lg font-semibold text-white sm:text-2xl">{activeResult.summary}</p>
                      <p className="max-w-4xl break-words text-outline">{activeResult.title}</p>
                    </div>

                    <div className="grid gap-4 md:grid-cols-4">
                      <StatCard label="Source count" value={`${activeResult.sourceCount}`} helper={activeResult.mode === 'live' ? 'Retrieved from the grounded response.' : 'Fallback reference sources.'} />
                      <StatCard label="Checked" value={formatDateTime(activeResult.analyzedAt)} helper={formatRelativeTime(activeResult.analyzedAt)} />
                      <StatCard label="Shares" value={formatCompactNumber(activeResult.shares)} helper="Updated by the app state." />
                      <StatCard label="Laughed at" value={formatCompactNumber(activeResult.laughedAt)} helper="Updated by the app state." />
                    </div>

                    {activeResult.note && (
                      <div className="flex items-start gap-3 rounded-[1.5rem] border border-white/8 bg-background/80 px-4 py-4 text-sm text-outline">
                        <Info size={18} className="mt-0.5 shrink-0 text-primary" />
                        <p>{activeResult.note}</p>
                      </div>
                    )}
                  </div>
                </section>

                <section className="grid gap-6 lg:grid-cols-[1.15fr_0.85fr]">
                  <div className="space-y-6">
                    <SectionTitle title="Discrepancy Analysis" />
                    <div className="space-y-4">
                      {activeResult.discrepancies.map((item, index) => (
                        <div key={`${item.title}-${index}`} className="rounded-[1.5rem] border border-white/5 bg-surface-high p-5">
                          <div className="flex gap-4">
                            <span className="font-label text-lg font-bold text-primary">{String(index + 1).padStart(2, '0')}</span>
                            <div>
                              <h3 className="font-headline text-lg font-bold uppercase tracking-[-0.04em]">{item.title}</h3>
                              <p className="mt-2 leading-7 text-outline">{item.text}</p>
                            </div>
                          </div>
                        </div>
                      ))}
                    </div>

                    <SectionTitle title="Evidence To Review" />
                    <div className="grid gap-4 sm:grid-cols-2">
                      {activeResult.evidence.map((item, index) => (
                        <div key={`${item}-${index}`} className="rounded-[1.5rem] border border-white/5 bg-surface-high p-5">
                          <p className="font-label text-xs uppercase tracking-[0.28em] text-outline">Evidence {index + 1}</p>
                          <p className="mt-3 leading-7 text-white/90">{item}</p>
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="space-y-6">
                    <SectionTitle title="Sources & Queries" />
                    <div className="space-y-4">
                      {activeResult.sources.length > 0 ? (
                        activeResult.sources.map((source) => (
                          <a
                            key={`${source.url}-${source.name}`}
                            href={source.url}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="group block rounded-[1.5rem] border border-white/5 bg-surface-high p-5 transition hover:border-white/15"
                          >
                            <div className="flex items-start justify-between gap-4">
                              <div>
                                <h3 className="font-headline text-lg font-bold uppercase tracking-[-0.04em] group-hover:text-primary">
                                  {source.name}
                                </h3>
                                <p className="mt-1 text-xs uppercase tracking-[0.24em] text-outline">{source.status ?? 'Source'}</p>
                              </div>
                              <ExternalLink size={16} className="shrink-0 text-outline transition group-hover:text-primary" />
                            </div>
                            <p className="mt-3 break-all text-sm text-outline">{source.url}</p>
                            {source.text && <p className="mt-3 text-sm leading-6 text-white/80">{source.text}</p>}
                          </a>
                        ))
                      ) : (
                        <EmptyPanel title="No structured sources" description="The analyzer returned no explicit sources for this result." />
                      )}
                    </div>

                    <div className="rounded-[1.5rem] border border-white/5 bg-surface-high p-5">
                      <div className="flex items-center gap-3">
                        <Sparkles size={18} className="text-primary" />
                        <h3 className="font-headline text-lg font-bold uppercase tracking-[-0.04em]">Query log</h3>
                      </div>
                      <div className="mt-4 flex flex-wrap gap-2">
                        {activeResult.queryLog.length > 0 ? (
                          activeResult.queryLog.map((query) => (
                            <span
                              key={query}
                              className="rounded-full border border-white/8 bg-background px-3 py-2 font-label text-[11px] uppercase tracking-[0.2em] text-outline"
                            >
                              {query}
                            </span>
                          ))
                        ) : (
                          <p className="text-sm text-outline">No explicit query metadata was returned for this result.</p>
                        )}
                      </div>
                    </div>
                  </div>
                </section>

                <section className="sticky bottom-[calc(5.75rem+env(safe-area-inset-bottom))] z-30 rounded-[1.75rem] border border-white/8 bg-background/90 p-3 shadow-2xl backdrop-blur-xl lg:bottom-6">
                  <div className="grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
                    <ActionButton icon={Share2} label="Share Result" onClick={() => void handleShare(activeResult.id)} />
                    <ActionButton
                      icon={resultIsSaved ? Check : Star}
                      label={resultIsSaved ? 'Already in Top Caps' : 'Add to Top Caps'}
                      onClick={() => handleAddToTopCaps(activeResult.id)}
                      disabled={resultIsSaved}
                      primary
                    />
                    <ActionButton
                      icon={Flag}
                      label={activeResult.isFlagged ? 'Flagged' : 'Flag Result'}
                      onClick={() => handleFlag(activeResult.id)}
                      disabled={activeResult.isFlagged}
                    />
                    <ActionButton icon={RefreshCw} label="Check Another" onClick={resetForAnotherCheck} inverse />
                  </div>
                </section>
              </motion.section>
            )}
          </AnimatePresence>
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
