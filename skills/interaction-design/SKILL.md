---
name: Interaction Design
description: Design flows, states, feedback, and micro-interactions — including errors, empty states, loading, and destructive actions. Use when designing how a feature behaves.
---

# Interaction Design

## Core loop

**Trigger → action → feedback → next state.** Every click must answer: what happened, what changed, what can I do now. If a screen cannot answer those three in under a second, the interaction is unfinished.

## Design all states, always

For every view, specify:

| State | Requirement |
| --- | --- |
| Empty (first use) | Explain value + one primary action; never a blank table |
| Empty (no results) | Say why, offer to clear filters |
| Loading | Skeleton for known layout; spinner only for unknown; >1s needs progress or optimistic UI |
| Partial | Show what loaded; per-section error, not whole-page failure |
| Error | What happened, what to do, retry path; keep user input |
| Success | Confirm with the specific result, not "Saved!" alone |
| Disabled | Say why (tooltip/inline reason), never a dead button |
| Offline / slow | Queue or degrade gracefully; show sync status |

## Flows

- One primary action per screen; competing CTAs flatten hierarchy.
- Reduce steps only if each remaining step still carries its weight (confirmation, consent, payment).
- **Progressive disclosure** for advanced options; do not hide required fields.
- **Destructive actions**: confirmation for irreversible + high-cost; undo for reversible. Prefer undo over modal. Never use a confirm dialog as a substitute for good defaults.
- **Forms**: label above field, inline validation on blur (not on every keystroke), errors next to the field, preserve values, autofocus first invalid field.
- **Wizards**: show progress, allow back without loss, save drafts.
- **Autosave**: show "saved at HH:MM"; debounce; offline queue.

## Feedback timing (perceived performance)

| Duration | Perception | Treatment |
| --- | --- | --- |
| <100ms | Instant | No indicator |
| 100ms–1s | Noticeable | Subtle spinner/skeleton, keep layout stable |
| 1–10s | Attention wanders | Optimistic UI, progress, or explanatory copy |
| >10s | Context lost | Background job + notification |

## Motion

- 150–250ms for UI transitions; 200–300ms for larger surfaces. Ease-out on enter, ease-in on exit.
- Motion must explain a spatial or causal relationship (where did this come from, where did it go).
- Respect `prefers-reduced-motion`: replace movement with a fade or instant change.
- Never animate layout-affecting properties (top/left/width) — use transform/opacity.

## Keyboard and focus

- Focus order matches visual order; no positive `tabindex`.
- Modals: trap focus, `Esc` closes, focus returns to the trigger.
- Every custom control works with `Enter`/`Space`/arrows as expected.
- Visible focus ring (≥3:1 contrast) — never `outline: none` without a replacement.

## Copy as interface

Buttons are verbs ("Save changes", not "OK"). Errors say what to fix, not "Invalid input". Empty states sell the feature. Confirmations name the object ("Delete invoice #1042?").

## Anti-patterns

Loading spinners for layout you can predict, error toasts that disappear before reading, "Are you sure?" for reversible actions, disabling submit with no reason shown, and multi-step flows that lose data on back.
