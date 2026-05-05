# Component Registry
> Maintained by agents only. Do not edit manually.
> Agents append entries on create, patch fields on modify.

## index

| name    | status | react-package  | flutter-export | depends-on | used-by |
|---------|--------|----------------|----------------|------------|---------|
| button  | stable | @acko/button   | DsButton       | —          | —       |

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
