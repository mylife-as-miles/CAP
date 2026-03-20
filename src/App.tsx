import React, { useState, useEffect, useRef } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import { Search, X, Check, ExternalLink, Share2, Star, RefreshCw, Info, Flag, Flame, Camera, Filter, ArrowUpDown, ChevronDown, ChevronUp, Bell, BellRing, Download } from 'lucide-react';
import { toPng } from 'html-to-image';
import { Header, MobileNav } from '@/src/components/Navigation';
import { MicOrb } from '@/src/components/MicOrb';
import { TrendCard } from '@/src/components/TrendCard';
import { cn } from '@/src/lib/utils';

type Screen = 'home' | 'listening' | 'checking' | 'results' | 'top' | 'history' | 'profile' | 'notifications' | 'trends';

export default function App() {
  const [screen, setScreen] = useState<Screen>('home');
  const [inputValue, setInputValue] = useState('');
  const [inputError, setInputError] = useState<string | null>(null);
  const [isShared, setIsShared] = useState(false);
  const [isAddedToTopCaps, setIsAddedToTopCaps] = useState(false);
  const [isFlagged, setIsFlagged] = useState(false);
  const [showShareCard, setShowShareCard] = useState(false);
  const [isDownloading, setIsDownloading] = useState(false);
  const shareCardRef = useRef<HTMLDivElement>(null);

  const [topCapsSortBy, setTopCapsSortBy] = useState<'Shares' | 'Laughed At' | 'Date Added'>('Shares');
  const [topCapsFilterCategory, setTopCapsFilterCategory] = useState<string>('All');
  const [followedCategories, setFollowedCategories] = useState<string[]>([]);
  const [isCategoryDropdownOpen, setIsCategoryDropdownOpen] = useState(false);
  const [isSortDropdownOpen, setIsSortDropdownOpen] = useState(false);
  const [showNotificationToast, setShowNotificationToast] = useState<string | null>(null);

  const [topCapsData, setTopCapsData] = useState([
    {
      id: 1,
      claim: "Drinking 4L of salt water cures all winter fatigue instantly.",
      shares: 8400,
      laughedAt: 12000,
      dateAdded: '2026-03-18',
      category: 'Health',
      details: "This claim originated from a viral TikTok video. Medical professionals warn that consuming excessive salt water can lead to severe dehydration and hypernatremia.",
      sources: [
        { name: 'World Health Organization', url: 'https://who.int', text: '"Excessive sodium intake is linked to adverse health outcomes and does not cure fatigue."' },
        { name: 'Mayo Clinic', url: 'https://mayoclinic.org', text: '"Drinking large amounts of salt water can cause dangerous electrolyte imbalances."' }
      ]
    },
    {
      id: 2,
      claim: "Eating raw onions before bed prevents all seasonal allergies.",
      shares: 5200,
      laughedAt: 8000,
      dateAdded: '2026-03-17',
      category: 'Health',
      details: "A persistent myth circulated in holistic health forums. There is no scientific evidence linking raw onion consumption to allergy prevention.",
      sources: [
        { name: 'American Academy of Allergy', url: 'https://aaaai.org', text: '"There is no clinical evidence supporting onions as a preventative measure for seasonal allergies."' }
      ]
    },
    {
      id: 3,
      claim: "5G towers are responsible for the new strain of the common cold.",
      shares: 4100,
      laughedAt: 15000,
      dateAdded: '2026-03-19',
      category: 'Tech',
      details: "A recurring conspiracy theory. Viruses cannot be transmitted through radio waves or cellular networks.",
      sources: [
        { name: 'FCC', url: 'https://fcc.gov', text: '"Radiofrequency emissions from 5G technology do not cause or transmit viral infections."' },
        { name: 'CDC', url: 'https://cdc.gov', text: '"The common cold is caused by rhinoviruses, which spread through respiratory droplets, not electromagnetic waves."' }
      ]
    },
    {
      id: 4,
      claim: "You can charge your phone by putting it in the microwave for 30 seconds.",
      shares: 3800,
      laughedAt: 22000,
      dateAdded: '2026-03-15',
      category: 'Tech',
      details: "An old internet prank that resurfaces occasionally. Microwaving electronics will destroy them and potentially cause a fire.",
      sources: [
        { name: 'Consumer Reports', url: 'https://consumerreports.org', text: '"Microwaving any electronic device will cause irreparable damage and poses a severe fire hazard."' }
      ]
    },
    {
      id: 5,
      claim: "Staring at the sun for 5 minutes a day improves your vision.",
      shares: 2900,
      laughedAt: 9500,
      dateAdded: '2026-03-16',
      category: 'Health',
      details: "Also known as 'sun gazing'. Ophthalmologists strongly advise against this as it can cause permanent retinal damage.",
      sources: [
        { name: 'American Academy of Ophthalmology', url: 'https://aao.org', text: '"Looking directly at the sun without proper eye protection can cause solar retinopathy, leading to permanent vision loss."' }
      ]
    },
    {
      id: 6,
      claim: "The earth is actually flat and Australia is a hoax.",
      shares: 1500,
      laughedAt: 35000,
      dateAdded: '2026-03-10',
      category: 'Science',
      details: "A combination of two popular conspiracy theories. Satellite imagery and basic physics disprove the flat earth theory, and Australia is a real continent.",
      sources: [
        { name: 'NASA', url: 'https://nasa.gov', text: '"Decades of satellite imagery and space exploration confirm the Earth is an oblate spheroid."' },
        { name: 'Australian Government', url: 'https://australia.gov.au', text: '"Australia is a sovereign country and continent with a population of over 26 million people."' }
      ]
    },
    {
      id: 7,
      claim: "New legislation will ban all gas-powered vehicles by 2028.",
      shares: 6000,
      laughedAt: 2000,
      dateAdded: '2026-03-19',
      category: 'Politics',
      details: "A misinterpretation of a proposed bill that aimed to increase electric vehicle incentives, not ban gas vehicles entirely.",
      sources: [
        { name: 'GovTrack', url: 'https://govtrack.us', text: '"The proposed legislation (HR-1042) focuses on tax incentives for EV manufacturers and does not contain provisions banning existing gas-powered vehicles."' }
      ]
    },
  ]);

  const [expandedCards, setExpandedCards] = useState<number[]>([]);

  const handleLaugh = (e: React.MouseEvent, id: number) => {
    e.stopPropagation();
    setTopCapsData(prev => prev.map(item => item.id === id ? { ...item, laughedAt: item.laughedAt + 1 } : item));
  };

  const toggleExpand = (id: number) => {
    setExpandedCards(prev => prev.includes(id) ? prev.filter(cardId => cardId !== id) : [...prev, id]);
  };

  const toggleFollowCategory = (e: React.MouseEvent, category: string) => {
    e.stopPropagation();
    setFollowedCategories(prev => {
      const isFollowing = prev.includes(category);
      if (isFollowing) {
        setShowNotificationToast(`Unfollowed ${category}`);
        setTimeout(() => setShowNotificationToast(null), 3000);
        return prev.filter(c => c !== category);
      } else {
        setShowNotificationToast(`Followed ${category}! You will be notified of new top claims.`);
        setTimeout(() => setShowNotificationToast(null), 3000);
        return [...prev, category];
      }
    });
  };

  const resetFilters = () => {
    setTopCapsSortBy('Shares');
    setTopCapsFilterCategory('All');
  };

  const filteredAndSortedTopCaps = topCapsData
    .filter(item => topCapsFilterCategory === 'All' || item.category === topCapsFilterCategory)
    .sort((a, b) => {
      if (topCapsSortBy === 'Shares') return b.shares - a.shares;
      if (topCapsSortBy === 'Laughed At') return b.laughedAt - a.laughedAt;
      if (topCapsSortBy === 'Date Added') return new Date(b.dateAdded).getTime() - new Date(a.dateAdded).getTime();
      return 0;
    });

  const formatNumber = (num: number) => {
    return num >= 1000 ? (num / 1000).toFixed(1) + 'k' : num.toString();
  };

  const handleMicClick = () => {
    if (screen === 'home') setScreen('listening');
  };

  const isValidUrl = (string: string) => {
    try {
      new URL(string);
      return true;
    } catch (_) {
      return false;
    }
  };

  const handleCheck = () => {
    setInputError(null);
    if (!inputValue.trim()) {
      setInputError("Please enter a URL to check.");
      return;
    }
    if (!isValidUrl(inputValue)) {
      setInputError("Invalid URL. Please paste a valid link (e.g., https://example.com).");
      return;
    }
    setScreen('checking');
  };

  const handleShare = () => {
    setShowShareCard(true);
  };

  const handleDownloadImage = async () => {
    if (!shareCardRef.current) return;
    try {
      setIsDownloading(true);
      const dataUrl = await toPng(shareCardRef.current, {
        cacheBust: true,
        pixelRatio: 2,
        backgroundColor: '#0A0A0A'
      });
      const link = document.createElement('a');
      link.download = 'cap-card.png';
      link.href = dataUrl;
      link.click();
    } catch (err) {
      console.error('Failed to generate image', err);
    } finally {
      setIsDownloading(false);
    }
  };

  const handleAddToTopCaps = () => {
    setIsAddedToTopCaps(true);
  };

  useEffect(() => {
    if (screen === 'listening') {
      const timer = setTimeout(() => setScreen('checking'), 3000);
      return () => clearTimeout(timer);
    }
    if (screen === 'checking') {
      const timer = setTimeout(() => setScreen('results'), 4000);
      return () => clearTimeout(timer);
    }
  }, [screen]);

  return (
    <div className="min-h-screen bg-background selection:bg-primary selection:text-black">
      <Header activeTab={screen} onNavigate={setScreen} />

      <AnimatePresence>
        {showNotificationToast && (
          <motion.div
            initial={{ opacity: 0, y: -50, x: '-50%' }}
            animate={{ opacity: 1, y: 0, x: '-50%' }}
            exit={{ opacity: 0, y: -50, x: '-50%' }}
            className="fixed top-24 left-1/2 z-50 bg-primary text-black font-label text-sm uppercase tracking-widest px-6 py-3 rounded-full shadow-2xl flex items-center gap-3"
          >
            <BellRing size={16} />
            {showNotificationToast}
          </motion.div>
        )}
      </AnimatePresence>

      <main className="pt-24 pb-32 px-6 max-w-7xl mx-auto">
        <AnimatePresence mode="wait">
          {screen === 'home' && (
            <motion.div
              key="home"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="flex flex-col items-center"
            >
              {/* Hero Section */}
              <div className="relative flex flex-col items-center mb-16 w-full max-w-2xl mt-12">
                <div className="absolute -left-20 top-0 hidden xl:flex flex-col gap-4">
                  {['Is this true?', 'Red flags?', 'Should I trust this?'].map((text, i) => (
                    <button
                      key={text}
                      className={cn(
                        "bg-surface-high text-white rounded-full px-6 py-3 font-label text-sm uppercase tracking-widest hover:bg-primary hover:text-black transition-all active:scale-95 whitespace-nowrap",
                        i === 1 && "translate-x-4"
                      )}
                    >
                      {text}
                    </button>
                  ))}
                </div>

                <div className="mb-8">
                  <span className="font-label text-[10px] uppercase tracking-[0.2em] text-outline bg-surface-high px-4 py-2 rounded-full border border-white/5">
                    Powered by Firecrawl & ElevenLabs
                  </span>
                </div>

                <MicOrb onClick={handleMicClick} />

                <div className="mt-8 text-center">
                  <h1 className="font-headline text-5xl md:text-7xl font-black uppercase tracking-tighter mb-4 text-white">
                    Tap to ask Cap
                  </h1>
                  <p className="font-body text-outline text-lg max-w-md mx-auto">
                    Our AI Oracle scans the web in real-time to detect deceit, hype, and hidden truths.
                  </p>
                </div>
              </div>

              {/* Input Section */}
              <div className="w-full max-w-3xl mb-24">
                <div className="flex flex-col items-center gap-6">
                  <p className="font-label text-xs uppercase tracking-[0.3em] text-outline">Or paste a link below</p>
                  <div className="w-full relative flex flex-col items-center">
                    <div className={cn(
                      "w-full relative flex items-center p-2 bg-surface rounded-full border transition-colors shadow-2xl",
                      inputError ? "border-red-500 focus-within:border-red-400" : "border-white/5 focus-within:border-primary/50"
                    )}>
                      <input
                        className="w-full bg-transparent border-none focus:ring-0 px-8 py-4 font-body text-xl text-white placeholder:text-outline/50"
                        placeholder="Paste a URL to check (e.g., https://news.com/article)"
                        type="text"
                        value={inputValue}
                        onChange={(e) => {
                          setInputValue(e.target.value);
                          if (inputError) setInputError(null);
                        }}
                        onKeyDown={(e) => e.key === 'Enter' && handleCheck()}
                      />
                      <button
                        onClick={handleCheck}
                        className="bg-primary text-black font-headline font-black uppercase tracking-tighter px-10 py-4 rounded-full hover:bg-primary-dim transition-colors active:scale-95"
                      >
                        Check
                      </button>
                    </div>
                    <AnimatePresence>
                      {inputError && (
                        <motion.p
                          initial={{ opacity: 0, y: -10 }}
                          animate={{ opacity: 1, y: 0 }}
                          exit={{ opacity: 0, y: -10 }}
                          className="text-red-400 font-label text-sm mt-4 tracking-wide"
                        >
                          {inputError}
                        </motion.p>
                      )}
                    </AnimatePresence>
                  </div>
                </div>
              </div>

              {/* Trending Section */}
              <div className="w-full">
                <div className="flex justify-between items-end mb-8">
                  <div>
                    <span className="font-label text-xs uppercase tracking-[0.3em] text-primary mb-2 block">Trending Investigations</span>
                    <h2 className="font-headline text-4xl font-black uppercase tracking-tighter">Top Caps</h2>
                  </div>
                  <button
                    onClick={() => setScreen('trends')}
                    className="font-label text-xs uppercase tracking-[0.2em] text-tertiary hover:opacity-80 transition-opacity font-bold"
                    style={{ textShadow: '-1.5px 0 0 #FF3B30, 1.5px 0 0 #34C759' }}
                  >
                    View All Trends
                  </button>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  <TrendCard
                    type="CAP"
                    category="Social Media"
                    time="2h ago"
                    claim="Drinking 4L of salt water cures all winter fatigue instantly."
                    stats="842 researchers checked"
                    onClick={() => setScreen('results')}
                    onBadgeClick={(e) => { e.stopPropagation(); setScreen('top'); }}
                  />
                  <TrendCard
                    type="FACTS"
                    category="Economics"
                    time="5h ago"
                    claim="New housing starts in the metro area hit a 10-year high this June."
                    stats="1.2k sources verified"
                    onClick={() => setScreen('results')}
                  />
                  <TrendCard
                    type="MIXED"
                    category="Tech News"
                    time="12h ago"
                    claim="The new AI model is 400% more efficient at coding than last year."
                    stats="Nuanced breakdown inside"
                    onClick={() => setScreen('results')}
                  />
                </div>
              </div>
            </motion.div>
          )}

          {screen === 'listening' && (
            <motion.div
              key="listening"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="flex flex-col items-center justify-center min-h-[70vh]"
            >
              <div className="mb-12">
                <span className="font-label text-sm uppercase tracking-[0.3em] text-secondary font-bold flex items-center gap-3">
                  <span className="relative flex h-3 w-3">
                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75"></span>
                    <span className="relative inline-flex rounded-full h-3 w-3 bg-secondary"></span>
                  </span>
                  Listening...
                </span>
              </div>

              <MicOrb isListening />

              <div className="mt-16 h-16 flex items-center justify-center gap-1.5 w-full max-w-2xl">
                {[4, 8, 12, 6, 10, 5, 12, 9, 4, 11, 6, 3, 7, 10, 14, 8, 12, 5, 9, 4, 11, 6, 8, 4].map((h, i) => (
                  <motion.div
                    key={i}
                    animate={{ height: [h * 3, h * 6, h * 3] }}
                    transition={{ duration: 0.4 + (i % 3) * 0.1, repeat: Infinity, delay: i * 0.05 }}
                    className={cn(
                      "w-1.5 rounded-full",
                      i % 4 === 0 ? "bg-primary" : i % 4 === 1 ? "bg-secondary" : i % 4 === 2 ? "bg-tertiary" : "bg-primary-dim"
                    )}
                  />
                ))}
              </div>

              <div className="mt-12 text-center max-w-3xl px-4">
                <p className="font-headline text-3xl md:text-5xl font-black text-white leading-tight tracking-tight">
                  "Yo Cap, <span className="text-outline">is this true? I saw a post that said...</span>"
                </p>
              </div>

              <div className="mt-12 flex flex-wrap justify-center gap-3">
                {['Sports Rumors', 'Viral TikToks', 'News Alerts'].map(tag => (
                  <button key={tag} className="px-6 py-3 rounded-full bg-surface-high text-white font-label text-xs uppercase tracking-widest border border-white/10 hover:border-primary/50 transition-all">
                    {tag}
                  </button>
                ))}
              </div>

              <button
                onClick={() => setScreen('home')}
                className="mt-20 group flex flex-col items-center gap-2 text-outline hover:text-primary transition-all duration-300"
              >
                <div className="w-12 h-12 rounded-full border border-white/10 flex items-center justify-center group-hover:border-primary/50 group-hover:bg-primary/10">
                  <X size={24} />
                </div>
                <span className="font-label text-[10px] uppercase font-bold tracking-[0.2em]">Cancel</span>
              </button>
            </motion.div>
          )}

          {screen === 'checking' && (
            <motion.div
              key="checking"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="w-full max-w-5xl mx-auto"
            >
              <div className="mb-16">
                <div className="inline-flex items-center gap-2 mb-4">
                  <span className="w-2 h-2 rounded-full bg-primary-dim animate-ping"></span>
                  <span className="font-label text-xs tracking-widest uppercase text-outline">Verifying Claim</span>
                </div>
                <h1 className="font-headline text-4xl md:text-6xl font-black tracking-tighter uppercase leading-none text-white">
                  "{inputValue || "The 2024 economic projections suggest a 40% decrease in consumer spending."}"
                </h1>
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 w-full items-start">
                <div className="lg:col-span-7 flex flex-col gap-6">
                  <div className="p-10 rounded-3xl bg-surface border-l-4 border-primary shadow-2xl relative overflow-hidden">
                    <h2 className="font-headline text-3xl font-black uppercase tracking-tighter text-primary mb-8">Cap is checking...</h2>
                    <div className="space-y-8 relative">
                      <div className="absolute left-[15px] top-2 bottom-2 w-0.5 bg-white/10"></div>

                      <div className="flex gap-6 relative">
                        <div className="z-10 w-8 h-8 rounded-full bg-secondary flex items-center justify-center text-black shadow-[0_0_15px_rgba(111,251,133,0.4)]">
                          <Check size={16} />
                        </div>
                        <div className="flex-1">
                          <p className="font-headline font-bold text-white">Synthesizing claim structure</p>
                          <p className="font-body text-sm text-outline">Parsed 3 core variables: Timeframe, Metric, Value.</p>
                        </div>
                      </div>

                      <div className="flex gap-6 relative">
                        <div className="z-10 w-8 h-8 rounded-full bg-primary flex items-center justify-center text-black shadow-[0_0_15px_rgba(255,142,128,0.4)] animate-pulse">
                          <Search size={16} />
                        </div>
                        <div className="flex-1">
                          <p className="font-headline font-bold text-white text-xl">Searching web for receipts...</p>
                          <p className="font-body text-outline">Querying Bloomberg, Reuters, and Federal Reserve archives.</p>
                          <div className="mt-4 flex gap-2">
                            <motion.span animate={{ opacity: [0.3, 1, 0.3] }} transition={{ duration: 1, repeat: Infinity }} className="w-12 h-1 bg-primary rounded-full"></motion.span>
                            <motion.span animate={{ opacity: [0.3, 1, 0.3] }} transition={{ duration: 1, repeat: Infinity, delay: 0.2 }} className="w-12 h-1 bg-primary rounded-full"></motion.span>
                            <span className="w-12 h-1 bg-white/10 rounded-full"></span>
                            <span className="w-12 h-1 bg-white/10 rounded-full"></span>
                          </div>
                        </div>
                      </div>

                      {['Comparing conflicting data', 'Issuing Verdict'].map((step) => (
                        <div key={step} className="flex gap-6 relative opacity-30">
                          <div className="z-10 w-8 h-8 rounded-full bg-surface-high flex items-center justify-center text-outline">
                            <div className="w-2 h-2 rounded-full bg-current" />
                          </div>
                          <div className="flex-1">
                            <p className="font-headline font-bold text-white">{step}</p>
                            <p className="font-body text-sm text-outline">Awaiting research completion...</p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-5 flex flex-col gap-4">
                  <div className="flex justify-between items-center px-2">
                    <h3 className="font-label text-xs tracking-widest uppercase text-outline font-bold">Live Evidence Stream</h3>
                    <span className="text-[10px] font-label text-secondary animate-pulse">4 SOURCES FOUND</span>
                  </div>

                  {[
                    { site: 'REUTERS.COM', color: 'text-secondary', text: '"Consumer spending remains resilient in Q1 despite inflationary pressures, showing a 1.2% increase..."' },
                    { site: 'BLOOMBERG', color: 'text-tertiary', text: '"Market analysts predict a softening but highlight that \'40%\' claims are statistically unfounded..."' }
                  ].map((source, i) => (
                    <div key={i} className={cn("bg-surface-high p-5 rounded-3xl border-l-2", source.color.replace('text-', 'border-'))}>
                      <div className="flex items-center gap-3 mb-3">
                        <div className="w-6 h-6 rounded-full bg-white/10" />
                        <span className={cn("font-label text-[10px] uppercase font-bold", source.color)}>{source.site}</span>
                        <span className="ml-auto font-label text-[10px] text-outline">{i === 0 ? 'READING...' : 'MATCH FOUND'}</span>
                      </div>
                      <p className="font-body text-sm text-outline leading-relaxed italic">{source.text}</p>
                    </div>
                  ))}

                  <div className="bg-surface border border-dashed border-white/10 p-5 rounded-3xl flex items-center justify-center">
                    <div className="flex flex-col items-center gap-2">
                      <div className="flex gap-1">
                        {[0, 1, 2].map(i => (
                          <motion.span
                            key={i}
                            animate={{ y: [0, -5, 0] }}
                            transition={{ duration: 0.6, repeat: Infinity, delay: i * 0.2 }}
                            className="w-2 h-2 rounded-full bg-white/20"
                          />
                        ))}
                      </div>
                      <span className="font-label text-[10px] text-outline uppercase tracking-widest">Scanning Social Sentiment</span>
                    </div>
                  </div>
                </div>
              </div>
            </motion.div>
          )}

          {screen === 'results' && (
            <motion.div
              key="results"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="w-full max-w-7xl mx-auto relative"
            >
              <section className="flex flex-col items-center text-center mb-16">
                <div className="relative w-full max-w-4xl bg-surface rounded-3xl overflow-hidden border-l-[4px] border-primary shadow-[0_0_60px_-15px_rgba(226,36,31,0.3)]">
                  <div className="p-8 md:p-16 flex flex-col items-center">
                    <div className="flex items-center gap-3 mb-6">
                      <span className="font-label text-xs uppercase tracking-[0.2em] text-primary bg-primary/10 px-3 py-1 rounded-full">Confidence: High</span>
                      <span className="font-label text-xs uppercase tracking-[0.2em] text-outline">Ref ID: 8821-X</span>
                    </div>
                    <div className="flex items-center justify-center gap-4 mb-4 relative">
                      <div className="relative group/cap cursor-help">
                        <h1 className="font-headline text-[80px] md:text-[140px] leading-none font-black text-primary uppercase italic tracking-tighter">CAP</h1>
                        <div className="absolute bottom-full left-1/2 -translate-x-1/2 mb-4 w-80 p-5 bg-surface-high border border-white/10 rounded-2xl shadow-[0_0_40px_rgba(0,0,0,0.5)] opacity-0 group-hover/cap:opacity-100 transition-all duration-200 pointer-events-none z-50">
                          <div className="flex items-center gap-2 mb-3">
                            <span className="bg-primary/20 text-primary px-3 py-1 rounded-full font-label text-[10px] uppercase tracking-widest">Verdict Reasoning</span>
                          </div>
                          <p className="font-body text-sm text-white normal-case not-italic text-left font-normal leading-relaxed">
                            Flagged as CAP due to significant contradictions with official documentation and verified pricing data. The claim overstates what the sources actually support.
                          </p>
                          <div className="absolute -bottom-2 left-1/2 -translate-x-1/2 w-4 h-4 bg-surface-high border-b border-r border-white/10 rotate-45"></div>
                        </div>
                      </div>
                      <div className="mt-4 md:mt-8">
                        <Info size={32} className="text-outline/50" />
                      </div>
                    </div>
                    <p className="font-headline text-2xl md:text-3xl text-white max-w-2xl font-bold leading-tight italic mb-8">
                      "The headline overstates what the sources actually support."
                    </p>
                    <div className="h-10 flex items-center justify-center gap-1.5 w-full max-w-sm opacity-60">
                      {[3, 5, 8, 4, 7, 3, 8, 6, 3, 7, 4, 2, 5, 7, 4, 8, 3, 6, 4, 3, 6, 8, 5, 4].map((h, i) => (
                        <motion.div
                          key={i}
                          animate={{ height: [h * 2, h * 4, h * 2] }}
                          transition={{ duration: 0.4 + (i % 3) * 0.1, repeat: Infinity, delay: i * 0.05 }}
                          className={cn(
                            "w-1 rounded-full",
                            i % 4 === 0 ? "bg-primary" : i % 4 === 1 ? "bg-secondary" : i % 4 === 2 ? "bg-tertiary" : "bg-primary-dim"
                          )}
                        />
                      ))}
                    </div>
                  </div>
                </div>
              </section>

              <section className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-16">
                <div className="md:col-span-2 space-y-6">
                  <h3 className="font-headline text-xl uppercase tracking-widest text-outline mb-4 flex items-center gap-2">
                    <span className="w-8 h-[1px] bg-outline"></span>
                    Discrepancy Analysis
                  </h3>
                  {[
                    { id: '01', title: 'Official Documentation Gap', text: 'The original claim cites "Section 4.2" of the 2023 Federal Registry, but that section exclusively discusses agricultural subsidies, not urban development grants.' },
                    { id: '02', title: 'Pricing Page Contradiction', text: 'The "Unlimit" plan mentioned in the leak is listed on the public pricing page as a deprecated enterprise-only tier with a $5,000 minimum spend, contradicting the "free for all" claim.' }
                  ].map(item => (
                    <div key={item.id} className="bg-surface-high p-8 rounded-3xl relative overflow-hidden group">
                      <div className="absolute left-0 top-0 w-1 h-full bg-primary-dim opacity-40"></div>
                      <div className="flex gap-6 items-start">
                        <span className="font-label text-primary text-xl font-bold">{item.id}</span>
                        <div>
                          <h4 className="font-headline text-lg font-bold mb-2 uppercase text-white">{item.title}</h4>
                          <p className="text-outline font-body leading-relaxed">{item.text}</p>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>

                <div className="bg-surface-high p-8 rounded-3xl flex flex-col justify-between">
                  <div>
                    <h3 className="font-headline text-xl uppercase tracking-widest text-outline mb-8">Metadata</h3>
                    <div className="space-y-6">
                      {[
                        { label: 'Source Count', value: '14 Verified' },
                        { label: 'Audit Speed', value: '1.2 Seconds' },
                        { label: 'Last Checked', value: 'Today 14:21' }
                      ].map(stat => (
                        <div key={stat.label} className="flex justify-between items-end border-b border-white/10 pb-2">
                          <span className="font-label text-xs uppercase text-outline">{stat.label}</span>
                          <span className="font-headline font-bold text-lg italic">{stat.value}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                  <div className="mt-8 pt-8 border-t border-white/10">
                    <p className="text-xs font-label text-outline uppercase leading-relaxed">
                      This report was generated using the CAP-ORACLE V3 model using cross-referenced editorial veracity datasets.
                    </p>
                  </div>
                </div>
              </section>

              <section className="mb-24">
                <h3 className="font-headline text-xl uppercase tracking-widest text-outline mb-8 flex items-center gap-2">
                  <span className="w-8 h-[1px] bg-outline"></span>
                  Top 3 Influential Sources
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  {[
                    { name: 'Federal Archives', url: 'https://archives.gov/budget/2024', text: '"...there is no mention of the proposed budget allocation for the fiscal year 2024 within the specified legislative docket..."' },
                    { name: 'Web Standards Org', url: 'https://w3c.org/protocols/drafts', text: '"The protocol referenced in the article (V-HTT-9) does not exist in the current working drafts of the HTTP steering committee."' },
                    { name: 'Stat-Check.org', url: 'https://stat-check.org/reports/2023', text: '"Historical data for the period 2018-2022 shows a maximum growth rate of 4%, not the 14% claimed in the viral post."' }
                  ].map((source, i) => (
                    <a key={i} href={source.url} target="_blank" rel="noopener noreferrer" className="bg-surface p-6 rounded-3xl hover:bg-surface-high transition-all group border border-transparent hover:border-white/10 flex flex-col h-full">
                      <div className="flex justify-between items-start mb-4">
                        <div className="w-10 h-10 bg-white/10 rounded-full flex items-center justify-center overflow-hidden">
                          <div className="w-6 h-6 bg-white/20 rounded-full" />
                        </div>
                        <ExternalLink size={18} className="text-outline group-hover:text-primary transition-colors" />
                      </div>
                      <h5 className="font-headline font-bold text-white mb-2 truncate uppercase tracking-tighter group-hover:text-primary transition-colors">{source.name}</h5>
                      <p className="text-sm text-outline line-clamp-4 font-body flex-grow">{source.text}</p>
                      <div className="mt-4 pt-4 border-t border-white/5 font-mono text-[10px] text-outline/50 truncate">
                        {source.url}
                      </div>
                    </a>
                  ))}
                </div>
              </section>

              <div className="fixed bottom-0 left-0 w-full z-40 px-6 pb-12 pt-12 bg-gradient-to-t from-background via-background/90 to-transparent pointer-events-none">
                <div className="w-full max-w-7xl mx-auto flex flex-col lg:flex-row flex-nowrap gap-4 justify-center items-center pointer-events-auto">
                  <button
                    onClick={handleShare}
                    className="w-full lg:w-auto px-6 py-4 text-sm bg-surface-high text-white font-headline font-black uppercase tracking-widest rounded-full hover:bg-white/10 transition-all flex items-center justify-center gap-3 active:scale-95 whitespace-nowrap"
                  >
                    <Share2 size={20} />
                    Share Result
                  </button>
                  <button
                    onClick={handleAddToTopCaps}
                    disabled={isAddedToTopCaps}
                    className={cn(
                      "w-full lg:w-auto px-6 py-4 text-sm font-headline font-black uppercase tracking-widest rounded-full transition-all flex items-center justify-center gap-3 active:scale-95 whitespace-nowrap",
                      isAddedToTopCaps
                        ? "bg-surface-high text-primary border border-primary/30 cursor-default"
                        : "bg-primary text-black hover:bg-primary-dim shadow-[0_0_25px_rgba(255,142,128,0.4)]"
                    )}
                  >
                    {isAddedToTopCaps ? <Check size={20} /> : <Star size={20} fill="currentColor" />}
                    {isAddedToTopCaps ? 'Added to Top Caps' : 'Add to Top Caps'}
                  </button>
                  <button
                    onClick={() => setIsFlagged(true)}
                    disabled={isFlagged}
                    className={cn(
                      "w-full lg:w-auto px-6 py-4 text-sm font-headline font-black uppercase tracking-widest rounded-full transition-all flex items-center justify-center gap-3 active:scale-95 whitespace-nowrap",
                      isFlagged
                        ? "bg-surface-high text-outline border border-white/10 cursor-default"
                        : "bg-surface text-white hover:bg-surface-high border border-white/10"
                    )}
                  >
                    <Flag size={20} className={isFlagged ? "fill-current" : ""} />
                    {isFlagged ? 'Flagged' : 'Flag Result'}
                  </button>
                  <button
                    onClick={() => {
                      setScreen('home');
                      setInputValue('');
                      setIsShared(false);
                      setIsAddedToTopCaps(false);
                      setIsFlagged(false);
                    }}
                    className="w-full lg:w-auto px-6 py-4 text-sm bg-white text-black font-headline font-black uppercase tracking-widest rounded-full hover:opacity-90 transition-all flex items-center justify-center gap-3 active:scale-95 whitespace-nowrap"
                  >
                    <RefreshCw size={20} />
                    Check Another
                  </button>
                </div>
              </div>
            </motion.div>
          )}

          {screen === 'top' && (
            <motion.div
              key="top"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="w-full max-w-4xl mx-auto"
            >
              <div className="text-center mb-16">
                <span className="font-label text-xs uppercase tracking-[0.3em] text-primary mb-4 block">Hall of Shame</span>
                <h1 className="font-headline text-5xl md:text-7xl font-black uppercase italic tracking-tighter mb-6 text-white">Top Caps</h1>
                <p className="text-outline font-body text-lg max-w-2xl mx-auto">
                  A leaderboard of the wildest, most delusional claims Cap has checked.
                </p>
              </div>

              {/* Cap of the Day */}
              <div className="mb-16">
                <h2 className="font-headline text-2xl font-black uppercase tracking-tighter mb-6 flex items-center gap-3 text-white">
                  <Flame className="text-primary" />
                  Most Delusional Claim Today
                </h2>
                <motion.div
                  animate={{ boxShadow: ['0 0 0 rgba(226,36,31,0)', '0 0 20px rgba(226,36,31,0.3)', '0 0 0 rgba(226,36,31,0)'] }}
                  transition={{ duration: 2, repeat: Infinity }}
                  className="bg-surface-high border-2 border-primary/50 rounded-3xl p-8 relative overflow-hidden"
                >
                  {/* Shimmer effect */}
                  <motion.div
                    animate={{ x: ['-100%', '200%'] }}
                    transition={{ duration: 3, repeat: Infinity, ease: "linear", repeatDelay: 1 }}
                    className="absolute inset-0 w-1/2 h-full bg-gradient-to-r from-transparent via-white/10 to-transparent skew-x-12 z-0"
                  />
                  <div className="absolute top-0 right-0 bg-primary text-white font-label text-[10px] uppercase tracking-widest px-4 py-2 rounded-bl-xl font-bold z-10">
                    Cap of the Day
                  </div>
                  <div className="relative z-10 group/claim cursor-help">
                    <p className="font-headline text-2xl md:text-4xl font-bold text-white mb-2 leading-tight mt-4">
                      "The moon landing was faked using early CGI from a time-traveling James Cameron."
                    </p>
                    {/* Tooltip on hover over claim text */}
                    <div className="absolute bottom-full left-0 mb-3 w-full max-w-md p-5 bg-surface border border-white/10 rounded-2xl shadow-[0_0_40px_rgba(0,0,0,0.6)] opacity-0 group-hover/claim:opacity-100 transition-all duration-200 pointer-events-none z-30">
                      <div className="flex items-center gap-2 mb-3">
                        <span className="bg-primary/20 text-primary px-3 py-1 rounded-full font-label text-[10px] uppercase tracking-widest">Science</span>
                      </div>
                      <h4 className="font-label text-xs uppercase tracking-widest text-primary mb-2">Why it's Cap</h4>
                      <p className="text-white/90 font-body text-sm leading-relaxed normal-case font-normal">
                        James Cameron was 14 years old during the 1969 moon landing. Furthermore, the CGI technology required to fake the moon landing did not exist until decades later.
                      </p>
                      <div className="absolute -bottom-2 left-8 w-4 h-4 bg-surface border-b border-r border-white/10 rotate-45"></div>
                    </div>
                  </div>
                  <div className="flex items-center gap-2 mb-6 relative z-10">
                    <Info size={14} className="text-outline/50" />
                    <span className="font-label text-[10px] uppercase tracking-widest text-outline/50">Hover claim for details</span>
                  </div>
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between border-t border-white/10 pt-6 gap-4 relative z-10">
                    <div className="flex items-center gap-4 text-outline text-sm font-label uppercase tracking-wider">
                      <span className="flex items-center gap-2"><Flame size={16} className="text-primary" /> 42.8k Laughed</span>
                      <span>•</span>
                      <span>12k Shares</span>
                    </div>
                    <div className="flex gap-2">
                      <button className="flex items-center justify-center gap-2 bg-surface border border-white/10 text-white px-6 py-3 rounded-full font-headline font-black uppercase tracking-widest text-sm hover:bg-white/5 transition-colors active:scale-95">
                        <Flame size={16} className="text-primary" /> Laugh
                      </button>
                      <button className="flex items-center justify-center gap-2 bg-white text-black px-6 py-3 rounded-full font-headline font-black uppercase tracking-widest text-sm hover:opacity-90 transition-opacity active:scale-95">
                        <Share2 size={16} /> Share
                      </button>
                    </div>
                  </div>
                </motion.div>
              </div>

              {/* Caught in 4K Leaderboard */}
              <div>
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-6">
                  <h2 className="font-headline text-2xl font-black uppercase tracking-tighter flex items-center gap-3 text-white m-0">
                    <Camera className="text-white" />
                    Caught in 4K
                  </h2>

                  {/* Sorting and Filtering Controls */}
                  <div className="flex flex-wrap items-center gap-3">
                    <div className="relative">
                      <div
                        onClick={() => setIsCategoryDropdownOpen(!isCategoryDropdownOpen)}
                        className="flex items-center gap-2 bg-surface border border-white/10 rounded-full px-4 py-2 cursor-pointer hover:bg-white/5 transition-colors"
                      >
                        <Filter size={14} className="text-outline" />
                        <span className="text-white font-label text-xs uppercase tracking-widest">
                          {topCapsFilterCategory === 'All' ? 'All Categories' : topCapsFilterCategory}
                        </span>
                        <ChevronDown size={14} className="text-outline ml-1" />
                      </div>

                      <AnimatePresence>
                        {isCategoryDropdownOpen && (
                          <motion.div
                            initial={{ opacity: 0, y: 10 }}
                            animate={{ opacity: 1, y: 0 }}
                            exit={{ opacity: 0, y: 10 }}
                            className="absolute top-full left-0 mt-2 w-56 bg-surface-high border border-white/10 rounded-xl shadow-xl overflow-hidden z-50"
                          >
                            {['All', 'Health', 'Tech', 'Science', 'Politics'].map((category) => (
                              <div
                                key={category}
                                onClick={() => {
                                  setTopCapsFilterCategory(category);
                                  setIsCategoryDropdownOpen(false);
                                }}
                                className={cn(
                                  "px-4 py-3 flex items-center justify-between cursor-pointer hover:bg-white/5 transition-colors",
                                  topCapsFilterCategory === category ? "bg-white/5" : ""
                                )}
                              >
                                <span className={cn(
                                  "font-label text-xs uppercase tracking-widest",
                                  topCapsFilterCategory === category ? "text-primary" : "text-white"
                                )}>
                                  {category === 'All' ? 'All Categories' : category}
                                </span>
                                {category !== 'All' && (
                                  <button
                                    onClick={(e) => toggleFollowCategory(e, category)}
                                    className="p-1.5 rounded-full hover:bg-white/10 transition-colors"
                                    title={followedCategories.includes(category) ? "Unfollow category" : "Follow category"}
                                  >
                                    {followedCategories.includes(category) ? (
                                      <BellRing size={14} className="text-primary" />
                                    ) : (
                                      <Bell size={14} className="text-outline" />
                                    )}
                                  </button>
                                )}
                              </div>
                            ))}
                          </motion.div>
                        )}
                      </AnimatePresence>
                    </div>
                    <div className="relative">
                      <div
                        onClick={() => setIsSortDropdownOpen(!isSortDropdownOpen)}
                        className="flex items-center gap-2 bg-surface border border-white/10 rounded-full px-4 py-2 cursor-pointer hover:bg-white/5 transition-colors"
                      >
                        <ArrowUpDown size={14} className="text-outline" />
                        <span className="text-white font-label text-xs uppercase tracking-widest">
                          Sort by {topCapsSortBy}
                        </span>
                        <ChevronDown size={14} className="text-outline ml-1" />
                      </div>

                      <AnimatePresence>
                        {isSortDropdownOpen && (
                          <motion.div
                            initial={{ opacity: 0, y: 10 }}
                            animate={{ opacity: 1, y: 0 }}
                            exit={{ opacity: 0, y: 10 }}
                            className="absolute top-full left-0 mt-2 w-56 bg-surface-high border border-white/10 rounded-xl shadow-xl overflow-hidden z-50"
                          >
                            {['Shares', 'Laughed At', 'Date Added'].map((sortOption) => (
                              <div
                                key={sortOption}
                                onClick={() => {
                                  setTopCapsSortBy(sortOption as any);
                                  setIsSortDropdownOpen(false);
                                }}
                                className={cn(
                                  "px-4 py-3 flex items-center justify-between cursor-pointer hover:bg-white/5 transition-colors",
                                  topCapsSortBy === sortOption ? "bg-white/5" : ""
                                )}
                              >
                                <span className={cn(
                                  "font-label text-xs uppercase tracking-widest",
                                  topCapsSortBy === sortOption ? "text-primary" : "text-white"
                                )}>
                                  Sort by {sortOption}
                                </span>
                              </div>
                            ))}
                          </motion.div>
                        )}
                      </AnimatePresence>
                    </div>
                    {(topCapsFilterCategory !== 'All' || topCapsSortBy !== 'Shares') && (
                      <button
                        onClick={resetFilters}
                        className="flex items-center gap-2 bg-surface-high border border-white/10 text-white rounded-full px-4 py-2 font-label text-xs uppercase tracking-widest hover:bg-white/5 transition-colors"
                      >
                        <X size={14} /> Reset
                      </button>
                    )}
                  </div>
                </div>

                <div className="flex flex-col gap-4">
                  {filteredAndSortedTopCaps.length > 0 ? (
                    filteredAndSortedTopCaps.map((item, index) => (
                      <div
                        key={item.id}
                        onClick={() => toggleExpand(item.id)}
                        className="bg-surface border border-white/5 rounded-2xl p-6 flex flex-col hover:border-white/20 transition-colors group cursor-pointer relative overflow-hidden"
                      >
                        <div className="absolute left-0 top-0 bottom-0 w-1 bg-primary/0 group-hover:bg-primary transition-colors" />
                        <div className="flex flex-col sm:flex-row sm:items-center gap-6">
                          <div className="text-4xl font-black font-headline text-white/10 group-hover:text-primary group-hover:scale-110 group-hover:bg-white/5 rounded-lg transition-all duration-300 w-12 h-12 flex items-center justify-center shrink-0">
                            #{index + 1}
                          </div>
                          <div className="flex-1">
                            <p className="text-white font-medium text-lg mb-2">{item.claim}</p>
                            <p className="text-outline text-xs font-label uppercase tracking-widest">
                              {item.category} • {formatNumber(item.shares)} Shares • {formatNumber(item.laughedAt)} Laughed
                            </p>
                          </div>
                          <div className="flex items-center gap-2 self-start sm:self-auto shrink-0">
                            <button
                              onClick={(e) => handleLaugh(e, item.id)}
                              className="text-outline hover:text-primary transition-colors p-3 bg-surface-high rounded-full opacity-100 sm:opacity-0 group-hover:opacity-100"
                              title="Laugh at this claim"
                            >
                              <Flame size={18} />
                            </button>
                            <button
                              onClick={(e) => { e.stopPropagation(); handleShare(); }}
                              className="text-outline hover:text-white transition-colors p-3 bg-surface-high rounded-full opacity-100 sm:opacity-0 group-hover:opacity-100"
                              title="Share this claim"
                            >
                              <Share2 size={18} />
                            </button>
                            <div className="text-outline p-3">
                              {expandedCards.includes(item.id) ? <ChevronUp size={18} /> : <ChevronDown size={18} />}
                            </div>
                          </div>
                        </div>

                        <AnimatePresence>
                          {expandedCards.includes(item.id) && (
                            <motion.div
                              initial={{ height: 0, opacity: 0, marginTop: 0 }}
                              animate={{ height: 'auto', opacity: 1, marginTop: 24 }}
                              exit={{ height: 0, opacity: 0, marginTop: 0 }}
                              className="overflow-hidden border-t border-white/10"
                            >
                              <div className="pt-6">
                                <h4 className="font-label text-xs uppercase tracking-widest text-primary mb-2">Why it's Cap</h4>
                                <p className="text-outline font-body text-sm leading-relaxed mb-6">
                                  {item.details}
                                </p>

                                {item.sources && item.sources.length > 0 && (
                                  <div>
                                    <h4 className="font-label text-xs uppercase tracking-widest text-white mb-3 flex items-center gap-2">
                                      <ExternalLink size={14} className="text-primary" />
                                      Top {item.sources.length} Influential Sources
                                    </h4>
                                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                                      {item.sources.map((source, idx) => (
                                        <a
                                          key={idx}
                                          href={source.url}
                                          target="_blank"
                                          rel="noopener noreferrer"
                                          onClick={(e) => e.stopPropagation()}
                                          className="bg-surface-high border border-white/5 rounded-xl p-4 hover:border-white/20 transition-colors flex flex-col gap-2 group/source"
                                        >
                                          <div className="flex items-center justify-between">
                                            <span className="text-white font-label text-xs uppercase tracking-widest truncate pr-4">{source.name}</span>
                                            <ExternalLink size={12} className="text-outline group-hover/source:text-primary transition-colors shrink-0" />
                                          </div>
                                          <p className="text-outline text-xs italic line-clamp-2">
                                            {source.text}
                                          </p>
                                        </a>
                                      ))}
                                    </div>
                                  </div>
                                )}
                              </div>
                            </motion.div>
                          )}
                        </AnimatePresence>
                      </div>
                    ))
                  ) : (
                    <div className="bg-surface border border-white/5 rounded-2xl p-12 text-center">
                      <p className="text-outline font-body text-lg">No claims found for this category.</p>
                    </div>
                  )}
                </div>
              </div>
            </motion.div>
          )}

          {screen === 'history' && (
            <motion.div
              key="history"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="w-full max-w-4xl mx-auto text-center"
            >
              <h1 className="font-headline text-4xl md:text-6xl font-black uppercase italic tracking-tighter mb-8 text-white">History</h1>
              <p className="text-outline font-body text-lg">Your past fact-checks and verifications.</p>
              <div className="mt-12 p-12 bg-surface rounded-3xl border border-white/5">
                <p className="text-outline">Your history is empty.</p>
              </div>
            </motion.div>
          )}

          {screen === 'profile' && (
            <motion.div
              key="profile"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="w-full max-w-4xl mx-auto text-center"
            >
              <h1 className="font-headline text-4xl md:text-6xl font-black uppercase italic tracking-tighter mb-8 text-white">Profile</h1>
              <div className="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-surface-high bg-surface mb-8">
                <img
                  alt="Profile"
                  src="https://picsum.photos/seed/avatar/200/200"
                  referrerPolicy="no-referrer"
                  className="w-full h-full object-cover"
                />
              </div>
              <p className="text-outline font-body text-lg">Manage your account and preferences.</p>
              <div className="mt-12 p-12 bg-surface rounded-3xl border border-white/5">
                <p className="text-outline">Profile settings coming soon.</p>
              </div>
            </motion.div>
          )}

          {screen === 'notifications' && (
            <motion.div
              key="notifications"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="w-full max-w-4xl mx-auto text-center"
            >
              <h1 className="font-headline text-4xl md:text-6xl font-black uppercase italic tracking-tighter mb-8 text-white">Alerts</h1>
              <p className="text-outline font-body text-lg">Recent updates and notifications.</p>
              <div className="mt-12 p-12 bg-surface rounded-3xl border border-white/5">
                <p className="text-outline">You have no new alerts.</p>
              </div>
            </motion.div>
          )}
          {screen === 'trends' && (
            <motion.div
              key="trends"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="w-full max-w-7xl mx-auto"
            >
              <div className="flex flex-col items-center text-center mb-16">
                <span className="font-label text-xs uppercase tracking-[0.3em] text-primary mb-4 block">Global Pulse</span>
                <h1 className="font-headline text-5xl md:text-7xl font-black uppercase italic tracking-tighter mb-6 text-white">All Trends</h1>
                <p className="text-outline font-body text-lg max-w-2xl">
                  A comprehensive view of the most widely circulated claims, rumors, and investigations across the network.
                </p>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <TrendCard
                  type="CAP"
                  category="Social Media"
                  time="2h ago"
                  claim="Drinking 4L of salt water cures all winter fatigue instantly."
                  stats="842 researchers checked"
                  onClick={() => setScreen('results')}
                  onBadgeClick={(e) => { e.stopPropagation(); setScreen('top'); }}
                />
                <TrendCard
                  type="CAP"
                  category="Economics"
                  time="5h ago"
                  claim="New housing starts in the metro area hit a 10-year high this June."
                  stats="1.2k sources verified"
                  onClick={() => setScreen('results')}
                  onBadgeClick={(e) => { e.stopPropagation(); setScreen('top'); }}
                />
                <TrendCard
                  type="CAP"
                  category="Tech News"
                  time="12h ago"
                  claim="The new AI model is 400% more efficient at coding than last year."
                  stats="Nuanced breakdown inside"
                  onClick={() => setScreen('results')}
                  onBadgeClick={(e) => { e.stopPropagation(); setScreen('top'); }}
                />
                <TrendCard
                  type="CAP"
                  category="Health"
                  time="1d ago"
                  claim="Eating raw onions before bed prevents all seasonal allergies."
                  stats="5.3k researchers checked"
                  onClick={() => setScreen('results')}
                  onBadgeClick={(e) => { e.stopPropagation(); setScreen('top'); }}
                />
                <TrendCard
                  type="CAP"
                  category="Science"
                  time="1d ago"
                  claim="Astronomers discover a new exoplanet with water vapor in its atmosphere."
                  stats="890 sources verified"
                  onClick={() => setScreen('results')}
                  onBadgeClick={(e) => { e.stopPropagation(); setScreen('top'); }}
                />
                <TrendCard
                  type="CAP"
                  category="Politics"
                  time="2d ago"
                  claim="New legislation will ban all gas-powered vehicles by 2028."
                  stats="Nuanced breakdown inside"
                  onClick={() => setScreen('results')}
                  onBadgeClick={(e) => { e.stopPropagation(); setScreen('top'); }}
                />
              </div>
            </motion.div>
          )}
        </AnimatePresence>

        {/* Share Card Modal */}
        <AnimatePresence>
          {showShareCard && (
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/90 backdrop-blur-md"
              onClick={() => setShowShareCard(false)}
            >
              <motion.div
                ref={shareCardRef}
                initial={{ scale: 0.95, y: 20 }}
                animate={{ scale: 1, y: 0 }}
                exit={{ scale: 0.95, y: 20 }}
                onClick={(e) => e.stopPropagation()}
                className="w-full max-w-sm aspect-[4/5] bg-[#0A0A0A] rounded-3xl overflow-hidden border border-white/10 shadow-2xl flex flex-col relative"
              >
                {/* Background effects */}
                <div className="absolute inset-0 bg-gradient-to-b from-primary/20 to-transparent opacity-30" />
                <div className="absolute top-0 left-0 w-full h-2 bg-primary" />

                <div className="flex-1 p-8 flex flex-col items-center justify-center text-center relative z-10">
                  <div className="mb-8">
                    <span className="font-label text-xs uppercase tracking-[0.2em] text-primary bg-primary/10 px-4 py-2 rounded-full border border-primary/20 font-bold">
                      99% Confidence
                    </span>
                  </div>

                  <h1 className="font-headline text-[110px] leading-none font-black text-primary uppercase italic tracking-tighter mb-8 drop-shadow-[0_0_40px_rgba(226,36,31,0.6)]">
                    CAP
                  </h1>

                  <p className="font-headline text-2xl text-white font-bold leading-tight italic">
                    "The headline overstates what the sources actually support."
                  </p>
                </div>

                <div className="p-6 text-center relative z-10 border-t border-white/5 bg-black/40">
                  <p className="font-label text-[10px] uppercase tracking-widest text-outline opacity-60">
                    Checked with Firecrawl. Spoken by Cap on 11Labs.
                  </p>
                </div>
              </motion.div>

              {/* Close button - hidden in screenshots usually, but good for UX */}
              <button
                onClick={() => setShowShareCard(false)}
                className="absolute top-4 right-4 p-2 bg-black/50 rounded-full text-white/50 hover:text-white transition-colors z-20"
              >
                <X size={16} />
              </button>

              <div className="absolute bottom-8 left-0 w-full flex justify-center pointer-events-auto">
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    handleDownloadImage();
                  }}
                  disabled={isDownloading}
                  className="flex items-center gap-2 bg-primary text-white px-6 py-3 rounded-full font-headline font-black uppercase tracking-widest text-sm hover:bg-primary/90 transition-colors active:scale-95 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {isDownloading ? (
                    <RefreshCw size={16} className="animate-spin" />
                  ) : (
                    <Download size={16} />
                  )}
                  {isDownloading ? 'Saving...' : 'Save as Image'}
                </button>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </main>

      <MobileNav activeTab={screen === 'results' || screen === 'listening' || screen === 'checking' ? 'home' : screen} onNavigate={setScreen} />
    </div>
  );
}
