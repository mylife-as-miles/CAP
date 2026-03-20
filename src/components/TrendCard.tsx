import React from 'react';
import {cn} from '@/src/lib/utils';

interface TrendCardProps {
  type: 'CAP' | 'FACTS' | 'MIXED';
  category: string;
  time: string;
  claim: string;
  stats: string;
  onClick?: () => void;
  onBadgeClick?: () => void;
}

export const TrendCard: React.FC<TrendCardProps> = ({
  type,
  category,
  time,
  claim,
  stats,
  onClick,
  onBadgeClick,
}) => {
  const badgeStyles = {
    CAP: 'bg-primary-dim text-white',
    FACTS: 'bg-secondary text-black',
    MIXED: 'bg-tertiary text-black',
  };

  return (
    <article
      className={cn(
        'group relative flex w-full flex-col rounded-[1.75rem] border-l-4 bg-surface p-6 text-left transition-all hover:bg-surface-high sm:p-8',
        type === 'CAP' ? 'border-primary' : type === 'FACTS' ? 'border-secondary' : 'border-tertiary',
      )}
    >
      {onBadgeClick ? (
        <button
          type="button"
          onClick={(event) => {
            event.stopPropagation();
            onBadgeClick();
          }}
          className={cn(
            'absolute right-4 top-4 rounded-full px-3 py-1 font-headline text-xs font-black uppercase transition-transform group-hover:rotate-0 sm:right-6 sm:top-6',
            badgeStyles[type],
            type === 'CAP' ? 'rotate-3' : type === 'FACTS' ? '-rotate-2' : 'rotate-1',
          )}
        >
          {type}
        </button>
      ) : (
        <span
          className={cn(
            'absolute right-4 top-4 rounded-full px-3 py-1 font-headline text-xs font-black uppercase transition-transform group-hover:rotate-0 sm:right-6 sm:top-6',
            badgeStyles[type],
            type === 'CAP' ? 'rotate-3' : type === 'FACTS' ? '-rotate-2' : 'rotate-1',
          )}
        >
          {type}
        </span>
      )}

      <button type="button" onClick={onClick} className="flex w-full flex-col text-left">
        <div className="mb-6">
          <span className="font-label text-[10px] uppercase tracking-[0.24em] text-outline">
            {category} | {time}
          </span>
        </div>
        <p className="mb-8 font-headline text-xl font-bold leading-tight sm:text-2xl">"{claim}"</p>
        <div className="flex items-center gap-3">
          <div className="flex -space-x-2">
            <div className="h-6 w-6 rounded-full bg-secondary ring-2 ring-surface" />
            <div className="h-6 w-6 rounded-full bg-primary ring-2 ring-surface" />
          </div>
          <span className="font-label text-xs uppercase text-outline">{stats}</span>
        </div>
      </button>
    </article>
  );
};
