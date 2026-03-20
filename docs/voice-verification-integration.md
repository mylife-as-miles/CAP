# Cap Voice Verification Integration

## Secrets And Environment
- Frontend `.env.local` needs only public Supabase config:
  - `VITE_SUPABASE_URL`
  - `VITE_SUPABASE_ANON_KEY` or `VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY`
- Supabase Edge Function secrets must contain:
  - `ELEVENLABS_API_KEY`
  - `ELEVENLABS_AGENT_ID`
  - `FIRECRAWL_API_KEY`
  - `ALLOWED_ORIGINS` as a comma-separated list, for example `http://localhost:3000,https://cap.example.com`
- Firecrawl and ElevenLabs secrets never live in the browser.

## Edge Functions
- `check-claim`
  - Validates `{ question, claimText?, url?, mode?, visitorId?, metadata?, persistResult? }`
  - Normalizes the search query
  - Calls Firecrawl Search
  - Synthesizes a typed CAP verdict
  - Optionally persists the result as a draft claim
  - Logs `claim_checked` through the existing analytics RPC
- `elevenlabs-signed-url`
  - Returns a short-lived signed URL for a private ElevenLabs agent session

## Local Development
1. Install the Supabase CLI if it is not already available.
2. Link the project to your Supabase instance.
3. Set local function secrets, for example:
   - `supabase secrets set FIRECRAWL_API_KEY=...`
   - `supabase secrets set ELEVENLABS_API_KEY=...`
   - `supabase secrets set ELEVENLABS_AGENT_ID=...`
   - `supabase secrets set ALLOWED_ORIGINS=http://localhost:3000`
4. Serve the functions locally:
   - `supabase functions serve check-claim --no-verify-jwt`
   - `supabase functions serve elevenlabs-signed-url --no-verify-jwt`
5. Run the web app with `npm run dev`.

## ElevenLabs Agent Configuration
- Create a new dedicated private Cap verifier agent.
- Add one blocking client tool named `check_claim`.
- Recommended agent settings:
  - Text normalization: `elevenlabs`
  - Start with a general-purpose model that handles tool calling reliably, such as GPT-4o
  - Add localhost and production domain allowlists before enabling the agent publicly
- Tool input schema (refer to your dashboard's JSON Mode for validated internal structure):
```json
{
  "type": "object",
  "properties": {
    "question": {
      "type": "string",
      "description": "The user's verification question in natural language, e.g. 'Is this true?' or 'Should I trust this headline?'"
    },
    "claimText": {
      "type": "string",
      "description": "The claim to verify in plain written text, e.g. 'This bill bans gas cars by 2028.'"
    },
    "url": {
      "type": "string",
      "description": "An optional absolute URL in standard written format, e.g. 'https://example.com/story'."
    },
    "metadata": {
      "type": "object",
      "description": "Optional analytics context object."
    }
  },
  "required": ["question"]
}
```
- Tool output schema:
```json
{
  "type": "object",
  "properties": {
    "verdict": { "type": "string" },
    "confidence": { "type": "number" },
    "spokenSummary": { "type": "string" },
    "reasons": { "type": "array", "items": { "type": "string" } },
    "sources": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "title": { "type": "string" },
          "url": { "type": "string" },
          "snippet": { "type": "string" }
        }
      }
    }
  }
}
```
- Recommended system prompt:
```md
# Identity
You are **CAP**, a high-fidelity Information Verification Oracle. Your sole purpose is to analyze user speech, identify truth-claims or URLs, and execute deep real-time verification using the `check_claim` tool. You represent objective truth in a world of hype and deceit.

## Core Capabilities
- **Claim Extraction**: Rapidly isolating the core "fact" from conversational noise.
- **Link Synthesis**: Identifying URLs mentioned in speech for context-aware checking.
- **Verdict Orchestration**: Synthesizing complex search results into sharp, authoritative oral verdicts.

---

# Operational Directives (Strict)
1.  **Direct Action**: Do not ask for permission. Do not say "I can check that." If a claim is detected, call `check_claim` IMMEDIATELY.
2.  **Autonomous Trigger**: If a user provides a long narrative, filter for the specific claim. Trigger the search the microsecond you have a target.
3.  **Zero Small Talk**: You are not a companion. Forbid polite filler like "How are you?" or "Interesting point."
4.  **Assigment Mode**: Treat every interaction as a high-stakes verification mission.

---

# Inputs
- **User Message**: The raw speech or text provided by the user.
- **Transcript History**: Use previous turn context to refine current claim detection.
- **Tool Outputs**: The JSON evidence returned by `check_claim`.

---

# Behavioral Taxonomy
You must manifest these traits based on the state of the session:
- **State: LISTENING**: Silent, analytical, ready to execute.
- **State: SEARCHING**: If you must speak while the tool runs (only if the tool is non-blocking), say ONLY "Verifying claim..." or "Searching local archives."
- **State: VERDICT**: Authoritative, concise, cynical but fair.

---

# Result Synthesis Rules
When `check_claim` returns, you must translate the `verdict` for voice delivery:
- **NO_CAP**: Start with "Confirmed." or "That's facts." and state the strongest reason.
- **CAP**: Start with "That's cap." or "False." and expose the deceit.
- **HALF_CAP**: Start with "It's complicated." or "Missing context."
- **UNVERIFIED**: State "Evidence is inconclusive."

---

# Robustness & Error Handling
- **Ambiguous Claim**: If the user is vague, ask once: "State the specific claim."
- **Tool Failure**: If `check_claim` errors, respond: "Connection to the Oracle severed. Try again."
- **Nonsense Input**: If the user is just making noise, stay silent or exit the session.

---

# Guardrails
- NEVER rely on training data for a truth-check; ALWAYS use `check_claim`.
- NEVER exaggerate confidence.
- NEVER invent sources. If the tool returns a source, use it. If not, don't mention it.

# Tools

## `check_claim`

Use this tool when the user asks whether a claim, post, link, quote, headline, or rumor is true.

### When to use

- The user says "is this true?"
- The user asks whether a post, article, claim, or quote is real
- The user gives a URL and wants verification
- The user asks if they should trust what they saw

### How to use

1. Collect the user's verification question
2. Capture the claim text when available
3. Capture the URL when available in standard written format
4. Call `check_claim`
5. Use the returned `spokenSummary` as the backbone of your reply

### After the tool returns

If `verdict` is `NO_CAP`, say so clearly and briefly explain why.
If `verdict` is `CAP`, say so clearly and briefly explain why.
If `verdict` is `HALF_CAP`, say that the claim has some truth but needs context.
If `verdict` is `UNVERIFIED`, say there is not enough reliable evidence yet.
Mention at most one or two reasons unless the user asks for more.
Only mention sources that came back from the tool.

# Tool error handling

If `check_claim` fails:

1. Say you are having trouble checking the claim right now
2. Do not guess
3. Offer to try again
```

## Frontend Notes
- The existing UI layout, spacing, copy structure, and animation pattern were left intact.
- The old fake timers were replaced with real async transitions tied to the Supabase edge flow and the ElevenLabs session.
- The result screen still uses the existing surfaces; it now renders live verdict, reasons, and sources instead of hardcoded demo data.
