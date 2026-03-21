import fs from 'fs';

async function main() {
    const url = "https://api.supabase.com/v1/projects/usuddhrjldeytjqlazpi/database/query";
    const headers = {
        "Authorization": "Bearer sbp_d8890f4ca2ffba30ee7a2d775682ec3a89939bf4",
        "Content-Type": "application/json"
    };

    try {
        console.log("Reading populate_database.sql...");
        const sqlContent = fs.readFileSync("populate_database.sql", "utf-8");

        console.log("Sending query to Supabase Management API...");
        const response = await fetch(url, {
            method: 'POST',
            headers: headers,
            body: JSON.stringify({ query: sqlContent })
        });

        console.log(`Status Code: ${response.status}`);
        if (!response.ok) {
            console.error("Error:");
            console.error(await response.text());
            process.exit(1);
        } else {
            console.log("Successfully executed SQL!");
        }
    } catch (e) {
        console.error(`Failed: ${e}`);
        process.exit(1);
    }
}

main();
