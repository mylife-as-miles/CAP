import React from 'react';
import {Bell, Flame, History, Home} from 'lucide-react';
import {cn} from '@/src/lib/utils';
import type {ProfileSettings, Screen} from '@/src/types';

export function Header({
  activeTab,
  onNavigate,
  unreadCount,
  profile,
}: {
  activeTab: string;
  onNavigate: (screen: Screen) => void;
  unreadCount: number;
  profile: ProfileSettings;
}) {
  return (
    <header className="fixed top-0 z-50 flex w-full items-center justify-between border-b border-white/5 bg-background/85 px-4 py-3 backdrop-blur-xl sm:px-6">
      <button type="button" className="flex items-center gap-2" onClick={() => onNavigate('home')}>
        <span className="font-headline text-xl font-black uppercase tracking-[-0.06em] text-white sm:text-2xl">
          CAP CORE
        </span>
      </button>

      <nav className="hidden items-center gap-8 font-headline text-sm font-black uppercase tracking-[0.16em] md:flex">
        <button onClick={() => onNavigate('home')} className={cn('transition-colors', activeTab === 'home' ? 'text-primary' : 'text-white hover:text-primary')}>Home</button>
        <button onClick={() => onNavigate('top')} className={cn('transition-colors', activeTab === 'top' ? 'text-primary' : 'text-outline hover:text-primary')}>Top Caps</button>
        <button onClick={() => onNavigate('history')} className={cn('transition-colors', activeTab === 'history' ? 'text-primary' : 'text-outline hover:text-primary')}>History</button>
        <button onClick={() => onNavigate('trends')} className={cn('transition-colors', activeTab === 'trends' ? 'text-primary' : 'text-outline hover:text-primary')}>Trends</button>
      </nav>

      <div className="flex items-center gap-2 sm:gap-4">
        <button
          onClick={() => onNavigate('notifications')}
          className={cn(
            'relative rounded-full p-2 transition-colors',
            activeTab === 'notifications' ? 'text-primary' : 'text-outline hover:text-primary',
          )}
          aria-label="Notifications"
        >
          <Bell size={20} />
          {unreadCount > 0 && (
            <span className="absolute -right-0.5 -top-0.5 flex h-5 min-w-5 items-center justify-center rounded-full bg-primary px-1 text-[10px] font-black text-black">
              {unreadCount > 9 ? '9+' : unreadCount}
            </span>
          )}
        </button>

        <button
          onClick={() => onNavigate('profile')}
          className={cn(
            'h-10 w-10 overflow-hidden rounded-full border-2 transition-colors',
            activeTab === 'profile' ? 'border-primary' : 'border-surface-high bg-surface hover:border-primary',
          )}
          aria-label="Profile"
        >
          <img
            alt="Profile"
            src={`https://picsum.photos/seed/${profile.avatarSeed}/100/100`}
            referrerPolicy="no-referrer"
            className="h-full w-full object-cover"
          />
        </button>
      </div>
    </header>
  );
}

export function MobileNav({
  activeTab,
  onNavigate,
  unreadCount,
}: {
  activeTab: string;
  onNavigate: (screen: Screen) => void;
  unreadCount: number;
}) {
  const tabs = [
    {id: 'home' as const, icon: Home, label: 'Home'},
    {id: 'top' as const, icon: Flame, label: 'Top Caps'},
    {id: 'history' as const, icon: History, label: 'History'},
    {id: 'notifications' as const, icon: Bell, label: 'Alerts'},
  ];

  return (
    <nav className="fixed bottom-0 left-0 z-50 flex w-full items-center justify-around border-t border-white/5 bg-background/92 px-2 pb-[calc(0.9rem+env(safe-area-inset-bottom))] pt-3 backdrop-blur-2xl md:hidden">
      {tabs.map((tab) => {
        const isActive = activeTab === tab.id;
        return (
          <button
            key={tab.id}
            onClick={() => onNavigate(tab.id)}
            className={cn(
              'relative flex min-w-0 flex-1 flex-col items-center justify-center gap-1 px-2 py-2 transition-all',
              isActive ? 'rounded-[1.5rem] bg-surface-high text-primary shadow-[0_0_15px_rgba(255,142,128,0.3)]' : 'text-outline hover:text-white',
            )}
          >
            <tab.icon size={24} className={cn(isActive && 'fill-current')} />
            {tab.id === 'notifications' && unreadCount > 0 && (
              <span className="absolute right-3 top-1 rounded-full bg-primary px-1.5 py-0.5 text-[10px] font-black text-black">
                {unreadCount > 9 ? '9+' : unreadCount}
              </span>
            )}
            <span className="truncate font-label text-[10px] font-bold uppercase tracking-[0.2em]">{tab.label}</span>
          </button>
        );
      })}
    </nav>
  );
}
