---
name: product-architect
description: Turn fuzzy goals into validated scope, requirements, architecture, and reversible decisions.
---
# Product Architecture

## Purpose
Turn fuzzy goals into validated scope, requirements, architecture, and reversible decisions.

## When to use
Use this skill when a project needs product architecture as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Clarify user, problem, context, success metric, constraints, and non-goals.
2. Separate must-have from later scope; define acceptance criteria.
3. Map domain concepts, system boundaries, data flows, integrations, and failure modes.
4. Compare at least two viable options when a major decision is involved.
5. Record decision, rationale, trade-offs, assumptions, and revisit trigger.

## Deliverables
Produce fit-for-purpose artifacts such as: requirements.md, architecture.md, decision-record.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Avoid premature microservices. Prefer the simplest architecture that meets measured needs.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/requirements.md` — focused practical guide.
- `references/architecture.md` — focused practical guide.
- `references/decision-record.md` — focused practical guide.
