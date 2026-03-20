import React from 'react';
import { cn } from '@/src/lib/utils';

interface TrendCardProps {
  type: 'CAP' | 'FACTS' | 'MIXED';
  category: string;
  time: string;
  claim: string;
  stats: string;
  onClick?: () => void;
  onBadgeClick?: (e: React.MouseEvent) => void;
}

export function TrendCard({ type, category, time, claim, stats, onClick, onBadgeClick }: TrendCardProps) {
  const typeStyles = {
    CAP: "border-primary bg-primary/10 text-primary",
    FACTS: "border-secondary bg-secondary/10 text-secondary",
    MIXED: "border-tertiary bg-tertiary/10 text-tertiary",
  };

  const badgeStyles = {
    CAP: "bg-primary-dim text-white",
    FACTS: "bg-secondary text-black",
    MIXED: "bg-tertiary text-black",
  };

  return (
    <div 
      onClick={onClick}
      className={cn(
        "bg-surface rounded-3xl p-8 relative border-l-4 group hover:bg-surface-high transition-all cursor-pointer",
        type === 'CAP' ? "border-primary" : type === 'FACTS' ? "border-secondary" : "border-tertiary"
      )}
    >
      <div 
        onClick={onBadgeClick}
        className={cn(
          "absolute top-6 right-6 font-headline font-black text-xs px-3 py-1 rounded-full transition-transform group-hover:rotate-0 uppercase",
          badgeStyles[type],
          type === 'CAP' ? "rotate-3" : type === 'FACTS' ? "-rotate-2" : "rotate-1",
          onBadgeClick ? "cursor-pointer hover:scale-105" : ""
        )}
      >
        {type}
      </div>
      <div className="mb-6">
        <span className="font-label text-[10px] text-outline uppercase tracking-widest">{category} • {time}</span>
      </div>
      <p className="font-headline text-2xl font-bold leading-tight mb-8">"{claim}"</p>
      <div className="flex items-center gap-3">
        <div className="flex -space-x-2">
          <div className="w-6 h-6 rounded-full bg-secondary ring-2 ring-surface" />
          <div className="w-6 h-6 rounded-full bg-primary ring-2 ring-surface" />
        </div>
        <span className="text-xs font-label text-outline uppercase">{stats}</span>
      </div>
    </div>
  );
}
