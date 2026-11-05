---
name: Project Management
description: Plan and run projects — scope, estimates, risks, dependencies, status reporting, and delivery under uncertainty. Use for planning, slipping deadlines, or stakeholder updates.
---

# Project Management

## Workflow

1. **Define done and the constraint.** Fixed scope, fixed date, or fixed team — pick two. Say explicitly which one flexes.
2. **Decompose** into deliverables ≤ 3 days each, with a named owner and an observable completion criterion. If a task cannot be demoed, it is not a task.
3. **Estimate in ranges** (best/likely/worst), not single numbers. Use reference-class estimating: how long did similar work actually take?
4. **Map dependencies and the critical path.** Anything on the critical path gets a buffer and a weekly check; everything else can slip.
5. **List risks** with impact × likelihood, an owner, a trigger, and a mitigation. Review weekly.
6. **Report against the plan, not against effort.** Status = scope delivered vs planned, forecast date, and top 3 risks.

## Estimation

| Technique | Use when |
| --- | --- |
| T-shirt sizes → ranges | Early, low information |
| Three-point PERT | Comparable history exists |
| Reference class / historical velocity | Team has ≥3 similar cycles |
| Spikes (timeboxed 1–2 days) | Unknown technology or integration |

Apply **cone of uncertainty**: ±4x at concept, ±1.5x at design complete, ±1.25x at detailed plan. Never present a single date before the design is stable.

## Status reporting (weekly, 10 lines max)

```
Status: green | amber | red  (amber = needs a decision this week)
Delivered: <outcomes, not activities>
Next: <next 1-2 outcomes> — <date>
Blocked by: <person/decision, since when>
Forecast: <date vs baseline>, confidence <high/med/low>
Risks: <top 3 with trigger + mitigation>
Decisions needed: <yes/no question + deadline>
```

Escalate early: a red that arrives on the deadline is a management failure, not a discovery.

## Dependency and handoff rules

- Every cross-team dependency has a named counterpart, an agreed date, and a fallback if they slip.
- Handoffs need an artifact (spec, API contract, design file), not a meeting.
- Freeze scope at least one iteration before a hard deadline; only "drop" decisions after that.

## Recovery playbook (project is slipping)

1. Quantify: days late at current burn, and the cost of each option.
2. Options: cut scope (ranked list), add people (only if parallelizable — Brooks's law), extend date, reduce quality (explicitly, never silently).
3. Present the trade-off to the decision-maker with a recommendation; do not absorb it silently.
4. Re-baseline once, communicate, and stop re-planning weekly.

## Anti-patterns

100% utilization plans, estimates given as commitments by someone else, "90% done" for three weeks, status reports that list activity instead of outcomes, and hidden buffers owned by individuals.

## Deliverables

WBS with owners and criteria, critical path, risk register, RACI for decisions, and a weekly status template.
