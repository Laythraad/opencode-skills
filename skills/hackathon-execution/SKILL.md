---
name: Hackathon Execution
description: Plan and execute a competition build under a hard deadline — scope cuts, demo-first development, team roles, and judging alignment. Use for 24/48/72-hour hackathons and competitive builds.
---

# Hackathon Execution

## The only metric

**A working demo of the core loop, on stage, with seeded data.** Not code volume, not architecture purity, not feature count. Every decision is judged against that.

## Timebox plan (48h example, scale proportionally)

| Window | Activity | Output |
| --- | --- | --- |
| 0–5% | Read the rubric, pick the problem, define the demo script | One-sentence pitch + 5-step demo flow |
| 5–10% | Skeleton: repo, CI, deploy, DB, auth stub, one page live | Public URL exists |
| 10–25% | Vertical slice: one real end-to-end path with fake data | Demo path works badly |
| 25–60% | Core loop: real data, real persistence, error handling | Demo path works reliably |
| 60–75% | Differentiator (the AI feature / the clever part) | One thing judges remember |
| 75–88% | Polish: states, copy, loading, empty, mobile viewport | Demo looks intentional |
| 88–95% | Freeze features, seed demo data, rehearse twice | Timed run-through |
| 95–100% | Pitch, backup video, sleep | Calm delivery |

Deploy on day one. A local-only project fails at the worst moment.

## Scope ladder

Write three lists at hour one and never renegotiate upward:

1. **Demo-critical** — without it there is no pitch. Build first, harden most.
2. **Credibility** — makes judges believe it is real (auth, persistence, one integration).
3. **Ignore** — admin panels, settings, onboarding, billing, multi-language, dark mode.

When behind schedule, **delete features, do not compress quality**. A broken extra feature costs more than a missing one.

## Demo-first development

- Build the exact path you will click on stage, end to end, before anything else.
- Mock behind real interfaces (`PaymentProvider`, `LLMClient`), so swapping to production is a config change.
- Seed deterministic data that tells a story (realistic names, numbers, timestamps).
- Record a 90-second screen capture at hour 40; update it at hour 46. If the live demo dies, play the video and keep talking.

## Judging alignment

Map every rubric line to a visible artifact:

| Criterion | Evidence to show |
| --- | --- |
| Innovation | The one differentiator, stated in one sentence |
| Technical depth | Architecture slide + one hard problem you solved |
| Impact | One user, one number, before/after |
| Design/UX | The polish pass, visible in the demo |
| Completeness | Live URL, working persistence, error state |
| Business viability | Who pays, how much, why now |

If a criterion is not visible in 30 seconds, it does not count.

## Team roles (even a team of 2)

- **Captain** — owns scope, time, and the cut decisions. Does not code in the last 4 hours.
- **Builders** — one owns the demo path, one owns infrastructure/integrations.
- **Designer/storyteller** — polish, copy, slides, demo script.
- **Presenter** — rehearses, not the person who is most tired.

Integration rule: merge to `main` at least every 3 hours; no long-lived branches.

## Risk register (live, on the wall)

| Risk | Trigger | Response |
| --- | --- | --- |
| Deploy broken | No green deploy by hour 12 | Move to a known-good PaaS template |
| API key / quota | Rate limit or billing block | Fallback to mock + recorded responses |
| Demo data missing | Empty screen in rehearsal | Seed script runs on every deploy |
| Scope creep | New idea after hour 30 | Add to "v2" list, not the build |
| Merge conflict hell | Two branches >3h old | Pair-merge immediately |

## Technical defaults (boring wins)

- Stack you have shipped before. New framework = lost hours, not innovation points.
- Managed Postgres + managed deploy (Vercel/Railway/Fly). No Kubernetes.
- Auth via a provider; never hand-roll sessions at hour 30.
- One LLM call with a strict schema beats an agent framework you are learning live.
- Feature flags for anything risky; env var to disable the AI path instantly.

## Anti-patterns

Starting with auth/DB schema perfection, building settings pages, "we'll deploy Saturday", rewriting the UI at hour 44, four people editing the same file, and demoing features instead of a story.
