# Avatar — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.
> This is the only file UX edits directly.

## anatomy

- container: outer clipping element; enforces size, shape, and overflow:hidden
- image: photo filling the container; object-fit:cover
- initials: centered text shown when image is absent or fails; primary-subtle background
- fallback-icon: generic User icon shown when neither image nor initials are available; same bg/color as initials

## variants

No explicit variants. Content layer is determined at runtime by the fallback hierarchy:
image (loads OK) → initials (image absent or failed, initials provided) → fallback-icon (no image, no initials)

## sizes

- xs: 24×24px container; initials font-label-sm (10px); icon 12px
- sm: 32×32px container; initials font-label-md (12px); icon 16px
- md: 40×40px container; initials font-body-sm (14px); icon font-heading-md (20px)  [default]
- lg: 48×48px container; initials font-body-md (16px); icon 24px
- xl: 64×64px container; initials font-heading-md (20px); icon 32px

## states

- default: static render; no interactive states
- img-loading: image fades in from opacity 0→1 as network load completes
- img-failed: image removed; initials or fallback-icon shown

## visual properties

container.width   [xs]: 24px
container.height  [xs]: 24px
container.width   [sm]: 32px
container.height  [sm]: 32px
container.width   [md]: 40px
container.height  [md]: 40px
container.width   [lg]: 48px
container.height  [lg]: 48px
container.width   [xl]: 64px
container.height  [xl]: 64px
container.overflow: hidden (all sizes)
container.flex-shrink: 0

container.border-radius [circle]: radius-full (9999px)
container.border-radius [square]: radius-lg (8px)

image.width:           100% of container
image.height:          100% of container
image.object-fit:      cover
image.opacity [img-loading → loaded]: 0→1, 200ms, ease

initials.background:   color-primary-subtle
initials.color:        color-primary
initials.font-weight:  500
initials.font-size [xs]: font-label-sm (10px)
initials.font-size [sm]: font-label-md (12px)
initials.font-size [md]: font-body-sm (14px)
initials.font-size [lg]: font-body-md (16px)
initials.font-size [xl]: font-heading-md (20px)
initials.text-align:   center

fallback-icon.background: color-primary-subtle
fallback-icon.color:      color-primary
fallback-icon.icon-size [xs]: 12px
fallback-icon.icon-size [sm]: 16px
fallback-icon.icon-size [md]: 20px
fallback-icon.icon-size [lg]: 24px
fallback-icon.icon-size [xl]: 32px

## platform-bridge

  image-load-fade:
    intent: image dissolves in smoothly when network load finishes; no pop, no blank flash
    perceptual-goal: opacity animates 0→1 over 200ms with ease curve as image arrives
    react: transition: opacity 200ms ease on <img> element; CSS handles the fade as src loads
    flutter: Image.network frameBuilder wraps child in AnimatedOpacity(duration:200ms, curve:Curves.ease); opacity is 0.0 when frame is null, 1.0 once first frame is available
    parity-risk: medium
    ux-acceptance: image should appear to dissolve in over ~200ms; no visible pop on either platform

  fallback-hierarchy:
    intent: graceful degradation ensures user always sees something meaningful
    perceptual-goal: photo → initials → icon; transitions are instant (no animation)
    react: <img onError> sets imgFailed state; conditional rendering switches layers
    flutter: Image.network errorBuilder renders fallback immediately; setState(_imgFailed) on next frame eliminates Image.network from tree
    parity-risk: medium
    ux-acceptance: simulate broken URL; initials appear instantly without flicker; fallback icon appears when no initials prop

  shape-clipping:
    intent: circle clips to perfect circle; square clips to 8px rounded rectangle
    perceptual-goal: image fills container edge-to-edge with correct shape; no corner bleed
    react: border-radius on container + overflow:hidden
    flutter: ClipOval (circle) or ClipRRect(borderRadius: BorderRadius.circular(8)) (square)
    parity-risk: low
    ux-acceptance: image with face; verify circle has no corners; square shows 8px radius corners

## accessibility notes

- screen-reader: announce alt text when image visible; announce initials text when initials shown; announce 'Avatar' when only fallback icon present
- keyboard: not focusable (presentational); parent component adds focus management if avatar is interactive
- focus: no focus ring on avatar itself
