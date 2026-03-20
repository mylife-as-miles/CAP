import React from 'react';
import { Mic } from 'lucide-react';
import { motion } from 'motion/react';
import { cn } from '@/src/lib/utils';

interface MicOrbProps {
  isListening?: boolean;
  onClick?: () => void;
  className?: string;
}

export function MicOrb({ isListening, onClick, className }: MicOrbProps) {
  return (
    <div className={cn("relative group cursor-pointer", className)} onClick={onClick}>
      {/* Outer Glow Orbs */}
      <motion.div 
        animate={{ 
          scale: isListening ? [1.4, 1.8, 1.4] : 1.4, 
          opacity: isListening ? [0.4, 0.7, 0.4] : 0.2,
          backgroundColor: isListening ? '#FF3B30' : '#FF3B30' // primary color
        }}
        transition={{ duration: 1.5, repeat: Infinity, ease: "easeInOut" }}
        className="absolute inset-0 blur-[100px] rounded-full"
      />
      <motion.div 
        animate={{
          scale: isListening ? [1, 1.2, 1] : 1,
          opacity: isListening ? [0.3, 0.6, 0.3] : 0.1
        }}
        transition={{ duration: 2, repeat: Infinity, ease: "easeInOut", delay: 0.5 }}
        className="absolute inset-0 bg-secondary blur-[80px] rounded-full -translate-x-10 translate-y-10" 
      />
      
      {/* Main Orb */}
      <motion.div 
        whileHover={{ scale: 1.05 }}
        whileTap={{ scale: 0.95 }}
        animate={{
          boxShadow: isListening 
            ? ["0 0 80px 10px rgba(255,59,48,0.3)", "0 0 120px 30px rgba(255,59,48,0.6)", "0 0 80px 10px rgba(255,59,48,0.3)"]
            : "0 0 80px 10px rgba(255,59,48,0.15)",
          borderColor: isListening ? "rgba(255,59,48,0.8)" : "rgba(255,255,255,0.05)"
        }}
        transition={{ duration: 1.5, repeat: Infinity, ease: "easeInOut" }}
        className={cn(
          "relative w-64 h-64 md:w-80 md:h-80 rounded-full flex items-center justify-center border transition-colors duration-500",
          isListening ? "bg-surface-high/80" : "bg-surface-high"
        )}
      >
        {/* Inner pulsing ring when listening */}
        {isListening && (
          <motion.div
            initial={{ scale: 0.8, opacity: 0 }}
            animate={{ scale: [0.8, 1.5], opacity: [0.8, 0] }}
            transition={{ duration: 1.5, repeat: Infinity, ease: "easeOut" }}
            className="absolute inset-0 rounded-full border-2 border-primary"
          />
        )}

        <div className="flex flex-col items-center z-10">
          <motion.div
            animate={{
              scale: isListening ? [1, 1.1, 1] : 1
            }}
            transition={{ duration: 1.5, repeat: Infinity, ease: "easeInOut" }}
          >
            <Mic 
              size={80} 
              className={cn(
                "transition-all duration-500",
                isListening ? "text-white fill-primary drop-shadow-[0_0_15px_rgba(255,59,48,0.8)]" : "text-primary opacity-80"
              )} 
              strokeWidth={1.5}
            />
          </motion.div>
        </div>
      </motion.div>
    </div>
  );
}
