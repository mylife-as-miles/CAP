import crypto from 'crypto';

const PROJECT_REF = "usuddhrjldeytjqlazpi";
const TOKEN = "sbp_d8890f4ca2ffba30ee7a2d775682ec3a89939bf4";

async function query(sql) {
    const url = `https://api.supabase.com/v1/projects/${PROJECT_REF}/database/query`;
    const headers = {
        "Authorization": `Bearer ${TOKEN}`,
        "Content-Type": "application/json"
    };
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify({ query: sql })
    });
    if (!response.ok) {
        const text = await response.text();
        console.error(`Query failed: ${response.status} - ${text}`);
        throw new Error(`Query failed: ${response.status}`);
    }
    return await response.json();
}

async function main() {
    try {
        console.log("Fetching claims...");
        const claims = await query("SELECT id FROM public.claims WHERE status = 'published';");
        const claimIds = claims.map(c => c.id);
        console.log(`Found ${claimIds.length} published claims.`);

        const totalUsers = 5000;
        const visitors = [];
        const interactions = [];
        const events = [];

        console.log("Generating interaction data...");
        for (let i = 0; i < totalUsers; i++) {
            const vId = 'anon_visitor_' + crypto.randomUUID();
            const firstSeen = new Date(Date.now() - Math.random() * 7 * 24 * 60 * 60 * 1000);

            visitors.push({
                visitor_id: vId,
                first_seen_at: firstSeen.toISOString(),
                last_seen_at: firstSeen.toISOString()
            });

            events.push({
                visitor_id: vId,
                event_name: 'session_started',
                claim_id: null,
                created_at: firstSeen.toISOString()
            });

            const numInteractions = Math.floor(Math.random() * 6) + 2;
            for (let j = 0; j < numInteractions; j++) {
                const claimId = claimIds[Math.floor(Math.random() * claimIds.length)];
                const timeOffset = Math.random() * 60 * 60 * 1000;
                const interactionTime = new Date(firstSeen.getTime() + timeOffset).toISOString();

                const types = ['view', 'view', 'view', 'laugh', 'share'];
                const type = types[Math.floor(Math.random() * types.length)];

                interactions.push({
                    claim_id: claimId,
                    visitor_id: vId,
                    interaction_type: type,
                    created_at: interactionTime
                });

                let eventName = 'claim_checked';
                if (type === 'laugh') eventName = 'laugh_clicked';
                else if (type === 'share') eventName = 'share_clicked';

                events.push({
                    visitor_id: vId,
                    event_name: eventName,
                    claim_id: claimId,
                    created_at: interactionTime
                });
            }
        }

        console.log(`Generated ${visitors.length} visitors, ${interactions.length} interactions, ${events.length} events.`);

        async function bulkInsert(table, data, batchSize = 200) {
            for (let i = 0; i < data.length; i += batchSize) {
                const batch = data.slice(i, i + batchSize);
                const columns = Object.keys(batch[0]).join(', ');
                const values = batch.map(row => {
                    const vals = Object.values(row).map(v => {
                        if (v === null) return 'NULL';
                        if (typeof v === 'string') return `'${v.replace(/'/g, "''")}'`;
                        return v;
                    });
                    return `(${vals.join(', ')})`;
                }).join(', ');

                const sql = `INSERT INTO public.${table} (${columns}) VALUES ${values} ON CONFLICT DO NOTHING;`;
                console.log(`Inserting batch ${i / batchSize + 1} into ${table}...`);
                await query(sql);
            }
        }

        console.log("Starting bulk inserts...");
        await bulkInsert('app_visitors', visitors, 500);
        await bulkInsert('claim_interactions', interactions, 500);
        await bulkInsert('analytics_events', events, 500);

        console.log("Synchronizing metrics...");
        const syncSql = `
BEGIN;
-- Sync claim_metrics
WITH interaction_counts AS (
    SELECT 
        claim_id,
        COUNT(*) FILTER (WHERE interaction_type = 'view') as v_count,
        COUNT(*) FILTER (WHERE interaction_type = 'laugh') as l_count,
        COUNT(*) FILTER (WHERE interaction_type = 'share') as s_count
    FROM public.claim_interactions
    GROUP BY claim_id
)
UPDATE public.claim_metrics m
SET 
  view_count = ic.v_count,
  laugh_count = ic.l_count,
  share_count = ic.s_count,
  updated_at = NOW()
FROM interaction_counts ic
WHERE m.claim_id = ic.claim_id;

-- Sync app_visitors
WITH event_counts AS (
    SELECT 
        visitor_id,
        COUNT(*) FILTER (WHERE event_name = 'claim_checked') as c_count,
        COUNT(*) FILTER (WHERE event_name = 'laugh_clicked') as l_count,
        COUNT(*) FILTER (WHERE event_name = 'share_clicked') as s_count,
        MAX(created_at) as last_seen
    FROM public.analytics_events
    GROUP BY visitor_id
)
UPDATE public.app_visitors v
SET 
  claims_checked_count = ec.c_count,
  laughs_count = ec.l_count,
  shares_count = ec.s_count,
  last_seen_at = ec.last_seen
FROM event_counts ec
WHERE v.visitor_id = ec.visitor_id;
COMMIT;
`;
        await query(syncSql);

        console.log("Downloading summary stats...");
        const stats = await query(`
        SELECT 
            (SELECT count(*) FROM public.claims) as total_claims,
            (SELECT count(*) FROM public.app_visitors) as total_visitors,
            (SELECT sum(view_count) FROM public.claim_metrics) as total_views,
            (SELECT sum(laugh_count) FROM public.claim_metrics) as total_laughs,
            (SELECT sum(share_count) FROM public.claim_metrics) as total_shares;
    `);
        console.log("Stats:", JSON.stringify(stats, null, 2));

        console.log("All engagement populated and synchronized!");
        process.exit(0);
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
}

main();
