# Breadcrumb — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.
> This is the only file UX edits directly.

## anatomy

- nav: landmark wrapper for the trail
- list: horizontal ordered list of segments (links, text, ellipsis control)
- crumb-link: navigational segment with optional leading icon; uses link styling when actionable
- crumb-current: final segment representing the current page (not a link)
- crumb-text: plain non-link segment that is not the current page (inherits secondary trail text)
- separator: visual divider between segments (decorative only)
- ellipsis-control: compact button that expands the full trail when middle segments are collapsed
- icon: optional glyph before label inside a crumb

## variants

No visual variants — density is fixed (single horizontal rhythm).

## sizes

No size props — typography tokens define hierarchy (current vs links vs secondary).

## states

- link-default: trail link uses link token color
- link-hover (fine pointer): link hover color; underline appears
- current: last segment uses current-page emphasis weight and color
- ellipsis-hover (fine pointer): ellipsis button surface tint
- collapsed: middle segments hidden; ellipsis control visible until expanded (behavior in react/flutter)

## visual properties

nav.width: 100%

list.direction: row
list.wrap: allowed when space is constrained
list.align-items: center
list.gap: 4px between segment cells (including separators)
list.style: no bullets

crumb-link.font: font-body-sm (14px / 20px, weight 400)
crumb-link.color: color-breadcrumb-link
crumb-link.text-decoration [hover, fine pointer]: underline
crumb-link.color [hover, fine pointer]: color-breadcrumb-link-hover
crumb-link.transition [color]: 150ms ease

crumb-current.font: font-body-sm size with font-label-lg weight (500)
crumb-current.color: color-breadcrumb-current

crumb-text.font: font-body-sm
crumb-text.color: color-breadcrumb-text

separator.color: color-breadcrumb-separator
separator.layout: flex alignment with adjacent crumbs; horizontal spacing consistent with list gap (4px rhythm)

ellipsis-control.padding-vertical: 4px
ellipsis-control.padding-horizontal: 8px
ellipsis-control.border-radius: radius-full
ellipsis-control.background [hover, fine pointer]: color-surface-raised-hover

icon.layout: inline flex beside label within the crumb row
icon.gap-to-label: 4px (matches list gap rhythm)

## platform-bridge

  breadcrumb-trail-hover:
    intent: links gain underline and hover color on desktop pointer; ellipsis gains subtle fill
    perceptual-goal: readable trail with clear interactive affordance without noisy chrome
    react: @media (hover: hover) and (pointer: fine) for link underline + color; ellipsis uses surface-raised-hover
    flutter: MouseRegion + InkWell or hover-aware colors on desktop/web; omit hover tint on coarse pointers where appropriate
    parity-risk: high
    ux-acceptance: touch navigation still works without sticky hover styles

  breadcrumb-collapse:
    intent: long trails shorten to first + control + last segments
    perceptual-goal: predictable truncation with explicit control to reveal full path
    react: DOM measurement not required; logical split by maxItems rules
    flutter: same index rules; expanded state toggled from ellipsis
    parity-risk: low
    ux-acceptance: expanded state shows identical order as unconstrained trail

## accessibility notes

- Landmark: navigation region with an accessible name for the breadcrumb trail
- Order: preserve reading order in the list
- Current page: exposed as current in accessibility APIs on the last crumb only
- Separators: hidden from accessibility tree
- Ellipsis control: explicit accessible name when collapsed
