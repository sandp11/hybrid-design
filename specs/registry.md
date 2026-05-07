# Component Registry
> Maintained by agents only. Do not edit manually.
> Agents append entries on create, patch fields on modify.

## index

| name      | status | react-package   | flutter-export | depends-on | used-by |
|-----------|--------|-----------------|----------------|------------|---------|
| accordion | draft  | @acko/accordion | DsAccordion    | —          | —       |
| alert     | draft  | @acko/alert     | DsAlert        | —          | —       |
| button   | stable | @acko/button   | DsButton       | —          | —       |
| badge    | draft  | @acko/badge    | DsBadge        | —          | —       |
| breadcrumb | draft | @acko/breadcrumb | DsBreadcrumb | —          | —       |
| avatar   | draft  | @acko/avatar   | DsAvatar       | —          | —       |
| checkbox | draft  | @acko/checkbox | DsCheckbox     | —          | —       |
| calendar | draft  | @acko/calendar | DsCalendar     | —          | —       |
| card     | draft  | @acko/card     | DsCard         | —          | —       |
| dialog   | draft  | @acko/dialog   | DsDialog       | —          | —       |
| drawer   | draft  | @acko/drawer   | DsDrawer       | —          | —       |

---

## accordion

status:          draft
path:            specs/components/accordion/
react-package:   @acko/accordion
flutter-export:  DsAccordion
variants:        type-single, type-multiple
sizes:           —
states:          collapsed, expanded, hover-trigger, disabled-item
tokens-used:
  color:
    - color-text-default
    - color-text-secondary
    - color-text-disabled
    - color-primary
    - color-border-subtle
  typography:
    - font-body-md (16px / 24px, weight 500) — trigger
    - font-body-sm (14px / 20px, weight 400) — content
  motion:
    - ease-out-quad — 200ms max-height content + chevron rotate
    - ease — 150ms trigger color (hover)
depends-on:      —
used-by:         —
last-modified:   2026-05-06
modified-by:     migrate-agent

---

## alert

status:          draft
path:            specs/components/alert/
react-package:   @acko/alert
flutter-export:  DsAlert
variants:        info, success, warning, error
tokens-used:
  color:
    - color-info-subtle, color-info-border, color-info-text
    - color-success-subtle, color-success-border, color-success-text
    - color-warning-subtle, color-warning-border, color-warning-text
    - color-error-subtle, color-error-border, color-error-text
    - color-text-default
  radius:
    - radius-3xl
  motion:
    - ease-out-cubic — 300ms entrance translateY + opacity (acko-alert-slide-up)
  typography:
    - font-body-sm (14px/20px, weight 600) — title
    - font-caption (12px/16px) — body
depends-on:      —
used-by:         —
last-modified:   2026-05-06
modified-by:     migrate-agent

---

## button

status:          stable
path:            specs/components/button/
react-package:   @acko/button
flutter-export:  DsButton
variants:        primary, secondary, inverted, ghost, link, danger
sizes:           xs (32px), sm (40px), md (48px), lg (56px), xl (64px)
tokens-used:
  color:
    - color-primary, color-primary-hover, color-on-primary
    - color-btn-secondary-bg, color-btn-secondary-border, color-btn-secondary-text
    - color-btn-inverted-bg, color-btn-inverted-text
    - color-btn-ghost-color, color-btn-ghost-hover-bg
    - color-btn-link-color
    - color-btn-danger-bg, color-btn-danger-text
    - color-btn-disabled-bg, color-btn-disabled-text
    - color-error, color-primary-ring
  radius:
    - radius-full
  shadow:
    - shadow-btn-inner, shadow-btn-hover, shadow-focus-ring
  motion:
    - ease (CSS default) — 150ms background/color/border/shadow transitions
    - ease — 100ms transform/press transition
  typography:
    - 12px/16px weight-500 (xs), 14px/18px weight-500 (sm), 16px/24px weight-500 (md)
    - 18px/28px weight-500 (lg), 20px/32px weight-500 (xl)
depends-on:      —
used-by:         —
last-modified:   2026-05-05
modified-by:     migrate-agent

---

## badge

status:          draft
path:            specs/components/badge/
react-package:   @acko/badge
flutter-export:  DsBadge, DsCounterBadge
variants:        solid, outline, dot (Badge) | counter (CounterBadge)
colors:          purple, green, blue, orange, pink, gray (Badge) | purple, pink, blue (CounterBadge)
sizes:           responsive only — 12px mobile / 14px desktop (no size prop)
tokens-used:
  color:
    - color-badge-purple-gradient-from, color-badge-purple-gradient-to, color-badge-purple-border, color-badge-purple-text, color-badge-purple-outline-color
    - color-badge-green-gradient-from, color-badge-green-gradient-to, color-badge-green-border, color-badge-green-text, color-badge-green-outline-color
    - color-badge-blue-gradient-from, color-badge-blue-gradient-to, color-badge-blue-border, color-badge-blue-text, color-badge-blue-outline-color
    - color-badge-orange-gradient-from, color-badge-orange-gradient-to, color-badge-orange-border, color-badge-orange-text, color-badge-orange-outline-color
    - color-badge-pink-gradient-from, color-badge-pink-gradient-to, color-badge-pink-border, color-badge-pink-text, color-badge-pink-outline-color
    - color-badge-gray-gradient-from, color-badge-gray-gradient-to, color-badge-gray-border, color-badge-gray-text, color-badge-gray-outline-color
    - color-counter-purple-gradient-from, color-counter-purple-gradient-to, color-counter-purple-border
    - color-counter-pink-gradient-from, color-counter-pink-gradient-to, color-counter-pink-border
    - color-counter-blue-gradient-from, color-counter-blue-gradient-to, color-counter-blue-border
    - color-on-primary
  radius:
    - radius-full
  typography:
    - font-caption (12px) — mobile badge + counter
    - font-body-sm (14px) — desktop badge
depends-on:      —
used-by:         —
last-modified:   2026-05-05
modified-by:     migrate-agent

---

## breadcrumb

status:          draft
path:            specs/components/breadcrumb/
react-package:   @acko/breadcrumb
flutter-export:  DsBreadcrumb
variants:        —
sizes:           —
states:          link-default, link-hover, current, ellipsis-hover, collapsed trail
tokens-used:
  color:
    - color-breadcrumb-link, color-breadcrumb-link-hover, color-breadcrumb-current
    - color-breadcrumb-text, color-breadcrumb-separator
    - color-surface-raised-hover
  radius:
    - radius-full — ellipsis control
  typography:
    - font-body-sm (14px / 20px) — links and plain crumbs
    - font-label-lg weight (500) — current crumb
  motion:
    - ease — 150ms link color / ellipsis surface
depends-on:      —
used-by:         —
last-modified:   2026-05-06
modified-by:     migrate-agent

---

## avatar

status:          draft
path:            specs/components/avatar/
react-package:   @acko/avatar
flutter-export:  DsAvatar
sizes:           xs (24px), sm (32px), md (40px), lg (48px), xl (64px)
shapes:          circle (radius-full), square (radius-lg)
tokens-used:
  color:
    - color-primary
    - color-primary-subtle
  radius:
    - radius-full
    - radius-lg
  typography:
    - font-label-sm (10px) — xs initials
    - font-label-md (12px) — sm initials
    - font-body-sm (14px)  — md initials
    - font-body-md (16px)  — lg initials
    - font-heading-md (20px) — xl initials + md icon
  motion:
    - opacity 200ms ease — image load fade (image-load-fade equivalence entry)
depends-on:      —
used-by:         —
last-modified:   2026-05-06
modified-by:     migrate-agent

---

## checkbox

status:          draft
path:            specs/components/checkbox/
react-package:   @acko/checkbox
flutter-export:  DsCheckbox, DsCheckboxRow, DsCheckboxGroup
sizes:           sm (16px box), md (20px box), lg (24px box) — atom only; row is responsive
states:          unchecked, checked, indeterminate, hover-unchecked, hover-checked, focused, disabled-unchecked, disabled-checked, error, active
tokens-used:
  color:
    - color-control-border-selector
    - color-card-bg
    - color-primary, color-primary-hover, color-primary-muted, color-primary-subtle, color-primary-ring, color-on-primary
    - color-border-subtle, color-border
    - color-surface-raised, color-surface-ghost-hover
    - color-disabled-border, color-disabled-bg, color-disabled-text
    - color-error
    - color-text-default, color-text-secondary
  radius:
    - radius-sm, radius-md, radius-lg
  typography:
    - font-body-sm (14px) — sm label
    - font-body-md (16px) — md label + row desktop
    - font-body-lg (18px) — lg label + row mobile
    - font-caption (12px) — description
    - font-label-lg (14px w500) — group label
  motion:
    - 300ms spring — check bounce + icon pop
    - 300ms ease-out — stroke-dashoffset checkmark draw
    - 300ms — error shake (acko-checkbox-shake)
    - 150ms ease — box color transition
depends-on:      —
used-by:         —
last-modified:   2026-05-06
modified-by:     migrate-agent

---

## calendar

status:          draft
path:            specs/components/calendar/
react-package:   @acko/calendar
flutter-export:  DsCalendar, DsDateRange
variants:        single, range, multi
sizes:           —
states:          trigger-default, trigger-hover, trigger-open, trigger-placeholder, panel-enter, day-selected, day-range-start, day-range-middle, day-range-end, day-today, day-outside, day-disabled, picker-selected, picker-current
tokens-used:
  color:
    - color-card-bg, color-card-border
    - color-input-bg, color-input-border, color-input-hover-border, color-input-focus-border, color-input-focus-ring
    - color-primary-ring
    - color-text-primary, color-text-secondary, color-text-disabled
    - color-cal-today-text, color-cal-selected-bg, color-cal-selected-text
    - color-cal-range-bg, color-cal-range-text, color-cal-cell-hover-bg
    - color-surface-raised, color-border — dark panel override
  radius:
    - radius-lg — trigger, header label, nav
    - radius-4xl — panel
    - radius-full — day + picker cells
  shadow:
    - shadow-md — panel
  motion:
    - ease-out-cubic — 150ms dropdown panel enter (acko-cal-enter)
  layout:
    - z-dropdown — dropdown panel stacking
  typography:
    - font-body-sm — trigger, day numerals, picker cells
    - font-body-md — header label
    - font-label-sm — weekday row
depends-on:      —
used-by:         —
last-modified:   2026-05-06
modified-by:     migrate-agent

---

## dialog

status:          draft
path:            specs/components/dialog/
react-package:   @acko/dialog
flutter-export:  DsDialog
variants:        —
sizes:           sm (360px), md (480px), lg (600px), xl (760px), full (100%)
states:          open (backdrop + panel enter animation), closed (not rendered), focus (close button + children)
tokens-used:
  color:
    - color-surface-overlay — backdrop
    - color-surface-raised — panel background
    - color-surface-ghost-hover — close button hover
    - color-text-default — title
    - color-text-secondary — description, close icon
    - color-border-subtle — footer top divider
    - color-primary-ring — focus ring
  radius:
    - radius-4xl — panel (all sizes except full)
    - radius-full — close button
  shadow:
    - shadow-lg — panel elevation
    - shadow-focus-ring — close button focus
  layout:
    - z-modal — backdrop + panel stacking
  motion:
    - ease-out-cubic — 200ms backdrop opacity enter
    - ease-out-quart — 250ms panel opacity + scale(0.95→1) + translateY(8px→0) enter
  typography:
    - font-body-lg weight 600 — title
    - font-body-sm — description
depends-on:      —
used-by:         —
last-modified:   2026-05-07
modified-by:     migrate-agent

---

## drawer

status:          draft
path:            specs/components/drawer/
react-package:   @acko/drawer
flutter-export:  DsDrawer
variants:        side: left, right (default), bottom, top
sizes:           sm, md (default), lg, full — width (left/right) or max-height (bottom/top)
states:          closed (visibility:hidden), open (slide-in + backdrop), close-button-hover, close-button-focus
tokens-used:
  color:
    - color-surface-overlay — backdrop
    - color-surface-raised — panel background
    - color-surface-ghost-hover — close button hover
    - color-text-default — title, body
    - color-text-secondary — description, close icon
    - color-border-subtle — header bottom + footer top dividers
    - color-primary-ring — focus ring
  radius:
    - radius-4xl — interior panel corners (per-side, two corners only)
    - radius-full — close button
  shadow:
    - shadow-modal — panel elevation (→ shadow-xl)
    - shadow-focus-ring — close button focus
  layout:
    - z-modal — root-shell stacking
  motion:
    - ease-out-cubic — 250ms backdrop opacity
    - ease-out-quart — 300ms panel transform slide
  typography:
    - font-body-lg weight 600 — title
    - font-body-sm — description
depends-on:      —
used-by:         —
last-modified:   2026-05-07
modified-by:     migrate-agent

---

## card

status:          draft
path:            specs/components/card/
react-package:   @acko/card
flutter-export:  DsCard, DsCardHeader, DsCardContent, DsCardFooter, DsCardInset
variants:        default, secondary, elevated, outline, demoted
sizes:           padding none | sm | md | lg — responsive shell inset; outer + nested radius responsive
states:          —
tokens-used:
  color:
    - color-card-bg, color-card-border
    - color-card-secondary-bg, color-card-secondary-border
    - color-card-elevated-bg
    - color-card-demoted-bg, color-card-demoted-border
    - color-card-outline-border
    - color-border-subtle — header/footer dividers
  radius:
    - radius-5xl, radius-6xl — outer shell (via radius-card-outer)
    - radius-2xl, radius-3xl — nested inset (via radius-card-nested)
  layout:
    - card-content-gutter — responsive gutter + padding scale
  shadow:
    - shadow-lg — elevated variant
depends-on:      —
used-by:         —
last-modified:   2026-05-06
modified-by:     migrate-agent
