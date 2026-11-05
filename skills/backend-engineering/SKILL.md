---
name: backend-engineering
description: Build maintainable APIs and domain services with predictable contracts and resilient behavior.
---
# Backend Engineering

## Purpose
Build maintainable APIs and domain services with predictable contracts and resilient behavior.

## When to use
Use this skill when a project needs backend engineering as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Define domain entities, invariants, ownership, and service boundaries.
2. Design API contracts with validation, pagination, stable errors, and versioning considerations.
3. Apply authentication and authorization on every protected operation; enforce ownership server-side.
4. Use transactions for multi-step state changes and idempotency where retries can duplicate effects.
5. Set timeouts, bounded retries, rate limits, and structured logs without secrets.
6. Add unit, integration, and contract tests around core invariants.

## Deliverables
Produce fit-for-purpose artifacts such as: api-contract.md, service-design.md, error-model.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Treat client-side checks as UX only; security decisions belong server-side.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/api-contract.md` — focused practical guide.
- `references/service-design.md` — focused practical guide.
- `references/error-model.md` — focused practical guide.
