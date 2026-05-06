# Alert — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.

## export

class-name: `DsAlert`
file: `lib/src/components/alert/ds_alert.dart`
theme-class: `DsAlertTheme`
theme-file: `lib/src/components/alert/ds_alert_theme.dart`

## parameters

| parameter   | type             | default              | required | description |
|-------------|------------------|----------------------|----------|-------------|
| variant     | `DsAlertVariant` | —                    | yes      | Semantic palette |
| title       | `String?`        | `null`               | no       | Optional heading |
| child       | `Widget`         | —                    | yes      | Body message |
| icon        | `Widget?`        | `null`               | no       | Overrides built-in icon |
| dismissible | `bool`           | `false`              | no       | Shows dismiss affordance |
| onDismiss   | `VoidCallback?` | `null`              | no       | Dismiss tapped |

## enums

```dart
enum DsAlertVariant { info, success, warning, error }
```

## theme-extension-keys

`DsAlertTheme` holds per-variant `DsAlertPalette`:

Each palette fields → semantic tokens (defaults mirror light tokens.css):

- `background` → color-*-subtle for variant
- `border` → color-*-border
- `accent` → color-*-text (icon + title)

Body text uses `Theme.of(context).extension<DsThemeExtension>()?.colorTextDefault` / falls back to `DsTokens.colorTextDefault`.

Structural dimensions from style.md:

- padding: EdgeInsets.all(12)
- gap between row children: 12 logical px
- icon box: 20 logical px
- dismiss box: 20 logical px
- border radius: `BorderRadius.circular(DsTokens.radius3xl)`

Built-in icons match React SVG paths via `CustomPaint` size 20.

## semantics

- Root: `Semantics(container: true, liveRegion: true)` — verify platform behaviour for announcement

- Dismiss: `Semantics(button: true, label: 'Dismiss alert')`

- Decorative icon: `ExcludeSemantics` around icon when default glyph used

## callbacks

| callback  | signature       | description |
|-----------|-----------------|-------------|
| onDismiss | `VoidCallback?` | dismiss tapped |

## platform-notes

- Entrance: optional `SlideTransition` / `AnimatedSlide` — match 300ms ease-out-cubic — comment `// UX REVIEW: medium parity-risk — verify timing vs CSS acko-alert-slide-up`

- Dismiss hover opacity: `MouseRegion` on desktop/web only — `// UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React`

## notes

Alert is stateless; parent removes widget after dismiss callback.

