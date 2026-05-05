# Badge — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.
> This is the only file UX edits directly.

## anatomy

- container: pill-shaped wrapper; holds gradient fill, border, and all children
- dot: 6×6px circle indicator (dot variant only); color inherits from foreground
- label: text content; font-weight medium; text-transform controlled by textCase
- remove-button: 12×12px tap target with X icon; only present when removable=true
- counter-container: pill wrapper for CounterBadge; gradient fill + border
- counter-label: numeric text; tabular figures; always color-on-primary

## variants

- solid: gradient fill (bottom→top) + 1px border + text
- outline: transparent fill + 1px border; border and text share the same outline-color token
- dot: identical to solid + a 6px dot indicator prepended to the label
- counter: separate sub-component (CounterBadge); saturated gradient pill; numeric display with max-overflow (e.g. 99+)

## sizes

No size prop. Sizing is fully automatic:
- mobile (< 768px):  font-size = 12px (font-caption), padding = 6px 8px
- desktop (≥ 768px): font-size = 14px (font-body-sm), padding = 6px 8px (same)

## states

- default: full color per variant/color
- removable: remove-button child is visible; no other visual change to container
No hover, focus, disabled, loading, or error states on Badge.

## visual properties

### Typography

label [mobile]:    font-caption (12px / 16px), weight-500, font-family Euclid Circular B
label [desktop]:   font-body-sm (14px / 20px), weight-500, font-family Euclid Circular B
label [uppercase]: text-transform uppercase, letter-spacing 0.04em
label [sentence]:  text-transform none, letter-spacing 0
counter-label:     font-caption (12px), weight-500, tabular-nums, color-on-primary

### Spacing & Radius

container.padding:       6px top/bottom, 8px left/right
container.gap:           4px between children (dot ↔ label ↔ remove)
container.borderRadius:  radius-full
counter.padding:         2px top/bottom, 6px left/right
counter.minWidth:        20px

### Dot child

dot.width:   6px
dot.height:  6px
dot.radius:  50% (circle)
dot.color:   inherits current foreground (same as label color)

### Remove button

remove.width:   12px
remove.height:  12px
remove.color:   inherits current foreground
remove.icon:    X (two diagonal strokes, stroke-width 1.5, round caps)

### Solid + Dot variant — colors per color

| color  | fill gradient (bottom→top)                                    | border token                      | text token                  |
|--------|---------------------------------------------------------------|-----------------------------------|-----------------------------|
| purple | color-badge-purple-gradient-from → color-badge-purple-gradient-to | color-badge-purple-border    | color-badge-purple-text     |
| green  | color-badge-green-gradient-from  → color-badge-green-gradient-to  | color-badge-green-border     | color-badge-green-text      |
| blue   | color-badge-blue-gradient-from   → color-badge-blue-gradient-to   | color-badge-blue-border      | color-badge-blue-text       |
| orange | color-badge-orange-gradient-from → color-badge-orange-gradient-to | color-badge-orange-border    | color-badge-orange-text     |
| pink   | color-badge-pink-gradient-from   → color-badge-pink-gradient-to   | color-badge-pink-border      | color-badge-pink-text       |
| gray   | color-badge-gray-gradient-from   → color-badge-gray-gradient-to   | color-badge-gray-border      | color-badge-gray-text       |

Light: 200→100 pastel gradients, 200-tier borders.
Dark: gradient = hue-950/hue-900 at 90% opacity; border = 900-tier solid; text = 200-tier.

### Outline variant — colors per color

| color  | outline-color token                      | usage              |
|--------|------------------------------------------|--------------------|
| purple | color-badge-purple-outline-color         | border + text both |
| green  | color-badge-green-outline-color          | border + text both |
| blue   | color-badge-blue-outline-color           | border + text both |
| orange | color-badge-orange-outline-color         | border + text both |
| pink   | color-badge-pink-outline-color           | border + text both |
| gray   | color-badge-gray-outline-color           | border + text both |

Outline fill: transparent. Border-width: 1px.

### Counter badge — colors per color

| color  | fill gradient (bottom→top)                                              | border token                       | text          |
|--------|-------------------------------------------------------------------------|------------------------------------|---------------|
| purple | color-counter-purple-gradient-from → color-counter-purple-gradient-to  | color-counter-purple-border        | color-on-primary |
| pink   | color-counter-pink-gradient-from   → color-counter-pink-gradient-to    | color-counter-pink-border          | color-on-primary |
| blue   | color-counter-blue-gradient-from   → color-counter-blue-gradient-to    | color-counter-blue-border          | color-on-primary |

Light: saturated hue-500→hue-400 gradients. Dark: hue-950/hue-900 at 90% opacity; border = 900-tier solid.

## platform-bridge

  responsive-size:
    intent: badge font size adjusts automatically based on viewport width — developers never pick a size
    perceptual-goal: 12px on narrow screens, 14px on wider screens, all without any prop
    react: CSS @media (min-width: 768px) block overrides font-size on .acko-badge
    flutter: MediaQuery.of(context).size.width >= 768 selects desktopTextSize vs mobileTextSize from DsBadgeTheme
    parity-risk: medium
    ux-acceptance: verify both sizes render at correct font-size on narrow and wide viewports

  gradient-fill:
    intent: bottom-to-top pastel gradient gives a subtle dimensional look
    perceptual-goal: slight lightening toward the top of the badge pill
    react: background: linear-gradient(0deg, from-token, to-token) — 0deg = bottom→top in CSS
    flutter: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [from, to]))
    parity-risk: low
    ux-acceptance: gradient direction matches — lighter at top, slightly deeper at bottom

  text-transform-uppercase:
    intent: short status labels rendered in all-caps with open letter-spacing
    perceptual-goal: ACTIVE, NEW, FREE etc. appear as compact all-caps labels
    react: text-transform: uppercase; letter-spacing: 0.04em on .acko-badge-uppercase
    flutter: label.toUpperCase() + TextStyle(letterSpacing: fontSize * 0.04) // UX REVIEW: high parity-risk — letter-spacing unit differs (em vs px); verify against React render
    parity-risk: high
    ux-acceptance: uppercase badges look optically equivalent across platforms

## accessibility notes

- keyboard: Badge is not interactive unless removable=true; remove button is a focusable button with aria-label="Remove"
- screen-reader: label text is announced; dot variant prepends a visual dot that is aria-hidden
- focus: remove button receives standard focus ring from the browser/platform; no custom focus style required on the badge container itself
