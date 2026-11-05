---
name: database-engineering
description: Design data models, migrations, and queries that preserve integrity and protect sensitive data.
---
# Database Engineering

## Purpose
Design data models, migrations, and queries that preserve integrity and protect sensitive data.

## When to use
Use this skill when a project needs database engineering as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Map entities, relationships, cardinality, lifecycle, and data retention.
2. Choose constraints as executable invariants: primary/foreign keys, uniqueness, checks, and nullability.
3. Plan indexes from actual query patterns; avoid speculative indexing.
4. Make migrations versioned, reviewable, and safe for rolling deployment where needed.
5. Use parameterized queries; least-privilege database roles; protect backups.
6. Test migration forward/backward strategy and data integrity on representative fixtures.

## Deliverables
Produce fit-for-purpose artifacts such as: schema-review.md, migration-plan.md, query-review.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Never place credentials or production personal data in fixtures or logs.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/schema-review.md` — focused practical guide.
- `references/migration-plan.md` — focused practical guide.
- `references/query-review.md` — focused practical guide.
