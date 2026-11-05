---
name: Engineering Leadership
description: Run a team — 1:1s, feedback, hiring, delegation, performance, incident communication, and technical decision-making. Use for people/process problems or team design.
---

# Engineering Leadership

## Operating cadence

| Ritual | Frequency | Purpose | Failure mode it prevents |
| --- | --- | --- | --- |
| 1:1 (30 min, theirs) | Weekly | Career, blockers, feedback | Surprises at review time |
| Team standup (15 min) | Daily | Flow and blockers, not status theater | Silent stalls |
| Planning | Per iteration | Commit to outcomes | Overcommitment |
| Retro | Per iteration, 1 action | Process fixes | Repeating the same pain |
| Tech review / RFC | Weekly | Design quality, shared context | Architectural drift |
| Skip-level | Monthly | Calibration, reality check | Filtered information |

## 1:1 craft

- Owned by the report: "what's on your mind?" before your agenda.
- Keep a shared doc with running topics, decisions, and growth actions.
- Every 4–6 weeks cover growth: what they want next, what evidence exists, what gap to close.
- Never save feedback for the 1:1 if it is urgent; never deliver it in public.

## Feedback (SBI + intent)

**Situation → Behavior → Impact**, then ask for their view. Praise specifically and publicly; correct privately and quickly.

> "In yesterday's incident call, you posted the mitigation before we had a shared diagnosis. The team split across two theories for 20 minutes. Next time, can we agree on a diagnosis checkpoint first?"

## Delegation ladder

1. Do exactly this → 2. Research and recommend → 3. Decide, inform me → 4. Own it fully. State the level explicitly; most friction comes from mismatched expectations.

## Hiring

- Score against a written rubric per competency, independent of gut feel.
- Ask for concrete past behavior with numbers: "walk me through the last system you scaled — what broke first?"
- Design a work-sample close to the real job; avoid trivia.
- Debrief within 24h, write evidence before discussing, and decide on the rubric, not on the loudest interviewer.

## Performance

- Expectations are written and known; ratings surprise no one.
- Underperformance: name the gap with examples, agree on a 30-day plan with checkpoints, document. Do not "wait and see" for a quarter.
- Top performers: increase scope and visibility before compensation conversations; know their next role.

## Incident communication

1. Acknowledge and assign an incident commander (not the person debugging).
2. Post a status update every 15–30 min: impact, current theory, next update time — even if nothing changed.
3. Separate the technical channel from the stakeholder channel.
4. Blameless postmortem within 48h: timeline, contributing factors, action items with owners and dates. Follow up on the actions — that is the part that earns trust.

## Technical decision-making

- Decide reversibly fast; decide irreversibly carefully.
- Write the decision down (ADR) and name the owner; "the team decided" means nobody did.
- Disagree and commit publicly; dissent belongs in the doc, not in side channels.

## Anti-patterns

Hero culture, status meetings that replace flow, protecting the team from all context, promoting the best coder into management without wanting it, and treating process as a substitute for clear goals.
