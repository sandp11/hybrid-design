# Button — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.
> This is the only file UX edits directly.

## anatomy

- container: the pressable outer surface; clips children; carries background, shadow, radius
- content-wrapper: invisible layer wrapping label + icons; visibility:hidden during loading so dimensions hold
- label: the text content inside the button
- leading-icon: optional icon to the left of the label
- trailing-icon: optional icon to the right of the label
- loading-dots: three animated dots that overlay the content area while loading (not a spinner)
- dot: individual 6px circle in the loading-dots group

## variants

- primary: filled with brand color; highest visual weight; default call-to-action
- secondary: tinted brand fill with brand border; medium visual weight
- inverted: light fill on dark surfaces; fixed colors — does not shift with dark theme
- ghost: transparent fill, brand text; lowest fill weight; tertiary actions
- link: transparent fill, blue text, no horizontal padding; behaves like a hyperlink in button form
- danger: red-tinted fill, red text; irreversible or destructive actions

## sizes

- xs: 32px height; dense tables or inline contexts
- sm: 40px height; secondary actions in tight layouts
- md: 48px height; default for most product contexts
- lg: 56px height; prominent CTAs, hero sections
- xl: 64px height; marketing and landing-page hero buttons

## states

- default: resting appearance, no interaction
- hover: cursor over button on pointer devices only (not touch)
- focused: keyboard or programmatic focus active; 3px ring visible
- pressed: active tap or click in progress; scale(0.97) transform
- disabled: non-interactive; explicit disabled colors applied — no opacity reduction
- loading: async action in progress; dots shown, content-wrapper hidden, pointer events blocked

## visual properties

### container — background

container.background [primary] [default]:          color-primary
container.background [primary] [hover]:            color-primary + dark-overlay-gradient (see platform-bridge: primary-hover-overlay)
container.background [primary] [disabled]:         color-btn-disabled-bg
container.background [secondary] [default]:        color-btn-secondary-bg
container.background [secondary] [hover]:          color-btn-secondary-bg + brightness-filter (see platform-bridge: brightness-filter-hover)
container.background [secondary] [disabled]:       color-btn-disabled-bg
container.background [inverted] [default]:         color-btn-inverted-bg
container.background [inverted] [hover]:           color-btn-inverted-bg + brightness-filter (see platform-bridge: brightness-filter-hover)
container.background [inverted] [disabled]:        color-btn-disabled-bg
container.background [ghost] [default]:            transparent
container.background [ghost] [hover]:              color-btn-ghost-hover-bg
container.background [ghost] [disabled]:           color-btn-disabled-bg
container.background [link] [default]:             transparent
container.background [link] [hover]:               transparent
container.background [link] [disabled]:            transparent
container.background [danger] [default]:           color-btn-danger-bg
container.background [danger] [hover]:             color-btn-danger-bg + brightness-filter (see platform-bridge: brightness-filter-hover)
container.background [danger] [disabled]:          color-btn-disabled-bg

### container — text / label color

label.color [primary] [default]:                   color-on-primary
label.color [primary] [disabled]:                  color-btn-disabled-text
label.color [secondary] [default]:                 color-btn-secondary-text
label.color [secondary] [disabled]:                color-btn-disabled-text
label.color [inverted] [default]:                  color-btn-inverted-text
label.color [inverted] [disabled]:                 color-btn-disabled-text
label.color [ghost] [default]:                     color-btn-ghost-color
label.color [ghost] [disabled]:                    color-btn-disabled-text
label.color [link] [default]:                      color-btn-link-color
label.color [link] [hover]:                        color-btn-link-color (underline added)
label.color [link] [disabled]:                     color-btn-disabled-text
label.color [danger] [default]:                    color-btn-danger-text
label.color [danger] [disabled]:                   color-btn-disabled-text

### container — border / shadow

container.shadow [primary] [default]:              shadow-btn-inner
container.shadow [primary] [hover]:                shadow-btn-inner + shadow-btn-hover (compound)
container.shadow [secondary] [default]:            inset 1px solid color-btn-secondary-border
container.shadow [secondary] [focused]:            inset 1px solid color-btn-secondary-border + shadow-focus-ring
container.shadow [any] [focused]:                  shadow-focus-ring
container.shadow [danger] [focused]:               0 0 0 3px color-error at opacity-20 (custom ring — see platform-bridge: danger-focus-ring)
container.shadow [any] [disabled]:                 none

### container — border radius

container.border-radius [all sizes]:               radius-full

### container — dimensions

container.height [xs]:                             32px
container.height [sm]:                             40px
container.height [md]:                             48px
container.height [lg]:                             56px
container.height [xl]:                             64px

container.padding-horizontal [xs]:                 16px
container.padding-horizontal [sm]:                 16px
container.padding-horizontal [md]:                 16px
container.padding-horizontal [lg]:                 24px
container.padding-horizontal [xl]:                 32px

container.padding-horizontal [link] [all sizes]:   0px (no horizontal padding)

### container — icon-only

When iconOnly is true: width equals height; no horizontal padding. Label remains accessible (visually hidden).

container.width [icon-only] [xs]:                  32px
container.width [icon-only] [sm]:                  40px
container.width [icon-only] [md]:                  48px
container.width [icon-only] [lg]:                  56px
container.width [icon-only] [xl]:                  64px

### label — typography

label.font-size [xs]:                              12px / line-height 16px / weight 500
label.font-size [sm]:                              14px / line-height 18px / weight 500
label.font-size [md]:                              16px / line-height 24px / weight 500
label.font-size [lg]:                              18px / line-height 28px / weight 500
label.font-size [xl]:                              20px / line-height 32px / weight 500

All label text: font-weight 500 (medium) regardless of size.

### icons

leading-icon.size [xs]:                            12px
leading-icon.size [sm]:                            16px
leading-icon.size [md]:                            16px
leading-icon.size [lg]:                            24px
leading-icon.size [xl]:                            32px
leading-icon.gap-to-label:                         8px

trailing-icon.size:                                same as leading-icon per size
trailing-icon.gap-to-label:                        8px

icon.color:                                        inherits label.color for that variant/state

### loading-dots

loading-dots.count:                                3
loading-dots.dot-size:                             6px diameter circles
loading-dots.gap:                                  4px between dots
loading-dots.color:                                inherits label.color for the active variant
loading-dots.animation:                            vertical wave, staggered (dot 1: 0ms, dot 2: 150ms, dot 3: 300ms)
loading-dots.keyframe-name:                        acko-dot-wave
loading-dots.position:                             absolute, centered over button
loading-dots.content-wrapper:                      visibility:hidden during loading (layout preserved, no shift)

### animation

container.transition:                              background-color 150ms ease, color 150ms ease,
                                                   border-color 150ms ease, box-shadow 150ms ease
container.press-transition:                        transform 100ms ease
container.press-scale:                             0.97

## platform-bridge

  primary-hover-overlay:
    intent: primary button surface subtly darkens on hover
    perceptual-goal: translucent dark gradient over the fill; brand color remains visible underneath
    react: linear-gradient(rgba(0,0,0,0.08), rgba(0,0,0,0.08)) layered over background-color; compound shadow-btn-inner + shadow-btn-hover; dark theme swaps to color-primary-hover flat fill (no gradient)
    flutter: AnimatedContainer switching colorPrimary → colorPrimaryHover; flat color shift; no gradient
    parity-risk: medium
    ux-acceptance: both feel immediately responsive. Gradient is web-only; flat color shift on Flutter is acceptable.

  brightness-filter-hover:
    intent: secondary, inverted, and danger buttons subtly darken or lighten on hover
    perceptual-goal: 4% brightness shift confirming hover — no color change visible
    react: filter: brightness(0.96) light / brightness(1.1) secondary+danger dark / brightness(0.9) inverted dark
    flutter: overlay Color at 4% opacity using Colors.black (light) / Colors.white (dark)
    parity-risk: medium
    ux-acceptance: subtle surface shift on both. Exact rendering differs — acceptable.

  loading-dots-wave:
    intent: three dots animate to indicate async activity while blocking interaction
    perceptual-goal: smooth wave bounce replacing the label without layout shift
    react: @keyframes acko-dot-wave; three absolute-positioned 6px circles; visibility:hidden hides content-wrapper
    flutter: AnimatedSwitcher + Row of three AnimatedContainers cycling translateY with staggered AnimationController delays; same height constraint as label row
    parity-risk: medium
    ux-acceptance: both show a wave of three dots. Exact timing may differ — acceptable.

  active-press:
    intent: button gives tactile feedback on click or tap
    perceptual-goal: button shrinks slightly at moment of press, immediately snapping back
    react: transform: scale(0.97) on :active:not(:disabled); transition 100ms ease
    flutter: GestureDetector onTapDown/onTapUp + AnimatedScale(scale: 0.97, duration: 100ms)
    parity-risk: low
    ux-acceptance: both feel identical — immediate, sharp press.

  focus-ring:
    intent: clear keyboard focus indicator on all background types
    perceptual-goal: 3px solid ring using primary-ring color, no offset gap
    react: box-shadow: var(--shadow-focus-ring) on :focus-visible; outline: none
    flutter: FocusNode listener toggling BoxDecoration border 3px + colorPrimaryRing
    parity-risk: medium
    ux-acceptance: ring must be clearly visible on light and dark backgrounds.

  danger-focus-ring:
    intent: danger button focus ring reinforces destructive intent
    perceptual-goal: 3px ring in color-error at 20% opacity
    react: box-shadow: 0 0 0 3px color-mix(in srgb, var(--color-error) 20%, transparent)
    flutter: BoxDecoration border 3px + colorError.withOpacity(0.20)
    parity-risk: low
    ux-acceptance: ring visible, tinted red — confirms destructive context.

  hover-gating:
    intent: hover states must not appear on touch devices
    perceptual-goal: hover effects only on desktop pointer devices
    react: all hover styles wrapped in @media (hover: hover) and (pointer: fine)
    flutter: MouseRegion active on desktop/web Flutter only; omit on mobile builds
    parity-risk: high
    ux-acceptance: mobile Flutter having no hover is correct by design. Desktop Flutter hover must match React.
    // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.

## accessibility notes

- keyboard: Space and Enter both trigger the button action
- screen-reader: label text is the accessible name. When loading, "Loading, please wait" announced via sr-only span. When icon-only, consumer must pass a meaningful label.
- focus: focus ring on keyboard navigation only (:focus-visible / FocusNode); never on mouse click
- disabled: button must remain focusable; must not fire onClick. Use aria-disabled (not HTML disabled) so Tab focus is preserved.
- loading: aria-busy="true" when loading; aria-disabled="true" when loading or disabled
- icons: all icon elements must be aria-hidden="true"; they are decorative
