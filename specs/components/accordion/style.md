# Accordion — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.
> This is the only file UX edits directly.

## anatomy

- root: vertical stack of all accordion sections; full width
- item: one expandable section; bottom border separates from next item (no border after last)
- trigger: full-width pressable row showing section title or custom trigger content and a trailing chevron
- chevron: 18×18px decorative rotation indicator (points down when collapsed)
- content-wrapper: clipped animated region whose visible height animates when expanding or collapsing
- content: body copy and nested UI below the trigger; scroll height drives animation measurement

## variants

- type-single: at most one section open at a time; opening one closes others
- type-multiple: sections open and close independently

## sizes

No size variants — one density only.

## states

- collapsed: content-wrapper animated height near zero; chevron default rotation
- expanded: content-wrapper height matches measured inner content; chevron rotated 180deg from default
- hover-trigger (fine pointer only): trigger label/chevron tint shifts toward brand primary
- disabled-item: item cannot be toggled; trigger and label use disabled text color; not-allowed interaction

## collapsible (single type only)

- collapsible-true: user may close the currently open section (zero sections open allowed)
- collapsible-false: at least one section must remain open when one section exists; clicking the open section does not close it

## visual properties

root.direction: column
root.width: 100%

item.border-bottom: 1px color-border-subtle
item.border-bottom [last item]: none

trigger.layout: horizontal flex; full width; align center; space-between trigger content and chevron
trigger.gap: 16px (between label slot and chevron)
trigger.padding-vertical: implied by min tap height via vertical padding (use 16px total comfortable tap — split symmetric)
trigger.font: font-body-md (16px / 24px, weight 500)
trigger.text [default]: color-text-default
trigger.text [hover, fine pointer]: color-primary
trigger.text [disabled]: color-text-disabled
trigger.transition [color]: 150ms, CSS default ease

chevron.size: 18×18px
chevron.color [default]: inherits trigger text
chevron.color [hover, fine pointer]: color-primary
chevron.rotation [collapsed]: 0deg
chevron.rotation [expanded]: 180deg
chevron.transition [transform]: 200ms ease-out-quad

content-wrapper.overflow: hidden
content-wrapper.max-height: animated from 0 to measured inner height when expanding (and reverse when collapsing)
content-wrapper.transition [max-height]: 200ms ease-out-quad

content.font: font-body-sm (14px / 20px, weight 400)
content.text: color-text-secondary
content.padding-bottom: 16px

## platform-bridge

  accordion-height-animation:
    intent: smooth expand/collapse without jarring layout jumps
    perceptual-goal: panel opens and closes in ~200ms with smooth deceleration
    react: CSS max-height transition on content-wrapper; numeric max-height from measured scrollHeight of inner content
    flutter: AnimatedAlign with heightFactor 0↔1 aligned to top, or AnimatedSize with alignment topCenter; duration 200ms; curve matching ease-out-quad per motion.md mapping
    parity-risk: medium
    ux-acceptance: closing animation completes without clipping visible content at rest; opening reveals full content height

  trigger-hover-tint:
    intent: affordance on desktop pointer — trigger reads as interactive before click
    perceptual-goal: label and chevron shift to primary brand color on hover
    react: @media (hover: hover) and (pointer: fine) + color transition on trigger
    flutter: MouseRegion on desktop/web only; animated or immediate Color.lerp to primary on hover
    parity-risk: high
    ux-acceptance: touch scroll paths do not leave spurious hover tint; keyboard focus still visible per focus product rules

## accessibility notes

- keyboard: Enter or Space toggles focused trigger; optional arrow keys between triggers (enhancement)
- screen-reader: trigger exposes expanded/collapsed; content region associated via aria-controls / id
- focus: visible focus ring on trigger (product-standard focus treatment)
