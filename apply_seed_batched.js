import fs from 'fs';

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
        throw new Error(`Query failed: ${response.status} - ${text}`);
    }
    return await response.json();
}

async function main() {
    try {
        const countRes = await query("SELECT count(*) FROM public.claims;");
        const count = parseInt(countRes[0].count);
        console.log(`Current claim count: ${count}`);

        if (count < 100) {
            console.log("Not enough claims, re-inserting...");
            const content = fs.readFileSync("populate_database.sql", "utf-8");
            const statements = content.split(';').map(s => s.trim()).filter(s => s.includes("INSERT INTO public.claims"));
            console.log(`Found ${statements.length} inserts.`);
            const batchSize = 25;
            for (let i = 0; i < statements.length; i += batchSize) {
                const batch = statements.slice(i, i + batchSize).map(s => s + ';').join('\n');
                console.log(`Inserting claims ${i + 1} to ${Math.min(i + batchSize, statements.length)}...`);
                await query(`BEGIN; ${batch} COMMIT;`);
            }
        }

        // 2. Generate engagement in batches
        // 50 users per batch to avoid timeouts
        const totalUsers = 5000;
        const batchSizeUsers = 50;
        for (let start = 1; start <= totalUsers; start += batchSizeUsers) {
            const end = start + batchSizeUsers - 1;
            console.log(`Simulating users ${start} to ${end}...`);

            const doBlock = `
DO $$
DECLARE
    v_id TEXT;
    c_id UUID;
    num_interactions INT;
    interaction_type TEXT;
    i INT;
    j INT;
    claim_ids UUID[];
BEGIN
    SELECT ARRAY(SELECT id FROM public.claims WHERE status = 'published') INTO claim_ids;
    IF array_length(claim_ids, 1) IS NULL THEN RETURN; END IF;

    FOR i IN ${start}..${end} LOOP
        v_id := 'anon_visitor_' || gen_random_uuid();
        num_interactions := floor(random() * 5 + 2)::INT; -- Fewer interactions per batch
        FOR j IN 1..num_interactions LOOP
            c_id := claim_ids[floor(random() * array_length(claim_ids, 1) + 1)::INT];
            interaction_type := (ARRAY['view', 'view', 'view', 'laugh', 'share'])[floor(random() * 5 + 1)::INT];
            IF interaction_type = 'view' THEN
                PERFORM public.increment_view_count(c_id, v_id);
                PERFORM public.log_analytics_event(v_id, 'claim_checked', c_id);
            ELSIF interaction_type = 'laugh' THEN
                PERFORM public.increment_laugh_count(c_id, v_id);
                PERFORM public.log_analytics_event(v_id, 'laugh_clicked', c_id);
            ELSIF interaction_type = 'share' THEN
                PERFORM public.increment_share_count(c_id, v_id);
                PERFORM public.log_analytics_event(v_id, 'share_clicked', c_id);
            END IF;
        END LOOP;
    END LOOP;
END $$;
`;
            await query(doBlock);
        }

        console.log("All done!");
        process.exit(0);
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
}

main();
