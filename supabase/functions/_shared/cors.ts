const DEFAULT_ALLOWED_ORIGINS = [
  'http://localhost:3000',
  'http://127.0.0.1:3000',
  'https://cap-khaki.vercel.app',
];

function getAllowedOrigins() {
  const configuredOrigins = (Deno.env.get('ALLOWED_ORIGINS') ?? '')
    .split(',')
    .map((origin) => origin.trim())
    .filter(Boolean);
  const appUrl = Deno.env.get('APP_URL')?.trim();

  return new Set([
    ...DEFAULT_ALLOWED_ORIGINS,
    ...(appUrl ? [appUrl] : []),
    ...configuredOrigins,
  ]);
}

export function resolveCorsOrigin(origin: string | null) {
  if (!origin) {
    return DEFAULT_ALLOWED_ORIGINS[0];
  }

  const allowedOrigins = getAllowedOrigins();

  // Support wildcard '*' to allow any origin (echoes back the incoming origin)
  if (allowedOrigins.has('*')) {
    return origin;
  }

  return allowedOrigins.has(origin) ? origin : null;
}

export function createCorsHeaders(origin: string | null) {
  const resolvedOrigin = resolveCorsOrigin(origin);

  if (!resolvedOrigin) {
    return null;
  }

  return {
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
    'Access-Control-Allow-Origin': resolvedOrigin,
    'Access-Control-Max-Age': '86400',
    'Content-Type': 'application/json',
    Vary: 'Origin',
  };
}
