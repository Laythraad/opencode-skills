---
name: Frontend Engineering
description: Build or review client-side apps — component architecture, state, data fetching, rendering strategy, and performance. Use for React/Vue/Svelte/Next work or frontend refactors. Produces component contracts and frontend checklists.
---

# Frontend Engineering

## When to use

Use this skill when a project needs frontend engineering as a defined workstream: component boundaries, state ownership, data fetching, rendering strategy, or performance work. Combine it with `project-orchestration` for multi-discipline tasks, and with `ux-ui-design` / `accessibility` when the work is design- or WCAG-driven.

## Workflow

1. **Inspect before changing**: read the existing framework, conventions, dependencies, component library, and real user flows first. Do not propose a rewrite of patterns that already work.
2. **Pick the rendering strategy per route**, not per app: static, ISR, SSR, client-only, or streaming. Criteria: data freshness, personalization, SEO, and time-to-first-byte budget.
3. **Define the data layer**: server state (query cache) vs client state (UI) vs URL state (shareable) vs form state. Mixing these is the root cause of most frontend bugs.
4. **Draw the component tree** by ownership of state; keep state as low as possible and as close to the consumer as possible. Translate UX specs into semantic components and reusable tokens.
5. **Model UI state explicitly**: loading, empty, failure, retry, stale, and offline for every async view — design all of them before coding.
6. **Validate input at boundaries** and render untrusted text safely; never inject unsanitized input into the DOM.
7. **Keep components focused**: avoid duplicate state and premature abstractions; extract only after the second real use.
8. **Set budgets up front**: JS shipped per route, LCP, INP, CLS. Enforce in CI.
9. **Run formatter, lint, type checks, and relevant tests**, and report the exact results — never claim a check passed unless it ran.

## Architecture rules

- **Feature-first folders** (`features/orders/...`) over type-first (`components/`, `hooks/` at root) once the app exceeds ~20 components.
- **Server state belongs in a cache library** (TanStack Query, SWR, Apollo). No `useEffect` + `useState` fetch loops.
- **URL is state** for filters, pagination, tabs, and selected entity. Deep links must work.
- **Forms**: schema validation (Zod/Valibot) shared with the server; optimistic UI only with a rollback path; disable submit while in flight; never lose user input on error.
- **Error boundaries** at route level, plus explicit empty/loading/error/stale states for every async view.
- **Avoid prop drilling > 2 levels**; use composition (`children`) before context, context before global store.

## Performance: measure, then fix

| Metric | Good | Fix order |
| --- | --- | --- |
| LCP | < 2.5s | image/font preload, server-render hero, reduce TTFB |
| INP | < 200ms | break long tasks, defer non-critical JS, virtualize lists |
| CLS | < 0.1 | reserve dimensions, avoid late-injected banners |
| Bundle/route | < 170KB gz | route-level code split, drop moment/lodash-full, check duplicates |

Techniques that actually pay: route-level splitting, `content-visibility`/virtualization for long lists, image `srcset` + AVIF/WebP + explicit dimensions, font `font-display: swap` with preload of the one used weight, memoization only after profiling, and moving work to the server.

## Review checklist

- [ ] No `any`; API responses parsed at the boundary, not trusted.
- [ ] Loading, empty, error, and partial states implemented.
- [ ] Keyboard navigable; focus visible and managed on route/modal change.
- [ ] No layout shift from images, fonts, or async banners.
- [ ] Cancellation/race handling for in-flight requests (abort or request-id guard).
- [ ] No secrets in client bundles; env vars prefixed for public use only.
- [ ] Untrusted text rendered as text; no unsanitized HTML injection.
- [ ] i18n: no concatenated sentences, RTL-safe spacing (`margin-inline`), locale-aware dates/numbers.
- [ ] Tests: component behavior + one E2E for the critical flow.
- [ ] Formatter, lint, type check, and tests actually run — exact results reported.

## Anti-patterns

Global store for server data, derived state duplicated in `useState`, index keys on reorderable lists, `useEffect` for derivable values, blocking the main thread with sync parsing, premature abstractions, and "it works on my machine" performance without a Lighthouse/WebPageTest trace.

## Quality gates

- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity

Do not claim checks passed unless they were actually run.

- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Deliverables

Route → rendering strategy table, state ownership diagram, performance budget with current numbers, and a prioritized fix list with estimated impact. Add fit-for-purpose artifacts only when they drive a decision or implementation — `references/component-contract.md`, `references/frontend-checklist.md`. Do not create paperwork that does not help a decision.

## Handoff

Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material

Load these files only when needed:

- `references/component-contract.md` — component boundary and props contract guide.
- `references/frontend-checklist.md` — focused frontend review checklist.
