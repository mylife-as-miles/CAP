import type {
  InvestigationResult,
  NotificationItem,
  PersistedState,
  ProfileSettings,
  TopCapEntry,
} from '@/src/types';
import {mapResultToTopCapEntry} from '@/src/lib/cap-utils';

const now = Date.now();
const hours = (count: number) => new Date(now - count * 60 * 60 * 1000).toISOString();
const days = (count: number) => new Date(now - count * 24 * 60 * 60 * 1000).toISOString();

export const HERO_CHIPS = [
  'Is this true?',
  'Red flags in this story',
  'Should I trust this claim?',
];

export const LISTENING_TAGS = [
  'Sports rumor',
  'Viral TikTok claim',
  'Breaking-news headline',
];

export const TOP_CAP_SORT_OPTIONS = ['Shares', 'Laughed At', 'Date Added'] as const;
export const TOP_CAP_CATEGORIES = ['All', 'Health', 'Tech', 'Science', 'Politics', 'Economics'] as const;

export const DEFAULT_PROFILE: ProfileSettings = {
  displayName: 'Cap Explorer',
  avatarSeed: 'cap-core',
  enableAlerts: true,
  preferNativeShare: true,
  reduceMotion: false,
};

const seedResultsBase: InvestigationResult[] = [
  {
    id: 'seed-salt-water',
    input: {
      kind: 'claim',
      value: 'Drinking 4L of salt water cures all winter fatigue instantly.',
      source: 'trend',
      submittedAt: hours(2),
    },
    title: 'Drinking 4L of salt water cures all winter fatigue instantly.',
    verdict: 'CAP',
    confidence: 97,
    summary:
      'The claim relies on extreme medical advice and is contradicted by mainstream health guidance on sodium intake and dehydration risk.',
    category: 'Health',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Absolute medical promise',
        text: '“Cures all” and “instantly” are classic overclaim signals for health misinformation.',
      },
      {
        title: 'Known safety risk',
        text: 'High salt-water intake can worsen dehydration and create dangerous electrolyte imbalance.',
      },
    ],
    evidence: [
      'Credible health sources describe excessive sodium consumption as a risk, not a fatigue cure.',
      'The claim does not identify a trial, physician, or public dataset supporting the dosage.',
      'The advice spreads mostly through reposts and anecdotal clips rather than primary guidance.',
    ],
    sources: [
      {
        name: 'World Health Organization',
        url: 'https://www.who.int',
        text: 'Guidance on sodium intake and health outcomes.',
      },
      {
        name: 'Mayo Clinic',
        url: 'https://www.mayoclinic.org',
        text: 'Overview of dehydration and electrolyte imbalance risks.',
      },
    ],
    citations: [
      {name: 'World Health Organization', url: 'https://www.who.int'},
      {name: 'Mayo Clinic', url: 'https://www.mayoclinic.org'},
    ],
    sourceCount: 2,
    queryLog: ['salt water fatigue cure health guidance', 'sodium dehydration risks'],
    analyzedAt: hours(2),
    shares: 8400,
    laughedAt: 12000,
    isFlagged: false,
    savedToTopCaps: true,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-onions',
    input: {
      kind: 'claim',
      value: 'Eating raw onions before bed prevents all seasonal allergies.',
      source: 'trend',
      submittedAt: hours(7),
    },
    title: 'Eating raw onions before bed prevents all seasonal allergies.',
    verdict: 'CAP',
    confidence: 94,
    summary:
      'This claim has no clinical support and treats a broad allergy condition as if it has a simple household cure.',
    category: 'Health',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'No clinical basis cited',
        text: 'The claim offers no study, trial, or professional recommendation to support onion-based allergy prevention.',
      },
      {
        title: 'Overgeneralized outcome',
        text: 'Seasonal allergies vary by trigger and severity, so “prevents all” is especially weak language.',
      },
    ],
    evidence: [
      'Specialist allergy guidance does not list raw onions as a validated preventative treatment.',
      'The claim is framed as a universal remedy without dosage, patient criteria, or evidence chain.',
    ],
    sources: [
      {
        name: 'AAAAI',
        url: 'https://www.aaaai.org',
        text: 'Allergy prevention and symptom-management guidance.',
      },
    ],
    citations: [{name: 'AAAAI', url: 'https://www.aaaai.org'}],
    sourceCount: 1,
    queryLog: ['raw onion seasonal allergies evidence'],
    analyzedAt: hours(7),
    shares: 5200,
    laughedAt: 8000,
    isFlagged: false,
    savedToTopCaps: true,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-5g-cold',
    input: {
      kind: 'claim',
      value: '5G towers are responsible for the new strain of the common cold.',
      source: 'trend',
      submittedAt: hours(12),
    },
    title: '5G towers are responsible for the new strain of the common cold.',
    verdict: 'CAP',
    confidence: 99,
    summary:
      'The claim confuses radio infrastructure with viral disease transmission and matches a recurring debunked conspiracy pattern.',
    category: 'Tech',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Mechanism mismatch',
        text: 'Viruses spread biologically, not through radiofrequency network equipment.',
      },
      {
        title: 'Conspiracy framing',
        text: 'The statement replaces epidemiology with unsupported telecommunications blame.',
      },
    ],
    evidence: [
      'Public-health explanations for common cold transmission center on respiratory spread and contact.',
      'Telecom safety and spectrum material do not support disease-creation claims.',
    ],
    sources: [
      {name: 'CDC', url: 'https://www.cdc.gov', text: 'Common cold transmission basics.'},
      {name: 'FCC', url: 'https://www.fcc.gov', text: '5G and radiofrequency guidance.'},
    ],
    citations: [
      {name: 'CDC', url: 'https://www.cdc.gov'},
      {name: 'FCC', url: 'https://www.fcc.gov'},
    ],
    sourceCount: 2,
    queryLog: ['5G common cold claim', 'how common cold spreads'],
    analyzedAt: hours(12),
    shares: 4100,
    laughedAt: 15000,
    isFlagged: false,
    savedToTopCaps: true,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-microwave',
    input: {
      kind: 'claim',
      value: 'You can charge your phone by putting it in the microwave for 30 seconds.',
      source: 'trend',
      submittedAt: days(1),
    },
    title: 'You can charge your phone by putting it in the microwave for 30 seconds.',
    verdict: 'CAP',
    confidence: 99,
    summary:
      'This is a long-running prank claim. Microwaving electronics damages the device and can create a fire hazard.',
    category: 'Tech',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Unsafe device advice',
        text: 'Microwaves are not designed to charge consumer electronics and can destroy internal components.',
      },
      {
        title: 'No real charging pathway',
        text: 'The claim offers no plausible electrical mechanism that would safely recharge a battery.',
      },
    ],
    evidence: [
      'Safety guidance consistently warns against putting electronics in microwaves.',
      'The claim survives as a meme because it sounds surprising, not because it works.',
    ],
    sources: [
      {
        name: 'Consumer Reports',
        url: 'https://www.consumerreports.org',
        text: 'Household safety guidance on electronics and fire risks.',
      },
    ],
    citations: [{name: 'Consumer Reports', url: 'https://www.consumerreports.org'}],
    sourceCount: 1,
    queryLog: ['microwave phone charging hoax'],
    analyzedAt: days(1),
    shares: 3800,
    laughedAt: 22000,
    isFlagged: false,
    savedToTopCaps: true,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-sun-gazing',
    input: {
      kind: 'claim',
      value: 'Staring at the sun for 5 minutes a day improves your vision.',
      source: 'trend',
      submittedAt: days(1),
    },
    title: 'Staring at the sun for 5 minutes a day improves your vision.',
    verdict: 'CAP',
    confidence: 98,
    summary:
      'The claim is contradicted by eye-safety guidance and promotes a practice associated with retinal damage.',
    category: 'Health',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Harms mistaken for benefits',
        text: 'Direct sun exposure can injure the retina rather than improve eyesight.',
      },
      {
        title: 'No protective context',
        text: 'The claim omits the risks and lacks any clinical basis for recommending the behavior.',
      },
    ],
    evidence: [
      'Eye-health organizations warn against looking directly at the sun without proper protection.',
      'The claim uses wellness language without identifying research or specialist endorsement.',
    ],
    sources: [
      {
        name: 'American Academy of Ophthalmology',
        url: 'https://www.aao.org',
        text: 'Solar retinopathy and sun-exposure risks.',
      },
    ],
    citations: [{name: 'American Academy of Ophthalmology', url: 'https://www.aao.org'}],
    sourceCount: 1,
    queryLog: ['sun gazing vision benefits', 'solar retinopathy risk'],
    analyzedAt: days(1),
    shares: 2900,
    laughedAt: 9500,
    isFlagged: false,
    savedToTopCaps: true,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-flat-earth',
    input: {
      kind: 'claim',
      value: 'The earth is actually flat and Australia is a hoax.',
      source: 'trend',
      submittedAt: days(2),
    },
    title: 'The earth is actually flat and Australia is a hoax.',
    verdict: 'CAP',
    confidence: 99,
    summary:
      'This bundles multiple disproven conspiracy claims into one statement and conflicts with basic observable evidence.',
    category: 'Science',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Observable reality conflict',
        text: 'Both satellite imagery and everyday geography contradict the premise.',
      },
      {
        title: 'Compound conspiracy structure',
        text: 'The statement relies on stacking unrelated hoaxes to increase emotional punch instead of evidence.',
      },
    ],
    evidence: [
      'Publicly observable geography, government records, and space imagery contradict the claim.',
      'The claim provides no verifiable source material beyond conspiratorial retellings.',
    ],
    sources: [
      {name: 'NASA', url: 'https://www.nasa.gov', text: 'Earth imagery and mission archives.'},
      {
        name: 'Australian Government',
        url: 'https://www.australia.gov.au',
        text: 'Official national information and services.',
      },
    ],
    citations: [
      {name: 'NASA', url: 'https://www.nasa.gov'},
      {name: 'Australian Government', url: 'https://www.australia.gov.au'},
    ],
    sourceCount: 2,
    queryLog: ['flat earth claim evidence', 'Australia hoax debunk'],
    analyzedAt: days(2),
    shares: 1500,
    laughedAt: 35000,
    isFlagged: false,
    savedToTopCaps: true,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-gas-ban',
    input: {
      kind: 'claim',
      value: 'New legislation will ban all gas-powered vehicles by 2028.',
      source: 'trend',
      submittedAt: hours(18),
    },
    title: 'New legislation will ban all gas-powered vehicles by 2028.',
    verdict: 'MIXED',
    confidence: 74,
    summary:
      'The claim likely stems from a real policy discussion, but the phrasing overstates what proposed legislation usually says.',
    category: 'Politics',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Proposal versus final law',
        text: 'Posts often collapse proposals, targets, and incentives into a hard ban that may not exist in the text.',
      },
      {
        title: 'Scope inflation',
        text: '“All gas-powered vehicles” is broader than many transportation bills or regional mandates actually are.',
      },
    ],
    evidence: [
      'Vehicle policy claims require reading the bill text, jurisdiction, and implementation timeline.',
      'Secondary posts often strip out carve-outs, exemptions, and proposed-only status.',
    ],
    sources: [
      {name: 'GovTrack', url: 'https://www.govtrack.us', text: 'US federal bill tracking.'},
      {name: 'Reuters', url: 'https://www.reuters.com', text: 'Policy and legislative reporting.'},
    ],
    citations: [
      {name: 'GovTrack', url: 'https://www.govtrack.us'},
      {name: 'Reuters', url: 'https://www.reuters.com'},
    ],
    sourceCount: 2,
    queryLog: ['gas vehicle ban 2028 legislation'],
    analyzedAt: hours(18),
    shares: 6000,
    laughedAt: 2000,
    isFlagged: false,
    savedToTopCaps: true,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-housing',
    input: {
      kind: 'claim',
      value: 'New housing starts in the metro area hit a 10-year high this June.',
      source: 'trend',
      submittedAt: days(3),
    },
    title: 'New housing starts in the metro area hit a 10-year high this June.',
    verdict: 'MIXED',
    confidence: 67,
    summary:
      'This sounds plausible but still needs direct sourcing. Local economic headlines often overstate a trend without the underlying series.',
    category: 'Economics',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Missing dataset citation',
        text: 'A “10-year high” claim should identify the metro area, dataset owner, and comparison range.',
      },
      {
        title: 'Headline compression',
        text: 'A monthly spike can be real while still failing to support the broader framing in reposted summaries.',
      },
    ],
    evidence: [
      'Housing-start claims require a named market, date range, and comparison methodology.',
      'The absence of a primary chart or release makes the claim harder to trust at face value.',
    ],
    sources: [
      {name: 'US Census Bureau', url: 'https://www.census.gov', text: 'Housing and construction releases.'},
      {name: 'Reuters', url: 'https://www.reuters.com', text: 'Economic coverage and market context.'},
    ],
    citations: [
      {name: 'US Census Bureau', url: 'https://www.census.gov'},
      {name: 'Reuters', url: 'https://www.reuters.com'},
    ],
    sourceCount: 2,
    queryLog: ['metro housing starts 10 year high June'],
    analyzedAt: days(3),
    shares: 2200,
    laughedAt: 1200,
    isFlagged: false,
    savedToTopCaps: false,
    note: 'Reference result bundled with the app.',
  },
  {
    id: 'seed-exoplanet',
    input: {
      kind: 'claim',
      value: 'Astronomers discover a new exoplanet with water vapor in its atmosphere.',
      source: 'trend',
      submittedAt: days(4),
    },
    title: 'Astronomers discover a new exoplanet with water vapor in its atmosphere.',
    verdict: 'FACTS',
    confidence: 72,
    summary:
      'This is the kind of claim that can be legitimate, but it still depends on the linked study or observatory release for the exact wording.',
    category: 'Science',
    mode: 'fallback',
    discrepancies: [
      {
        title: 'Scientific nuance matters',
        text: 'Terms like “discover,” “water vapor,” and “atmosphere” can each have precise meanings in the underlying paper.',
      },
      {
        title: 'Needs source paper',
        text: 'The claim is credible-sounding but should still be tied to a mission team, preprint, or journal release.',
      },
    ],
    evidence: [
      'Exoplanet atmosphere stories are common in observatory and journal announcements.',
      'The wording should be cross-checked against the original release to avoid exaggeration.',
    ],
    sources: [
      {name: 'NASA Exoplanets', url: 'https://exoplanets.nasa.gov', text: 'Mission updates and discovery summaries.'},
      {name: 'ESA', url: 'https://www.esa.int', text: 'Observatory and space-science releases.'},
    ],
    citations: [
      {name: 'NASA Exoplanets', url: 'https://exoplanets.nasa.gov'},
      {name: 'ESA', url: 'https://www.esa.int'},
    ],
    sourceCount: 2,
    queryLog: ['exoplanet water vapor discovery'],
    analyzedAt: days(4),
    shares: 1800,
    laughedAt: 400,
    isFlagged: false,
    savedToTopCaps: false,
    note: 'Reference result bundled with the app.',
  },
];

export const SEED_RESULTS = seedResultsBase.map((result) => ({...result}));

export const DEFAULT_NOTIFICATIONS: NotificationItem[] = [
  {
    id: 'system-ready',
    type: 'system',
    title: 'CAP CORE is ready',
    message: 'Live analysis uses Gemini when a key is available. Otherwise the app stays functional in fallback mode.',
    createdAt: hours(1),
    isRead: false,
  },
];

export const SEED_TOP_CAPS: TopCapEntry[] = SEED_RESULTS.filter((result) => result.savedToTopCaps).map((result) =>
  mapResultToTopCapEntry(result, result.analyzedAt),
);

function clone<T>(value: T): T {
  return JSON.parse(JSON.stringify(value)) as T;
}

export function createDefaultPersistedState(): PersistedState {
  return {
    investigations: clone(SEED_RESULTS),
    history: [],
    topCaps: clone(SEED_TOP_CAPS),
    notifications: clone(DEFAULT_NOTIFICATIONS),
    followedCategories: ['Health'],
    profile: clone(DEFAULT_PROFILE),
  };
}
