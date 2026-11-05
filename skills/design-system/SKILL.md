---
name: Design System
description: Build and govern a component library — tokens, component APIs, documentation, versioning, and adoption. Use when creating or scaling a shared UI system.
---

# Design System

## What it is

A design system is **tokens + components + rules + governance**. A component library without rules and governance becomes a second legacy codebase.

## Layers

1. **Primitive tokens** — raw values: `blue-600`, `space-4`, `radius-md`.
2. **Semantic tokens** — intent: `color-action-primary`, `surface-raised`, `text-muted`. Components consume only these.
3. **Component tokens** — per-component overrides: `button-height-md`.
4. **Components** — behavior + accessibility + styling.
5. **Patterns** — composed solutions (form validation, data table, empty state).
6. **Docs** — usage, do/don't, code, accessibility notes.

## Component API design

- **Composition over props**: `children`/slots before boolean flags. Avoid `isPrimary isSecondary isGhost` — use `variant`.
- **Controlled + uncontrolled** where state matters (`value`/`defaultValue`).
- **Forward refs and rest props** to the underlying element; never swallow `className`/`style`.
- **Polymorphic `as` prop** sparingly; it complicates types and a11y.
- **Size scale** fixed: `sm | md | lg`. No arbitrary pixel props.
- **No styling props** (`marginTop`) — layout belongs to the consumer, not the component.
- **Stable names**: renaming a prop is a breaking change; deprecate with a codemod.

## Documentation page per component

Anatomy · variants · states (default/hover/focus/active/disabled/loading/error) · props table · accessibility (role, keyboard, ARIA) · do/don't with visuals · code example · content guidelines (labels/copy) · changelog.

## Versioning and release

- Semver. Breaking change = major + migration guide + codemod.
- Visual regression tests (Chromatic/Playwright screenshots) on every PR for changed components.
- Accessibility tests (axe) in CI per component.
- Deprecation policy: announce, provide replacement, keep for ≥2 minors, emit dev warnings.

## Adoption strategy

- Start with the 10 components that cover 80% of screens; do not build a 60-component set up front.
- Migrate one real product surface at a time; publish before/after.
- Make the right thing the easy thing: lint rule banning raw hex/px in product code.
- Track adoption: % of screens using tokens, number of local overrides, contribution PRs merged.

## Contribution model

Clear ownership, a template (proposal → API review → implementation → docs → release), and a decision forum. Accept contributions only with tests + docs; otherwise the system rots.

## Anti-patterns

A Figma library with no code parity, tokens named after colors in product code, one mega `Button` with 20 props, breaking changes in minors, and a system that ships components but no guidance on when to use them.
