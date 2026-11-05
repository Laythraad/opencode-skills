---
name: technical-documentation
description: Create accurate, navigable documentation that stays aligned with implementation.
---
# Technical Documentation

## Purpose
Create accurate, navigable documentation that stays aligned with implementation.

## When to use
Use this skill when a project needs technical documentation as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Identify reader, task, prerequisites, supported versions, and scope.
2. Use a clear structure: quickstart, concepts, workflows, configuration, troubleshooting, reference.
3. Use copyable commands and expected output; flag platform-specific steps.
4. Link source files and authoritative external references; date volatile information.
5. Document decisions, limitations, security considerations, and recovery paths.
6. Check links, spelling, code snippets, and consistency with actual behavior.

## Deliverables
Produce fit-for-purpose artifacts such as: README-template.md, runbook-template.md, decision-log-template.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Documentation must not claim features, test results, or compatibility that are unverified.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/README-template.md` — focused practical guide.
- `references/runbook-template.md` — focused practical guide.
- `references/decision-log-template.md` — focused practical guide.
