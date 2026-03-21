import random
import uuid
import json

categories = ['Tech', 'Gaming', 'Crypto', 'Internet Drama', 'Science', 'Pop Culture']
verdicts = ['CAP', 'NO CAP', 'HALF CAP']

subjects = ['Elon Musk', 'Sam Altman', 'A new AI model', 'Bitcoin', 'Ethereum', 'A popular streamer', 'MrBeast', 'A hidden Discord server', 'A leaked iPhone design', 'A secret government project', 'A popular YouTuber', 'A generic Reddit mod', 'A new VR headset']
actions = ['just bought Twitter again', 'is actually a robot', 'predicted the exact date of the crash', 'was caught faking their speedrun', 'is secretly funding a competitor', 'was banned for using aimbot', 'just released a manifesto', 'has been faking their videos', 'is actually two people', 'got hacked by a 12 year old', 'is shutting down tomorrow', 'just fired their whole team', 'is releasing a crypto token']

sources_templates = [
    {"name": "Reddit", "url": "https://reddit.com/r/{}", "text": "A viral post with 50k upvotes claimed this."},
    {"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."},
    {"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."},
    {"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}
]

def generate_claim(index):
    subject = random.choice(subjects)
    action = random.choice(actions)
    title = f"{subject} {action}"
    slug = f"claim-{uuid.uuid4().hex[:8]}"
    claim_text = f"Rumor circulating that {subject} {action}. People are going crazy over it."
    category = random.choice(categories)
    verdict = random.choice(verdicts)
    confidence = random.randint(40, 100)
    reason_summary = f"Upon investigation, it seems this is mostly {verdict.lower()}."
    details = f"We checked multiple sources. Some said it's true, some said it's fake. The consensus is {verdict}."
    
    source_tmpl = random.choice(sources_templates)
    if "Reddit" in source_tmpl["name"]:
        source_tmpl["url"] = source_tmpl["url"].format(category.lower().replace(' ', ''))
    
    sources = json.dumps([source_tmpl]).replace("'", "''")
    is_featured = random.random() < 0.05
    
    title_escaped = title.replace("'", "''")
    claim_text_escaped = claim_text.replace("'", "''")
    reason_summary_escaped = reason_summary.replace("'", "''")
    details_escaped = details.replace("'", "''")
    
    return f"""
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('{slug}', '{title_escaped}', '{claim_text_escaped}', '{category}', '{verdict}', {confidence}, '{reason_summary_escaped}', '{details_escaped}', '{sources}'::jsonb, {str(is_featured).lower()}, 'published');
    """

with open('populate_database.sql', 'w', encoding='utf-8') as f:
    f.write("-- 1. INSERT 1000 CAPS\n")
    f.write("BEGIN;\n")
    for i in range(1000):
        f.write(generate_claim(i))
    f.write("COMMIT;\n\n")
    
    f.write("-- 2. GENERATE 5000+ UNIQUE VISITORS AND RANDOM ENGAGEMENT\n")
    f.write("""
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
    -- Get an array of all published claim IDs
    SELECT ARRAY(SELECT id FROM public.claims WHERE status = 'published') INTO claim_ids;
    
    IF array_length(claim_ids, 1) IS NULL THEN
        RAISE NOTICE 'No claims found.';
        RETURN;
    END IF;

    -- Generate 5000 visitors
    FOR i IN 1..5000 LOOP
        v_id := 'anon_visitor_' || gen_random_uuid();
        
        -- Generate random number of interactions for this visitor (between 1 and 20)
        num_interactions := floor(random() * 20 + 1)::INT;
        
        FOR j IN 1..num_interactions LOOP
            -- Pick a random claim
            c_id := claim_ids[floor(random() * array_length(claim_ids, 1) + 1)::INT];
            
            -- Pick a random interaction type
            interaction_type := (ARRAY['view', 'view', 'view', 'laugh', 'share'])[floor(random() * 5 + 1)::INT];
            
            -- Use the existing increment functions for analytics parsing, or direct inserts
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
        
        IF i % 500 = 0 THEN
            RAISE NOTICE 'Processed % visitors...', i;
        END IF;
    END LOOP;
END $$;
""")

print('Successfully generated populate_database.sql')
