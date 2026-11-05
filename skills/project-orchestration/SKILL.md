---
name: project-orchestration
description: Coordinate specialist skills into an ordered, traceable delivery workflow.
---
# Project Orchestration

## Purpose
Coordinate specialist skills into an ordered, traceable delivery workflow.

## When to use
Use this skill when a project needs project orchestration as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Create a short brief with objective, user, constraints, acceptance criteria, and risks.
2. Break work into independently reviewable tasks with owner, dependency, and done definition.
3. Select relevant skills only; avoid activating every specialist by default.
4. Sequence architecture and UX before implementation; security and QA throughout.
5. Maintain a decision log, project map, status, blockers, and explicit handoff artifacts.
6. Integrate outputs, resolve contradictions, run end-to-end verification, and summarize gaps.

## Deliverables
Produce fit-for-purpose artifacts such as: project-plan.md, handoff.md, status-report.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Parallelize only tasks with stable interfaces and no shared-file conflicts.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/project-plan.md` — focused practical guide.
- `references/handoff.md` — focused practical guide.
- `references/status-report.md` — focused practical guide.
