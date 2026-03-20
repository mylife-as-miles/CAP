import { createCorsHeaders } from '../_shared/cors.ts';

function jsonResponse(body: unknown, status: number, origin: string | null) {
  const headers = createCorsHeaders(origin);
  if (!headers) {
    return new Response(
      JSON.stringify({
        error: {
          code: 'UPSTREAM_ERROR',
          message: 'Origin not allowed.',
          retryable: false,
        },
      }),
      {
        status: 403,
        headers: {
          'Content-Type': 'application/json',
        },
      },
    );
  }

  return new Response(JSON.stringify(body), {
    status,
    headers,
  });
}

Deno.serve(async (request) => {
  const origin = request.headers.get('origin');

  if (request.method === 'OPTIONS') {
    const headers = createCorsHeaders(origin);
    return headers
      ? new Response('ok', { headers })
      : new Response('Origin not allowed.', { status: 403 });
  }

  if (request.method !== 'POST') {
    return jsonResponse(
      {
        error: {
          code: 'VALIDATION_ERROR',
          message: 'Only POST requests are supported.',
          retryable: false,
        },
      },
      405,
      origin,
    );
  }

  const agentId = Deno.env.get('ELEVENLABS_AGENT_ID');
  const apiKey = Deno.env.get('ELEVENLABS_API_KEY');

  if (!agentId || !apiKey) {
    return jsonResponse(
      {
        error: {
          code: 'UPSTREAM_ERROR',
          message: 'ElevenLabs credentials are not configured in Supabase secrets.',
          retryable: false,
        },
      },
      500,
      origin,
    );
  }

  const response = await fetch(
    `https://api.elevenlabs.io/v1/convai/conversation/get-signed-url?agent_id=${encodeURIComponent(agentId)}`,
    {
      headers: {
        'xi-api-key': apiKey,
      },
      method: 'GET',
    },
  );

  if (!response.ok) {
    return jsonResponse(
      {
        error: {
          code: 'UPSTREAM_ERROR',
          message: 'Cap could not start a private ElevenLabs session.',
          retryable: response.status >= 500,
        },
      },
      502,
      origin,
    );
  }

  const payload = await response.json() as { signed_url?: string };
  if (!payload.signed_url) {
    return jsonResponse(
      {
        error: {
          code: 'UPSTREAM_ERROR',
          message: 'ElevenLabs did not return a signed URL.',
          retryable: true,
        },
      },
      502,
      origin,
    );
  }

  return jsonResponse(
    {
      signedUrl: payload.signed_url,
    },
    200,
    origin,
  );
});
