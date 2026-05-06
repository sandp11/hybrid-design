# Alert — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.

## anatomy

- root: full-width row container; optional bottom-to-top entrance motion on mount
- icon: leading affordance; inherits variant accent (semantic text color for that variant)
- content: flex column; holds optional title row and body row
- title: optional single line; uses variant accent color and emphasis typography
- body: primary message; uses default body text color token
- dismiss-control: optional trailing control; opacity increases on pointer hover (fine pointer only)

## variants

- info: informational messaging; uses brand-purple semantics via info tokens (not blue)
- success: positive outcome
- warning: caution
- error: failure or critical attention

## sizes

Single layout scale — no size prop. Dimensions fixed per migration source.

## states

- default: visible, dismiss control interactive when dismissible
- dismiss-hover: dismiss-control opacity transition on hover-capable pointers only

## visual properties

Format: part.property [variant] [state]: token-name

### root

container.background [info]: color-info-subtle
container.background [success]: color-success-subtle
container.background [warning]: color-warning-subtle
container.background [error]: color-error-subtle

container.border-color [info]: color-info-border
container.border-color [success]: color-success-border
container.border-color [warning]: color-warning-border
container.border-color [error]: color-error-border

container.border-width [all]: 1px logical — local numeric (no dedicated token)

container.padding [all]: 12px all sides — local numeric

container.gap [all]: 12px between flex items — local numeric

container.corner-radius [all]: radius-3xl

container.layout [all]: horizontal flex; items vertically centered; root stretches full width — equivalence handled per platform

### entrance motion (mount)

root.motion [all] [enter]: duration 300ms, easing ease-out-cubic, translateY from 8px upward to 0 — tokens ease-out-cubic; translation expressed as raw px in component CSS / Flutter animation

### icon

icon.size [all]: 20px square — local numeric

icon.color [info]: color-info-text
icon.color [success]: color-success-text
icon.color [warning]: color-warning-text
icon.color [error]: color-error-text

### title

title.typography [all]: semantic step body-sm with weight 600 — font-body-sm-size, font-body-sm-line; weight semibold (600) documented per typography ramp

title.color [info]: color-info-text
title.color [success]: color-success-text
title.color [warning]: color-warning-text
title.color [error]: color-error-text

title.overflow [all]: single-line truncation intent — ellipsis overflow

### body

body.typography [all]: caption ramp — font-caption-size, font-caption-line

body.color [all]: color-text-default

body.overflow [all]: single-line truncation intent — ellipsis overflow

### dismiss-control

dismiss.size [all]: 20px hit target — local numeric

dismiss.opacity [all] [default]: 0.7 — local alpha

dismiss.opacity [all] [hover]: 1 — local alpha

dismiss.icon.stroke [all]: inherits variant accent via currentColor on SVG — same as icon.color mapping

## platform-bridge

entrance-motion:

  intent: alert visibly enters from slightly below its resting position without altering layout width

  perceptual-goal: short upward settle consistent across web and Flutter

  react: CSS keyframe acko-alert-slide-up — transform translateY(8px) to translateY(0), 300ms var(--ease-out-cubic)

  flutter: SlideTransition or AnimatedSlide from Offset(0, 8 / logical px scale) to Offset.zero over 300ms with Cubic(0.215, 0.61, 0.355, 1)

  parity-risk: medium

  ux-acceptance: entrance duration and displacement visually match Storybook web preview at desktop density

dismiss-hover-opacity:

  intent: dismiss affordance strengthens when pointer hovers

  perceptual-goal: opacity 0.7 default → 1 on hover without shifting layout

  react: @media (hover: hover) and (pointer: fine) nested opacity rule on dismiss control

  flutter: MouseRegion on desktop/web only tracking hover on dismiss — omit hover tint change on touch-first targets if opacity listener unavailable

  parity-risk: high

  ux-acceptance: hover opacity matches CSS on Flutter desktop web target

## accessibility notes

- Treat root as live announcement surface — web uses role="alert"; Flutter uses Semantics live region behaviour equivalent

- dismiss control exposes explicit dismiss label

- decorative icons hidden from AT — aria-hidden / ExcludeSemantics on icon graphics

