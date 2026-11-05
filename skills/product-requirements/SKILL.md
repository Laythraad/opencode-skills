---
name: Product Requirements
description: Turn an idea into a PRD — problem, users, scope, user stories, acceptance criteria, metrics, and prioritization. Use before building a feature or when scope is unclear.
---

# Product Requirements

## Workflow

1. **State the problem in the user's words**, with evidence (interview quote, support tickets, funnel data). A requirement without a problem is a solution looking for a reason.
2. **Name the target user and the job-to-be-done.** "When <situation>, I want <motivation>, so I can <outcome>."
3. **Define success measurably** before scope: primary metric, guardrail metrics (must not regress), and the review date.
4. **Draw the smallest complete solution.** Then list explicit **out of scope** items — this section prevents most scope creep.
5. **Write user stories with acceptance criteria** in Given/When/Then, covering happy path, empty, error, permission, and edge cases.
6. **Prioritize** with a stated method (RICE, MoSCoW, cost of delay) and show the math.

## PRD skeleton

Problem · Users & JTBD · Success metrics · Scope (in/out) · User stories + acceptance criteria · UX notes/flows · Data & analytics events · Non-functional requirements (perf, a11y, i18n, privacy) · Dependencies · Risks · Rollout (flag, beta, migration) · Open questions with owners.

See `references/prd-template.md`.

## Acceptance criteria quality

- Testable by QA without asking the PM a question.
- Observable from outside the system (API response, UI state, event emitted).
- Include the negative cases: unauthorized, empty, over limit, duplicate submit, network failure, concurrent edit.
- One behavior per criterion; no "and also".

## Prioritization

| Method | Good for | Weakness |
| --- | --- | --- |
| RICE | Comparing many features | Garbage-in scores, false precision |
| MoSCoW | Fixed-deadline scope | "Must" inflation |
| Cost of delay / WSJF | Sequencing a backlog | Needs economic input |
| Kano | Satisfaction vs investment | Survey-heavy |

Always show the inputs, not just the rank, so the decision is arguable.

## Non-functional requirements to always ask

Latency budget, expected volume/growth, availability target, accessibility level (WCAG 2.2 AA default), localization/RTL, data retention and privacy (consent, deletion), audit needs, and backward compatibility for existing clients.

## Analytics

Define events before build: name, trigger, properties, and the question each answers. If no decision would change based on an event, do not instrument it.

## Anti-patterns

Solution-first PRDs, success defined as "ship it", acceptance criteria that restate the design, unbounded scope ("and reporting"), and no named owner for open questions.

## Deliverables

One-page PRD, prioritized scope with out-of-scope list, acceptance criteria per story, metric definitions, and a rollout plan.
