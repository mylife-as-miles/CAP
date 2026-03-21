import { createClient } from 'npm:@supabase/supabase-js@2';
import {
  createClaimSlug,
  type CheckClaimError,
  type PublishClaimInput,
  type PublishClaimResponse,
} from '../../../shared/cap.ts';
import { createCorsHeaders } from '../_shared/cors.ts';

type ParsedPublishInput = PublishClaimInput;

function errorResponse(message: string, origin: string | null, status = 400, retryable = false) {
  const headers = createCorsHeaders(origin);
  const body: CheckClaimError = {
    error: {
      code: status >= 500 ? 'UPSTREAM_ERROR' : 'VALIDATION_ERROR',
      message,
      retryable,
    },
  };

  if (!headers) {
    return new Response(JSON.stringify(body), {
      status: 403,
      headers: {
        'Content-Type': 'application/json',
      },
    });
  }

  return new Response(JSON.stringify(body), {
    status,
    headers,
  });
}

function successResponse(body: PublishClaimResponse, origin: string | null) {
  const headers = createCorsHeaders(origin);
  if (!headers) {
    return errorResponse('Origin not allowed.', origin, 403);
  }

  return new Response(JSON.stringify(body), {
    status: 200,
    headers,
  });
}

function normalizeString(value: unknown) {
  return typeof value === 'string' ? value.trim() : '';
}

function parseInput(body: unknown): ParsedPublishInput | CheckClaimError {
  if (!body || typeof body !== 'object' || Array.isArray(body)) {
    return {
      error: {
        code: 'VALIDATION_ERROR',
        message: 'Request body must be a JSON object.',
        retryable: false,
      },
    };
  }

  const payload = body as Record<string, unknown>;
  const visitorId = normalizeString(payload.visitorId);
  const checkedAt = normalizeString(payload.checkedAt);
  const question = normalizeString(payload.question);
  const claimText = normalizeString(payload.claimText);
  const category = normalizeString(payload.category);
  const url = normalizeString(payload.url);
  const mode = normalizeString(payload.mode) === 'voice' ? 'voice' : 'manual';
  const result = payload.result;

  if (!visitorId || !checkedAt || !question || !claimText || !result || typeof result !== 'object' || Array.isArray(result)) {
    return {
      error: {
        code: 'VALIDATION_ERROR',
        message: 'visitorId, checkedAt, question, claimText, and result are required.',
        retryable: false,
      },
    };
  }

  const snapshot = result as Record<string, unknown>;
  const verdict = normalizeString(snapshot.verdict);
  const summary = normalizeString(snapshot.summary);
  const verdictExplanation = normalizeString(snapshot.verdictExplanation);
  const sourceClaimText = normalizeString(snapshot.claimText);
  const analysisCards = Array.isArray(snapshot.analysisCards) ? snapshot.analysisCards : [];
  const sources = Array.isArray(snapshot.sources) ? snapshot.sources : [];
  const confidence = typeof snapshot.confidence === 'number' ? Math.max(0, Math.min(100, Math.round(snapshot.confidence))) : NaN;

  if (!sourceClaimText || !verdict || Number.isNaN(confidence)) {
    return {
      error: {
        code: 'VALIDATION_ERROR',
        message: 'The result snapshot is missing required claim data.',
        retryable: false,
      },
    };
  }

  if (!['CAP', 'NO CAP', 'HALF CAP'].includes(verdict)) {
    return {
      error: {
        code: 'VALIDATION_ERROR',
        message: 'Only verified verdicts can be added to Top Caps.',
        retryable: false,
      },
    };
  }

  return {
    checkedAt,
    category: category || undefined,
    claimText,
    mode,
    question,
    result: {
      analysisCards: analysisCards.map((card) => ({
        id: normalizeString((card as Record<string, unknown>).id),
        text: normalizeString((card as Record<string, unknown>).text),
        title: normalizeString((card as Record<string, unknown>).title),
      })),
      claimText: sourceClaimText,
      confidence,
      sources: sources.map((source) => ({
        name: normalizeString((source as Record<string, unknown>).name),
        text: normalizeString((source as Record<string, unknown>).text),
        url: normalizeString((source as Record<string, unknown>).url),
      })).filter((source) => source.url),
      summary,
      verdict: verdict as ParsedPublishInput['result']['verdict'],
      verdictExplanation,
    },
    url: url || undefined,
    visitorId,
  };
}

function buildSupabaseAdminClient() {
  const url = Deno.env.get('SUPABASE_URL');
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');

  if (!url || !serviceRoleKey) {
    return null;
  }

  return createClient(url, serviceRoleKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}

function buildClaimTitle(input: ParsedPublishInput) {
  const title = input.result.claimText || input.claimText || input.question;
  return title.length > 96 ? `${title.slice(0, 93)}...` : title;
}

function buildReasonSummary(input: ParsedPublishInput) {
  return input.result.analysisCards
    .map((card) => card.text.trim())
    .find(Boolean) || input.result.summary || input.result.verdictExplanation;
}

function buildDetails(input: ParsedPublishInput) {
  const parts = [
    input.result.summary,
    input.result.verdictExplanation,
    ...input.result.analysisCards.map((card) => card.text),
  ]
    .map((value) => value.trim())
    .filter(Boolean);

  return [...new Set(parts)].join(' ');
}

async function readMetrics(client: ReturnType<typeof buildSupabaseAdminClient>, claimId: string) {
  if (!client) {
    return {
      laughCount: 0,
      shareCount: 0,
      viewCount: 0,
    };
  }

  const { data: metrics } = await client
    .from('claim_metrics')
    .select('laugh_count, share_count, view_count')
    .eq('claim_id', claimId)
    .maybeSingle();

  if (!metrics) {
    await client.from('claim_metrics').upsert({
      claim_id: claimId,
      laugh_count: 0,
      share_count: 0,
      view_count: 0,
    });

    return {
      laughCount: 0,
      shareCount: 0,
      viewCount: 0,
    };
  }

  return {
    laughCount: metrics.laugh_count ?? 0,
    shareCount: metrics.share_count ?? 0,
    viewCount: metrics.view_count ?? 0,
  };
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
    return errorResponse('Only POST requests are supported.', origin, 405);
  }

  const parsed = parseInput(await request.json().catch(() => null));
  if ('error' in parsed) {
    return errorResponse(parsed.error.message, origin, 400, parsed.error.retryable);
  }

  const client = buildSupabaseAdminClient();
  if (!client) {
    return errorResponse('Supabase service role configuration is missing.', origin, 500, true);
  }

  const slug = createClaimSlug(parsed.claimText);
  const { data: existing, error: lookupError } = await client
    .from('claims')
    .select('id, status')
    .eq('slug', slug)
    .maybeSingle();

  if (lookupError) {
    return errorResponse('Cap could not check for an existing Top Cap entry.', origin, 500, true);
  }

  let claimId = existing?.id ?? null;
  let created = false;

  const claimRecord = {
    category: parsed.category || (parsed.mode === 'voice' ? 'Voice Check' : 'Manual Check'),
    claim_text: parsed.result.claimText,
    confidence: parsed.result.confidence,
    details: buildDetails(parsed),
    is_featured: false,
    reason_summary: buildReasonSummary(parsed),
    slug,
    source_url: parsed.url ?? parsed.result.sources[0]?.url ?? null,
    sources: parsed.result.sources,
    status: 'published',
    title: buildClaimTitle(parsed),
    verdict: parsed.result.verdict,
  };

  let upserted;
  let upsertError;

  try {
    const response = await client
      .from('claims')
      .upsert(claimRecord, { onConflict: 'slug' })
      .select('id, status')
      .single();
    upserted = response.data;
    upsertError = response.error;
  } catch (err) {
    console.error('[publish-claim] Unexpected error during upsert:', err);
    return errorResponse(`Unexpected internal error: ${err instanceof Error ? err.message : String(err)}`, origin, 500, false);
  }

  if (upsertError || !upserted?.id) {
    console.error('[publish-claim] Upsert failed:', upsertError);
    return errorResponse(
      `Cap could not publish or update this claim: ${upsertError?.message || 'Unknown database error'}`,
      origin,
      500,
      true
    );
  }

  claimId = upserted.id;
  created = !existing; // Fallback for 'created' flag logic

  const metrics = await readMetrics(client, claimId);

  return successResponse({
    claimId,
    created,
    metrics,
  }, origin);
});
