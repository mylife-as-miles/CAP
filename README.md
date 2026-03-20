<div align="center">

# 🧢 CAP

**AI-Powered Real-Time Claim Verification Engine**

[![Built with React](https://img.shields.io/badge/React-19-61DAFB?logo=react&logoColor=white)](https://react.dev)
[![Styled with Tailwind](https://img.shields.io/badge/Tailwind_CSS-4-06B6D4?logo=tailwindcss&logoColor=white)](https://tailwindcss.com)
[![Powered by Gemini](https://img.shields.io/badge/Gemini_AI-API-4285F4?logo=google&logoColor=white)](https://ai.google.dev)
[![License](https://img.shields.io/badge/License-Private-red)]()

*Detect misinformation, hype, and hidden truths — instantly.*

</div>

---

## Overview

**CAP** is a next-generation claim verification platform that leverages AI to scan the web in real-time, cross-reference sources, and issue verdicts on the accuracy of viral claims, news articles, and social media posts. Built for speed, transparency, and shareability.

### Key Capabilities

- **Real-Time Verification** — Submit any claim or URL and receive an AI-generated verdict backed by cross-referenced sources within seconds.
- **Discrepancy Analysis** — Automated identification of contradictions between claims and authoritative documentation.
- **Source Attribution** — Every verdict links to verified sources with inline citations and confidence scoring.
- **Top Caps Leaderboard** — Community-driven leaderboard surfacing the most delusional claims checked by the platform.
- **Shareable Verdicts** — Export verdict cards as images for frictionless sharing across social platforms.
- **Voice Input** — Speak a claim directly using integrated voice capture powered by ElevenLabs.

---

## Tech Stack

| Layer | Technology |
|---|---|
| **Frontend** | React 19, TypeScript, Vite |
| **Styling** | Tailwind CSS 4, Motion (Framer Motion) |
| **AI Engine** | Google Gemini API |
| **Voice** | ElevenLabs Integration |
| **Web Scraping** | Firecrawl |
| **Icons** | Lucide React |
| **Export** | html-to-image |

---

## Getting Started

### Prerequisites

- **Node.js** ≥ 18.x
- **npm** ≥ 9.x
- A valid **Gemini API Key** ([Get one here](https://ai.google.dev))

### Installation

```bash
# Clone the repository
git clone https://github.com/your-org/cap.git
cd cap

# Install dependencies
npm install

# Configure environment variables
cp .env.example .env.local
```

Edit `.env.local` and set your API keys:

```env
GEMINI_API_KEY="your-gemini-api-key"
APP_URL="http://localhost:3000"
```

### Development

```bash
npm run dev
```

The application will be available at `http://localhost:3000`.

### Production Build

```bash
npm run build
npm run preview
```

---

## Project Structure

```
cap/
├── public/              # Static assets & favicon
├── src/
│   ├── components/      # Reusable UI components
│   │   ├── MicOrb.tsx   # Voice input orb animation
│   │   ├── Navigation.tsx # App header & navigation
│   │   └── TrendCard.tsx  # Trending claim cards
│   ├── lib/             # Utilities & helpers
│   ├── App.tsx          # Main application & screens
│   ├── index.css        # Global styles & design tokens
│   └── main.tsx         # Application entry point
├── index.html           # HTML entry point
├── vite.config.ts       # Vite configuration
├── tsconfig.json        # TypeScript configuration
└── package.json
```

---

## Environment Variables

| Variable | Required | Description |
|---|---|---|
| `GEMINI_API_KEY` | ✅ | Google Gemini API key for AI inference |
| `APP_URL` | ❌ | Application base URL (defaults to localhost) |

---

## Scripts

| Command | Description |
|---|---|
| `npm run dev` | Start development server on port 3000 |
| `npm run build` | Create optimized production build |
| `npm run preview` | Preview production build locally |
| `npm run clean` | Remove build artifacts |
| `npm run lint` | Type-check with TypeScript compiler |

---

## License

This project is proprietary software. All rights reserved.

---

<div align="center">
  <sub>Built with ❤️ by the CAP team</sub>
</div>
