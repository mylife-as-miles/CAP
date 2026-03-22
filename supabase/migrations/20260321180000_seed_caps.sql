-- 1. INSERT 1000 CAPS
BEGIN;

    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c6e769f2', 'A new AI model is releasing a crypto token', 'A new AI model is releasing a crypto token.', 'Crypto', 'NO CAP', 91, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c341ca9d', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Gaming', 'HALF CAP', 88, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4ed3da80', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Science', 'HALF CAP', 50, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-29462af7', 'A new VR headset got hacked by a 12 year old', 'A new VR headset got hacked by a 12 year old.', 'Gaming', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f26af53f', 'A hidden Discord server was caught faking their speedrun', 'A hidden Discord server was caught faking their speedrun.', 'Internet Drama', 'CAP', 53, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a6e08a3b', 'Ethereum just released a manifesto', 'Ethereum just released a manifesto.', 'Pop Culture', 'CAP', 58, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b72778a9', 'MrBeast is shutting down tomorrow', 'MrBeast is shutting down tomorrow.', 'Gaming', 'CAP', 55, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5d8997ab', 'A popular streamer is shutting down tomorrow', 'A popular streamer is shutting down tomorrow.', 'Internet Drama', 'CAP', 81, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c1ce9295', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Gaming', 'HALF CAP', 68, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-db2c3a53', 'A leaked iPhone design was caught faking their speedrun', 'A leaked iPhone design was caught faking their speedrun.', 'Science', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d6380cc9', 'Elon Musk was banned for using aimbot', 'Elon Musk was banned for using aimbot.', 'Crypto', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ed14a856', 'MrBeast has been faking their videos', 'MrBeast has been faking their videos.', 'Science', 'NO CAP', 49, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d97f4f04', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Science', 'NO CAP', 52, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-92f183b4', 'A new VR headset got hacked by a 12 year old', 'A new VR headset got hacked by a 12 year old.', 'Internet Drama', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-284bd010', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Pop Culture', 'CAP', 61, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0ec9a40c', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Science', 'HALF CAP', 42, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-67416673', 'A new AI model got hacked by a 12 year old', 'A new AI model got hacked by a 12 year old.', 'Science', 'NO CAP', 71, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9d81cb69', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Science', 'NO CAP', 61, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-53fd0caa', 'A new VR headset got hacked by a 12 year old', 'A new VR headset got hacked by a 12 year old.', 'Internet Drama', 'HALF CAP', 41, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-241e0371', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Tech', 'NO CAP', 71, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ad104f13', 'A generic Reddit mod just bought Twitter again', 'A generic Reddit mod just bought Twitter again.', 'Crypto', 'NO CAP', 44, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fba31955', 'A hidden Discord server predicted the exact date of the crash', 'A hidden Discord server predicted the exact date of the crash.', 'Crypto', 'CAP', 46, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9682d35c', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Pop Culture', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e6b2461b', 'MrBeast was banned for using aimbot', 'MrBeast was banned for using aimbot.', 'Science', 'HALF CAP', 44, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d80a7295', 'A new VR headset just bought Twitter again', 'A new VR headset just bought Twitter again.', 'Tech', 'HALF CAP', 45, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bdd85daf', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Crypto', 'HALF CAP', 93, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-01f49eff', 'A secret government project is secretly funding a competitor', 'A secret government project is secretly funding a competitor.', 'Pop Culture', 'NO CAP', 84, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a998bbf4', 'A popular streamer was caught faking their speedrun', 'A popular streamer was caught faking their speedrun.', 'Tech', 'HALF CAP', 44, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c0863fbf', 'Bitcoin was banned for using aimbot', 'Bitcoin was banned for using aimbot.', 'Internet Drama', 'NO CAP', 82, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-177e1f52', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Gaming', 'CAP', 88, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-14aa84dc', 'Ethereum is actually two people', 'Ethereum is actually two people.', 'Gaming', 'CAP', 92, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-865ad502', 'A secret government project was caught faking their speedrun', 'A secret government project was caught faking their speedrun.', 'Tech', 'HALF CAP', 92, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4925c64b', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Tech', 'HALF CAP', 40, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f169c4f3', 'A new VR headset is actually a robot', 'A new VR headset is actually a robot.', 'Gaming', 'CAP', 49, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7f9ccede', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Pop Culture', 'CAP', 76, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b20a2c24', 'A generic Reddit mod predicted the exact date of the crash', 'A generic Reddit mod predicted the exact date of the crash.', 'Pop Culture', 'NO CAP', 90, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b54ccfcc', 'Ethereum is actually a robot', 'Ethereum is actually a robot.', 'Internet Drama', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a3f0d65d', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Pop Culture', 'NO CAP', 66, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bf0770fe', 'A new AI model just released a manifesto', 'A new AI model just released a manifesto.', 'Internet Drama', 'HALF CAP', 74, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c48f3981', 'A new AI model just released a manifesto', 'A new AI model just released a manifesto.', 'Crypto', 'NO CAP', 82, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c81c40b9', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Tech', 'HALF CAP', 46, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1bc67f31', 'A leaked iPhone design was caught faking their speedrun', 'A leaked iPhone design was caught faking their speedrun.', 'Gaming', 'CAP', 55, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3a75ad45', 'A new AI model is actually a robot', 'A new AI model is actually a robot.', 'Gaming', 'HALF CAP', 51, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-309f80fe', 'A popular YouTuber was banned for using aimbot', 'A popular YouTuber was banned for using aimbot.', 'Pop Culture', 'CAP', 51, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2e745eea', 'MrBeast was caught faking their speedrun', 'MrBeast was caught faking their speedrun.', 'Internet Drama', 'NO CAP', 87, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-310f97bd', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Pop Culture', 'HALF CAP', 74, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4fdf17c1', 'Elon Musk just released a manifesto', 'Elon Musk just released a manifesto.', 'Science', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-14cf52e8', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Crypto', 'CAP', 68, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-454878ea', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Tech', 'HALF CAP', 69, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e5ab4aa1', 'A secret government project has been faking their videos', 'A secret government project has been faking their videos.', 'Gaming', 'CAP', 79, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-70941fd4', 'A popular streamer just bought Twitter again', 'A popular streamer just bought Twitter again.', 'Internet Drama', 'HALF CAP', 42, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b7f1083e', 'A generic Reddit mod is actually two people', 'A generic Reddit mod is actually two people.', 'Tech', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-444f3cbc', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Tech', 'HALF CAP', 49, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c08d7b4b', 'A secret government project is releasing a crypto token', 'A secret government project is releasing a crypto token.', 'Pop Culture', 'HALF CAP', 72, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1bfa5260', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Crypto', 'HALF CAP', 98, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a3531331', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Science', 'HALF CAP', 78, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7cfaaa48', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Tech', 'CAP', 97, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c2f539a3', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Tech', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9af0c2e3', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Tech', 'NO CAP', 44, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4c65612f', 'A new AI model is secretly funding a competitor', 'A new AI model is secretly funding a competitor.', 'Crypto', 'NO CAP', 41, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-812b92a6', 'A new VR headset predicted the exact date of the crash', 'A new VR headset predicted the exact date of the crash.', 'Pop Culture', 'CAP', 96, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bf4893cb', 'A new AI model predicted the exact date of the crash', 'A new AI model predicted the exact date of the crash.', 'Gaming', 'NO CAP', 67, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1b52d73c', 'A new AI model predicted the exact date of the crash', 'A new AI model predicted the exact date of the crash.', 'Gaming', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e0756f12', 'Elon Musk is secretly funding a competitor', 'Elon Musk is secretly funding a competitor.', 'Tech', 'HALF CAP', 58, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-731e1de3', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Tech', 'NO CAP', 76, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2df08aea', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Pop Culture', 'CAP', 40, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d3e20992', 'A leaked iPhone design just fired their whole team', 'A leaked iPhone design just fired their whole team.', 'Tech', 'CAP', 82, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ebc0c8f4', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Tech', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e17fd471', 'Bitcoin predicted the exact date of the crash', 'Bitcoin predicted the exact date of the crash.', 'Science', 'CAP', 45, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9c3fcbfd', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Tech', 'NO CAP', 88, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a074727d', 'A generic Reddit mod just fired their whole team', 'A generic Reddit mod just fired their whole team.', 'Science', 'HALF CAP', 63, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-293c0fc6', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Tech', 'CAP', 88, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-131a7927', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Science', 'HALF CAP', 43, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1069c173', 'Elon Musk just released a manifesto', 'Elon Musk just released a manifesto.', 'Internet Drama', 'HALF CAP', 64, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0e1a9e2e', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Science', 'CAP', 77, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4ab54aab', 'A hidden Discord server predicted the exact date of the crash', 'A hidden Discord server predicted the exact date of the crash.', 'Science', 'HALF CAP', 67, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-22163bfd', 'Ethereum just released a manifesto', 'Ethereum just released a manifesto.', 'Internet Drama', 'HALF CAP', 78, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e1774ff7', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Crypto', 'CAP', 58, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cbec9e56', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Pop Culture', 'CAP', 85, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e254b5f1', 'A popular YouTuber is actually a robot', 'A popular YouTuber is actually a robot.', 'Tech', 'CAP', 50, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2463d28d', 'A leaked iPhone design is shutting down tomorrow', 'A leaked iPhone design is shutting down tomorrow.', 'Crypto', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7a982945', 'Sam Altman got hacked by a 12 year old', 'Sam Altman got hacked by a 12 year old.', 'Science', 'HALF CAP', 77, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8880697d', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Internet Drama', 'CAP', 48, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-69486606', 'A popular YouTuber just bought Twitter again', 'A popular YouTuber just bought Twitter again.', 'Crypto', 'CAP', 91, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5813b863', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Pop Culture', 'HALF CAP', 65, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-101ae330', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Crypto', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-471bbcde', 'Ethereum is actually a robot', 'Ethereum is actually a robot.', 'Internet Drama', 'NO CAP', 51, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f61485e9', 'A generic Reddit mod was banned for using aimbot', 'A generic Reddit mod was banned for using aimbot.', 'Internet Drama', 'CAP', 97, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ea5037dd', 'A popular streamer got hacked by a 12 year old', 'A popular streamer got hacked by a 12 year old.', 'Gaming', 'CAP', 96, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-36d75844', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Science', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e3411aa2', 'A hidden Discord server is releasing a crypto token', 'A hidden Discord server is releasing a crypto token.', 'Science', 'CAP', 58, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dcd47035', 'A hidden Discord server has been faking their videos', 'A hidden Discord server has been faking their videos.', 'Crypto', 'NO CAP', 68, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3754e474', 'Elon Musk just fired their whole team', 'Elon Musk just fired their whole team.', 'Gaming', 'HALF CAP', 46, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cfab1655', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Gaming', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d5e21ace', 'MrBeast just released a manifesto', 'MrBeast just released a manifesto.', 'Science', 'HALF CAP', 76, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a86ae088', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Gaming', 'CAP', 90, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f7a7f361', 'MrBeast just released a manifesto', 'MrBeast just released a manifesto.', 'Science', 'NO CAP', 79, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-eb4eaed2', 'Sam Altman is actually a robot', 'Sam Altman is actually a robot.', 'Science', 'NO CAP', 41, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b543f9fd', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Crypto', 'CAP', 60, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-42b6f0de', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Science', 'CAP', 88, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bd829734', 'A new AI model just released a manifesto', 'A new AI model just released a manifesto.', 'Pop Culture', 'HALF CAP', 46, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0e2bc1b6', 'Ethereum predicted the exact date of the crash', 'Ethereum predicted the exact date of the crash.', 'Tech', 'NO CAP', 97, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9fe54ce5', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Crypto', 'HALF CAP', 75, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-728cc31b', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Internet Drama', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3658a37a', 'A popular streamer was banned for using aimbot', 'A popular streamer was banned for using aimbot.', 'Tech', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3fd04c2d', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Internet Drama', 'HALF CAP', 56, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ce9b3109', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Internet Drama', 'HALF CAP', 47, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d2c4ef7a', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Internet Drama', 'HALF CAP', 55, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dfbae106', 'A leaked iPhone design is shutting down tomorrow', 'A leaked iPhone design is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 96, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-55986133', 'A generic Reddit mod has been faking their videos', 'A generic Reddit mod has been faking their videos.', 'Tech', 'NO CAP', 65, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f95be7c4', 'A leaked iPhone design is releasing a crypto token', 'A leaked iPhone design is releasing a crypto token.', 'Pop Culture', 'NO CAP', 82, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f7ba98b7', 'Bitcoin is releasing a crypto token', 'Bitcoin is releasing a crypto token.', 'Gaming', 'HALF CAP', 80, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5b8e6928', 'A secret government project just bought Twitter again', 'A secret government project just bought Twitter again.', 'Tech', 'NO CAP', 44, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-eb536453', 'Bitcoin is shutting down tomorrow', 'Bitcoin is shutting down tomorrow.', 'Tech', 'NO CAP', 45, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-94e9dd13', 'A popular streamer was banned for using aimbot', 'A popular streamer was banned for using aimbot.', 'Pop Culture', 'HALF CAP', 92, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a2f0c305', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Science', 'HALF CAP', 82, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-18c8a3ec', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Science', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2c778913', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Pop Culture', 'CAP', 84, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4e7331a9', 'A new AI model predicted the exact date of the crash', 'A new AI model predicted the exact date of the crash.', 'Internet Drama', 'CAP', 72, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ddf97ea7', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Pop Culture', 'CAP', 50, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fdfd026f', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Gaming', 'CAP', 68, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-43a12515', 'Bitcoin is releasing a crypto token', 'Bitcoin is releasing a crypto token.', 'Tech', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a1bf6567', 'A new VR headset just fired their whole team', 'A new VR headset just fired their whole team.', 'Pop Culture', 'NO CAP', 62, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a84af829', 'A leaked iPhone design is secretly funding a competitor', 'A leaked iPhone design is secretly funding a competitor.', 'Pop Culture', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-879ceb99', 'Sam Altman just fired their whole team', 'Sam Altman just fired their whole team.', 'Pop Culture', 'NO CAP', 41, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-55cf960f', 'Bitcoin has been faking their videos', 'Bitcoin has been faking their videos.', 'Tech', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-748d9c6f', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Crypto', 'NO CAP', 40, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-31583416', 'A generic Reddit mod just released a manifesto', 'A generic Reddit mod just released a manifesto.', 'Science', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9e88ab32', 'A generic Reddit mod predicted the exact date of the crash', 'A generic Reddit mod predicted the exact date of the crash.', 'Pop Culture', 'NO CAP', 58, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ed2dc1e7', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Internet Drama', 'NO CAP', 99, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7bd2c95f', 'Elon Musk just bought Twitter again', 'Elon Musk just bought Twitter again.', 'Internet Drama', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5badc7e5', 'A popular YouTuber has been faking their videos', 'A popular YouTuber has been faking their videos.', 'Tech', 'HALF CAP', 94, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2e79fd2d', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Tech', 'NO CAP', 46, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4523271e', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Science', 'CAP', 91, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d4eb598c', 'A popular YouTuber is secretly funding a competitor', 'A popular YouTuber is secretly funding a competitor.', 'Science', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d82dc5b6', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Crypto', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-03816821', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Gaming', 'HALF CAP', 58, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-14f7a074', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Science', 'NO CAP', 83, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-915c7e8e', 'A popular streamer just fired their whole team', 'A popular streamer just fired their whole team.', 'Science', 'CAP', 90, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c284396d', 'A leaked iPhone design is actually a robot', 'A leaked iPhone design is actually a robot.', 'Crypto', 'NO CAP', 62, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0bfd4662', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Pop Culture', 'NO CAP', 45, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c3be0727', 'A generic Reddit mod is actually two people', 'A generic Reddit mod is actually two people.', 'Crypto', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5850b6c0', 'Ethereum is secretly funding a competitor', 'Ethereum is secretly funding a competitor.', 'Crypto', 'NO CAP', 74, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ef25855c', 'A new AI model is releasing a crypto token', 'A new AI model is releasing a crypto token.', 'Crypto', 'CAP', 50, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-acb74479', 'Bitcoin predicted the exact date of the crash', 'Bitcoin predicted the exact date of the crash.', 'Gaming', 'CAP', 47, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1b4afbc4', 'A popular YouTuber is secretly funding a competitor', 'A popular YouTuber is secretly funding a competitor.', 'Pop Culture', 'NO CAP', 85, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9e1cdce7', 'A popular streamer is shutting down tomorrow', 'A popular streamer is shutting down tomorrow.', 'Science', 'CAP', 79, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-49065b2d', 'A hidden Discord server is releasing a crypto token', 'A hidden Discord server is releasing a crypto token.', 'Science', 'NO CAP', 89, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d702b520', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Internet Drama', 'CAP', 76, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ce2179a7', 'Ethereum predicted the exact date of the crash', 'Ethereum predicted the exact date of the crash.', 'Science', 'CAP', 54, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cb361da8', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Pop Culture', 'NO CAP', 100, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-696a0e9d', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Pop Culture', 'NO CAP', 73, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-263d0174', 'A popular YouTuber got hacked by a 12 year old', 'A popular YouTuber got hacked by a 12 year old.', 'Science', 'NO CAP', 63, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9bf62583', 'Elon Musk just bought Twitter again', 'Elon Musk just bought Twitter again.', 'Gaming', 'NO CAP', 85, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c0942470', 'A hidden Discord server predicted the exact date of the crash', 'A hidden Discord server predicted the exact date of the crash.', 'Pop Culture', 'CAP', 64, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d4d9259e', 'A hidden Discord server was banned for using aimbot', 'A hidden Discord server was banned for using aimbot.', 'Science', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2c9b3bff', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Science', 'NO CAP', 98, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-017438d9', 'A popular streamer was caught faking their speedrun', 'A popular streamer was caught faking their speedrun.', 'Science', 'CAP', 80, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c356cf89', 'Elon Musk was banned for using aimbot', 'Elon Musk was banned for using aimbot.', 'Tech', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-237ec2f5', 'A new AI model got hacked by a 12 year old', 'A new AI model got hacked by a 12 year old.', 'Gaming', 'CAP', 77, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-987f8eab', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Gaming', 'HALF CAP', 52, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-32846dd2', 'A hidden Discord server is releasing a crypto token', 'A hidden Discord server is releasing a crypto token.', 'Crypto', 'CAP', 52, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fe84cc72', 'A leaked iPhone design was caught faking their speedrun', 'A leaked iPhone design was caught faking their speedrun.', 'Pop Culture', 'CAP', 78, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-57870de3', 'Sam Altman is actually two people', 'Sam Altman is actually two people.', 'Tech', 'CAP', 54, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a1db6174', 'A secret government project is shutting down tomorrow', 'A secret government project is shutting down tomorrow.', 'Science', 'CAP', 52, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-badd7be3', 'A popular streamer got hacked by a 12 year old', 'A popular streamer got hacked by a 12 year old.', 'Internet Drama', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b1dd918b', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Tech', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-69da2f4a', 'A new VR headset just released a manifesto', 'A new VR headset just released a manifesto.', 'Pop Culture', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-30e462f6', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Crypto', 'HALF CAP', 97, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-24ffc66e', 'A leaked iPhone design is actually two people', 'A leaked iPhone design is actually two people.', 'Crypto', 'HALF CAP', 60, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-43f06f8b', 'A popular streamer got hacked by a 12 year old', 'A popular streamer got hacked by a 12 year old.', 'Science', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-19151770', 'A secret government project was caught faking their speedrun', 'A secret government project was caught faking their speedrun.', 'Science', 'HALF CAP', 45, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-629b02b2', 'A secret government project is actually a robot', 'A secret government project is actually a robot.', 'Internet Drama', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-73c9527e', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Internet Drama', 'HALF CAP', 72, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bc0d777b', 'A popular streamer predicted the exact date of the crash', 'A popular streamer predicted the exact date of the crash.', 'Crypto', 'CAP', 72, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-415a1099', 'Bitcoin is actually a robot', 'Bitcoin is actually a robot.', 'Crypto', 'HALF CAP', 57, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c74f246b', 'A secret government project got hacked by a 12 year old', 'A secret government project got hacked by a 12 year old.', 'Gaming', 'CAP', 89, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b2dbfd09', 'Ethereum is shutting down tomorrow', 'Ethereum is shutting down tomorrow.', 'Science', 'NO CAP', 80, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-717917ba', 'A generic Reddit mod is shutting down tomorrow', 'A generic Reddit mod is shutting down tomorrow.', 'Crypto', 'CAP', 84, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0ae5d0c3', 'Ethereum is secretly funding a competitor', 'Ethereum is secretly funding a competitor.', 'Science', 'HALF CAP', 61, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-afde1105', 'A new VR headset is releasing a crypto token', 'A new VR headset is releasing a crypto token.', 'Internet Drama', 'HALF CAP', 95, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-21201d83', 'A popular YouTuber got hacked by a 12 year old', 'A popular YouTuber got hacked by a 12 year old.', 'Internet Drama', 'HALF CAP', 80, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ccc871b5', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Tech', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3c725bee', 'A secret government project predicted the exact date of the crash', 'A secret government project predicted the exact date of the crash.', 'Crypto', 'NO CAP', 67, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3b2c95bc', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Tech', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-401b8739', 'A new AI model just bought Twitter again', 'A new AI model just bought Twitter again.', 'Crypto', 'NO CAP', 75, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1372a2f1', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Pop Culture', 'NO CAP', 77, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-32ebedad', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Pop Culture', 'NO CAP', 86, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5aa3d36e', 'A generic Reddit mod just fired their whole team', 'A generic Reddit mod just fired their whole team.', 'Gaming', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e5feeebc', 'A secret government project is actually a robot', 'A secret government project is actually a robot.', 'Crypto', 'NO CAP', 63, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a2be597b', 'MrBeast was caught faking their speedrun', 'MrBeast was caught faking their speedrun.', 'Pop Culture', 'NO CAP', 40, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-15db2e32', 'Sam Altman just fired their whole team', 'Sam Altman just fired their whole team.', 'Science', 'NO CAP', 41, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cd8417a3', 'Elon Musk is shutting down tomorrow', 'Elon Musk is shutting down tomorrow.', 'Internet Drama', 'HALF CAP', 64, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-26f83b85', 'A leaked iPhone design got hacked by a 12 year old', 'A leaked iPhone design got hacked by a 12 year old.', 'Crypto', 'HALF CAP', 100, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-aabb0d71', 'Bitcoin is shutting down tomorrow', 'Bitcoin is shutting down tomorrow.', 'Internet Drama', 'HALF CAP', 61, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e7bd8e4e', 'Bitcoin predicted the exact date of the crash', 'Bitcoin predicted the exact date of the crash.', 'Crypto', 'NO CAP', 52, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a3f0e380', 'Elon Musk is actually two people', 'Elon Musk is actually two people.', 'Crypto', 'CAP', 85, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f96efc02', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Science', 'NO CAP', 75, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f768de05', 'A new VR headset got hacked by a 12 year old', 'A new VR headset got hacked by a 12 year old.', 'Internet Drama', 'CAP', 70, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7185c4e5', 'A secret government project has been faking their videos', 'A secret government project has been faking their videos.', 'Science', 'CAP', 77, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-89f16a03', 'A secret government project was caught faking their speedrun', 'A secret government project was caught faking their speedrun.', 'Science', 'HALF CAP', 100, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b68e32a5', 'A popular YouTuber is actually two people', 'A popular YouTuber is actually two people.', 'Crypto', 'CAP', 71, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-96c7122e', 'Ethereum just fired their whole team', 'Ethereum just fired their whole team.', 'Gaming', 'NO CAP', 96, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4ac54186', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Tech', 'CAP', 82, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9370d90f', 'Sam Altman is actually two people', 'Sam Altman is actually two people.', 'Crypto', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-db2bb529', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Tech', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-42013dfc', 'Ethereum was caught faking their speedrun', 'Ethereum was caught faking their speedrun.', 'Tech', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-42d58879', 'A popular YouTuber has been faking their videos', 'A popular YouTuber has been faking their videos.', 'Science', 'HALF CAP', 48, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3323839c', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Internet Drama', 'HALF CAP', 46, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-036ddc05', 'A leaked iPhone design is actually a robot', 'A leaked iPhone design is actually a robot.', 'Internet Drama', 'NO CAP', 67, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c8376a71', 'A hidden Discord server just bought Twitter again', 'A hidden Discord server just bought Twitter again.', 'Tech', 'CAP', 76, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0070aa0d', 'Ethereum is actually two people', 'Ethereum is actually two people.', 'Tech', 'CAP', 88, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cba38441', 'A new VR headset got hacked by a 12 year old', 'A new VR headset got hacked by a 12 year old.', 'Crypto', 'NO CAP', 90, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cb3959be', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Tech', 'CAP', 89, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d93a02f9', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Crypto', 'NO CAP', 60, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-44ba123b', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Gaming', 'HALF CAP', 48, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7ff63b75', 'A popular YouTuber is secretly funding a competitor', 'A popular YouTuber is secretly funding a competitor.', 'Internet Drama', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1d9aabf7', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Science', 'CAP', 77, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-988ac699', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Pop Culture', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-20daf116', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Gaming', 'NO CAP', 68, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-324f5b42', 'A leaked iPhone design is releasing a crypto token', 'A leaked iPhone design is releasing a crypto token.', 'Science', 'NO CAP', 54, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-177f7864', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Crypto', 'NO CAP', 100, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8ed52395', 'A secret government project is secretly funding a competitor', 'A secret government project is secretly funding a competitor.', 'Pop Culture', 'CAP', 92, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ad3e4ded', 'Ethereum just bought Twitter again', 'Ethereum just bought Twitter again.', 'Gaming', 'NO CAP', 45, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4f264d5d', 'Elon Musk is secretly funding a competitor', 'Elon Musk is secretly funding a competitor.', 'Internet Drama', 'CAP', 47, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9539f50b', 'Bitcoin is releasing a crypto token', 'Bitcoin is releasing a crypto token.', 'Crypto', 'HALF CAP', 81, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-da05ed92', 'A secret government project is shutting down tomorrow', 'A secret government project is shutting down tomorrow.', 'Tech', 'HALF CAP', 75, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0622d7cf', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Pop Culture', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0a65a673', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Tech', 'HALF CAP', 60, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4da816e3', 'A popular YouTuber was banned for using aimbot', 'A popular YouTuber was banned for using aimbot.', 'Pop Culture', 'CAP', 82, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2a35d076', 'A new AI model has been faking their videos', 'A new AI model has been faking their videos.', 'Internet Drama', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7ddd593a', 'Sam Altman got hacked by a 12 year old', 'Sam Altman got hacked by a 12 year old.', 'Science', 'CAP', 84, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5fe6a25b', 'Elon Musk got hacked by a 12 year old', 'Elon Musk got hacked by a 12 year old.', 'Tech', 'HALF CAP', 72, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-14634a71', 'Sam Altman is shutting down tomorrow', 'Sam Altman is shutting down tomorrow.', 'Crypto', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3297274c', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Gaming', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d59ab0db', 'A new AI model predicted the exact date of the crash', 'A new AI model predicted the exact date of the crash.', 'Science', 'HALF CAP', 46, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-20b04af8', 'A generic Reddit mod is shutting down tomorrow', 'A generic Reddit mod is shutting down tomorrow.', 'Tech', 'CAP', 64, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-39134903', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Gaming', 'HALF CAP', 53, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-40e31300', 'A new VR headset is releasing a crypto token', 'A new VR headset is releasing a crypto token.', 'Science', 'HALF CAP', 78, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-06f30ca3', 'A popular YouTuber is actually a robot', 'A popular YouTuber is actually a robot.', 'Crypto', 'CAP', 60, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d1c2d2ea', 'A popular YouTuber is secretly funding a competitor', 'A popular YouTuber is secretly funding a competitor.', 'Gaming', 'HALF CAP', 60, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-07729553', 'A leaked iPhone design just bought Twitter again', 'A leaked iPhone design just bought Twitter again.', 'Pop Culture', 'NO CAP', 72, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-163312ca', 'MrBeast has been faking their videos', 'MrBeast has been faking their videos.', 'Science', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d684951e', 'Bitcoin just bought Twitter again', 'Bitcoin just bought Twitter again.', 'Pop Culture', 'CAP', 47, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-351a49a1', 'A popular YouTuber just released a manifesto', 'A popular YouTuber just released a manifesto.', 'Crypto', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-27be1f69', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Pop Culture', 'NO CAP', 99, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a82d5251', 'Sam Altman got hacked by a 12 year old', 'Sam Altman got hacked by a 12 year old.', 'Gaming', 'HALF CAP', 73, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1f1620cf', 'Ethereum just released a manifesto', 'Ethereum just released a manifesto.', 'Tech', 'HALF CAP', 60, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e517a831', 'A generic Reddit mod was caught faking their speedrun', 'A generic Reddit mod was caught faking their speedrun.', 'Gaming', 'NO CAP', 88, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-233be00c', 'A popular streamer is secretly funding a competitor', 'A popular streamer is secretly funding a competitor.', 'Tech', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-466ae834', 'Sam Altman is secretly funding a competitor', 'Sam Altman is secretly funding a competitor.', 'Gaming', 'CAP', 75, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-28e8f764', 'Ethereum just bought Twitter again', 'Ethereum just bought Twitter again.', 'Gaming', 'CAP', 52, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bedd3aa1', 'A new VR headset is actually a robot', 'A new VR headset is actually a robot.', 'Tech', 'CAP', 85, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-893d0074', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Gaming', 'NO CAP', 43, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7fb57595', 'A popular streamer is shutting down tomorrow', 'A popular streamer is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 58, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-03c70dde', 'Ethereum just bought Twitter again', 'Ethereum just bought Twitter again.', 'Internet Drama', 'NO CAP', 75, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4b619700', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Science', 'NO CAP', 47, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-971119b6', 'A popular streamer just released a manifesto', 'A popular streamer just released a manifesto.', 'Gaming', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9dfb9072', 'Ethereum is releasing a crypto token', 'Ethereum is releasing a crypto token.', 'Tech', 'HALF CAP', 76, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-11d2a354', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Gaming', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a7227720', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Science', 'HALF CAP', 62, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a3e9f9cf', 'A hidden Discord server was caught faking their speedrun', 'A hidden Discord server was caught faking their speedrun.', 'Science', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bfb553f5', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Tech', 'NO CAP', 85, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-87b2abee', 'Ethereum has been faking their videos', 'Ethereum has been faking their videos.', 'Gaming', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ecccf32f', 'A generic Reddit mod was caught faking their speedrun', 'A generic Reddit mod was caught faking their speedrun.', 'Gaming', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-78686e4d', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Science', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-16720b92', 'A secret government project predicted the exact date of the crash', 'A secret government project predicted the exact date of the crash.', 'Science', 'NO CAP', 97, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b93c4236', 'A generic Reddit mod just bought Twitter again', 'A generic Reddit mod just bought Twitter again.', 'Pop Culture', 'NO CAP', 51, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fd43d651', 'A popular streamer is shutting down tomorrow', 'A popular streamer is shutting down tomorrow.', 'Gaming', 'NO CAP', 79, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4dbbb83c', 'A generic Reddit mod was banned for using aimbot', 'A generic Reddit mod was banned for using aimbot.', 'Science', 'HALF CAP', 64, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4815aa23', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Science', 'NO CAP', 99, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-98945f79', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Gaming', 'CAP', 85, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-589c7f05', 'A new AI model is actually a robot', 'A new AI model is actually a robot.', 'Science', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-01ae5ec1', 'A generic Reddit mod is actually two people', 'A generic Reddit mod is actually two people.', 'Pop Culture', 'CAP', 77, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1c8cb1ed', 'A hidden Discord server just bought Twitter again', 'A hidden Discord server just bought Twitter again.', 'Science', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2d8c2ee7', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Crypto', 'CAP', 92, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-97ca866f', 'Ethereum is shutting down tomorrow', 'Ethereum is shutting down tomorrow.', 'Science', 'CAP', 48, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-931161f1', 'Ethereum just fired their whole team', 'Ethereum just fired their whole team.', 'Pop Culture', 'CAP', 48, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b9ebe46f', 'A secret government project has been faking their videos', 'A secret government project has been faking their videos.', 'Gaming', 'NO CAP', 49, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6878d7c5', 'A secret government project is releasing a crypto token', 'A secret government project is releasing a crypto token.', 'Tech', 'HALF CAP', 98, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d7b41ac6', 'A hidden Discord server is actually two people', 'A hidden Discord server is actually two people.', 'Crypto', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-edf8a317', 'Ethereum just released a manifesto', 'Ethereum just released a manifesto.', 'Tech', 'CAP', 76, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-82a239f0', 'A hidden Discord server is releasing a crypto token', 'A hidden Discord server is releasing a crypto token.', 'Pop Culture', 'HALF CAP', 87, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-17062cea', 'A generic Reddit mod is actually two people', 'A generic Reddit mod is actually two people.', 'Tech', 'CAP', 99, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-656bcd24', 'A generic Reddit mod predicted the exact date of the crash', 'A generic Reddit mod predicted the exact date of the crash.', 'Crypto', 'HALF CAP', 77, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9a659eb7', 'Ethereum is releasing a crypto token', 'Ethereum is releasing a crypto token.', 'Crypto', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e25a631c', 'A popular YouTuber is shutting down tomorrow', 'A popular YouTuber is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 61, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-597bfd80', 'A new AI model just bought Twitter again', 'A new AI model just bought Twitter again.', 'Internet Drama', 'CAP', 97, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-10cdfd57', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Science', 'HALF CAP', 50, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2f65d8ca', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Crypto', 'HALF CAP', 52, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fc204080', 'Elon Musk was banned for using aimbot', 'Elon Musk was banned for using aimbot.', 'Gaming', 'HALF CAP', 68, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2f40a7a4', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Pop Culture', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-20ce351c', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Gaming', 'NO CAP', 94, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-23c0492a', 'A leaked iPhone design is actually a robot', 'A leaked iPhone design is actually a robot.', 'Gaming', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b6227e60', 'A generic Reddit mod just fired their whole team', 'A generic Reddit mod just fired their whole team.', 'Tech', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0c78eaa0', 'A secret government project has been faking their videos', 'A secret government project has been faking their videos.', 'Crypto', 'HALF CAP', 68, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3a5e5374', 'Sam Altman is secretly funding a competitor', 'Sam Altman is secretly funding a competitor.', 'Internet Drama', 'HALF CAP', 65, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fc235f3a', 'A leaked iPhone design just fired their whole team', 'A leaked iPhone design just fired their whole team.', 'Science', 'HALF CAP', 56, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0624b43e', 'Sam Altman was caught faking their speedrun', 'Sam Altman was caught faking their speedrun.', 'Tech', 'CAP', 45, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bf028d52', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Tech', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b8a103ac', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Pop Culture', 'CAP', 87, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4dfec15b', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Tech', 'HALF CAP', 87, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-545ce971', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Tech', 'HALF CAP', 71, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1c8810e5', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Internet Drama', 'HALF CAP', 58, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b618f00c', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Tech', 'CAP', 58, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5dae8f5d', 'A generic Reddit mod just released a manifesto', 'A generic Reddit mod just released a manifesto.', 'Internet Drama', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cb4fbaec', 'Bitcoin is secretly funding a competitor', 'Bitcoin is secretly funding a competitor.', 'Internet Drama', 'HALF CAP', 67, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b4ab29e6', 'A new AI model was banned for using aimbot', 'A new AI model was banned for using aimbot.', 'Science', 'NO CAP', 70, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cb5e6cd7', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Crypto', 'HALF CAP', 67, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-129ec492', 'A leaked iPhone design is releasing a crypto token', 'A leaked iPhone design is releasing a crypto token.', 'Crypto', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2ffca033', 'A popular streamer just bought Twitter again', 'A popular streamer just bought Twitter again.', 'Science', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8ae2bef1', 'MrBeast just released a manifesto', 'MrBeast just released a manifesto.', 'Crypto', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-de6b2e27', 'A generic Reddit mod just fired their whole team', 'A generic Reddit mod just fired their whole team.', 'Science', 'CAP', 49, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b34ebbdf', 'A popular YouTuber is actually a robot', 'A popular YouTuber is actually a robot.', 'Science', 'HALF CAP', 64, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1737a09c', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Science', 'CAP', 64, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bac5b19e', 'A secret government project just bought Twitter again', 'A secret government project just bought Twitter again.', 'Internet Drama', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f520d390', 'A popular YouTuber got hacked by a 12 year old', 'A popular YouTuber got hacked by a 12 year old.', 'Crypto', 'HALF CAP', 92, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-75bfa64f', 'A new AI model is shutting down tomorrow', 'A new AI model is shutting down tomorrow.', 'Tech', 'CAP', 75, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-972e6191', 'A popular YouTuber just fired their whole team', 'A popular YouTuber just fired their whole team.', 'Science', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-39821fd0', 'A new VR headset is actually a robot', 'A new VR headset is actually a robot.', 'Internet Drama', 'NO CAP', 63, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3feb4e0d', 'Ethereum just bought Twitter again', 'Ethereum just bought Twitter again.', 'Gaming', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d2eef8da', 'A secret government project is actually a robot', 'A secret government project is actually a robot.', 'Crypto', 'CAP', 49, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a9ed4852', 'A popular streamer got hacked by a 12 year old', 'A popular streamer got hacked by a 12 year old.', 'Gaming', 'HALF CAP', 53, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2f53d7c2', 'Bitcoin is releasing a crypto token', 'Bitcoin is releasing a crypto token.', 'Gaming', 'HALF CAP', 75, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2a7d9ea8', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Internet Drama', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b97ea17f', 'Ethereum is shutting down tomorrow', 'Ethereum is shutting down tomorrow.', 'Gaming', 'HALF CAP', 49, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-83278d28', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Crypto', 'HALF CAP', 42, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-172d776a', 'Bitcoin is shutting down tomorrow', 'Bitcoin is shutting down tomorrow.', 'Internet Drama', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-05ad3425', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Crypto', 'CAP', 63, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f205cc0b', 'Elon Musk is shutting down tomorrow', 'Elon Musk is shutting down tomorrow.', 'Science', 'HALF CAP', 73, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-60ca14d6', 'A new AI model just released a manifesto', 'A new AI model just released a manifesto.', 'Pop Culture', 'CAP', 84, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a06b0d6a', 'A hidden Discord server just bought Twitter again', 'A hidden Discord server just bought Twitter again.', 'Pop Culture', 'CAP', 68, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4b188980', 'Ethereum is actually two people', 'Ethereum is actually two people.', 'Crypto', 'NO CAP', 64, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8aafabf7', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Pop Culture', 'NO CAP', 66, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ade1993f', 'Bitcoin is actually a robot', 'Bitcoin is actually a robot.', 'Science', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-30efaee2', 'Bitcoin is actually a robot', 'Bitcoin is actually a robot.', 'Pop Culture', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-86a88576', 'A leaked iPhone design is releasing a crypto token', 'A leaked iPhone design is releasing a crypto token.', 'Internet Drama', 'HALF CAP', 96, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1458354e', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Gaming', 'NO CAP', 58, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-26c20da8', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Crypto', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7eb03b9d', 'Bitcoin is secretly funding a competitor', 'Bitcoin is secretly funding a competitor.', 'Crypto', 'HALF CAP', 55, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d2c376ee', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Internet Drama', 'CAP', 71, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5b3263bf', 'A hidden Discord server just released a manifesto', 'A hidden Discord server just released a manifesto.', 'Internet Drama', 'CAP', 81, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9e8b91b6', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Science', 'NO CAP', 62, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ce0d1e6a', 'A hidden Discord server has been faking their videos', 'A hidden Discord server has been faking their videos.', 'Gaming', 'HALF CAP', 89, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-974bc106', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Crypto', 'CAP', 49, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8323ea1f', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Pop Culture', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4ff1e300', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Science', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2f1ce8ea', 'Sam Altman is shutting down tomorrow', 'Sam Altman is shutting down tomorrow.', 'Crypto', 'CAP', 84, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7c46936f', 'Sam Altman was caught faking their speedrun', 'Sam Altman was caught faking their speedrun.', 'Crypto', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c1fbe950', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Crypto', 'HALF CAP', 71, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-75d8f35e', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Pop Culture', 'NO CAP', 90, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-128f1f05', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Gaming', 'NO CAP', 72, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-df0c8f19', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Science', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-da06132e', 'Sam Altman is secretly funding a competitor', 'Sam Altman is secretly funding a competitor.', 'Tech', 'CAP', 59, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e6a310d3', 'A popular streamer is actually a robot', 'A popular streamer is actually a robot.', 'Crypto', 'CAP', 81, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b881f823', 'A secret government project got hacked by a 12 year old', 'A secret government project got hacked by a 12 year old.', 'Internet Drama', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cd2554c6', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Science', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d5fb3138', 'A popular streamer just fired their whole team', 'A popular streamer just fired their whole team.', 'Crypto', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-120a3c86', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Science', 'HALF CAP', 62, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4278e6fb', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Tech', 'NO CAP', 83, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-66c7a662', 'A leaked iPhone design just fired their whole team', 'A leaked iPhone design just fired their whole team.', 'Internet Drama', 'HALF CAP', 75, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-15b843fe', 'Ethereum is actually a robot', 'Ethereum is actually a robot.', 'Tech', 'HALF CAP', 91, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d2120d7d', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Crypto', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-41f19d4f', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Pop Culture', 'HALF CAP', 41, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-001bde6d', 'A generic Reddit mod is actually two people', 'A generic Reddit mod is actually two people.', 'Internet Drama', 'HALF CAP', 85, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-78dfd9bc', 'A new VR headset is actually a robot', 'A new VR headset is actually a robot.', 'Science', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8190629d', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Science', 'NO CAP', 49, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5447db34', 'Bitcoin was banned for using aimbot', 'Bitcoin was banned for using aimbot.', 'Tech', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e03deaf5', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Tech', 'NO CAP', 68, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3844b27b', 'A hidden Discord server is secretly funding a competitor', 'A hidden Discord server is secretly funding a competitor.', 'Crypto', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-539ca8c1', 'Sam Altman just fired their whole team', 'Sam Altman just fired their whole team.', 'Tech', 'NO CAP', 49, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a1a1caf9', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Pop Culture', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9606008e', 'Elon Musk is actually two people', 'Elon Musk is actually two people.', 'Pop Culture', 'NO CAP', 72, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5c4c7ac2', 'A hidden Discord server just released a manifesto', 'A hidden Discord server just released a manifesto.', 'Pop Culture', 'HALF CAP', 85, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-270ea9f1', 'A popular YouTuber was caught faking their speedrun', 'A popular YouTuber was caught faking their speedrun.', 'Gaming', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f237ee32', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Pop Culture', 'NO CAP', 58, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e1f736ae', 'A leaked iPhone design is secretly funding a competitor', 'A leaked iPhone design is secretly funding a competitor.', 'Internet Drama', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e6566785', 'Sam Altman is releasing a crypto token', 'Sam Altman is releasing a crypto token.', 'Science', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0f123be1', 'A generic Reddit mod has been faking their videos', 'A generic Reddit mod has been faking their videos.', 'Science', 'HALF CAP', 64, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c572045a', 'A new VR headset just bought Twitter again', 'A new VR headset just bought Twitter again.', 'Gaming', 'NO CAP', 89, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c2c59743', 'A new AI model just fired their whole team', 'A new AI model just fired their whole team.', 'Science', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5057f539', 'A popular streamer was caught faking their speedrun', 'A popular streamer was caught faking their speedrun.', 'Science', 'NO CAP', 71, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3c5e76f2', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Tech', 'CAP', 78, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-25cdda56', 'A popular streamer just bought Twitter again', 'A popular streamer just bought Twitter again.', 'Pop Culture', 'CAP', 81, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-df3afd34', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Science', 'HALF CAP', 97, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8b9b4093', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Tech', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c0c8d293', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Crypto', 'CAP', 89, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-038b826f', 'A generic Reddit mod was banned for using aimbot', 'A generic Reddit mod was banned for using aimbot.', 'Internet Drama', 'HALF CAP', 48, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-26926ef5', 'A new AI model is shutting down tomorrow', 'A new AI model is shutting down tomorrow.', 'Gaming', 'HALF CAP', 47, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2b417467', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Crypto', 'NO CAP', 47, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b69cdfb0', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Tech', 'HALF CAP', 48, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9e68118d', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Science', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5ec71354', 'A popular YouTuber just bought Twitter again', 'A popular YouTuber just bought Twitter again.', 'Crypto', 'CAP', 93, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f90f653b', 'A leaked iPhone design got hacked by a 12 year old', 'A leaked iPhone design got hacked by a 12 year old.', 'Gaming', 'NO CAP', 63, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d77d40d1', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Crypto', 'NO CAP', 84, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-45750f35', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Science', 'NO CAP', 58, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c7a8f3c8', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Pop Culture', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c8d50fa8', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Crypto', 'HALF CAP', 59, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2d34e19b', 'Bitcoin just bought Twitter again', 'Bitcoin just bought Twitter again.', 'Pop Culture', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ee382247', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Gaming', 'CAP', 58, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-91ec4195', 'Elon Musk is releasing a crypto token', 'Elon Musk is releasing a crypto token.', 'Gaming', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-84768aa4', 'A leaked iPhone design has been faking their videos', 'A leaked iPhone design has been faking their videos.', 'Pop Culture', 'HALF CAP', 50, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d61e2448', 'A generic Reddit mod is releasing a crypto token', 'A generic Reddit mod is releasing a crypto token.', 'Science', 'CAP', 45, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e83a604c', 'A popular YouTuber is secretly funding a competitor', 'A popular YouTuber is secretly funding a competitor.', 'Internet Drama', 'CAP', 48, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ced3bf9e', 'A secret government project is actually a robot', 'A secret government project is actually a robot.', 'Pop Culture', 'CAP', 71, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0dd0d4e5', 'A leaked iPhone design just released a manifesto', 'A leaked iPhone design just released a manifesto.', 'Gaming', 'NO CAP', 76, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-948e3567', 'Elon Musk got hacked by a 12 year old', 'Elon Musk got hacked by a 12 year old.', 'Crypto', 'CAP', 97, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-40d7c1d6', 'Ethereum just fired their whole team', 'Ethereum just fired their whole team.', 'Internet Drama', 'HALF CAP', 82, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a06952db', 'Sam Altman is releasing a crypto token', 'Sam Altman is releasing a crypto token.', 'Internet Drama', 'HALF CAP', 52, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1182b900', 'A generic Reddit mod is shutting down tomorrow', 'A generic Reddit mod is shutting down tomorrow.', 'Tech', 'NO CAP', 76, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ba71d5c0', 'A generic Reddit mod was caught faking their speedrun', 'A generic Reddit mod was caught faking their speedrun.', 'Science', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1183b022', 'A new AI model is releasing a crypto token', 'A new AI model is releasing a crypto token.', 'Gaming', 'HALF CAP', 58, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-571bdafe', 'Bitcoin has been faking their videos', 'Bitcoin has been faking their videos.', 'Internet Drama', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-75ff9806', 'MrBeast has been faking their videos', 'MrBeast has been faking their videos.', 'Crypto', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d43573af', 'A leaked iPhone design just released a manifesto', 'A leaked iPhone design just released a manifesto.', 'Crypto', 'NO CAP', 74, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-235ec06a', 'A hidden Discord server is actually two people', 'A hidden Discord server is actually two people.', 'Science', 'HALF CAP', 67, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4e1a1933', 'A leaked iPhone design got hacked by a 12 year old', 'A leaked iPhone design got hacked by a 12 year old.', 'Internet Drama', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f89b6455', 'A hidden Discord server is actually a robot', 'A hidden Discord server is actually a robot.', 'Internet Drama', 'HALF CAP', 47, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-673a86a2', 'Sam Altman was caught faking their speedrun', 'Sam Altman was caught faking their speedrun.', 'Tech', 'NO CAP', 89, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e92633b7', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Tech', 'NO CAP', 86, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e1b6d9eb', 'A hidden Discord server was banned for using aimbot', 'A hidden Discord server was banned for using aimbot.', 'Crypto', 'CAP', 83, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7a8fede2', 'Ethereum is actually a robot', 'Ethereum is actually a robot.', 'Tech', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e0d9c731', 'MrBeast is secretly funding a competitor', 'MrBeast is secretly funding a competitor.', 'Crypto', 'CAP', 46, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cba04758', 'A new VR headset is secretly funding a competitor', 'A new VR headset is secretly funding a competitor.', 'Science', 'CAP', 43, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d83fb06f', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Science', 'HALF CAP', 71, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e2a52a9e', 'A hidden Discord server is releasing a crypto token', 'A hidden Discord server is releasing a crypto token.', 'Pop Culture', 'CAP', 59, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c46e80a0', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Gaming', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dfc744c2', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Crypto', 'CAP', 48, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6ee2f9cd', 'Elon Musk got hacked by a 12 year old', 'Elon Musk got hacked by a 12 year old.', 'Gaming', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4e3d0ee5', 'MrBeast is shutting down tomorrow', 'MrBeast is shutting down tomorrow.', 'Gaming', 'HALF CAP', 69, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-54a11ead', 'A generic Reddit mod just released a manifesto', 'A generic Reddit mod just released a manifesto.', 'Internet Drama', 'HALF CAP', 93, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e553647b', 'A generic Reddit mod just bought Twitter again', 'A generic Reddit mod just bought Twitter again.', 'Crypto', 'CAP', 76, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-70d53d19', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Internet Drama', 'HALF CAP', 89, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9a89c880', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Internet Drama', 'NO CAP', 90, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f7741edd', 'A hidden Discord server got hacked by a 12 year old', 'A hidden Discord server got hacked by a 12 year old.', 'Gaming', 'NO CAP', 93, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-809236bd', 'Elon Musk is releasing a crypto token', 'Elon Musk is releasing a crypto token.', 'Science', 'CAP', 95, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-93fc41d6', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Crypto', 'HALF CAP', 81, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-467c05ba', 'A new AI model is releasing a crypto token', 'A new AI model is releasing a crypto token.', 'Tech', 'NO CAP', 75, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4d7cde10', 'A hidden Discord server has been faking their videos', 'A hidden Discord server has been faking their videos.', 'Crypto', 'NO CAP', 73, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0c10ae93', 'A hidden Discord server just fired their whole team', 'A hidden Discord server just fired their whole team.', 'Gaming', 'NO CAP', 44, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c24a886d', 'A secret government project just bought Twitter again', 'A secret government project just bought Twitter again.', 'Tech', 'HALF CAP', 45, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4f84fb17', 'A popular YouTuber was banned for using aimbot', 'A popular YouTuber was banned for using aimbot.', 'Internet Drama', 'CAP', 50, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c44be6a6', 'Elon Musk is shutting down tomorrow', 'Elon Musk is shutting down tomorrow.', 'Internet Drama', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-04a664b3', 'Bitcoin is actually a robot', 'Bitcoin is actually a robot.', 'Internet Drama', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-86494cdc', 'A secret government project got hacked by a 12 year old', 'A secret government project got hacked by a 12 year old.', 'Pop Culture', 'HALF CAP', 40, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-03bcf342', 'Sam Altman is actually a robot', 'Sam Altman is actually a robot.', 'Gaming', 'NO CAP', 88, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-05563aac', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 62, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bced2d6f', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Science', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f60ec0db', 'Bitcoin is secretly funding a competitor', 'Bitcoin is secretly funding a competitor.', 'Pop Culture', 'NO CAP', 54, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-afc20290', 'Sam Altman got hacked by a 12 year old', 'Sam Altman got hacked by a 12 year old.', 'Pop Culture', 'CAP', 61, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bdf99f17', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Science', 'NO CAP', 52, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c2088d66', 'Ethereum has been faking their videos', 'Ethereum has been faking their videos.', 'Science', 'NO CAP', 87, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c0b8b3ce', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Crypto', 'HALF CAP', 72, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-02beaf5f', 'A popular YouTuber is actually a robot', 'A popular YouTuber is actually a robot.', 'Internet Drama', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c3ad461d', 'A new VR headset just bought Twitter again', 'A new VR headset just bought Twitter again.', 'Internet Drama', 'HALF CAP', 57, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8bde9484', 'A generic Reddit mod has been faking their videos', 'A generic Reddit mod has been faking their videos.', 'Pop Culture', 'NO CAP', 60, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d6185299', 'A popular YouTuber got hacked by a 12 year old', 'A popular YouTuber got hacked by a 12 year old.', 'Tech', 'CAP', 95, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4d376fe6', 'A generic Reddit mod is actually two people', 'A generic Reddit mod is actually two people.', 'Tech', 'CAP', 41, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f5867dde', 'Elon Musk is shutting down tomorrow', 'Elon Musk is shutting down tomorrow.', 'Internet Drama', 'CAP', 87, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d754be15', 'MrBeast is secretly funding a competitor', 'MrBeast is secretly funding a competitor.', 'Gaming', 'NO CAP', 68, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fdba4204', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Science', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e4dd59d6', 'A secret government project is actually a robot', 'A secret government project is actually a robot.', 'Science', 'CAP', 85, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b929c520', 'A leaked iPhone design was caught faking their speedrun', 'A leaked iPhone design was caught faking their speedrun.', 'Tech', 'NO CAP', 98, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e915fa9a', 'Elon Musk just fired their whole team', 'Elon Musk just fired their whole team.', 'Crypto', 'NO CAP', 61, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-769d01b1', 'Elon Musk just bought Twitter again', 'Elon Musk just bought Twitter again.', 'Tech', 'HALF CAP', 76, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2067f873', 'A new AI model just bought Twitter again', 'A new AI model just bought Twitter again.', 'Tech', 'CAP', 55, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-12a442de', 'Sam Altman just fired their whole team', 'Sam Altman just fired their whole team.', 'Gaming', 'HALF CAP', 82, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-be5d3fa8', 'A popular YouTuber has been faking their videos', 'A popular YouTuber has been faking their videos.', 'Pop Culture', 'CAP', 49, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4161be85', 'A popular YouTuber got hacked by a 12 year old', 'A popular YouTuber got hacked by a 12 year old.', 'Crypto', 'CAP', 87, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6d939150', 'A popular streamer is secretly funding a competitor', 'A popular streamer is secretly funding a competitor.', 'Pop Culture', 'HALF CAP', 62, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-90d553f6', 'Ethereum is actually two people', 'Ethereum is actually two people.', 'Internet Drama', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e0ee7d47', 'A popular YouTuber just released a manifesto', 'A popular YouTuber just released a manifesto.', 'Science', 'NO CAP', 67, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e8405232', 'Elon Musk is actually two people', 'Elon Musk is actually two people.', 'Tech', 'CAP', 73, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bf9f8142', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Science', 'HALF CAP', 82, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8aba2106', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Science', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c284511f', 'A new VR headset got hacked by a 12 year old', 'A new VR headset got hacked by a 12 year old.', 'Science', 'CAP', 80, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-de97c145', 'MrBeast was banned for using aimbot', 'MrBeast was banned for using aimbot.', 'Internet Drama', 'HALF CAP', 40, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-80cc4aab', 'A new VR headset is releasing a crypto token', 'A new VR headset is releasing a crypto token.', 'Pop Culture', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d8e80fc6', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Gaming', 'HALF CAP', 49, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7a29d11b', 'A popular YouTuber just bought Twitter again', 'A popular YouTuber just bought Twitter again.', 'Gaming', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5e5e110f', 'A leaked iPhone design was caught faking their speedrun', 'A leaked iPhone design was caught faking their speedrun.', 'Pop Culture', 'HALF CAP', 93, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6424c35f', 'A leaked iPhone design is actually two people', 'A leaked iPhone design is actually two people.', 'Internet Drama', 'NO CAP', 62, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7d5b53e5', 'MrBeast just released a manifesto', 'MrBeast just released a manifesto.', 'Tech', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f4514f6d', 'MrBeast is shutting down tomorrow', 'MrBeast is shutting down tomorrow.', 'Science', 'NO CAP', 79, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ef397041', 'Elon Musk was banned for using aimbot', 'Elon Musk was banned for using aimbot.', 'Crypto', 'HALF CAP', 72, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2f2d52b5', 'Ethereum is actually a robot', 'Ethereum is actually a robot.', 'Pop Culture', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6a81d7ed', 'A generic Reddit mod was caught faking their speedrun', 'A generic Reddit mod was caught faking their speedrun.', 'Gaming', 'HALF CAP', 65, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-96620924', 'A hidden Discord server was caught faking their speedrun', 'A hidden Discord server was caught faking their speedrun.', 'Pop Culture', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0e4292a0', 'A popular YouTuber just bought Twitter again', 'A popular YouTuber just bought Twitter again.', 'Pop Culture', 'HALF CAP', 43, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f1c06cce', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Internet Drama', 'HALF CAP', 56, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1af3308c', 'A popular streamer predicted the exact date of the crash', 'A popular streamer predicted the exact date of the crash.', 'Gaming', 'CAP', 97, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c9eadcea', 'A generic Reddit mod just released a manifesto', 'A generic Reddit mod just released a manifesto.', 'Pop Culture', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-df5de767', 'A popular streamer was banned for using aimbot', 'A popular streamer was banned for using aimbot.', 'Tech', 'HALF CAP', 52, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9098f37e', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Pop Culture', 'NO CAP', 49, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2a83e8b9', 'A secret government project predicted the exact date of the crash', 'A secret government project predicted the exact date of the crash.', 'Pop Culture', 'NO CAP', 40, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3168cd1d', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Crypto', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-892f3d90', 'A new AI model was banned for using aimbot', 'A new AI model was banned for using aimbot.', 'Science', 'NO CAP', 83, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6bd5a254', 'MrBeast is secretly funding a competitor', 'MrBeast is secretly funding a competitor.', 'Pop Culture', 'CAP', 57, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-10db16b3', 'Elon Musk is actually a robot', 'Elon Musk is actually a robot.', 'Tech', 'CAP', 96, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0a1dab1c', 'Elon Musk just released a manifesto', 'Elon Musk just released a manifesto.', 'Science', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7ba236aa', 'Bitcoin just bought Twitter again', 'Bitcoin just bought Twitter again.', 'Internet Drama', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5c1e5c1d', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Internet Drama', 'HALF CAP', 56, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5dd1fbfc', 'A leaked iPhone design just fired their whole team', 'A leaked iPhone design just fired their whole team.', 'Internet Drama', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2b75191c', 'A secret government project just bought Twitter again', 'A secret government project just bought Twitter again.', 'Tech', 'CAP', 54, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ffb9b253', 'Sam Altman just fired their whole team', 'Sam Altman just fired their whole team.', 'Internet Drama', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fe27bd51', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Crypto', 'HALF CAP', 42, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b66ee102', 'A new AI model is actually a robot', 'A new AI model is actually a robot.', 'Crypto', 'HALF CAP', 63, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-593fd4c9', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Internet Drama', 'HALF CAP', 91, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ae58734e', 'A popular YouTuber was caught faking their speedrun', 'A popular YouTuber was caught faking their speedrun.', 'Crypto', 'NO CAP', 51, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-892365af', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Pop Culture', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7314cbca', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Internet Drama', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cc6b6a6a', 'A hidden Discord server just bought Twitter again', 'A hidden Discord server just bought Twitter again.', 'Science', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3b0ed31a', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Pop Culture', 'NO CAP', 47, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0aea945e', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Gaming', 'CAP', 47, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6b57059a', 'Bitcoin is actually two people', 'Bitcoin is actually two people.', 'Gaming', 'CAP', 83, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-926d1748', 'A hidden Discord server was caught faking their speedrun', 'A hidden Discord server was caught faking their speedrun.', 'Pop Culture', 'NO CAP', 60, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-84e10806', 'A secret government project just bought Twitter again', 'A secret government project just bought Twitter again.', 'Tech', 'CAP', 73, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4ec87dd5', 'A new VR headset just bought Twitter again', 'A new VR headset just bought Twitter again.', 'Gaming', 'HALF CAP', 75, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-41dd6dea', 'A secret government project is shutting down tomorrow', 'A secret government project is shutting down tomorrow.', 'Tech', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9f890d01', 'Ethereum just fired their whole team', 'Ethereum just fired their whole team.', 'Crypto', 'CAP', 60, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-804aac65', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Crypto', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8cfe0961', 'MrBeast is releasing a crypto token', 'MrBeast is releasing a crypto token.', 'Internet Drama', 'NO CAP', 68, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3d015299', 'A leaked iPhone design is actually a robot', 'A leaked iPhone design is actually a robot.', 'Science', 'NO CAP', 44, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fbc71513', 'A hidden Discord server just fired their whole team', 'A hidden Discord server just fired their whole team.', 'Gaming', 'NO CAP', 86, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e3ec6c2a', 'Elon Musk just released a manifesto', 'Elon Musk just released a manifesto.', 'Pop Culture', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f48d4a78', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Gaming', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-07648046', 'A popular YouTuber is shutting down tomorrow', 'A popular YouTuber is shutting down tomorrow.', 'Internet Drama', 'NO CAP', 70, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7b630643', 'A hidden Discord server just fired their whole team', 'A hidden Discord server just fired their whole team.', 'Gaming', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8fcb6bc7', 'A popular YouTuber was caught faking their speedrun', 'A popular YouTuber was caught faking their speedrun.', 'Pop Culture', 'HALF CAP', 50, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ad9ef187', 'A leaked iPhone design predicted the exact date of the crash', 'A leaked iPhone design predicted the exact date of the crash.', 'Internet Drama', 'HALF CAP', 57, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cb2f0adf', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Internet Drama', 'CAP', 94, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e7148966', 'A popular streamer just released a manifesto', 'A popular streamer just released a manifesto.', 'Pop Culture', 'HALF CAP', 78, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bb7c314a', 'A secret government project is shutting down tomorrow', 'A secret government project is shutting down tomorrow.', 'Pop Culture', 'HALF CAP', 96, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bf37720d', 'A secret government project has been faking their videos', 'A secret government project has been faking their videos.', 'Crypto', 'HALF CAP', 76, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9e8b20d2', 'A new VR headset is actually a robot', 'A new VR headset is actually a robot.', 'Internet Drama', 'CAP', 87, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-03677534', 'A new AI model was banned for using aimbot', 'A new AI model was banned for using aimbot.', 'Gaming', 'CAP', 85, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a2b7c188', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Gaming', 'HALF CAP', 71, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ccf106b3', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Tech', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8a2996d5', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Internet Drama', 'HALF CAP', 88, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-517b730d', 'A hidden Discord server just released a manifesto', 'A hidden Discord server just released a manifesto.', 'Science', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-de43afbe', 'A new AI model got hacked by a 12 year old', 'A new AI model got hacked by a 12 year old.', 'Science', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5bf247f9', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Pop Culture', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-382f7a25', 'A popular streamer just bought Twitter again', 'A popular streamer just bought Twitter again.', 'Science', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-567d9ecb', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Tech', 'NO CAP', 55, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-81f07671', 'A secret government project was caught faking their speedrun', 'A secret government project was caught faking their speedrun.', 'Pop Culture', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2b27554a', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Science', 'CAP', 75, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-71e07ea7', 'Elon Musk is actually a robot', 'Elon Musk is actually a robot.', 'Internet Drama', 'CAP', 60, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7fb70aee', 'A popular YouTuber was caught faking their speedrun', 'A popular YouTuber was caught faking their speedrun.', 'Tech', 'CAP', 50, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c0492232', 'A new AI model just bought Twitter again', 'A new AI model just bought Twitter again.', 'Tech', 'NO CAP', 68, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e12f0512', 'Elon Musk has been faking their videos', 'Elon Musk has been faking their videos.', 'Tech', 'HALF CAP', 42, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d2037393', 'A popular YouTuber is shutting down tomorrow', 'A popular YouTuber is shutting down tomorrow.', 'Crypto', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e212f935', 'A generic Reddit mod is secretly funding a competitor', 'A generic Reddit mod is secretly funding a competitor.', 'Pop Culture', 'NO CAP', 65, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b39f1ee6', 'A new VR headset was caught faking their speedrun', 'A new VR headset was caught faking their speedrun.', 'Science', 'NO CAP', 76, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-85be1665', 'A leaked iPhone design is secretly funding a competitor', 'A leaked iPhone design is secretly funding a competitor.', 'Crypto', 'NO CAP', 46, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8a9f8dd9', 'A popular streamer was caught faking their speedrun', 'A popular streamer was caught faking their speedrun.', 'Crypto', 'HALF CAP', 51, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bc59f900', 'A hidden Discord server is secretly funding a competitor', 'A hidden Discord server is secretly funding a competitor.', 'Crypto', 'NO CAP', 96, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c5a458a8', 'Sam Altman is shutting down tomorrow', 'Sam Altman is shutting down tomorrow.', 'Internet Drama', 'HALF CAP', 78, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b2c4190d', 'A new AI model was banned for using aimbot', 'A new AI model was banned for using aimbot.', 'Pop Culture', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0bbf5319', 'A popular YouTuber is releasing a crypto token', 'A popular YouTuber is releasing a crypto token.', 'Internet Drama', 'NO CAP', 60, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-068053f1', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Crypto', 'HALF CAP', 58, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1035f199', 'A leaked iPhone design is actually two people', 'A leaked iPhone design is actually two people.', 'Internet Drama', 'NO CAP', 70, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8bc6660f', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Tech', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4bb584cb', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Internet Drama', 'HALF CAP', 69, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e33b36df', 'A new VR headset is actually a robot', 'A new VR headset is actually a robot.', 'Tech', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0a0bbecf', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Internet Drama', 'NO CAP', 79, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3f67118f', 'Sam Altman is shutting down tomorrow', 'Sam Altman is shutting down tomorrow.', 'Science', 'CAP', 93, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-731995d3', 'MrBeast was caught faking their speedrun', 'MrBeast was caught faking their speedrun.', 'Pop Culture', 'CAP', 90, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0134c010', 'A popular YouTuber just bought Twitter again', 'A popular YouTuber just bought Twitter again.', 'Pop Culture', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0d0f6868', 'A new VR headset was caught faking their speedrun', 'A new VR headset was caught faking their speedrun.', 'Crypto', 'NO CAP', 40, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-17611c88', 'A popular YouTuber is shutting down tomorrow', 'A popular YouTuber is shutting down tomorrow.', 'Tech', 'NO CAP', 98, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-86658393', 'A generic Reddit mod is shutting down tomorrow', 'A generic Reddit mod is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 70, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5cc39552', 'Ethereum is actually two people', 'Ethereum is actually two people.', 'Internet Drama', 'CAP', 81, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b0f4c7e0', 'A new AI model just bought Twitter again', 'A new AI model just bought Twitter again.', 'Internet Drama', 'HALF CAP', 96, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-10a41a6b', 'Elon Musk is shutting down tomorrow', 'Elon Musk is shutting down tomorrow.', 'Science', 'HALF CAP', 85, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-02fbc1ed', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Tech', 'NO CAP', 76, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0c758c4b', 'A popular YouTuber just fired their whole team', 'A popular YouTuber just fired their whole team.', 'Pop Culture', 'NO CAP', 87, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b4e33c9e', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Science', 'HALF CAP', 50, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1250b419', 'A hidden Discord server was caught faking their speedrun', 'A hidden Discord server was caught faking their speedrun.', 'Crypto', 'HALF CAP', 58, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-19c3682e', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Crypto', 'CAP', 45, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b4e7fe4f', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Crypto', 'NO CAP', 79, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-47065315', 'Elon Musk just fired their whole team', 'Elon Musk just fired their whole team.', 'Gaming', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3c323807', 'A generic Reddit mod has been faking their videos', 'A generic Reddit mod has been faking their videos.', 'Pop Culture', 'NO CAP', 86, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8a228aac', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Gaming', 'NO CAP', 44, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bc40ea41', 'A secret government project is shutting down tomorrow', 'A secret government project is shutting down tomorrow.', 'Gaming', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ce477d0c', 'Ethereum was caught faking their speedrun', 'Ethereum was caught faking their speedrun.', 'Gaming', 'HALF CAP', 51, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-79b968e6', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Gaming', 'HALF CAP', 77, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7c327c78', 'Ethereum was caught faking their speedrun', 'Ethereum was caught faking their speedrun.', 'Pop Culture', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cb943d63', 'Sam Altman is shutting down tomorrow', 'Sam Altman is shutting down tomorrow.', 'Tech', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-37ea2be6', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Tech', 'HALF CAP', 52, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3a211df7', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Crypto', 'NO CAP', 55, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e9d53a6f', 'Bitcoin just released a manifesto', 'Bitcoin just released a manifesto.', 'Crypto', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-127a5f50', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Internet Drama', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-97a778b5', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Crypto', 'HALF CAP', 94, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f8c1139a', 'Ethereum is shutting down tomorrow', 'Ethereum is shutting down tomorrow.', 'Gaming', 'NO CAP', 82, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-574dfcfa', 'A hidden Discord server just bought Twitter again', 'A hidden Discord server just bought Twitter again.', 'Pop Culture', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e6875e5b', 'Sam Altman was caught faking their speedrun', 'Sam Altman was caught faking their speedrun.', 'Tech', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e0e7af6d', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Internet Drama', 'HALF CAP', 80, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8664c704', 'A new VR headset just fired their whole team', 'A new VR headset just fired their whole team.', 'Gaming', 'HALF CAP', 48, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d519e3a1', 'A popular streamer was caught faking their speedrun', 'A popular streamer was caught faking their speedrun.', 'Internet Drama', 'NO CAP', 82, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-88a9b816', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Tech', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fabfe3fb', 'Sam Altman is releasing a crypto token', 'Sam Altman is releasing a crypto token.', 'Science', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-70b3898a', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Crypto', 'CAP', 83, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ab394a70', 'A leaked iPhone design has been faking their videos', 'A leaked iPhone design has been faking their videos.', 'Internet Drama', 'CAP', 77, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-db3334ca', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Crypto', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1f2ae281', 'A new VR headset is secretly funding a competitor', 'A new VR headset is secretly funding a competitor.', 'Gaming', 'HALF CAP', 67, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bef068c6', 'Ethereum was caught faking their speedrun', 'Ethereum was caught faking their speedrun.', 'Tech', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5770442c', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Pop Culture', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-688ba945', 'Elon Musk just bought Twitter again', 'Elon Musk just bought Twitter again.', 'Gaming', 'CAP', 96, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3eb8e122', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Internet Drama', 'CAP', 43, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c60d8aaf', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Science', 'CAP', 58, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-24dcaa0c', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Gaming', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7bf2d22e', 'A hidden Discord server just released a manifesto', 'A hidden Discord server just released a manifesto.', 'Tech', 'HALF CAP', 87, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6307639a', 'A secret government project was caught faking their speedrun', 'A secret government project was caught faking their speedrun.', 'Tech', 'HALF CAP', 65, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ef182c0a', 'A popular YouTuber got hacked by a 12 year old', 'A popular YouTuber got hacked by a 12 year old.', 'Science', 'HALF CAP', 68, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f4c82f14', 'A leaked iPhone design is releasing a crypto token', 'A leaked iPhone design is releasing a crypto token.', 'Pop Culture', 'NO CAP', 50, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9f2120b7', 'A popular streamer just fired their whole team', 'A popular streamer just fired their whole team.', 'Tech', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4591f3fe', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Pop Culture', 'HALF CAP', 85, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1ef20ca9', 'Bitcoin just released a manifesto', 'Bitcoin just released a manifesto.', 'Pop Culture', 'CAP', 55, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4e270fdf', 'Sam Altman is actually a robot', 'Sam Altman is actually a robot.', 'Tech', 'HALF CAP', 69, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-755d346c', 'Ethereum just fired their whole team', 'Ethereum just fired their whole team.', 'Science', 'CAP', 60, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9b8da98b', 'A new AI model got hacked by a 12 year old', 'A new AI model got hacked by a 12 year old.', 'Crypto', 'HALF CAP', 87, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3bf676d6', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Science', 'CAP', 89, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-df2e79dc', 'A hidden Discord server is actually two people', 'A hidden Discord server is actually two people.', 'Gaming', 'HALF CAP', 87, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2811579b', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Crypto', 'HALF CAP', 44, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0715b664', 'A popular YouTuber is actually two people', 'A popular YouTuber is actually two people.', 'Tech', 'HALF CAP', 80, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fb1f96d7', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Science', 'NO CAP', 70, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5f2d5693', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Internet Drama', 'NO CAP', 100, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-79bc0474', 'A new VR headset got hacked by a 12 year old', 'A new VR headset got hacked by a 12 year old.', 'Crypto', 'CAP', 93, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0f7043c6', 'Elon Musk is secretly funding a competitor', 'Elon Musk is secretly funding a competitor.', 'Tech', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-911dcff2', 'A hidden Discord server is releasing a crypto token', 'A hidden Discord server is releasing a crypto token.', 'Internet Drama', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ad5e6684', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Pop Culture', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6ba7fc33', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Tech', 'HALF CAP', 55, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-560262ef', 'A new VR headset predicted the exact date of the crash', 'A new VR headset predicted the exact date of the crash.', 'Science', 'CAP', 64, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e58dcd14', 'A hidden Discord server predicted the exact date of the crash', 'A hidden Discord server predicted the exact date of the crash.', 'Crypto', 'NO CAP', 75, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-66e2e558', 'Sam Altman is secretly funding a competitor', 'Sam Altman is secretly funding a competitor.', 'Pop Culture', 'HALF CAP', 98, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d3ad61f4', 'A generic Reddit mod has been faking their videos', 'A generic Reddit mod has been faking their videos.', 'Internet Drama', 'CAP', 87, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4c91a32b', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Internet Drama', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a0357494', 'A generic Reddit mod just bought Twitter again', 'A generic Reddit mod just bought Twitter again.', 'Science', 'NO CAP', 60, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-69b8fe61', 'Bitcoin is actually a robot', 'Bitcoin is actually a robot.', 'Tech', 'HALF CAP', 77, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2dc13a21', 'MrBeast is secretly funding a competitor', 'MrBeast is secretly funding a competitor.', 'Tech', 'CAP', 95, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8e5b4cd1', 'A popular streamer got hacked by a 12 year old', 'A popular streamer got hacked by a 12 year old.', 'Gaming', 'CAP', 49, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-318b30a2', 'Bitcoin is secretly funding a competitor', 'Bitcoin is secretly funding a competitor.', 'Crypto', 'CAP', 57, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-52551a6c', 'A secret government project is releasing a crypto token', 'A secret government project is releasing a crypto token.', 'Pop Culture', 'NO CAP', 65, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e7ec1689', 'A popular YouTuber just fired their whole team', 'A popular YouTuber just fired their whole team.', 'Crypto', 'NO CAP', 81, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-841b3549', 'Elon Musk got hacked by a 12 year old', 'Elon Musk got hacked by a 12 year old.', 'Pop Culture', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bae8010a', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Tech', 'CAP', 73, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f63a8281', 'Elon Musk is actually a robot', 'Elon Musk is actually a robot.', 'Crypto', 'NO CAP', 43, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8f26bcce', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Tech', 'HALF CAP', 41, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-de9ae539', 'Bitcoin is shutting down tomorrow', 'Bitcoin is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ee0ef8ad', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Pop Culture', 'NO CAP', 86, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a4c10118', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 40, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-623e04b0', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Gaming', 'NO CAP', 60, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4852a92a', 'A popular streamer is actually a robot', 'A popular streamer is actually a robot.', 'Science', 'CAP', 99, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-016a6346', 'A popular streamer was banned for using aimbot', 'A popular streamer was banned for using aimbot.', 'Crypto', 'HALF CAP', 61, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-33b3cf25', 'Bitcoin is secretly funding a competitor', 'Bitcoin is secretly funding a competitor.', 'Pop Culture', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2fce1507', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Internet Drama', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1c395021', 'A new AI model just fired their whole team', 'A new AI model just fired their whole team.', 'Internet Drama', 'CAP', 99, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-89d61084', 'A leaked iPhone design just released a manifesto', 'A leaked iPhone design just released a manifesto.', 'Internet Drama', 'NO CAP', 47, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ebbb4407', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Pop Culture', 'NO CAP', 77, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b393ac16', 'Sam Altman is actually two people', 'Sam Altman is actually two people.', 'Tech', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fcab6a95', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Internet Drama', 'HALF CAP', 56, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ed0040f4', 'A new AI model just fired their whole team', 'A new AI model just fired their whole team.', 'Internet Drama', 'NO CAP', 95, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e7fbe18f', 'A popular streamer got hacked by a 12 year old', 'A popular streamer got hacked by a 12 year old.', 'Gaming', 'HALF CAP', 59, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-10856e94', 'A popular streamer just bought Twitter again', 'A popular streamer just bought Twitter again.', 'Internet Drama', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d0bab641', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Pop Culture', 'HALF CAP', 82, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-551ab8b8', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Tech', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f2f030b6', 'A generic Reddit mod was caught faking their speedrun', 'A generic Reddit mod was caught faking their speedrun.', 'Gaming', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fbcb1029', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Internet Drama', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6da56655', 'MrBeast just released a manifesto', 'MrBeast just released a manifesto.', 'Science', 'NO CAP', 97, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fda44b9b', 'A hidden Discord server got hacked by a 12 year old', 'A hidden Discord server got hacked by a 12 year old.', 'Tech', 'HALF CAP', 74, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-36aad56a', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Gaming', 'HALF CAP', 48, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0e46645b', 'A generic Reddit mod has been faking their videos', 'A generic Reddit mod has been faking their videos.', 'Internet Drama', 'HALF CAP', 94, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-630894fe', 'A new VR headset just fired their whole team', 'A new VR headset just fired their whole team.', 'Gaming', 'HALF CAP', 69, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-61d101ea', 'A new AI model just bought Twitter again', 'A new AI model just bought Twitter again.', 'Science', 'CAP', 52, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bbb95d2e', 'Ethereum just fired their whole team', 'Ethereum just fired their whole team.', 'Pop Culture', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-48ae3bf7', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Internet Drama', 'NO CAP', 51, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a1062b0e', 'Ethereum was banned for using aimbot', 'Ethereum was banned for using aimbot.', 'Internet Drama', 'CAP', 89, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f7eee1c0', 'A generic Reddit mod just released a manifesto', 'A generic Reddit mod just released a manifesto.', 'Crypto', 'CAP', 94, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f23d9f58', 'A secret government project got hacked by a 12 year old', 'A secret government project got hacked by a 12 year old.', 'Internet Drama', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c85be2fb', 'Bitcoin just bought Twitter again', 'Bitcoin just bought Twitter again.', 'Science', 'NO CAP', 40, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-98dac90d', 'A new VR headset is secretly funding a competitor', 'A new VR headset is secretly funding a competitor.', 'Science', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-35821ff8', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Science', 'NO CAP', 61, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-98acedad', 'A secret government project has been faking their videos', 'A secret government project has been faking their videos.', 'Internet Drama', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9fc6e7e9', 'A popular YouTuber got hacked by a 12 year old', 'A popular YouTuber got hacked by a 12 year old.', 'Tech', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6c17b1de', 'A generic Reddit mod just released a manifesto', 'A generic Reddit mod just released a manifesto.', 'Science', 'HALF CAP', 72, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-65895f8c', 'Bitcoin was banned for using aimbot', 'Bitcoin was banned for using aimbot.', 'Crypto', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4b7d3ed3', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Crypto', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b3eb89f2', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Pop Culture', 'HALF CAP', 96, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f28f207d', 'A popular streamer was banned for using aimbot', 'A popular streamer was banned for using aimbot.', 'Internet Drama', 'HALF CAP', 50, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e9ba701e', 'A popular YouTuber just fired their whole team', 'A popular YouTuber just fired their whole team.', 'Pop Culture', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-374b7b71', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Crypto', 'HALF CAP', 81, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7ec37e13', 'A secret government project was caught faking their speedrun', 'A secret government project was caught faking their speedrun.', 'Gaming', 'NO CAP', 93, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a67d2f56', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Tech', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-63fba47d', 'A new AI model got hacked by a 12 year old', 'A new AI model got hacked by a 12 year old.', 'Tech', 'CAP', 76, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-03f4d191', 'A leaked iPhone design is actually a robot', 'A leaked iPhone design is actually a robot.', 'Crypto', 'NO CAP', 75, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e797dccd', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Tech', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a94fa90f', 'A new AI model is actually a robot', 'A new AI model is actually a robot.', 'Science', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-be23ebf6', 'A hidden Discord server has been faking their videos', 'A hidden Discord server has been faking their videos.', 'Internet Drama', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-906a7f39', 'Elon Musk is actually two people', 'Elon Musk is actually two people.', 'Science', 'CAP', 66, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4fe23e14', 'Elon Musk predicted the exact date of the crash', 'Elon Musk predicted the exact date of the crash.', 'Pop Culture', 'HALF CAP', 71, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-031295a7', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Crypto', 'HALF CAP', 62, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5bc603da', 'A leaked iPhone design is actually a robot', 'A leaked iPhone design is actually a robot.', 'Gaming', 'CAP', 49, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5abf17b6', 'A leaked iPhone design predicted the exact date of the crash', 'A leaked iPhone design predicted the exact date of the crash.', 'Science', 'CAP', 54, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ca16d09d', 'A new VR headset predicted the exact date of the crash', 'A new VR headset predicted the exact date of the crash.', 'Gaming', 'CAP', 63, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1b50b033', 'A leaked iPhone design predicted the exact date of the crash', 'A leaked iPhone design predicted the exact date of the crash.', 'Crypto', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bb78652d', 'Sam Altman just fired their whole team', 'Sam Altman just fired their whole team.', 'Science', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ae1f022c', 'A popular YouTuber is actually a robot', 'A popular YouTuber is actually a robot.', 'Internet Drama', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8d9a5f0d', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Crypto', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0bd485d8', 'Ethereum just released a manifesto', 'Ethereum just released a manifesto.', 'Tech', 'NO CAP', 47, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0ea97508', 'Bitcoin just bought Twitter again', 'Bitcoin just bought Twitter again.', 'Science', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-56db1669', 'Ethereum is secretly funding a competitor', 'Ethereum is secretly funding a competitor.', 'Gaming', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-655d8002', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Pop Culture', 'HALF CAP', 98, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-19c64993', 'MrBeast has been faking their videos', 'MrBeast has been faking their videos.', 'Gaming', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2a838fe6', 'A popular streamer is actually a robot', 'A popular streamer is actually a robot.', 'Gaming', 'CAP', 71, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c4d5d6f5', 'A new AI model predicted the exact date of the crash', 'A new AI model predicted the exact date of the crash.', 'Internet Drama', 'CAP', 51, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ac5baeef', 'A generic Reddit mod just fired their whole team', 'A generic Reddit mod just fired their whole team.', 'Science', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c69ac5d5', 'Elon Musk is secretly funding a competitor', 'Elon Musk is secretly funding a competitor.', 'Pop Culture', 'HALF CAP', 96, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-648ac4ac', 'Ethereum is releasing a crypto token', 'Ethereum is releasing a crypto token.', 'Science', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6d70d06b', 'A popular streamer got hacked by a 12 year old', 'A popular streamer got hacked by a 12 year old.', 'Crypto', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a0c24c8e', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Internet Drama', 'HALF CAP', 80, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-72b4e469', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Science', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f7d5d000', 'Elon Musk predicted the exact date of the crash', 'Elon Musk predicted the exact date of the crash.', 'Science', 'HALF CAP', 94, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d7c30953', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Science', 'NO CAP', 99, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2d0d158c', 'Bitcoin just bought Twitter again', 'Bitcoin just bought Twitter again.', 'Pop Culture', 'NO CAP', 64, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a0538083', 'MrBeast has been faking their videos', 'MrBeast has been faking their videos.', 'Pop Culture', 'HALF CAP', 76, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b29c5a1d', 'Sam Altman just fired their whole team', 'Sam Altman just fired their whole team.', 'Crypto', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6eea7ca1', 'A popular streamer is actually a robot', 'A popular streamer is actually a robot.', 'Internet Drama', 'NO CAP', 96, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-61e96637', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Tech', 'HALF CAP', 43, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ac1adbe7', 'Bitcoin is secretly funding a competitor', 'Bitcoin is secretly funding a competitor.', 'Pop Culture', 'CAP', 47, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-89ac312f', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Internet Drama', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-606e9c84', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Tech', 'NO CAP', 67, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5f305aa8', 'Bitcoin has been faking their videos', 'Bitcoin has been faking their videos.', 'Crypto', 'HALF CAP', 59, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3583fd3f', 'A leaked iPhone design is shutting down tomorrow', 'A leaked iPhone design is shutting down tomorrow.', 'Crypto', 'HALF CAP', 63, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8a5aa9df', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Internet Drama', 'HALF CAP', 82, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3145402c', 'A generic Reddit mod predicted the exact date of the crash', 'A generic Reddit mod predicted the exact date of the crash.', 'Crypto', 'NO CAP', 85, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-978dea1f', 'A hidden Discord server was caught faking their speedrun', 'A hidden Discord server was caught faking their speedrun.', 'Tech', 'HALF CAP', 74, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9814aa18', 'A secret government project just bought Twitter again', 'A secret government project just bought Twitter again.', 'Pop Culture', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b53d9406', 'A new AI model is shutting down tomorrow', 'A new AI model is shutting down tomorrow.', 'Crypto', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ea9f724e', 'A popular streamer predicted the exact date of the crash', 'A popular streamer predicted the exact date of the crash.', 'Internet Drama', 'CAP', 73, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-95ed7850', 'A hidden Discord server just fired their whole team', 'A hidden Discord server just fired their whole team.', 'Pop Culture', 'CAP', 83, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-38759f8c', 'A leaked iPhone design is actually two people', 'A leaked iPhone design is actually two people.', 'Tech', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cb663942', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Pop Culture', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8a202a8d', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Science', 'CAP', 51, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-db4982d8', 'MrBeast is actually a robot', 'MrBeast is actually a robot.', 'Pop Culture', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f87d83af', 'A popular streamer is releasing a crypto token', 'A popular streamer is releasing a crypto token.', 'Tech', 'CAP', 99, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-787f2044', 'A new VR headset just bought Twitter again', 'A new VR headset just bought Twitter again.', 'Tech', 'CAP', 54, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3a4cde41', 'A popular YouTuber is secretly funding a competitor', 'A popular YouTuber is secretly funding a competitor.', 'Gaming', 'CAP', 89, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-05d6c5ad', 'A popular streamer just bought Twitter again', 'A popular streamer just bought Twitter again.', 'Gaming', 'CAP', 72, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c4145e28', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Crypto', 'HALF CAP', 43, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7583d95b', 'A leaked iPhone design just bought Twitter again', 'A leaked iPhone design just bought Twitter again.', 'Internet Drama', 'NO CAP', 44, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6463e453', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Science', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-643846e0', 'Ethereum just bought Twitter again', 'Ethereum just bought Twitter again.', 'Internet Drama', 'HALF CAP', 81, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2b0e7e2f', 'Sam Altman is secretly funding a competitor', 'Sam Altman is secretly funding a competitor.', 'Tech', 'NO CAP', 90, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4bce5e00', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Science', 'HALF CAP', 94, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-06c54c5c', 'Elon Musk got hacked by a 12 year old', 'Elon Musk got hacked by a 12 year old.', 'Pop Culture', 'NO CAP', 63, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-967d100d', 'A hidden Discord server is secretly funding a competitor', 'A hidden Discord server is secretly funding a competitor.', 'Pop Culture', 'CAP', 75, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8db3bd4d', 'A secret government project predicted the exact date of the crash', 'A secret government project predicted the exact date of the crash.', 'Science', 'CAP', 93, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c5c6767e', 'A secret government project was banned for using aimbot', 'A secret government project was banned for using aimbot.', 'Tech', 'CAP', 62, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-66d82483', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Internet Drama', 'NO CAP', 41, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-13cc09ae', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Gaming', 'CAP', 51, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-517fc6de', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Gaming', 'NO CAP', 96, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-63946867', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Pop Culture', 'HALF CAP', 47, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-94ba1bf1', 'A popular streamer just released a manifesto', 'A popular streamer just released a manifesto.', 'Crypto', 'NO CAP', 89, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f2a29239', 'A generic Reddit mod was caught faking their speedrun', 'A generic Reddit mod was caught faking their speedrun.', 'Internet Drama', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0cf80e08', 'Ethereum has been faking their videos', 'Ethereum has been faking their videos.', 'Science', 'CAP', 72, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b10b5229', 'A generic Reddit mod predicted the exact date of the crash', 'A generic Reddit mod predicted the exact date of the crash.', 'Internet Drama', 'HALF CAP', 43, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-af9d32da', 'Bitcoin was banned for using aimbot', 'Bitcoin was banned for using aimbot.', 'Tech', 'NO CAP', 84, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a09715a6', 'Ethereum is actually two people', 'Ethereum is actually two people.', 'Tech', 'CAP', 92, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d820b8c6', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Gaming', 'NO CAP', 91, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d61cd3c5', 'A generic Reddit mod is secretly funding a competitor', 'A generic Reddit mod is secretly funding a competitor.', 'Pop Culture', 'CAP', 61, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8d0ef45f', 'Bitcoin is secretly funding a competitor', 'Bitcoin is secretly funding a competitor.', 'Science', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-19079506', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Pop Culture', 'NO CAP', 65, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6f4f3a7f', 'A leaked iPhone design is shutting down tomorrow', 'A leaked iPhone design is shutting down tomorrow.', 'Gaming', 'HALF CAP', 78, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4e4eef70', 'Bitcoin has been faking their videos', 'Bitcoin has been faking their videos.', 'Internet Drama', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4f15511d', 'Elon Musk just released a manifesto', 'Elon Musk just released a manifesto.', 'Pop Culture', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-09c4df1e', 'Bitcoin has been faking their videos', 'Bitcoin has been faking their videos.', 'Internet Drama', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c32fb4d3', 'Sam Altman predicted the exact date of the crash', 'Sam Altman predicted the exact date of the crash.', 'Crypto', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-aebd6f19', 'A leaked iPhone design is releasing a crypto token', 'A leaked iPhone design is releasing a crypto token.', 'Internet Drama', 'CAP', 65, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-517b2bab', 'A popular YouTuber just released a manifesto', 'A popular YouTuber just released a manifesto.', 'Tech', 'HALF CAP', 57, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-03adc258', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Gaming', 'CAP', 93, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-37c8164a', 'A leaked iPhone design just released a manifesto', 'A leaked iPhone design just released a manifesto.', 'Crypto', 'HALF CAP', 62, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c8c26c2f', 'A generic Reddit mod is shutting down tomorrow', 'A generic Reddit mod is shutting down tomorrow.', 'Tech', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-77b715a3', 'Sam Altman is shutting down tomorrow', 'Sam Altman is shutting down tomorrow.', 'Internet Drama', 'CAP', 77, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a686d20a', 'A new AI model is releasing a crypto token', 'A new AI model is releasing a crypto token.', 'Pop Culture', 'CAP', 83, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2a77ad80', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Science', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7a219135', 'A new AI model got hacked by a 12 year old', 'A new AI model got hacked by a 12 year old.', 'Gaming', 'NO CAP', 61, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e0f95e81', 'MrBeast is shutting down tomorrow', 'MrBeast is shutting down tomorrow.', 'Tech', 'NO CAP', 64, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-71d76f5c', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Internet Drama', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7cd3a440', 'A popular YouTuber is actually two people', 'A popular YouTuber is actually two people.', 'Tech', 'NO CAP', 51, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-971d22b9', 'A hidden Discord server just fired their whole team', 'A hidden Discord server just fired their whole team.', 'Science', 'CAP', 96, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-72d8e99f', 'A popular streamer is actually a robot', 'A popular streamer is actually a robot.', 'Pop Culture', 'CAP', 60, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1425caf6', 'A hidden Discord server got hacked by a 12 year old', 'A hidden Discord server got hacked by a 12 year old.', 'Tech', 'NO CAP', 78, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-96009cb8', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Internet Drama', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-05f65614', 'Elon Musk is actually a robot', 'Elon Musk is actually a robot.', 'Crypto', 'HALF CAP', 75, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3d6fdd55', 'Bitcoin is actually a robot', 'Bitcoin is actually a robot.', 'Pop Culture', 'CAP', 97, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c8e24c88', 'A hidden Discord server got hacked by a 12 year old', 'A hidden Discord server got hacked by a 12 year old.', 'Gaming', 'HALF CAP', 95, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c50e3de8', 'Elon Musk is releasing a crypto token', 'Elon Musk is releasing a crypto token.', 'Gaming', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e96ae50c', 'Elon Musk is actually a robot', 'Elon Musk is actually a robot.', 'Pop Culture', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cf9353ed', 'A hidden Discord server got hacked by a 12 year old', 'A hidden Discord server got hacked by a 12 year old.', 'Gaming', 'HALF CAP', 85, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8a3ab9b2', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Pop Culture', 'CAP', 43, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-828d7369', 'Elon Musk predicted the exact date of the crash', 'Elon Musk predicted the exact date of the crash.', 'Gaming', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-db08891f', 'A new AI model is secretly funding a competitor', 'A new AI model is secretly funding a competitor.', 'Crypto', 'CAP', 70, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d7d93094', 'A popular YouTuber is actually two people', 'A popular YouTuber is actually two people.', 'Internet Drama', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b510263d', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Internet Drama', 'HALF CAP', 96, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1973affb', 'A new VR headset is actually a robot', 'A new VR headset is actually a robot.', 'Crypto', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0f3b0f0e', 'A generic Reddit mod is secretly funding a competitor', 'A generic Reddit mod is secretly funding a competitor.', 'Internet Drama', 'HALF CAP', 41, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3978f960', 'A popular YouTuber is secretly funding a competitor', 'A popular YouTuber is secretly funding a competitor.', 'Crypto', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-53171a86', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Science', 'NO CAP', 63, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-feed73b4', 'A popular YouTuber just bought Twitter again', 'A popular YouTuber just bought Twitter again.', 'Internet Drama', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7d91d117', 'A new VR headset is actually two people', 'A new VR headset is actually two people.', 'Pop Culture', 'CAP', 56, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ae7bd307', 'A new VR headset just fired their whole team', 'A new VR headset just fired their whole team.', 'Crypto', 'NO CAP', 93, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7983196f', 'A leaked iPhone design was caught faking their speedrun', 'A leaked iPhone design was caught faking their speedrun.', 'Tech', 'CAP', 41, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-044e709d', 'A popular YouTuber just bought Twitter again', 'A popular YouTuber just bought Twitter again.', 'Tech', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5d6647f2', 'A new AI model has been faking their videos', 'A new AI model has been faking their videos.', 'Tech', 'CAP', 41, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ab6e2475', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Gaming', 'HALF CAP', 82, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ced4666e', 'MrBeast is secretly funding a competitor', 'MrBeast is secretly funding a competitor.', 'Science', 'CAP', 85, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-71126fe1', 'A hidden Discord server is actually a robot', 'A hidden Discord server is actually a robot.', 'Internet Drama', 'NO CAP', 41, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6d8cb85c', 'A hidden Discord server was banned for using aimbot', 'A hidden Discord server was banned for using aimbot.', 'Pop Culture', 'CAP', 43, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a022ace3', 'A popular YouTuber is shutting down tomorrow', 'A popular YouTuber is shutting down tomorrow.', 'Gaming', 'HALF CAP', 80, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0e308f8b', 'Elon Musk just fired their whole team', 'Elon Musk just fired their whole team.', 'Tech', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-eb3f2904', 'A leaked iPhone design just released a manifesto', 'A leaked iPhone design just released a manifesto.', 'Tech', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5e0a52e0', 'A hidden Discord server predicted the exact date of the crash', 'A hidden Discord server predicted the exact date of the crash.', 'Crypto', 'HALF CAP', 92, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-930a1326', 'Ethereum is secretly funding a competitor', 'Ethereum is secretly funding a competitor.', 'Crypto', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9ef88bc7', 'A hidden Discord server is secretly funding a competitor', 'A hidden Discord server is secretly funding a competitor.', 'Gaming', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-daeee3b5', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Crypto', 'NO CAP', 75, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-88560d99', 'A hidden Discord server is secretly funding a competitor', 'A hidden Discord server is secretly funding a competitor.', 'Pop Culture', 'NO CAP', 93, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-52bf81f9', 'A new AI model got hacked by a 12 year old', 'A new AI model got hacked by a 12 year old.', 'Crypto', 'CAP', 99, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-09e4b8d0', 'A new VR headset is secretly funding a competitor', 'A new VR headset is secretly funding a competitor.', 'Internet Drama', 'NO CAP', 71, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d4fe2cb8', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Tech', 'HALF CAP', 81, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ca65f3c2', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Tech', 'CAP', 57, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fc4ae744', 'A hidden Discord server is releasing a crypto token', 'A hidden Discord server is releasing a crypto token.', 'Gaming', 'CAP', 54, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-76757993', 'A leaked iPhone design just bought Twitter again', 'A leaked iPhone design just bought Twitter again.', 'Tech', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d506c658', 'A secret government project predicted the exact date of the crash', 'A secret government project predicted the exact date of the crash.', 'Crypto', 'CAP', 48, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6905f4fd', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Internet Drama', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-98d04020', 'A popular YouTuber was banned for using aimbot', 'A popular YouTuber was banned for using aimbot.', 'Science', 'NO CAP', 52, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-db81668d', 'A new AI model is shutting down tomorrow', 'A new AI model is shutting down tomorrow.', 'Internet Drama', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-62882d4a', 'A popular streamer is actually a robot', 'A popular streamer is actually a robot.', 'Pop Culture', 'NO CAP', 59, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-472a71a1', 'MrBeast is shutting down tomorrow', 'MrBeast is shutting down tomorrow.', 'Science', 'CAP', 45, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2edfb261', 'A hidden Discord server just released a manifesto', 'A hidden Discord server just released a manifesto.', 'Gaming', 'HALF CAP', 44, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-65c91f65', 'A hidden Discord server was banned for using aimbot', 'A hidden Discord server was banned for using aimbot.', 'Crypto', 'HALF CAP', 57, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b4b1d2e8', 'MrBeast is releasing a crypto token', 'MrBeast is releasing a crypto token.', 'Science', 'NO CAP', 61, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c1e16680', 'A leaked iPhone design just bought Twitter again', 'A leaked iPhone design just bought Twitter again.', 'Pop Culture', 'CAP', 51, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e5551215', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Science', 'CAP', 71, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6d48118b', 'Bitcoin just released a manifesto', 'Bitcoin just released a manifesto.', 'Gaming', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d1e481d8', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Crypto', 'CAP', 40, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b93aa96b', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Internet Drama', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3b92bad7', 'Ethereum is actually a robot', 'Ethereum is actually a robot.', 'Crypto', 'NO CAP', 67, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b0141bf3', 'Elon Musk has been faking their videos', 'Elon Musk has been faking their videos.', 'Tech', 'NO CAP', 82, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e040d933', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Crypto', 'NO CAP', 95, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4d6b1b87', 'A new AI model is secretly funding a competitor', 'A new AI model is secretly funding a competitor.', 'Pop Culture', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ae695dc6', 'A new VR headset just fired their whole team', 'A new VR headset just fired their whole team.', 'Crypto', 'NO CAP', 79, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c574ba26', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Gaming', 'NO CAP', 87, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2994f3bf', 'A generic Reddit mod is secretly funding a competitor', 'A generic Reddit mod is secretly funding a competitor.', 'Science', 'CAP', 78, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a788b75a', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Science', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f60fd317', 'A popular YouTuber was caught faking their speedrun', 'A popular YouTuber was caught faking their speedrun.', 'Science', 'CAP', 88, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6c95ae64', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Internet Drama', 'NO CAP', 51, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0015b46e', 'Ethereum was banned for using aimbot', 'Ethereum was banned for using aimbot.', 'Pop Culture', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bce3853d', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Tech', 'HALF CAP', 88, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-429b65a8', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Pop Culture', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2d865c9f', 'A new AI model is actually two people', 'A new AI model is actually two people.', 'Tech', 'HALF CAP', 57, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0d14062e', 'A popular streamer predicted the exact date of the crash', 'A popular streamer predicted the exact date of the crash.', 'Internet Drama', 'NO CAP', 40, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f0ccb359', 'Sam Altman just released a manifesto', 'Sam Altman just released a manifesto.', 'Pop Culture', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8bdbc0b0', 'A popular YouTuber was caught faking their speedrun', 'A popular YouTuber was caught faking their speedrun.', 'Crypto', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-38c8a852', 'A popular streamer is shutting down tomorrow', 'A popular streamer is shutting down tomorrow.', 'Science', 'CAP', 64, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-58daaf70', 'A new VR headset was banned for using aimbot', 'A new VR headset was banned for using aimbot.', 'Internet Drama', 'CAP', 54, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dce009ba', 'Elon Musk was caught faking their speedrun', 'Elon Musk was caught faking their speedrun.', 'Pop Culture', 'CAP', 47, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-07bffa91', 'A new VR headset just released a manifesto', 'A new VR headset just released a manifesto.', 'Gaming', 'CAP', 91, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e1bfa78f', 'Ethereum got hacked by a 12 year old', 'Ethereum got hacked by a 12 year old.', 'Internet Drama', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1080633c', 'A generic Reddit mod just bought Twitter again', 'A generic Reddit mod just bought Twitter again.', 'Science', 'HALF CAP', 55, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-780c8b0a', 'Ethereum just released a manifesto', 'Ethereum just released a manifesto.', 'Science', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b50be607', 'Bitcoin just fired their whole team', 'Bitcoin just fired their whole team.', 'Crypto', 'NO CAP', 46, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e31899cf', 'Elon Musk just bought Twitter again', 'Elon Musk just bought Twitter again.', 'Science', 'NO CAP', 55, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-eb7639c6', 'Ethereum has been faking their videos', 'Ethereum has been faking their videos.', 'Pop Culture', 'HALF CAP', 73, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-04ea5ad4', 'A hidden Discord server is secretly funding a competitor', 'A hidden Discord server is secretly funding a competitor.', 'Internet Drama', 'CAP', 72, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9e2ddab1', 'A popular YouTuber just fired their whole team', 'A popular YouTuber just fired their whole team.', 'Tech', 'CAP', 53, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-91563328', 'A hidden Discord server has been faking their videos', 'A hidden Discord server has been faking their videos.', 'Gaming', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-92d18e75', 'A hidden Discord server was banned for using aimbot', 'A hidden Discord server was banned for using aimbot.', 'Internet Drama', 'CAP', 40, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-45bd915e', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Crypto', 'CAP', 68, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1a2c97a7', 'Elon Musk is actually a robot', 'Elon Musk is actually a robot.', 'Gaming', 'CAP', 63, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6da1e049', 'A popular YouTuber just released a manifesto', 'A popular YouTuber just released a manifesto.', 'Gaming', 'HALF CAP', 100, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-84d59025', 'A generic Reddit mod is actually a robot', 'A generic Reddit mod is actually a robot.', 'Tech', 'HALF CAP', 57, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d8201489', 'A secret government project just released a manifesto', 'A secret government project just released a manifesto.', 'Crypto', 'CAP', 98, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9f5926dd', 'A popular streamer is actually a robot', 'A popular streamer is actually a robot.', 'Internet Drama', 'CAP', 76, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4b0645ec', 'A popular YouTuber is actually a robot', 'A popular YouTuber is actually a robot.', 'Tech', 'CAP', 71, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0cd5c44d', 'A new AI model just fired their whole team', 'A new AI model just fired their whole team.', 'Tech', 'NO CAP', 66, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-43545ec0', 'Sam Altman just bought Twitter again', 'Sam Altman just bought Twitter again.', 'Science', 'NO CAP', 86, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-099a9534', 'A new AI model is actually a robot', 'A new AI model is actually a robot.', 'Tech', 'NO CAP', 54, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-20bfda8e', 'A hidden Discord server is actually two people', 'A hidden Discord server is actually two people.', 'Tech', 'NO CAP', 73, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8f122ce8', 'A new AI model is shutting down tomorrow', 'A new AI model is shutting down tomorrow.', 'Pop Culture', 'HALF CAP', 67, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-267ed97e', 'Elon Musk got hacked by a 12 year old', 'Elon Musk got hacked by a 12 year old.', 'Pop Culture', 'HALF CAP', 71, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3c408515', 'A secret government project is releasing a crypto token', 'A secret government project is releasing a crypto token.', 'Crypto', 'HALF CAP', 85, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b6abd0e5', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Science', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c0a45335', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Gaming', 'CAP', 88, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a9d9b77d', 'A generic Reddit mod was banned for using aimbot', 'A generic Reddit mod was banned for using aimbot.', 'Tech', 'CAP', 47, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-930fcd86', 'A leaked iPhone design was caught faking their speedrun', 'A leaked iPhone design was caught faking their speedrun.', 'Crypto', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5a12a64e', 'A new VR headset just bought Twitter again', 'A new VR headset just bought Twitter again.', 'Pop Culture', 'HALF CAP', 73, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7bb5bb79', 'A popular streamer is shutting down tomorrow', 'A popular streamer is shutting down tomorrow.', 'Gaming', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0e3c7a22', 'A generic Reddit mod is secretly funding a competitor', 'A generic Reddit mod is secretly funding a competitor.', 'Tech', 'NO CAP', 97, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4dcc88c5', 'Sam Altman has been faking their videos', 'Sam Altman has been faking their videos.', 'Internet Drama', 'CAP', 52, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c79a0dc1', 'A leaked iPhone design predicted the exact date of the crash', 'A leaked iPhone design predicted the exact date of the crash.', 'Pop Culture', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-596e207b', 'A popular YouTuber has been faking their videos', 'A popular YouTuber has been faking their videos.', 'Science', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-481d5c7f', 'A new VR headset predicted the exact date of the crash', 'A new VR headset predicted the exact date of the crash.', 'Tech', 'HALF CAP', 78, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ef3373a5', 'A popular streamer just fired their whole team', 'A popular streamer just fired their whole team.', 'Science', 'CAP', 70, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b9828015', 'A leaked iPhone design just fired their whole team', 'A leaked iPhone design just fired their whole team.', 'Tech', 'CAP', 83, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-36303529', 'A popular YouTuber is actually a robot', 'A popular YouTuber is actually a robot.', 'Tech', 'NO CAP', 51, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-db023a45', 'Sam Altman is actually a robot', 'Sam Altman is actually a robot.', 'Pop Culture', 'CAP', 99, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4bcc7426', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Gaming', 'NO CAP', 86, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-385de65a', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Pop Culture', 'HALF CAP', 51, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e6895d0c', 'A new AI model just fired their whole team', 'A new AI model just fired their whole team.', 'Gaming', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a06e0a0d', 'Elon Musk just released a manifesto', 'Elon Musk just released a manifesto.', 'Tech', 'HALF CAP', 42, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2b280eeb', 'A leaked iPhone design just fired their whole team', 'A leaked iPhone design just fired their whole team.', 'Crypto', 'HALF CAP', 54, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-10772fbf', 'Elon Musk just released a manifesto', 'Elon Musk just released a manifesto.', 'Pop Culture', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-83b0b149', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Gaming', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c2de98f0', 'Ethereum just released a manifesto', 'Ethereum just released a manifesto.', 'Science', 'CAP', 46, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-161ec808', 'A popular streamer is actually two people', 'A popular streamer is actually two people.', 'Tech', 'HALF CAP', 84, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-43786cce', 'A leaked iPhone design has been faking their videos', 'A leaked iPhone design has been faking their videos.', 'Science', 'HALF CAP', 95, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f93fd30c', 'A secret government project has been faking their videos', 'A secret government project has been faking their videos.', 'Science', 'CAP', 91, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d6006b4d', 'Elon Musk has been faking their videos', 'Elon Musk has been faking their videos.', 'Gaming', 'NO CAP', 53, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6842fe85', 'A hidden Discord server predicted the exact date of the crash', 'A hidden Discord server predicted the exact date of the crash.', 'Tech', 'CAP', 59, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dd4475d6', 'MrBeast just fired their whole team', 'MrBeast just fired their whole team.', 'Tech', 'CAP', 75, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-cfc1b0ff', 'A popular YouTuber has been faking their videos', 'A popular YouTuber has been faking their videos.', 'Pop Culture', 'NO CAP', 95, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b951d1d5', 'Elon Musk is actually a robot', 'Elon Musk is actually a robot.', 'Science', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-9dfb04b5', 'A leaked iPhone design got hacked by a 12 year old', 'A leaked iPhone design got hacked by a 12 year old.', 'Science', 'HALF CAP', 100, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d205df33', 'A secret government project predicted the exact date of the crash', 'A secret government project predicted the exact date of the crash.', 'Gaming', 'NO CAP', 92, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-05a7f451', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Crypto', 'NO CAP', 61, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dd6ce678', 'A new AI model is releasing a crypto token', 'A new AI model is releasing a crypto token.', 'Internet Drama', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c411cc94', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Internet Drama', 'CAP', 94, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-41acc479', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Internet Drama', 'HALF CAP', 47, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8c0cfa00', 'MrBeast was banned for using aimbot', 'MrBeast was banned for using aimbot.', 'Science', 'NO CAP', 71, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1ffaaa03', 'A popular streamer has been faking their videos', 'A popular streamer has been faking their videos.', 'Science', 'CAP', 80, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-391b1b7b', 'A new VR headset just released a manifesto', 'A new VR headset just released a manifesto.', 'Science', 'CAP', 100, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0cb404fe', 'MrBeast is releasing a crypto token', 'MrBeast is releasing a crypto token.', 'Gaming', 'NO CAP', 93, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d5c362df', 'MrBeast just released a manifesto', 'MrBeast just released a manifesto.', 'Pop Culture', 'NO CAP', 56, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0a5420bd', 'A leaked iPhone design has been faking their videos', 'A leaked iPhone design has been faking their videos.', 'Crypto', 'HALF CAP', 77, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-7f50b718', 'MrBeast just released a manifesto', 'MrBeast just released a manifesto.', 'Crypto', 'CAP', 59, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-118d0130', 'Bitcoin is shutting down tomorrow', 'Bitcoin is shutting down tomorrow.', 'Internet Drama', 'CAP', 64, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5d8982e2', 'A secret government project is actually a robot', 'A secret government project is actually a robot.', 'Crypto', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8fd308fd', 'A popular YouTuber has been faking their videos', 'A popular YouTuber has been faking their videos.', 'Tech', 'HALF CAP', 79, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dd7c07dd', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Crypto', 'HALF CAP', 99, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a2873e82', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Gaming', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-ad362b73', 'A new AI model just bought Twitter again', 'A new AI model just bought Twitter again.', 'Internet Drama', 'CAP', 44, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b1d9c755', 'A popular YouTuber is releasing a crypto token', 'A popular YouTuber is releasing a crypto token.', 'Crypto', 'NO CAP', 76, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5840b3f0', 'A generic Reddit mod just bought Twitter again', 'A generic Reddit mod just bought Twitter again.', 'Tech', 'HALF CAP', 97, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a75ce7aa', 'A popular YouTuber is releasing a crypto token', 'A popular YouTuber is releasing a crypto token.', 'Pop Culture', 'HALF CAP', 48, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-220db18e', 'Sam Altman was banned for using aimbot', 'Sam Altman was banned for using aimbot.', 'Pop Culture', 'CAP', 87, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-8e38415e', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Tech', 'CAP', 67, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c6d2de5d', 'A hidden Discord server got hacked by a 12 year old', 'A hidden Discord server got hacked by a 12 year old.', 'Gaming', 'CAP', 89, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-16c9cba8', 'A new AI model was caught faking their speedrun', 'A new AI model was caught faking their speedrun.', 'Gaming', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4cc97813', 'A leaked iPhone design was banned for using aimbot', 'A leaked iPhone design was banned for using aimbot.', 'Gaming', 'NO CAP', 93, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2d3bb29f', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Internet Drama', 'NO CAP', 84, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dc22ea90', 'A popular streamer was banned for using aimbot', 'A popular streamer was banned for using aimbot.', 'Gaming', 'HALF CAP', 95, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-00c000e5', 'Bitcoin is shutting down tomorrow', 'Bitcoin is shutting down tomorrow.', 'Pop Culture', 'CAP', 69, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0f1e46a2', 'A popular streamer just bought Twitter again', 'A popular streamer just bought Twitter again.', 'Gaming', 'CAP', 42, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1c694417', 'A secret government project is actually two people', 'A secret government project is actually two people.', 'Pop Culture', 'CAP', 55, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c05f64bd', 'A secret government project is secretly funding a competitor', 'A secret government project is secretly funding a competitor.', 'Crypto', 'HALF CAP', 88, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-df3807e3', 'Sam Altman is actually two people', 'Sam Altman is actually two people.', 'Crypto', 'HALF CAP', 83, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-07b91aa9', 'A popular streamer was banned for using aimbot', 'A popular streamer was banned for using aimbot.', 'Pop Culture', 'NO CAP', 91, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-898224d8', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Crypto', 'HALF CAP', 70, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-74c1bb73', 'A hidden Discord server was banned for using aimbot', 'A hidden Discord server was banned for using aimbot.', 'Tech', 'NO CAP', 93, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d5130432', 'A new VR headset is shutting down tomorrow', 'A new VR headset is shutting down tomorrow.', 'Gaming', 'CAP', 58, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-82d6a116', 'Elon Musk got hacked by a 12 year old', 'Elon Musk got hacked by a 12 year old.', 'Crypto', 'HALF CAP', 100, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-3e3f161d', 'Sam Altman is actually a robot', 'Sam Altman is actually a robot.', 'Science', 'NO CAP', 48, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d67c0021', 'A hidden Discord server was caught faking their speedrun', 'A hidden Discord server was caught faking their speedrun.', 'Pop Culture', 'CAP', 74, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-723905aa', 'Sam Altman got hacked by a 12 year old', 'Sam Altman got hacked by a 12 year old.', 'Internet Drama', 'CAP', 81, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-66c71809', 'A hidden Discord server got hacked by a 12 year old', 'A hidden Discord server got hacked by a 12 year old.', 'Pop Culture', 'CAP', 41, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fbd4d263', 'MrBeast just bought Twitter again', 'MrBeast just bought Twitter again.', 'Pop Culture', 'CAP', 99, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e54699e0', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Pop Culture', 'CAP', 68, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-84f73c4f', 'A generic Reddit mod was banned for using aimbot', 'A generic Reddit mod was banned for using aimbot.', 'Crypto', 'NO CAP', 69, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b2b18ae8', 'A secret government project is actually a robot', 'A secret government project is actually a robot.', 'Science', 'CAP', 79, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bdf8885e', 'A popular YouTuber was banned for using aimbot', 'A popular YouTuber was banned for using aimbot.', 'Tech', 'CAP', 45, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-e7bb451d', 'A hidden Discord server is actually two people', 'A hidden Discord server is actually two people.', 'Tech', 'CAP', 86, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-aed5ad40', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Science', 'HALF CAP', 66, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-d2ccf56c', 'MrBeast got hacked by a 12 year old', 'MrBeast got hacked by a 12 year old.', 'Tech', 'NO CAP', 81, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0734b78e', 'A popular streamer is shutting down tomorrow', 'A popular streamer is shutting down tomorrow.', 'Pop Culture', 'NO CAP', 67, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-054d3726', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Tech', 'NO CAP', 57, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-dddecd08', 'Elon Musk predicted the exact date of the crash', 'Elon Musk predicted the exact date of the crash.', 'Tech', 'HALF CAP', 81, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c1886ec1', 'A generic Reddit mod got hacked by a 12 year old', 'A generic Reddit mod got hacked by a 12 year old.', 'Tech', 'HALF CAP', 97, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-399166d5', 'A new VR headset has been faking their videos', 'A new VR headset has been faking their videos.', 'Pop Culture', 'NO CAP', 42, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-2cbf67d3', 'MrBeast predicted the exact date of the crash', 'MrBeast predicted the exact date of the crash.', 'Gaming', 'CAP', 40, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-4f2f216b', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Pop Culture', 'NO CAP', 60, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5502f199', 'A hidden Discord server is shutting down tomorrow', 'A hidden Discord server is shutting down tomorrow.', 'Science', 'CAP', 93, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-da12c44a', 'Elon Musk was banned for using aimbot', 'Elon Musk was banned for using aimbot.', 'Tech', 'NO CAP', 54, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-a047b73e', 'A generic Reddit mod predicted the exact date of the crash', 'A generic Reddit mod predicted the exact date of the crash.', 'Internet Drama', 'HALF CAP', 69, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c9f3b8c4', 'Sam Altman is actually two people', 'Sam Altman is actually two people.', 'Tech', 'NO CAP', 64, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f80f972e', 'Ethereum predicted the exact date of the crash', 'Ethereum predicted the exact date of the crash.', 'Science', 'CAP', 92, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f687550d', 'A popular YouTuber predicted the exact date of the crash', 'A popular YouTuber predicted the exact date of the crash.', 'Crypto', 'NO CAP', 79, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6224fc9a', 'A new AI model just fired their whole team', 'A new AI model just fired their whole team.', 'Pop Culture', 'HALF CAP', 52, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-50d9fecf', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Tech', 'HALF CAP', 67, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-f476bf39', 'A secret government project just fired their whole team', 'A secret government project just fired their whole team.', 'Pop Culture', 'CAP', 40, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-5e7136b9', 'Ethereum is releasing a crypto token', 'Ethereum is releasing a crypto token.', 'Crypto', 'NO CAP', 62, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-1a9f3e02', 'A hidden Discord server is secretly funding a competitor', 'A hidden Discord server is secretly funding a competitor.', 'Crypto', 'CAP', 80, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-bdb2db22', 'Bitcoin was caught faking their speedrun', 'Bitcoin was caught faking their speedrun.', 'Science', 'NO CAP', 94, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b6bb3d8b', 'A popular YouTuber was banned for using aimbot', 'A popular YouTuber was banned for using aimbot.', 'Tech', 'HALF CAP', 86, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-0a30feff', 'A leaked iPhone design got hacked by a 12 year old', 'A leaked iPhone design got hacked by a 12 year old.', 'Tech', 'NO CAP', 43, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "HackerNews", "url": "https://news.ycombinator.com/item?id=123", "text": "Top post on HN discussed the implications."}]'::jsonb, true, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fb5d7552', 'A new VR headset was caught faking their speedrun', 'A new VR headset was caught faking their speedrun.', 'Tech', 'HALF CAP', 56, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-fa651686', 'Elon Musk just bought Twitter again', 'Elon Musk just bought Twitter again.', 'Internet Drama', 'CAP', 94, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-6d3947cb', 'A secret government project is secretly funding a competitor', 'A secret government project is secretly funding a competitor.', 'Gaming', 'NO CAP', 80, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-c00d02f2', 'A generic Reddit mod has been faking their videos', 'A generic Reddit mod has been faking their videos.', 'Gaming', 'CAP', 81, 'Upon investigation, it seems this is mostly cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is CAP.', '[{"name": "Twitter", "url": "https://twitter.com/user/status/123456", "text": "A tweet from a popular insider."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-b80d2135', 'MrBeast is actually two people', 'MrBeast is actually two people.', 'Tech', 'NO CAP', 45, 'Upon investigation, it seems this is mostly no cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is NO CAP.', '[{"name": "Reddit", "url": "https://reddit.com/r/gaming", "text": "A viral post with 50k upvotes claimed this."}]'::jsonb, false, 'published');
    
    INSERT INTO public.claims (slug, title, claim_text, category, verdict, confidence, reason_summary, details, sources, is_featured, status)
    VALUES ('claim-aa4400d8', 'Bitcoin got hacked by a 12 year old', 'Bitcoin got hacked by a 12 year old.', 'Tech', 'HALF CAP', 90, 'Upon investigation, it seems this is mostly half cap.', 'We checked multiple sources. Some said it''s true, some said it''s fake. The consensus is HALF CAP.', '[{"name": "Discord", "url": "https://discord.com/channels/123/456", "text": "Leaked screenshots from a private server."}]'::jsonb, false, 'published');
    COMMIT;

-- 2. GENERATE 5000+ UNIQUE VISITORS AND RANDOM ENGAGEMENT

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
