<div align="center">

# 🧢 CAP

**AI-Powered Real-Time Claim Verification Engine**

[![Built with React](https://img.shields.io/badge/React-19-61DAFB?logo=react&logoColor=white)](https://react.dev)
[![Styled with Tailwind](https://img.shields.io/badge/Tailwind_CSS-4-06B6D4?logo=tailwindcss&logoColor=white)](https://tailwindcss.com)
[![Powered by Gemini](https://img.shields.io/badge/Gemini_AI-API-4285F4?logo=google&logoColor=white)](https://ai.google.dev)
[![Backed by Supabase](https://img.shields.io/badge/Supabase-Database-3ECF8E?logo=supabase&logoColor=white)](https://supabase.com)
[![Voice by ElevenLabs](https://img.shields.io/badge/Voice-ElevenLabs-black?logo=elevenlabs&logoColor=white)](https://elevenlabs.io)
[![Scraping by Firecrawl](https://img.shields.io/badge/Scraping-Firecrawl-FF4500?logo=firecrawl&logoColor=white)](https://firecrawl.dev)

*Detect misinformation, hype, and hidden truths — instantly.*

</div>

---

## 📖 Overview

**CAP** is a next-generation claim verification platform that leverages the latest AI technology to scan the web in real-time, cross-reference sources, and issue verdicts on the accuracy of viral claims, news articles, and social media posts. Built for speed, transparency, and shareability, it aims to combat misinformation in the digital age.

Whether you're scrolling through social media or reading a news article, CAP empowers you to fact-check any claim instantly. Just paste a link, type a statement, or use voice input to receive a comprehensive, AI-backed verdict within seconds.

---

## ✨ Key Features

- **⚡ Real-Time Verification:** Submit any claim or URL and receive an AI-generated verdict backed by cross-referenced sources almost instantly.
- **🎙️ Voice Input (ElevenLabs):** Speak a claim directly into the app using integrated voice capture and playback powered by ElevenLabs.
- **🔍 Web Scraping (Firecrawl):** Powerful real-time web search and content extraction powered by Firecrawl to find receipts for any claim.
- **🧠 AI Analysis (Gemini):** Advanced natural language processing using Google's Gemini models to analyze discrepancies, contradictions, and sentiment.
- **📊 Discrepancy Analysis:** Automated identification of contradictions between claims and authoritative documentation.
- **🔗 Source Attribution:** Every verdict links to verified sources with inline citations and confidence scoring.
- **🏆 Top Caps Leaderboard:** A community-driven leaderboard surfacing the most delusional claims checked by the platform, ranked by laughs and shares.
- **📸 Shareable Verdicts:** Export beautifully designed verdict cards as images for frictionless sharing across social platforms.

---

## 🏗️ Architecture & Tech Stack

CAP is built using a modern, scalable, and highly responsive technology stack:

| Layer | Technology |
|---|---|
| **Frontend Framework** | React 19, TypeScript, Vite |
| **Styling & Animation** | Tailwind CSS 4, Motion (Framer Motion) |
| **Database & Auth** | Supabase (PostgreSQL), Edge Functions |
| **AI Inference Engine** | Google Gemini API (`@google/genai`) |
| **Voice Synthesis** | ElevenLabs API Integration |
| **Web Search & Scraping** | Firecrawl API |
| **Icons & UI Assets** | Lucide React |
| **Image Generation** | `html-to-image` for Shareable Cards |

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- **Node.js** ≥ 18.x
- **npm** ≥ 9.x (or `pnpm`/`yarn`)
- **Supabase CLI** (for local database and edge function development)

### Required API Keys

You will need accounts and API keys for the following services:

1.  **Google Gemini API:** [Get an API key here](https://aistudio.google.com/app/apikey)
2.  **Supabase:** [Create a project here](https://supabase.com/)
3.  **ElevenLabs:** [Get an API key here](https://elevenlabs.io/)
4.  **Firecrawl:** [Get an API key here](https://www.firecrawl.dev/)

### Installation & Setup

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-org/cap.git
    cd cap
    ```

2.  **Install dependencies:**

    ```bash
    npm install
    ```

3.  **Configure Environment Variables:**

    Copy the example environment file:
    ```bash
    cp .env.example .env.local
    ```

    Edit `.env.local` and add your frontend configuration (if any are required by your Vite setup).
    *Note: Sensitive API keys (Gemini, ElevenLabs, Firecrawl) should be set in your Supabase Edge Functions environment, not the frontend.*

4.  **Database Setup:**

    You need to set up the Supabase database using the provided SQL script.
    - Go to your Supabase project dashboard.
    - Navigate to the **SQL Editor**.
    - Copy the contents of `database_setup.sql` and run it to create the necessary tables (`claims`, `claim_metrics`, `claim_interactions`, `app_visitors`, `analytics_events`), functions, and policies.

    *(Optional)* To view analytics, use the queries in `analytics_queries.sql`.

5.  **Configure Supabase Edge Functions:**

    The backend logic lives in Supabase Edge Functions. You must provide the necessary secrets to your Supabase project.

    ```bash
    supabase secrets set GEMINI_API_KEY="your-gemini-key"
    supabase secrets set ELEVENLABS_API_KEY="your-elevenlabs-key"
    supabase secrets set ELEVENLABS_AGENT_ID="your-agent-id"
    supabase secrets set FIRECRAWL_API_KEY="your-firecrawl-key"
    ```

    Deploy the functions to your project:
    ```bash
    supabase functions deploy
    ```

6.  **Start the Development Server:**

    Run the dev script (`npm run` with `dev` argument) to start the development server.

    ```bash
    npm run dev &
    ```

    The application will be available at `http://localhost:3000`.

---

## 📂 Project Structure

```
cap/
├── public/                 # Static assets & favicon
├── scripts/                # Utility scripts
│   ├── seed-real-claims.ts # Script to seed the DB with initial claims
│   └── cleanup_caps.js     # DB cleanup utility
├── shared/                 # Shared types and constants between frontend & backend
│   ├── cap.ts              # API interfaces for claim checking
│   └── leaderboard.ts      # Leaderboard type definitions
├── src/                    # Frontend source code
│   ├── components/         # Reusable UI components (MicOrb, TrendCard, etc.)
│   ├── hooks/              # Custom React hooks (e.g., useCapVoiceSession)
│   ├── lib/                # Utilities, API clients (capApi, feedApi, supabase)
│   ├── App.tsx             # Main application component & routing logic
│   ├── index.css           # Global styles & Tailwind configuration
│   └── main.tsx            # Application entry point
├── supabase/               # Supabase configuration & Edge Functions
│   └── functions/
│       ├── check-claim/           # Core AI verification logic
│       ├── elevenlabs-signed-url/ # Voice session authentication
│       └── publish-claim/         # Logic for publishing claims to Top Caps
├── database_setup.sql      # Database schema & initial setup script
├── analytics_queries.sql   # SQL queries for tracking engagement
└── vite.config.ts          # Vite configuration
```

---

## 🛠️ Edge Functions Overview

The core verification logic runs securely in Supabase Edge Functions:

-   `check-claim`: Accepts a claim or URL, uses Firecrawl to search the web for context, and prompts Gemini to analyze the findings and return a structured verdict.
-   `elevenlabs-signed-url`: Securely generates signed URLs for the frontend to connect directly to the ElevenLabs Conversational AI agent.
-   `publish-claim`: Handles the submission of a locally-verified claim to the global "Top Caps" public leaderboard.

---

## 📜 Scripts

| Command | Description |
|---|---|
| `npm run build` | Create optimized production build |
| `npm run preview` | Preview production build locally |
| `npm run clean` | Remove build artifacts |
| `npm run lint` | Type-check with TypeScript compiler |
| `npm run seed:real-claims` | Seeds the database with sample/real claims using `tsx` |

---

## 📄 License

This project is proprietary software. All rights reserved.

---

<div align="center">
  <sub>Built with ❤️ by the CAP team</sub>
</div>
