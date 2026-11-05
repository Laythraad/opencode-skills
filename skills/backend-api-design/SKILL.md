---
name: Backend API Design
description: Design or audit HTTP/REST, GraphQL, or RPC APIs — resources, errors, pagination, versioning, idempotency, auth. Use when adding endpoints or defining a public contract.
---

# Backend API Design

## Workflow

1. **Name the consumer and the job-to-be-done.** Client type (web, mobile, third party), call frequency, payload size, offline needs. These decide the shape more than style guides do.
2. **Model resources and state transitions**, not CRUD verbs. Every mutation should be expressible as a transition with preconditions.
3. **Choose the style** deliberately:

   | Need | Style |
   | --- | --- |
   | Resource CRUD, cacheable, broad clients | REST + JSON |
   | Aggregated views, many client shapes | GraphQL (with persisted queries + depth limits) |
   | Low-latency internal, typed contracts | gRPC / tRPC |
   | Fire-and-forget, long-running | Async job API (`202` + job resource + webhook) |

4. **Fix the cross-cutting contract once**: auth scheme, error envelope, pagination, filtering, sorting, idempotency, rate limits, timestamps (RFC 3339 UTC), money (integer minor units + currency), IDs (opaque strings, never auto-increment in public APIs).
5. **Write the spec** (OpenAPI 3.1 / SDL) before implementation. Generate clients and tests from it.
6. **Define the compatibility policy** and enforce it in CI.

## Non-negotiables

- **Idempotency**: `Idempotency-Key` header on all non-idempotent POSTs; store key → response hash for ≥24h; replay returns the original response.
- **Pagination**: cursor-based (`?cursor=&limit=`) for anything that can grow. Cap `limit`. Return `next_cursor: null` at the end. Offset pagination only for small, stable, admin datasets.
- **Errors**: stable machine `code`, human `message`, optional `details[]` with `field` + `reason`, and a `request_id`. Never leak stack traces or SQL.
- **Status codes**: 400 malformed, 401 unauthenticated, 403 authenticated-but-forbidden, 404 absent-or-hidden, 409 conflict/state, 412 precondition (ETag), 422 semantic validation, 429 with `Retry-After`, 503 for shedding.
- **Versioning**: additive changes only within a major version. Remove fields only after deprecation window (≥90 days) with `Sunset`/`Deprecation` headers and telemetry proving zero usage.
- **Rate limiting**: per credential and per IP, token bucket, return remaining quota headers.
- **Timeouts and retries**: document server-side timeouts; clients retry only idempotent calls with exponential backoff + jitter, max 3.
- **Consistency**: expose `ETag`/`If-Match` for concurrent edits; return `409` rather than silently overwriting.

## Review checklist

- [ ] Every list endpoint is bounded and paginated.
- [ ] Every mutation is idempotent or documented as unsafe.
- [ ] AuthZ is checked per object, not just per route (no IDOR).
- [ ] Input validated at the boundary (schema + limits: body size, array length, string length, numeric range).
- [ ] No N+1: batch loaders or joins; response time measured at p95 under realistic payload.
- [ ] Breaking-change diff in CI (`oasdiff` / schema registry) blocks merge.
- [ ] Errors are enumerable and documented; each has an owner.
- [ ] Webhooks signed (HMAC), timestamped, replay-protected, retried with backoff.
- [ ] Bulk operations have a size cap and partial-failure semantics.

## Anti-patterns

Verb endpoints everywhere (`/getUser`, `/doThing`), 200-with-error-body, unbounded `?limit=100000`, leaking internal IDs, "v2" as a folder copy, auth logic duplicated per handler, and pagination by `OFFSET` on a table with deletes.

## Deliverables

OpenAPI/SDL spec, error catalog, auth matrix (role × resource × action), example requests for happy path + 3 failure paths, and a migration note if the contract changes.
