---
name: Technical Writing
description: Write docs engineers actually use — READMEs, RFCs, ADRs, runbooks, API docs, and postmortems. Use when documenting a system, process, or decision.
---

# Technical Writing

## Rules

1. **Lead with the reader's task.** First sentence answers "what is this and should I keep reading?"
2. **One idea per paragraph**, ≤ 4 sentences. Prefer lists and tables for anything enumerable.
3. **Show, then explain.** A runnable command or 6-line example beats a paragraph of description.
4. **Be specific.** "Fast" → "p95 < 200 ms"; "soon" → a date; "some users" → a number.
5. **Cut hedges and filler**: "simply", "just", "obviously", "in order to", "it should be noted".
6. **Maintain or delete.** A stale doc is worse than none — add an owner and a `Last verified:` date.

## Doc types and required sections

| Type | Sections |
| --- | --- |
| README | What it is · Quick start (copy-paste) · Config · Common tasks · Troubleshooting · Where to get help |
| RFC | Problem · Goals/non-goals · Proposal · Alternatives · Risks · Rollout · Open questions |
| ADR | See `software-architecture` skill |
| Runbook | Symptom · Impact · Diagnose (commands) · Mitigate · Rollback · Escalate · Post-incident |
| API docs | Auth · Endpoint + params + example request/response per error · Rate limits · Changelog |
| Postmortem | Impact · Timeline (UTC) · Contributing factors · What went well/badly · Actions with owners/dates |
| Onboarding | Day 1 checklist · Architecture map · Environments/access · First task · Glossary |

## Runbook quality bar

Someone on call at 03:00 with no context must be able to act. Every command is copy-pasteable, every dashboard link resolves, every step says what "good" looks like. Test runbooks in a drill.

## Writing process

1. Outline as questions the reader will ask.
2. Draft fast, mark unknowns with `TODO(owner)`.
3. Verify by executing every command in a clean environment.
4. Have someone in the target audience follow it cold; fix where they hesitate.
5. Add version/date and an owner.

## Diagrams

Prefer text diagrams (Mermaid) in the repo so they version with the code. Label edges with protocol + direction. Every diagram needs a legend and a "last updated" note.

## Reviewing docs

Check: does the quick start work verbatim? Are prerequisites stated? Are failure modes covered? Is terminology consistent with the code? Is there a single source of truth (link, do not duplicate)?

## Anti-patterns

Wall-of-text architecture dumps, screenshots of text, undocumented env vars, "TODO" from two years ago, docs that describe intent rather than actual behavior, and READMEs with no runnable example.
