---
name: Accessibility
description: Audit and fix interfaces for WCAG 2.2 AA — keyboard, screen readers, contrast, forms, and motion. Use for a11y reviews, audits, or compliance questions.
---

# Accessibility (WCAG 2.2 AA)

## The four questions that catch most issues

1. Can I do everything with a keyboard only, and can I see where focus is?
2. Does a screen reader announce the name, role, state, and value of every control?
3. Is all text readable at 4.5:1 (3:1 for large text and UI components)?
4. Does it still work at 200% zoom, with reduced motion, and in RTL?

## Checklist

**Semantics**
- [ ] One `h1` per page, heading levels not skipped.
- [ ] Native elements first (`button`, `a`, `input`, `label`); ARIA only when native is impossible.
- [ ] Landmarks: `header`/`nav`/`main`/`footer`; skip-link to main content.
- [ ] Lists are lists; tables have `th` + `scope` + caption.

**Keyboard**
- [ ] Tab order logical; focus visible (≥3:1 ring, 2px).
- [ ] No keyboard trap; modals trap intentionally and restore focus on close.
- [ ] Custom widgets implement expected keys (arrows for tabs/menus, `Esc`, `Home`/`End`).
- [ ] Focus not lost after dynamic updates; announce with a live region.

**Content**
- [ ] Images: meaningful `alt`, decorative `alt=""`.
- [ ] Links/buttons describe destination/action out of context ("View invoice 1042", not "click here").
- [ ] Errors identified in text, associated with the field, and suggest a fix.
- [ ] No information conveyed by color alone.

**Forms**
- [ ] Every input has a programmatic label; placeholders are not labels.
- [ ] Required fields marked in text, not only with `*` color.
- [ ] `autocomplete` attributes on identity/payment fields.
- [ ] Error summary at top for long forms, linked to fields.

**Motion/zoom**
- [ ] `prefers-reduced-motion` honored; no auto-playing motion >5s without a pause.
- [ ] Works at 200% zoom and 320px width without two-dimensional scrolling.
- [ ] No flashing >3 times/second.

**Targets (2.2 additions)**
- [ ] Touch targets ≥24×24 CSS px (44×44 recommended).
- [ ] Focus not obscured by sticky headers/footers.
- [ ] Dragging has a single-pointer alternative.
- [ ] No cognitive test for authentication (allow paste, password managers).

## Testing method

1. **Automated** (axe, Lighthouse) — catches ~30–40%. Never treat a clean run as compliance.
2. **Keyboard pass** — unplug the mouse, complete the primary task.
3. **Screen reader pass** — NVDA+Firefox or VoiceOver+Safari: navigate by headings, landmarks, and form controls.
4. **Zoom/reflow** — 200% and 320px.
5. **Contrast** — measure real rendered colors, including overlays and disabled states.

## Reporting

Per issue: WCAG criterion (e.g. 1.4.3 Contrast), location, current vs required value, user impact, and fix. Severity by blocker (cannot complete task) vs friction.

## Anti-patterns

`aria-label` on everything instead of visible labels, `div` buttons, `outline: none`, placeholder-as-label, and "we'll do accessibility at the end" — retrofitting costs 5–10× more.
