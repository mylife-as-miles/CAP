import fs from 'fs';
import path from 'path';

const filePath = 'c:\\Users\\MILES\\Documents\\CAP\\supabase\\migrations\\20260321180000_seed_caps.sql';
let content = fs.readFileSync(filePath, 'utf8');

// Pattern 1: 'Rumor circulating that ...'
content = content.replace(/'Rumor circulating that\s*/gi, "'");

// Pattern 2: '"Rumor circulating that ..."' (if any)
content = content.replace(/'"Rumor circulating that\s*/gi, "'\"");

fs.writeFileSync(filePath, content);
console.log('Successfully cleaned up seed_caps.sql');
