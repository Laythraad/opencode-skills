---
name: devops-deployment
description: Ship reproducible software with secure CI/CD, observability, and operational readiness.
---
# DevOps & Deployment

## Purpose
Ship reproducible software with secure CI/CD, observability, and operational readiness.

## When to use
Use this skill when a project needs devops & deployment as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Define environments, configuration boundaries, dependencies, and artifact provenance.
2. Automate formatting, static analysis, tests, dependency scanning, and build steps in CI.
3. Use protected secrets and least-privilege CI tokens; pin important actions/dependencies.
4. Plan health checks, logs, metrics, alerts, backup/restore, rollback, and incident ownership.
5. Deploy incrementally when risk warrants; verify smoke tests and post-deploy signals.
6. Document hosting costs/limits and operational responsibilities; never assert deployment without proof.

## Deliverables
Produce fit-for-purpose artifacts such as: deployment-runbook.md, ci-checklist.md, incident-template.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Do not expose secrets in CI output or commit environment files.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/deployment-runbook.md` — focused practical guide.
- `references/ci-checklist.md` — focused practical guide.
- `references/incident-template.md` — focused practical guide.
