# Card — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.

## anatomy
- shell: outer rounded rectangle shared by all variants; establishes stacking context and responsive outer radius.
- header-region: optional top band with horizontal layout and bottom divider.
- body-region: optional main block between header and footer with vertical rhythm.
- footer-region: optional bottom band with horizontal layout and top divider.
- inset-panel: nested recessed surface inside body or header — smaller responsive radius than the shell.

## variants
- default: primary card surface one step above page base; subtle stroke.
- secondary: blends toward page base for grouped or nested contexts; paired stroke.
- elevated: same fill intent as default but elevated shadow instead of relying on stroke contrast.
- outline: transparent fill with visible stroke for minimal emphasis.
- demoted: recessed relative to page base for de-emphasized content.

## sizes
- shell outer radius: responsive — narrower viewports use a smaller outer radius token; wider viewports use a larger outer radius token (breakpoint-driven in foundation tokens).
- inset nested radius: responsive — paired to outer radius scale but smaller than shell at each breakpoint.
- padding-none: zero inner inset on the shell.
- padding-sm: gutter minus fixed delta (see visual properties).
- padding-md: equals responsive content gutter at each breakpoint.
- padding-lg: gutter plus fixed delta at each breakpoint.

## states
- default: static presentation only — no dedicated interactive states on the shell.

## visual properties

### shell (all variants)
- shape.radius.outer [all variants]: radius-card-outer (narrow vs wide via foundation breakpoint remapping)
- layout.width [all variants]: fluid width within parent (implementation bridge)

### variant surfaces (shell only — geometry unchanged)
- surface.background [default]: color-card-bg
- stroke.border [default]: 1px solid color-card-border
- surface.background [secondary]: color-card-secondary-bg
- stroke.border [secondary]: 1px solid color-card-secondary-border
- surface.background [elevated]: color-card-elevated-bg
- elevation.shadow [elevated]: shadow-lg (no stroke)
- surface.background [outline]: transparent
- stroke.border [outline]: 1px solid color-card-outline-border
- surface.background [demoted]: color-card-demoted-bg
- stroke.border [demoted]: 1px solid color-card-demoted-border

### shell padding (inner inset — responsive)
- layout.padding [padding-none]: 0
- layout.padding [padding-sm]: card-content-gutter minus 4px per edge (computed at breakpoint)
- layout.padding [padding-md]: card-content-gutter
- layout.padding [padding-lg]: card-content-gutter plus 8px per edge

### header-region
- layout.direction [default]: horizontal row with consistent gap between leading and trailing clusters
- layout.gap [default]: spacing fixed at 12px between header items (bridge)
- stroke.separator.bottom [default]: 1px color-border-subtle
- layout.padding-bottom [default]: 16px below header content before separator meets body

### body-region (card content block)
- layout.padding-vertical [default]: 20px top and bottom
- layout.padding-horizontal [default]: 0 (horizontal inset comes from shell padding)

### footer-region
- layout.direction [default]: horizontal row aligned to trailing edge for actions
- layout.gap [default]: 12px between footer controls
- stroke.separator.top [default]: 1px color-border-subtle
- layout.padding-top [default]: 16px above footer content below separator

### inset-panel
- surface.background [default]: color-card-demoted-bg
- stroke.border [default]: 1px solid color-card-demoted-border
- shape.radius [default]: radius-card-nested (narrow vs wide breakpoint remapping)
- layout.padding [default]: card-content-gutter on all sides

## platform-bridge

  responsive-card-geometry:
    intent: outer radius, nested radius, and gutter shift together at one breakpoint.
    perceptual-goal: mobile reads softer-smaller; desktop reads spacious without changing variant semantics.
    react: consume foundation CSS variables (`radius-card-outer`, `radius-card-nested`, `card-content-gutter`) — no per-component media queries when tokens.css owns the breakpoint.
    flutter: read `MediaQuery` width against the same breakpoint constant as tokens.css; pick narrow vs wide numeric radius and gutter from shared foundation constants.
    parity-risk: medium
    ux-acceptance: at 768 vs 769 width, nested inset radius and shell padding jump exactly once with no oscillation.

  elevated-shadow-vs-outline:
    intent: elevated uses shadow lift; outline uses stroke-only emphasis.
    perceptual-goal: elevated reads “floating”; outline reads “framed void”.
    react: box-shadow token shadow-lg on elevated only.
    flutter: BoxShadow stack approximating shadow-lg from equivalence-table elevation mapping where applicable.
    parity-risk: low
    ux-acceptance: elevated shows no hairline border unless designer opts in elsewhere.

  full-width-cta-inset:
    intent: pill controls never collide with the shell’s rounded corners.
    perceptual-goal: buttons stay inside padded content; radius discipline preserved.
    react: enforce via shell padding minimum md when CTAs are present — consumer discipline.
    flutter: same rule — prefer minimum md padding when placing full-width buttons.
    parity-risk: low
    ux-acceptance: focus rings on buttons remain inside inner safe area at both breakpoints.

## accessibility notes
- shell uses neutral grouping containers only; headings, landmarks, and interactive roles come from consumer content.
- inset-panel remains a visual grouping surface — semantics supplied by children.
