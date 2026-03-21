import random
import uuid
import json

real_caps = [
    {"title": "AI-Generated Food Delivery Fraud", "text": "AI-generated internal memos claim food delivery companies are stealing 100% of driver tips.", "verdict": "CAP", "source": "Reddit", "url": "https://reddit.com/r/technology"},
    {"title": "GTA 6 Bridge Leak", "text": "A leaked video shows a bridge in GTA 6 that turns out to be a 40-second elaborate hoax.", "verdict": "CAP", "source": "Twitter", "url": "https://twitter.com/rockstargames"},
    {"title": "Pizzagate Pedophilia Ring", "text": "False claims of a pedophilia ring operating out of a D.C. pizzeria.", "verdict": "CAP", "source": "Reddit", "url": "https://wikipedia.org/wiki/Pizzagate_conspiracy_theory"},
    {"title": "Frida Sofia Mexico Earthquake", "text": "A 12-year-old girl named Frida Sofia is trapped under ruins after the 2017 Mexico earthquake.", "verdict": "CAP", "source": "News", "url": "https://reddit.com/r/worldnews"},
    {"title": "Trump Swifties Endorsement", "text": "Taylor Swift endorses Donald Trump for the 2024 presidential campaign via AI images.", "verdict": "CAP", "source": "Twitter", "url": "https://thefulcrum.us"},
    {"title": "Zelenskyy Surrender Deepfake", "text": "A video of Ukrainian President Zelenskyy asking his troops to surrender.", "verdict": "CAP", "source": "Twitter", "url": "https://smallwarsjournal.com"},
    {"title": "Pope Francis Madonna Kiss", "text": "Viral image showing Pope Francis kissing the musician Madonna.", "verdict": "CAP", "source": "Twitter", "url": "https://wikipedia.org"},
    {"title": "Elon Musk Penis Tweet", "text": "A fabricated tweet about Elon Musk's 'botched surgery'.", "verdict": "CAP", "source": "Twitter", "url": "https://gizmodo.com"},
    {"title": "Andrew Tate Dating Rule 2025", "text": "A fake tweet from Andrew Tate saying having a girlfriend in 2025 is 'gay'.", "verdict": "CAP", "source": "Twitter", "url": "https://twitter.com"},
    {"title": "Joe Rogan Trump Protest Tweet", "text": "Joe Rogan shares a fake tweet from Donald Trump about 'No Kings' protests.", "verdict": "CAP", "source": "Twitter", "url": "https://gizmodo.com"},
    {"title": "Synthetic Virus Pandemic 2025", "text": "Viral claims about a new pandemic caused by synthetic viruses reach 9 million shares.", "verdict": "CAP", "source": "Meta", "url": "https://sqmagazine.co.uk"},
    {"title": "AI Music Royalty Scammer", "text": "A musician used AI songs and bots to generate $10 million in royalties.", "verdict": "NO CAP", "source": "News", "url": "https://wikipedia.org"},
    {"title": "Discord Support ID Breach", "text": "Unauthorized access to Discord support exposed 70,000 user IDs.", "verdict": "NO CAP", "source": "Discord", "url": "https://discord.com"},
    {"title": "Tamagotchi 10-Year Life", "text": "Claims of keeping a Tamagotchi alive for over 10 years without resetting.", "verdict": "CAP", "source": "Reddit", "url": "https://reddit.com/r/tamagotchi"},
    {"title": "Cake Decorating 'First Try'", "text": "A professional-level wedding cake described as a 'first attempt' by a hobbyist.", "verdict": "HALF CAP", "source": "Reddit", "url": "https://reddit.com/r/baking"},
    {"title": "TIFU: Bully Power Fantasy", "text": "A Reddit user claimed to have taken down a bodybuilder bully with a single punch in front of the whole school.", "verdict": "CAP", "source": "Reddit", "url": "https://reddit.com/r/tifu"},
    {"title": "Bitcoin will hit $1M by end of 2024", "text": "Several analysts claimed Bitcoin would reach $1 million by December 2024.", "verdict": "CAP", "source": "Twitter", "url": "https://crypto.com"},
    {"title": "Discord will be shut down in 2026", "text": "Rumors that Discord is being acquired and shut down due to server costs.", "verdict": "CAP", "source": "Discord", "url": "https://discord.com"},
    {"title": "MrBeast Secret Giveaway", "text": "A secret link in a MrBeast video that gives $10k to the first 100 people.", "verdict": "CAP", "source": "YouTube", "url": "https://youtube.com"},
    {"title": "Hidden iPhone 16 Secret Button", "text": "Leaked Apple internal documents reveal a physical 'AI button' on the iPhone 16.", "verdict": "HALF CAP", "source": "Twitter", "url": "https://apple.com"}
]

categories = ['Tech', 'Gaming', 'Crypto', 'Internet Drama', 'Science', 'Pop Culture']
verdicts = ['CAP', 'NO CAP', 'HALF CAP']

subjects = ['Elon Musk', 'Sam Altman', 'Vitalik Buterin', 'Jensen Huang', 'A Rogue AI', 'The Reddit CEO', 'A Discord Moderator', 'A TikTok Influencer', 'A leaked CIA document', 'A NASA scientist']
actions = ['discovered a new planet', 'is building a private army', 'deleted the entire production database', 'was caught using a voice changer', 'is actually a group of three people', 'found a way to hack any bank account', 'just bought an entire island for users', 'is releasing a brain-computer interface', 'leaked the script for the next world event', 'found evidence of aliens in a Discord chat']

sources_templates = [
    {"name": "Reddit", "url": "https://reddit.com/r/{}", "text": "A viral post with 50k upvotes claimed this."},
    {"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."},
    {"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."},
    {"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}
]

def generate_claim(index):
    if index < len(real_caps):
        rc = real_caps[index]
        title = rc["title"]
        claim_text = rc["text"]
        verdict = rc["verdict"]
        category = random.choice(categories)
        source_name = rc["source"]
        source_url = rc["url"]
    else:
        subject = random.choice(subjects)
        action = random.choice(actions)
        title = f"{subject} {action}"
        claim_text = f"Rumor circulating that {subject} {action}. People are going crazy over it."
        category = random.choice(categories)
        verdict = random.choice(verdicts)
        source_tmpl = random.choice(sources_templates)
        source_name = source_tmpl["name"]
        source_url = source_tmpl["url"]
        if "Reddit" in source_name:
            source_url = source_url.format(category.lower().replace(' ', ''))

    slug = f"claim-{uuid.uuid4().hex[:8]}"
    confidence = random.randint(40, 100)
    reason_summary = f"Upon investigation, it seems this is mostly {verdict.lower()}."
    details = f"We checked multiple sources. Some said it's true, some said it's fake. The consensus is {verdict}."
    
    sources = json.dumps([{"name": source_name, "url": source_url, "text": "Verified source link."}]).replace("'", "''")
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
