import React from 'react';
import { Search, Bell, Home, Flame, History, User, Menu } from 'lucide-react';
import { cn } from '@/src/lib/utils';

export function Header({ activeTab, onNavigate }: { activeTab: string, onNavigate: (screen: string) => void }) {
  return (
    <header className="fixed top-0 w-full flex justify-between items-center px-6 py-4 bg-background/80 backdrop-blur-xl z-50 border-b border-white/5">
      <div className="flex items-center gap-2 cursor-pointer" onClick={() => onNavigate('home')}>
        <span className="text-2xl font-black text-white italic font-headline tracking-tighter uppercase">CAP CORE</span>
      </div>
      <nav className="hidden md:flex items-center gap-8 font-headline font-black uppercase tracking-tighter text-sm">
        <button onClick={() => onNavigate('home')} className={cn("transition-colors", activeTab === 'home' ? "text-primary" : "text-white hover:text-primary")}>Home</button>
        <button onClick={() => onNavigate('top')} className={cn("transition-colors", activeTab === 'top' ? "text-primary" : "text-outline hover:text-primary")}>Top Caps</button>
        <button onClick={() => onNavigate('history')} className={cn("transition-colors", activeTab === 'history' ? "text-primary" : "text-outline hover:text-primary")}>History</button>
      </nav>
      <div className="flex items-center gap-4">
        <button onClick={() => onNavigate('notifications')} className={cn("transition-colors p-2", activeTab === 'notifications' ? "text-primary" : "text-outline hover:text-primary")}>
          <Bell size={20} />
        </button>
        <button onClick={() => onNavigate('profile')} className={cn("w-10 h-10 rounded-full overflow-hidden border-2 transition-colors", activeTab === 'profile' ? "border-primary" : "border-surface-high hover:border-primary bg-surface")}>
          <img 
            alt="Profile" 
            src="https://picsum.photos/seed/avatar/100/100" 
            referrerPolicy="no-referrer"
            className="w-full h-full object-cover"
          />
        </button>
      </div>
    </header>
  );
}

export function MobileNav({ activeTab, onNavigate }: { activeTab: string, onNavigate: (screen: string) => void }) {
  const tabs = [
    { id: 'home', icon: Home, label: 'Home' },
    { id: 'top', icon: Flame, label: 'Top Caps' },
    { id: 'history', icon: History, label: 'History' },
    { id: 'notifications', icon: Bell, label: 'Alerts' },
  ];

  return (
    <nav className="fixed bottom-0 left-0 w-full z-50 flex justify-around items-center px-4 pb-8 pt-4 bg-background/90 backdrop-blur-2xl rounded-t-[3rem] md:hidden border-t border-white/5">
      {tabs.map((tab) => {
        const isActive = activeTab === tab.id;
        return (
          <button
            key={tab.id}
            onClick={() => onNavigate(tab.id)}
            className={cn(
              "flex flex-col items-center justify-center px-6 py-2 transition-all",
              isActive 
                ? "bg-surface-high text-primary rounded-full shadow-[0_0_15px_rgba(255,142,128,0.3)]" 
                : "text-outline hover:text-white"
            )}
          >
            <tab.icon size={24} className={cn(isActive && "fill-current")} />
            <span className="font-label text-[10px] uppercase font-bold tracking-widest mt-1">{tab.label}</span>
          </button>
        );
      })}
    </nav>
  );
}
