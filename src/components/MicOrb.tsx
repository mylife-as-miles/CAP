import React from 'react';
import {Mic} from 'lucide-react';
import {motion} from 'motion/react';
import {cn} from '@/src/lib/utils';

interface MicOrbProps {
  isListening?: boolean;
  onClick?: () => void;
  className?: string;
}

export function MicOrb({isListening, onClick, className}: MicOrbProps) {
  return (
    <button
      type="button"
      className={cn('relative rounded-full focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/40', className)}
      onClick={onClick}
      aria-label={isListening ? 'Listening' : 'Start voice capture'}
    >
      <motion.div
        animate={{
          scale: isListening ? [1.4, 1.8, 1.4] : 1.4,
          opacity: isListening ? [0.4, 0.7, 0.4] : 0.2,
          backgroundColor: '#FF3B30',
        }}
        transition={{duration: 1.5, repeat: Infinity, ease: 'easeInOut'}}
        className="absolute inset-0 rounded-full blur-[100px]"
      />
      <motion.div
        animate={{
          scale: isListening ? [1, 1.2, 1] : 1,
          opacity: isListening ? [0.3, 0.6, 0.3] : 0.1,
        }}
        transition={{duration: 2, repeat: Infinity, ease: 'easeInOut', delay: 0.5}}
        className="absolute inset-0 -translate-x-10 translate-y-10 rounded-full bg-secondary blur-[80px]"
      />

      <motion.div
        whileHover={{scale: 1.05}}
        whileTap={{scale: 0.95}}
        animate={{
          boxShadow: isListening
            ? ['0 0 80px 10px rgba(255,59,48,0.3)', '0 0 120px 30px rgba(255,59,48,0.6)', '0 0 80px 10px rgba(255,59,48,0.3)']
            : '0 0 80px 10px rgba(255,59,48,0.15)',
          borderColor: isListening ? 'rgba(255,59,48,0.8)' : 'rgba(255,255,255,0.05)',
        }}
        transition={{duration: 1.5, repeat: Infinity, ease: 'easeInOut'}}
        className={cn(
          'relative flex h-52 w-52 items-center justify-center rounded-full border transition-colors duration-500 sm:h-64 sm:w-64 md:h-80 md:w-80',
          isListening ? 'bg-surface-high/80' : 'bg-surface-high',
        )}
      >
        {isListening && (
          <motion.div
            initial={{scale: 0.8, opacity: 0}}
            animate={{scale: [0.8, 1.5], opacity: [0.8, 0]}}
            transition={{duration: 1.5, repeat: Infinity, ease: 'easeOut'}}
            className="absolute inset-0 rounded-full border-2 border-primary"
          />
        )}

        <div className="z-10 flex flex-col items-center">
          <motion.div animate={{scale: isListening ? [1, 1.1, 1] : 1}} transition={{duration: 1.5, repeat: Infinity, ease: 'easeInOut'}}>
            <Mic
              size={68}
              className={cn(
                'transition-all duration-500',
                isListening ? 'fill-primary text-white drop-shadow-[0_0_15px_rgba(255,59,48,0.8)]' : 'text-primary opacity-80',
              )}
              strokeWidth={1.5}
            />
          </motion.div>
        </div>
      </motion.div>
    </button>
  );
}
