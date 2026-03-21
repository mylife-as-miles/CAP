
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
dotenv.config();

const url = process.env.VITE_SUPABASE_URL;
const key = process.env.VITE_SUPABASE_ANON_KEY || 'sb_publishable_1Lr6KpsdyuuZ15XDoNMYMg_THgjj4lg';
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'sbp_d8890f4ca2ffba30ee7a2d775682ec3a89939bf4';

console.log('Using URL:', url);
// Use service role if possible for updates, otherwise anon
const supabase = createClient(url, serviceRoleKey);

async function cleanup() {
    console.log('Cleaning up claim titles and texts...');

    // Using direct SQL via RPC because bulk update with REPLACE is more efficient
    const { data, error } = await supabase.rpc('execute_sql', {
        sql_query: `
      UPDATE public.claims
      SET 
        claim_text = TRIM(REPLACE(claim_text, 'Rumor circulating that ', '')),
        title = TRIM(REPLACE(title, 'Rumor circulating that ', ''))
      WHERE claim_text ILIKE 'Rumor circulating that %'
         OR title ILIKE 'Rumor circulating that %';
    `
    });

    if (error) {
        if (error.message.includes('function "execute_sql" does not exist')) {
            console.log('RPC execute_sql does not exist, falling back to manual update...');
            // Fallback: This is slower but works without extra permissions
            const { data: claims, error: fetchError } = await supabase
                .from('claims')
                .select('id, title, claim_text')
                .or('claim_text.ilike.Rumor circulating that %,title.ilike.Rumor circulating that %');

            if (fetchError) throw fetchError;

            console.log(`Found ${claims.length} claims to clean.`);

            for (const claim of claims) {
                const newTitle = claim.title.replace(/^Rumor circulating that\s+/i, '').trim();
                const newText = claim.claim_text.replace(/^Rumor circulating that\s+/i, '').trim();

                const { error: updateError } = await supabase
                    .from('claims')
                    .update({ title: newTitle, claim_text: newText })
                    .eq('id', claim.id);

                if (updateError) console.error(`Failed to update claim ${claim.id}:`, updateError);
            }
        } else {
            console.error('Error during cleanup:', error);
        }
    } else {
        console.log('Cleanup complete via SQL.');
    }
}

cleanup().catch(console.error);
