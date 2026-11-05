---
name: security-privacy
description: Reduce risk through threat modeling, secure defaults, privacy minimization, and verifiable controls.
---
# Security & Privacy

## Purpose
Reduce risk through threat modeling, secure defaults, privacy minimization, and verifiable controls.

## When to use
Use this skill when a project needs security & privacy as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Identify assets, trust boundaries, actors, entry points, threats, and impact.
2. Apply least privilege, deny-by-default authorization, and server-side access checks.
3. Keep secrets out of source, logs, prompts, and client bundles; use managed secret storage.
4. Validate input, encode output, parameterize queries, and protect against injection.
5. Minimize collection; define purpose, retention, deletion, consent, and access policy.
6. Test abuse cases; document residual risk and incident response; never perform unauthorized testing.

## Deliverables
Produce fit-for-purpose artifacts such as: threat-model.md, privacy-review.md, security-checklist.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Only assess systems with explicit authorization and a bounded scope.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/threat-model.md` — focused practical guide.
- `references/privacy-review.md` — focused practical guide.
- `references/security-checklist.md` — focused practical guide.
