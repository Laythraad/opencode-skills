---
name: data-science-analytics
description: Create trustworthy analysis from quality-checked data and clearly defined metrics.
---
# Data Science & Analytics

## Purpose
Create trustworthy analysis from quality-checked data and clearly defined metrics.

## When to use
Use this skill when a project needs data science & analytics as a defined workstream. Combine it with `project-orchestration` for multi-discipline tasks.

## Workflow
1. Clarify decision question, population, unit of analysis, time window, and metric definitions.
2. Inspect provenance, schema, missingness, duplicates, outliers, and sampling bias.
3. Document cleaning rules and preserve raw data where permitted.
4. Use appropriate statistical methods; distinguish correlation from causation.
5. Visualize with legible labels, honest scales, uncertainty, and context.
6. Reproduce results with recorded code, environment, and data version.

## Deliverables
Produce fit-for-purpose artifacts such as: analysis-plan.md, data-quality-report.md, metric-dictionary.md. Do not create paperwork that does not help a decision or implementation.

## Quality gates
- Deliverables are specific to the project, internally consistent, and actionable.
- Assumptions and unknowns are explicitly labeled.
- High-impact risks have mitigations or an owner and acceptance decision.
- Claims are supported by implementation evidence or clearly marked as proposals.
- Review for accessibility, privacy, security, maintainability, and user impact as applicable.

## Safety and integrity
Do not imply population-wide conclusions from unrepresentative data.
- Ask for clarification only when a missing detail blocks safe or correct work; otherwise state a reasonable assumption.
- Do not expose credentials, personal data, or confidential material in artifacts.
- Do not fabricate external research, test runs, approvals, deployment, or tool outcomes.
- Human approval is required for consequential external actions, production changes, and irreversible operations.

## Handoff
Summarize: objective, decisions, changed/produced artifacts, validation performed, unresolved issues, and next recommended step. Link to artifacts by repository-relative path.

## Reference material
Load these files only when needed:
- `references/analysis-plan.md` — focused practical guide.
- `references/data-quality-report.md` — focused practical guide.
- `references/metric-dictionary.md` — focused practical guide.
