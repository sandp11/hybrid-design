# Checkbox — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.
> This is the only file UX edits directly.

## anatomy

Checkbox (atom):
- box: custom visual square; contains the check or minus icon
- icon: checkmark (checked) or minus (indeterminate) drawn inside the box
- label: text label beside the box
- description: optional supporting text below the label
- native-input: visually hidden; drives browser/platform accessibility

CheckboxRow:
- row: full-width tappable container
- box: reuses atom box — responsive size (md on desktop, lg on mobile)
- content: column holding label + description
- label: row label text
- description: optional supporting subtext
- separator: 1px line at bottom of row; hidden on last item in list

CheckboxGroup:
- list: column container of CheckboxRow items
- list-label: group heading above the list

## variants

No visual variants — state is driven by checked/indeterminate/disabled/error props.
CheckboxRow is a separate layout pattern, not a variant of the atom.

## sizes

Atom only (CheckboxRow uses md/lg responsive, no prop):
- sm: box 16×16px, radius-sm (4px), icon 10px, label font-body-sm (14px)
- md: box 20×20px, radius-md (6px), icon 12px, label font-body-md (16px)  [default]
- lg: box 24×24px, radius-md (6px), icon 14px, label font-body-lg (18px)

## states

- unchecked: empty box, default border and background
- checked: filled box + animated checkmark
- indeterminate: filled box + minus icon
- hover-unchecked: muted border + subtle tint background (desktop pointer only)
- hover-checked: darker fill (desktop pointer only)
- focused: focus ring outside the box
- disabled-unchecked: muted border, surface-raised background, not interactive
- disabled-checked: disabled colors, icon still visible, not interactive
- error: error-colored border, card-bg background
- active: surface tint on row tap (mobile only)

## visual properties

### Checkbox atom — box dimensions

box.width  [sm]: 16px
box.height [sm]: 16px
box.width  [md]: 20px
box.height [md]: 20px
box.width  [lg]: 24px
box.height [lg]: 24px
box.border-width: 1.5px (all states)
box.border-radius [sm]: radius-sm (4px)
box.border-radius [md]: radius-md (6px)
box.border-radius [lg]: radius-md (6px)
box.flex-shrink: 0

### Checkbox atom — box colors

box.border [unchecked]:           color-control-border-selector
box.background [unchecked]:       color-card-bg
box.border [checked]:             color-primary
box.background [checked]:         color-primary
box.border [indeterminate]:       color-primary
box.background [indeterminate]:   color-primary
box.border [hover-unchecked]:     color-primary-muted
box.background [hover-unchecked]: color-primary-subtle
box.border [hover-checked]:       color-primary-hover
box.background [hover-checked]:   color-primary-hover
box.border [focused]:             color-primary
box.focus-ring: 3px spread outside box, color-primary-ring
box.border [disabled-unchecked]:     color-border-subtle
box.background [disabled-unchecked]: color-surface-raised
box.border [disabled-checked]:       color-disabled-border
box.background [disabled-checked]:   color-disabled-bg
box.border [error]:               color-error
box.background [error]:           color-card-bg

### Checkbox atom — icon

icon.color [checked]:          color-on-primary
icon.color [indeterminate]:    color-on-primary
icon.color [disabled-checked]: color-disabled-text
icon.size [sm]: 10px
icon.size [md]: 12px
icon.size [lg]: 14px
icon.type [checked]:       checkmark path, animated stroke draw left-to-right
icon.type [indeterminate]: horizontal minus/dash path

### Checkbox atom — label and description

atom.gap: 12px (between box and text column)
label.color: color-text-default
label.font [sm]: font-body-sm (14px / 20px, weight 400)
label.font [md]: font-body-md (16px / 24px, weight 400)
label.font [lg]: font-body-lg (18px / 24px, weight 400)
description.color: color-text-secondary
description.font: font-caption (12px / 16px)

### Checkbox atom — animation

checked-enter: box bounces (scale 0.85 → 1.05 → 1.0) over 300ms spring; icon draws in via stroke-dashoffset 300ms ease-out
error: horizontal shake 300ms (acko-checkbox-shake keyframe)
icon-pop: scale(0.3 → 1) over 300ms spring on first appearance

### CheckboxRow — layout

row.width: 100% (no horizontal padding — inherits from parent)
row.gap: 12px (between box and content)
row.min-height [desktop ≥768px]: 44px
row.min-height [mobile <768px]:  52px
row.padding-vertical [desktop]:  12px
row.padding-vertical [mobile]:   16px
row.box-position [desktop]: leading (left)
row.box-position [mobile]:  trailing (right)
row.box-size [desktop]: md (20×20px)
row.box-size [mobile]:  lg (24×24px)

### CheckboxRow — colors and typography

row.background [hover, desktop pointer]: color-surface-ghost-hover
row.background [active, mobile tap]:     color-surface-ghost-hover
row.label.color: color-text-default
row.label.font [desktop]: font-body-md (16px)
row.label.font [mobile]:  font-body-lg (18px)
row.description.color: color-text-secondary
row.description.font: font-caption (12px)

### CheckboxRow — separator

separator.height: 1px
separator.color: color-border
separator.position: bottom edge of each row
separator.visibility: visible on all rows except the last child in the list
separator.visibility [desktop, inside multi-select menu overlay]: hidden — thin dividers omitted so hover alone separates rows; mobile sheet keeps separators visible

### CheckboxGroup

list.direction: column
list-label.font: font-label-lg (14px, weight 500)
list-label.color: color-text-default
list-label.margin-bottom: 8px

## platform-bridge

  responsive-checkbox-position:
    intent: checkbox is on the LEFT on desktop, RIGHT on mobile — driven by viewport, no prop
    perceptual-goal: desktop aligns with dropdown multi-select (checkbox left); mobile places checkbox in right thumb zone
    react: DOM order is native input, box, then content column — flex-direction row-reverse below 768px (checkbox right); @media (min-width:768px) flex-direction row (checkbox left)
    flutter: MediaQuery.of(context).size.width >= 768 controls children order in Row — box first (left) on desktop, box last (right) on mobile
    parity-risk: high
    ux-acceptance: at exactly 768px width, checkbox must be on left; at 767px, on right — verify on both platforms

  row-hover-vs-active:
    intent: desktop gets hover highlight; mobile gets tap/active highlight; never both simultaneously
    perceptual-goal: row background tints on pointer hover (desktop) or finger press (mobile)
    react: @media (hover: hover) and (pointer: fine) wraps hover rule; :active covers mobile
    flutter: MouseRegion tracks hover on desktop; GestureDetector onTapDown/onTapUp drives active tint
    parity-risk: high
    ux-acceptance: touch devices show no hover on swipe; mouse devices show hover without tap

  checkbox-animation:
    intent: checkmark animates in on check; box bounces; icon pops; error shakes
    perceptual-goal: check feels springy and satisfying (300ms); error shake is unmissable (300ms)
    react: stroke-dashoffset on SVG path for tick draw; CSS keyframe acko-checkbox-bounce for scale; acko-checkbox-shake for horizontal error
    flutter: AnimationController + Path.computeMetrics for progressive checkmark draw; AnimatedScale for bounce; SlideTransition + Tween<Offset> for error shake
    parity-risk: medium
    ux-acceptance: checkmark draws from left to right; box springs on check; error row shakes horizontally 3–4px

  separator:
    intent: 1px visual divider between rows; absent on the last row
    perceptual-goal: clean list separation without a container border
    react: ::after pseudo-element; :last-child::after { display: none }; scoped hide inside desktop multi-select menu container (see Dropdown styles)
    flutter: conditional BoxDecoration bottom border per row, skipped on last index; parent overlay may hide separators on wide viewports when matching Dropdown multi-menu rules
    parity-risk: low
    ux-acceptance: last row in any list has no visible bottom line

  dropdown-multi-row-hover:
    intent: row hover inside desktop multi-select menu matches single-select option hover tint
    perceptual-goal: primary-subtle wash on pointer hover instead of surface-ghost-hover
    react: scoped rule under multi-select menu container overrides `.acko-cb-row:hover` background to color-primary-subtle (desktop + fine pointer only)
    flutter: Dropdown implementation applies row hover color using color-primary-subtle when embedding CheckboxRow in menu mode — verify when Dropdown ships
    parity-risk: medium
    ux-acceptance: menu rows match adjacent single-select option hover

## accessibility notes

- keyboard: Space toggles; Tab/Shift-Tab moves focus; Enter also toggles on the atom
- screen-reader: announce label + description; announce checked/unchecked/mixed state; announce error state
- focus: visible 3px ring (color-primary-ring) on the box; row container is not separately focusable
- disabled: aria-disabled="true"; removed from tab order; not interactive
- indeterminate: aria-checked="mixed" on native input
- error: aria-invalid="true" on native input
