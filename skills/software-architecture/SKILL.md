---
name: Software Architecture
description: Design or review system architecture — boundaries, trade-offs, ADRs, scaling and failure modes. Use for new systems, major refactors, or "should we use X" decisions.
---

# Software Architecture

Assume the reader knows patterns; focus on decisions, constraints, and failure.

## Workflow

1. **Extract the real constraints** before proposing anything: expected load (RPS, data volume, growth), latency budget (p50/p99), consistency needs, team size and skills, deadline, budget, compliance (GDPR/PDPL, PCI, HIPAA), and existing systems.
2. **Define the quality attributes** that matter, ranked. You cannot optimize all of: latency, consistency, availability, cost, delivery speed, operability. Force a top-3.
3. **Model the domain first** (entities, invariants, lifecycle), then the boundaries. Boundaries follow invariants and change cadence — not org charts or frameworks.
4. **Propose 2–3 options**, each with a one-line thesis, a diagram (C4 level 1–2), cost, and the failure modes it accepts.
5. **Write the ADR** with the decision, alternatives rejected, and the trigger that would reverse it.
6. **Define the operational contract**: SLOs, dashboards, alerts, backup/restore, rollback, on-call ownership.

## Decision heuristics

| Situation | Default | Switch when |
| --- | --- | --- |
| Single team, unclear domain | Modular monolith | Independent scaling/deploy cadence is proven |
| Cross-team boundary with stable contract | Service + async events | Sync only if caller cannot proceed without the answer |
| Strong invariants across entities | Single database, transactions | Write volume or blast radius demands partitioning |
| Read-heavy, tolerant of staleness | Cache + read replicas | Staleness breaks correctness or UX |
| Unpredictable spikes | Queue + workers, backpressure | Latency SLA < 200ms and load is predictable |
| Unsure about scale | Vertical + stateless app tier | You measured a ceiling |

## Expert-level checks

- **Blast radius**: what fails when this component fails? Is there a bulkhead, timeout, circuit breaker, and retry budget with jitter?
- **Data gravity**: moving code is cheap, moving data is not. Place boundaries where data changes together.
- **Idempotency and ordering**: any at-least-once transport needs dedupe keys; any multi-writer entity needs a conflict policy (LWW, version vectors, CRDT, or manual merge).
- **Consistency ladder**: strong → read-your-writes → monotonic reads → eventual. Name the level per read path.
- **Evolution**: can you deploy producer and consumer independently for one release cycle? If not, the contract is too tight.
- **Cost model**: estimate storage growth/month, egress, and the cost of the *idle* system, not just peak.
- **Operability**: every new component adds pager duty. Count new failure modes added per component.

## Anti-patterns to call out explicitly

- Microservices before product-market fit or with a single team.
- Distributed transactions as a default; prefer sagas with compensating actions and explicit states.
- Shared database between services (hidden coupling).
- "We'll add observability later."
- Choosing technology by résumé rather than by constraint.
- Architecture diagrams that omit the queue, the cache, and the third-party dependency that actually breaks.

## Deliverables

- Context + container diagrams (C4), one page each.
- ADR (`references/adr-template.md`).
- Quality attribute table: attribute, target, measurement, owner.
- Failure-mode table: component, failure, user impact, mitigation, detection.
- Rollout and rollback plan with a named kill switch.

## Review mode

When reviewing existing architecture, produce findings ranked by **risk × likelihood**, each with evidence (metric, incident, code path) and a concrete remediation. Never propose a rewrite without quantifying the current cost of the status quo.
