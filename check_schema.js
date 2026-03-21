import fs from 'fs';

async function query(sql) {
    const url = "https://api.supabase.com/v1/projects/usuddhrjldeytjqlazpi/database/query";
    const headers = {
        "Authorization": "Bearer sbp_d8890f4ca2ffba30ee7a2d775682ec3a89939bf4",
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
        console.log("Checking tables...");
        const tables = await query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';");
        console.log("Tables:", JSON.stringify(tables, null, 2));

        console.log("Checking analytics_events columns...");
        const columns = await query("SELECT column_name FROM information_schema.columns WHERE table_name = 'analytics_events';");
        console.log("Columns:", JSON.stringify(columns, null, 2));

        process.exit(0);
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
}

main();
