import React, { useEffect, useState } from 'react';
import { AnimatePresence, motion } from 'motion/react';
import { Flame } from 'lucide-react';
import { cn } from '@/src/lib/utils';

const celebrationParticles = [
  { label: '+1', x: -54, y: -42, rotate: -18, delay: 0 },
  { label: 'HA!', x: -20, y: -76, rotate: -10, delay: 0.04 },
  { label: 'LOL', x: 18, y: -72, rotate: 12, delay: 0.08 },
  { label: 'FIRE', x: 56, y: -40, rotate: 18, delay: 0.12 },
];

type LaughButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  celebrationKey: number;
  compact?: boolean;
  iconClassName?: string;
  label?: string;
};

export function LaughButton({
  celebrationKey,
  className,
  compact = false,
  disabled,
  iconClassName,
  label,
  type = 'button',
  ...props
}: LaughButtonProps) {
  const [isCelebrating, setIsCelebrating] = useState(false);

  useEffect(() => {
    if (!celebrationKey) return;

    setIsCelebrating(true);
    const timer = window.setTimeout(() => setIsCelebrating(false), 900);

    return () => window.clearTimeout(timer);
  }, [celebrationKey]);

  return (
    <motion.button
      type={type}
      disabled={disabled}
      whileHover={disabled ? undefined : { y: -2 }}
      whileTap={disabled ? undefined : { scale: 0.94 }}
      animate={
        isCelebrating
          ? {
              scale: [1, 0.94, 1.08, 1],
              boxShadow: [
                '0 0 0 rgba(255,59,48,0)',
                '0 0 24px rgba(255,59,48,0.22)',
                '0 0 42px rgba(255,59,48,0.28)',
                '0 0 0 rgba(255,59,48,0)',
              ],
            }
          : { scale: 1, boxShadow: '0 0 0 rgba(255,59,48,0)' }
      }
      transition={{ duration: 0.72, times: [0, 0.18, 0.6, 1], ease: 'easeOut' }}
      className={cn(
        'relative isolate overflow-visible',
        compact ? 'min-w-0 rounded-full' : 'rounded-full',
        className
      )}
      {...props}
    >
      <AnimatePresence mode="sync">
        {isCelebrating && (
          <motion.span
            key={`laugh-fx-${celebrationKey}`}
            initial={{ opacity: 1 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="pointer-events-none absolute inset-0"
          >
            <motion.span
              initial={{ scale: 0.7, opacity: 0.32 }}
              animate={{ scale: 1.75, opacity: 0 }}
              transition={{ duration: 0.7, ease: 'easeOut' }}
              className="absolute inset-0 rounded-full border border-primary/40"
            />
            <motion.span
              initial={{ scale: 0.7, opacity: 0.22 }}
              animate={{ scale: 1.45, opacity: 0 }}
              transition={{ duration: 0.6, ease: 'easeOut', delay: 0.05 }}
              className="absolute inset-0 rounded-full bg-primary/10 blur-sm"
            />
            {celebrationParticles.map((particle) => (
              <motion.span
                key={particle.label}
                initial={{ opacity: 0, scale: 0.4, x: 0, y: 0, rotate: 0 }}
                animate={{
                  opacity: [0, 1, 1, 0],
                  scale: [0.4, 1, 1, 0.8],
                  x: particle.x,
                  y: particle.y,
                  rotate: particle.rotate,
                }}
                transition={{ duration: 0.8, ease: 'easeOut', delay: particle.delay }}
                className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 rounded-full bg-[#241311] px-2 py-1 text-[10px] font-black uppercase tracking-[0.24em] text-primary shadow-[0_10px_40px_rgba(255,59,48,0.28)]"
              >
                {particle.label}
              </motion.span>
            ))}
            <motion.span
              initial={{ opacity: 0, y: 8, scale: 0.82 }}
              animate={{ opacity: [0, 1, 1, 0], y: [8, -18, -30], scale: [0.82, 1.08, 0.96] }}
              transition={{ duration: 0.84, ease: 'easeOut' }}
              className={cn(
                'absolute left-1/2 top-0 -translate-x-1/2 rounded-full border border-primary/30 bg-[#241311] px-3 py-1 text-[10px] font-black uppercase tracking-[0.28em] text-primary shadow-[0_12px_30px_rgba(255,59,48,0.28)]',
                compact ? '-mt-8' : '-mt-6'
              )}
            >
              +1 Laugh
            </motion.span>
          </motion.span>
        )}
      </AnimatePresence>

      <span className="relative z-10 flex items-center justify-center gap-2">
        <motion.span
          animate={
            isCelebrating
              ? { rotate: [0, -16, 14, 0], scale: [1, 1.24, 1], y: [0, -2, 0] }
              : { rotate: 0, scale: 1, y: 0 }
          }
          transition={{ duration: 0.58, ease: 'easeOut' }}
          className="flex shrink-0 items-center justify-center"
        >
          <Flame size={compact ? 18 : 16} className={cn('text-current', iconClassName)} />
        </motion.span>
        {label ? <span>{label}</span> : null}
      </span>
    </motion.button>
  );
}
