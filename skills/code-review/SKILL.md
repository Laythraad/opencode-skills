---
name: Code Review
description: Review pull requests or diffs for correctness, design, security, and maintainability, and write actionable review comments. Use when asked to review code.
---

# Code Review

## Order of review (stop at the first blocking tier)

1. **Intent** — does the change do what the description claims, and is the approach right for the problem?
2. **Correctness** — edge cases, error paths, concurrency, off-by-one, null/empty, timezone, encoding.
3. **Security** — authz on new paths, input validation, secrets, injection, data exposure.
4. **Data** — migrations safe and reversible, indexes, backward compatibility, transactions.
5. **Tests** — do they fail without the change? Is the risky path covered?
6. **Maintainability** — naming, duplication, dead code, complexity, consistency with the codebase.
7. **Style** — only what a linter cannot catch.

## What to look for (high yield)

- Silent failure: swallowed exceptions, `catch {}`, ignored return values, retries without limits.
- Partial failure: multi-step writes without transaction/compensation; async jobs without idempotency.
- Boundary handling: empty arrays, zero, negative, max length, unicode, concurrent edits.
- Coupling: new dependency on an internal detail; feature flags left without a removal date.
- Observability: no log/metric on a new failure path; error messages that cannot be diagnosed.
- N+1 queries, unbounded loops/loads, sync I/O in a hot path.
- Tests that assert implementation rather than behavior.

## Comment style

Use severity prefixes so authors can triage:

- **blocking:** must change before merge (bug, security, data loss).
- **should:** strong preference, author may push back with a reason.
- **nit:** cosmetic, non-blocking.
- **question:** I do not understand; explain.
- **praise:** call out genuinely good solutions.

Every blocking comment states: what is wrong, why it matters (concrete failure), and a suggested fix or a question. Link to the line and, where useful, to a doc.

```
blocking: `user.role` comes from the request body and is written directly,
so any authenticated user can set role=admin. Please derive it server-side or
validate against an allowlist in the DTO.
```

## Review etiquette and limits

- Review the diff, not the author. Ask about intent before assuming a mistake.
- Cap reviews at ~400 changed lines for real depth; ask to split larger PRs.
- Do not restate what the code does; only say what is not obvious.
- Approve when it is better than the alternative and safe, not when it is perfect.
- If you cannot verify something (prod data, external API), say so explicitly.

## Output template

**Verdict:** approve | approve with nits | request changes
**Summary:** 1–3 sentences on the approach.
**Blocking:** numbered, each with location + failure scenario + fix.
**Should/Nits:** grouped.
**Questions:** what you need to finish the review.
**Test gaps:** specific cases missing.

## Anti-patterns

Bike-shedding on formatting, "LGTM" on a 900-line diff, blocking on personal taste, rewriting the PR in comments instead of pairing, and reviewing without running the tests locally when it is cheap to do so.
