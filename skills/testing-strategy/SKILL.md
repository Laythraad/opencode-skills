---
name: Testing Strategy
description: Decide what to test and how — unit, integration, contract, E2E, property-based, and load. Use when setting up tests, fixing flaky suites, or reviewing coverage.
---

# Testing Strategy

## Principle

Tests exist to protect **behavior that matters** and to make change safe. Coverage percentage is a proxy, not a goal. Aim for confidence per minute of CI time.

## Workflow

1. **List the risk surface**: money movement, auth, data loss, integrations, state machines, concurrency, migrations.
2. **Assign each risk a test level** — cheapest level that can catch the failure:

   | Risk | Level |
   | --- | --- |
   | Pure logic, parsing, pricing rules | Unit + property-based |
   | Query correctness, transactions, constraints | Integration against real DB (Testcontainers) |
   | Service-to-service schema drift | Contract tests (consumer-driven) |
   | Critical user journeys (login, checkout) | E2E, 5–15 max |
   | UI component behavior/states | Component tests |
   | Performance regressions | Load test in CI on a schedule |
   | Infra/recovery | Restore drill, chaos experiment |

3. **Write the failing test first** for bug fixes; keep it as a regression guard.
4. **Budget**: unit suite < 60s, PR suite < 10 min, nightly for heavy/E2E.

## Quality rules

- **One assertion concept per test**, named as behavior: `rejects expired token with 401`, not `test auth 2`.
- **Arrange–Act–Assert** with the smallest meaningful fixture; no shared mutable fixtures.
- **Deterministic**: inject clock, seed randomness, no sleeps (use fake timers or await conditions), isolate network with recorded fixtures or a sandbox.
- **Property-based** for parsers, serializers, money math, and state machines: invariants like round-trip, monotonicity, no-negative-balance.
- **Mutation testing** (Stryker/PIT) on the core domain to reveal assertion-free tests.
- **Flaky test policy**: quarantine on second failure, owner assigned, fix within a week or delete. Never retry-to-green without a ticket.

## What not to test

Framework behavior, trivial getters, implementation details (private methods), snapshot blobs nobody reviews, and third-party services (test your adapter instead).

## Test doubles

- Prefer real dependencies at the boundary you own (DB, queue) via containers.
- Fake only what you cannot run (payment provider, email). Keep fakes behind the same interface and **contract-test the fake**.
- Mock at the architectural seam, never deep inside the unit under test.

## Review checklist

- [ ] Every reported production bug has a regression test.
- [ ] Critical paths have at least one E2E, and it runs on every deploy candidate.
- [ ] No test depends on execution order or wall-clock time.
- [ ] Failure messages identify the input that broke.
- [ ] Tests fail when the behavior is removed (verify by mutating once).
- [ ] CI reports duration per suite; slow tests are visible.

## Deliverables

Test pyramid table mapped to risks, coverage of critical paths (not lines), flake dashboard, and CI time budget.
