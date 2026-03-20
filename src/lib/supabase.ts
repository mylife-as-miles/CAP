import { createClient } from '@supabase/supabase-js';

const supabaseUrl = (import.meta as any).env.VITE_SUPABASE_URL;
// Support both standard anon key and the custom publishable key name seen in the environment
const supabaseAnonKey = (import.meta as any).env.VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY || (import.meta as any).env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
    console.warn('Supabase environment variables are missing. Some features may not work.');
}

export const supabase = createClient(supabaseUrl || '', supabaseAnonKey || '');
