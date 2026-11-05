---
name: prompt-engineering
description: Write testable prompts that reliably produce bounded, useful outputs.
---
# Prompt Engineering

## Purpose
Write testable prompts that reliably produce bounded, useful outputs.

## When to use
Use this skill when a project needs prompt engineering as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. State role, task, audience, constraints, output schema, and completion criteria explicitly.
2. Provide only relevant context; distinguish instructions from quoted or retrieved data.
3. Use examples that cover ordinary and edge cases without overfitting.
4. Require uncertainty disclosure and citations when source-grounding is needed.
5. Validate outputs programmatically; reject malformed or unsupported claims.
6. Version prompts and evaluate against fixed regression examples.

## Deliverables
Produce fit-for-purpose artifacts such as: prompt-template.md, prompt-evaluation.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Prompts are not security boundaries; enforce policy in code and tool permissions.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/prompt-template.md` — focused practical guide.
- `references/prompt-evaluation.md` — focused practical guide.
