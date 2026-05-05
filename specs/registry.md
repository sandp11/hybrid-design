# Component Registry
> Maintained by agents only. Do not edit manually.
> Agents append entries on create, patch fields on modify.

## index

| name    | status | react-package  | flutter-export | depends-on | used-by |
|---------|--------|----------------|----------------|------------|---------|
| button  | stable | @acko/button   | DsButton       | —          | —       |
| badge   | draft  | @acko/badge    | DsBadge        | —          | —       |
| avatar  | draft  | @acko/avatar   | DsAvatar       | —          | —       |

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
