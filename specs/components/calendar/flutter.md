# Calendar — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.

## export

class-name: `DsCalendar`
file: `lib/src/components/calendar/ds_calendar.dart`
theme-class: `DsCalendarTheme`
theme-file: `lib/src/components/calendar/ds_calendar_theme.dart`

## parameters

| parameter       | type                     | default            | required | description |
|-----------------|--------------------------|--------------------|----------|-------------|
| variant         | `DsCalendarVariant`      | `single`           | no       | single / range / multi |
| display         | `DsCalendarDisplay`      | `dropdown`         | no       | inline vs anchored overlay |
| value           | `Object` (see below)     | —                  | yes      | Same shapes as React |
| onChanged       | `ValueChanged<Object>?`  | —                  | yes      | Emits updated selection |
| minDate         | `DateTime?`              | —                  | no       | Local date bound |
| maxDate         | `DateTime?`              | —                  | no       | Local date bound |
| disabledDates   | `List<DateTime>?`       | —                  | no       | Extra exclusions |
| locale          | `Locale`                 | `Locale('en','IN')`| no       | Formatting |
| triggerBuilder  | optional                 | —                  | no       | Replace dropdown trigger |

Value shapes:

- single: `DateTime`
- range: `{DateTime start, DateTime end}` — use a small `DsDateRange` record/class.
- multi: `List<DateTime>`

## enums

- `DsCalendarVariant` — `single`, `range`, `multi`
- `DsCalendarDisplay` — `inline`, `dropdown`

## theme-extension-keys

Map style.md → theme fields (defaults mirror `tokens.css` / `DsTokens` numerics):

| style concept | theme field | default reference |
|---------------|---------------|-------------------|
| trigger bg/border | `triggerBackground`, `triggerBorderColor`, `triggerBorderWidth` | input semantic colors |
| trigger open ring | `triggerFocusRingColor`, `triggerFocusRingSpread` | color-primary-ring / 2px |
| panel surface | `panelBackground`, `panelBorderColor`, `panelBorderRadius` | color-card-bg, color-card-border, radius4xl |
| panel shadow | `panelShadowBlur`, `panelShadowOffsetY`, `panelShadowColor` | shadow-md equivalence |
| panel width | `panelWidth` | 340 |
| header text | `headerTextStyle` | font-body-md |
| nav hover | `navHoverColor` | color-cal-cell-hover-bg |
| day selected | `daySelectedBackground`, `daySelectedForeground` | color-cal-selected-* |
| range band | `rangeBandBackground`, `rangeBandForeground` | color-cal-range-* |
| today text | `todayColor` | color-cal-today-text |
| disabled | `dayDisabledForeground` | color-text-secondary |
| outside month | `outsideForeground` | color-text-disabled |

## semantics

- grid: `Semantics` container with `liveRegion` false; cells use `selected`, `enabled`, `label`.
- trigger (dropdown): `hint` describes opens calendar; `expanded` tracks overlay.

## callbacks

| callback   | signature | description |
|------------|-----------|-------------|
| onChanged  | `void Function(Object value)` | Selection update |

## platform-notes

- hover: `MouseRegion` on desktop/web only for day/picker hover fills — `// UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.`
- press: `GestureDetector` `onTapDown`/`onTapUp` + `AnimatedScale` to `0.97` on day/picker cells.
- focus: `FocusNode` per focusable cell with `BoxDecoration` border `3px` using `focusRingColor` from theme — `// UX REVIEW: high parity-risk — verify focus ring vs CSS.`
- haptics: `HapticFeedback.lightImpact()` inside selection callbacks on iOS/Android.
- dropdown overlay: prefer `OverlayPortal` / `CompositedTransformFollower` for parity with `position:absolute` — `// UX REVIEW: high parity-risk — overlay stacking vs web z-dropdown.`

## notes

- Disabled styling uses explicit muted colors + `IgnorePointer`, never raw `Opacity` wrapper on the whole panel.
- Range preview while selecting uses `rangeBand*` colors between anchor and hovered date.
- Theme implements `copyWith` (nullable fields) and `lerp` per field type like other DS components.
