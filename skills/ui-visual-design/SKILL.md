---
name: UI Visual Design
description: Define layout, type, color, spacing, and hierarchy for interfaces — visual system, tokens, dark mode, and polish. Use when a screen looks off or a visual system is needed.
---

# UI Visual Design

## Hierarchy first

Before color or decoration: can a user identify the primary action, the content, and the secondary options in 2 seconds? Use size, weight, contrast, and space — in that order. Color is the last resort for hierarchy.

## Foundations

**Spacing** — 4px base, scale 4/8/12/16/24/32/48/64. Spacing encodes grouping: related items closer, sections farther. When in doubt, more space.

**Type scale** — ratio ~1.2 (compact UI) to 1.25. Example: 12 / 14 / 16 / 20 / 24 / 32 / 40. Body 16px minimum on web; line-height 1.5 body, 1.2 headings; measure 45–75 characters. Max 2 families (or 1 + mono).

**Color** — separate semantic roles from raw values:

| Role | Notes |
| --- | --- |
| surface / surface-raised | Backgrounds, cards, overlays |
| text / text-muted / text-disabled | ≥4.5:1 for body, ≥3:1 for large |
| border / border-strong | Dividers, inputs |
| primary / primary-hover / on-primary | Brand action |
| success / warning / danger / info | Always paired with icon or text, never color alone |

Build each hue as a 9–11 step scale; pick pairs by contrast, not by eye. Never encode meaning with hue alone (color-blind users ≈ 8% of men).

**Elevation and radius** — 2–3 levels max. Radius consistent per component size; mixing 4/8/12 randomly reads as sloppy.

## Layout

- 12-column grid, gutters 16–24, max content width 1200–1440 for marketing, 640–800 for reading.
- Container queries / fluid type (`clamp`) over fixed breakpoints where possible.
- Align to a shared baseline; optical alignment beats mathematical alignment for icons and text.
- Every screen needs one clear focal point; if everything is emphasized, nothing is.

## Dark mode

- Not inverted light mode: desaturate brand colors, raise surfaces instead of shadows, avoid pure `#000` and pure `#fff`.
- Re-check contrast separately; semantic tokens must resolve per theme.
- Elevation in dark = lighter surface + subtle border, not a heavier shadow.

## Polish checklist

- [ ] Consistent icon set (same stroke width, size grid, corner radius).
- [ ] Optical centering of icons in buttons; 8px gap icon↔label.
- [ ] Long text truncation strategy (ellipsis + tooltip/full view).
- [ ] Numbers tabular in tables (`font-variant-numeric: tabular-nums`).
- [ ] Focus, hover, active, disabled, selected states designed — not improvised.
- [ ] Empty/loading visuals match the product, not a spinner from a library.
- [ ] Images have aspect ratio and fallback; no stretching.
- [ ] RTL: use logical properties (`margin-inline`, `padding-block`), mirror icons with direction.

## Anti-patterns

Grey-on-grey text below 4.5:1, five font sizes for one role, shadows on everything, centered long paragraphs, decorative gradients behind content, and "make it pop" without a hierarchy diagnosis.
