---
name: qa-testing
description: Provide evidence-based release confidence through risk-driven test coverage.
---
# QA & Testing

## Purpose
Provide evidence-based release confidence through risk-driven test coverage.

## When to use
Use this skill when a project needs qa & testing as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Translate requirements and risks into observable acceptance criteria.
2. Use unit tests for logic, integration tests for boundaries, and end-to-end tests for critical journeys.
3. Cover happy path, invalid input, permissions, network failure, empty states, and regressions.
4. Use deterministic fixtures; isolate external dependencies; avoid secrets and real user data.
5. Track defect severity, reproduction steps, expected/actual behavior, and environment.
6. Report executed commands, pass/fail counts, skips, and known gaps.

## Deliverables
Produce fit-for-purpose artifacts such as: test-plan.md, bug-report.md, release-checklist.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Test results are evidence for tested conditions—not proof of zero defects.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/test-plan.md` — focused practical guide.
- `references/bug-report.md` — focused practical guide.
- `references/release-checklist.md` — focused practical guide.
