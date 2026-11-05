---
name: Large-Scale Delivery
description: Coordinate big codebases and multiple teams — monorepo boundaries, contract-first integration, feature flags, release trains, and delivery governance. Use for multi-team or long-lived projects.
---

# Large-Scale Delivery

## The failure mode to design against

Big projects fail at **integration and coordination**, not at individual coding. Optimize for independent, reversible change.

## Boundaries

- **Vertical slices by business capability**, not layers. A team owns a slice end to end (UI, API, data).
- **Monorepo** when teams share contracts and need atomic refactors; **polyrepo** when independent release cadence and access control dominate.
- Enforce dependency direction with tooling (`nx`/`turbo` boundaries, ESLint `no-restricted-imports`, `dependency-cruiser`). Rules that are not automated do not exist.
- **CODEOWNERS** per package; no package without an owner.

```text
apps/web · apps/admin · apps/api
packages/ui · packages/contracts · packages/db · packages/config
```

`packages/contracts` holds schemas/types shared across apps — the only allowed cross-team coupling.

## Contract-first integration

1. Publish the schema (OpenAPI/Proto/Zod/GraphQL) before implementation.
2. Consumers generate clients from it; contract tests fail the build on drift.
3. Version additively; deprecate with telemetry and a sunset date.
4. Freeze interfaces at an agreed date; after that, changes need an RFC.

## Parallelism that actually works

| Split | Works | Fails |
| --- | --- | --- |
| By vertical slice | Yes | — |
| By layer (front/back/QA) | Only with frozen contracts | Handoff queues |
| By feature flag | Yes, short-lived | Flags living for months |
| By long-lived branch | No | Merge hell, big-bang integration |

Rules: trunk-based development, PRs < 400 lines, merge at least daily, flags with removal dates, and a nightly integration environment.

## Release management

- **Release train** (fixed cadence) for predictability; hotfix path for SEV1.
- Staged rollout 5% → 25% → 100% with automated gates on error rate, p95, and saturation.
- Every release has a rollback command, tested in the last 30 days.
- Database changes are expand/contract, decoupled from app deploys.

## Delivery governance (light but real)

- **Quarterly**: strategy, OKRs, capacity with 20–30% reserved for debt/incidents.
- **Monthly**: architecture review of cross-team changes; debt budget spent, not banked.
- **Weekly**: dependency and risk review; blockers escalated with a named decision-maker.
- **Per change**: ADR for irreversible decisions; RFC for cross-team contracts.

## Scale-specific engineering

- **Performance**: load test at 2× expected peak before launch; define SLOs and error budgets.
- **Cost**: track unit economics (cost per request/tenant); tag infra by team.
- **Observability**: per-service dashboards, trace propagation across async, SLO burn alerts.
- **Data**: partitioning and retention from day one for high-volume tables; archive, do not delete blindly.
- **Security**: threat model per new trust boundary; least privilege; audit log for privileged actions.

## Anti-patterns

Shared `utils` dumping ground, distributed monolith (services that must deploy together), "integration phase" at the end, architecture by committee, and a roadmap with no capacity math.
