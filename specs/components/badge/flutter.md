# Badge — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## export

class-name:   DsBadge
file:         lib/src/components/badge/ds_badge.dart
theme-class:  DsBadgeTheme
theme-file:   lib/src/components/badge/ds_badge_theme.dart

CounterBadge class-name: DsCounterBadge (same files)

## parameters

### DsBadge

| parameter  | type               | default               | required | description                                    |
|------------|--------------------|-----------------------|----------|------------------------------------------------|
| label      | String             | —                     | yes      | badge label; passed to Semantics               |
| variant    | DsBadgeVariant     | DsBadgeVariant.solid  | no       | visual style                                   |
| color      | DsBadgeColor       | DsBadgeColor.purple   | no       | color set                                      |
| textCase   | DsBadgeTextCase    | DsBadgeTextCase.uppercase | no   | uppercase transforms + letter-spacing; sentence passes as-is |
| removable  | bool               | false                 | no       | shows remove button (GestureDetector + X icon) |
| onRemove   | VoidCallback?      | null                  | no       | called when remove button is tapped            |

### DsCounterBadge

| parameter  | type                    | default                      | required | description                                   |
|------------|-------------------------|------------------------------|----------|-----------------------------------------------|
| count      | int                     | —                            | yes      | numeric value                                 |
| max        | int?                    | null                         | no       | when count > max, displays "$max+"            |
| color      | DsCounterBadgeColor     | DsCounterBadgeColor.purple   | no       | color set                                     |

## enums

```dart
enum DsBadgeVariant   { solid, outline, dot }
enum DsBadgeColor     { purple, green, blue, orange, pink, gray }
enum DsBadgeTextCase  { uppercase, sentence }
enum DsCounterBadgeColor { purple, pink, blue }
```

## theme-extension-keys

`DsBadgeTheme extends ThemeExtension<DsBadgeTheme>`

### Color sets

`DsBadgeColorSet` — nested data class per badge color (purple/green/blue/orange/pink/gray):

| field             | light default                      | dark default                        |
|-------------------|------------------------------------|-------------------------------------|
| gradientFrom      | color-badge-{color}-gradient-from  | hue-950 @ 90% opacity               |
| gradientTo        | color-badge-{color}-gradient-to    | hue-900 @ 90% opacity               |
| border            | color-badge-{color}-border         | hue-900 opaque                      |
| text              | color-badge-{color}-text           | hue-200                             |
| outlineColor      | color-badge-{color}-outline-color  | hue-400 (purple), hue-600 (others), grey-500 (gray) |

Fields on DsBadgeTheme: `purple`, `green`, `blue`, `orange`, `pink`, `gray` — each of type `DsBadgeColorSet`.

`DsCounterBadgeColorSet` — nested data class per counter color (purple/pink/blue):

| field             | light default                         | dark default                        |
|-------------------|---------------------------------------|-------------------------------------|
| gradientFrom      | color-counter-{color}-gradient-from   | hue-950 @ 90% opacity               |
| gradientTo        | color-counter-{color}-gradient-to     | hue-900 @ 90% opacity               |
| border            | color-counter-{color}-border          | hue-900 opaque                      |

Fields on DsBadgeTheme: `counterPurple`, `counterPink`, `counterBlue` — each of type `DsCounterBadgeColorSet`. Plus `counterText: Color` = color-on-primary (#FFFFFF).

### Dimensions

| field               | value   |
|---------------------|---------|
| padding             | EdgeInsets.symmetric(horizontal: 8, vertical: 6) |
| gap                 | 4.0 (SizedBox width between children) |
| dotSize             | 6.0     |
| removeIconSize      | 12.0    |
| mobileTextSize      | 12.0    |
| desktopTextSize     | 14.0    |
| desktopBreakpoint   | 768.0   |
| borderRadius        | BorderRadius.circular(9999) |
| counterPadding      | EdgeInsets.symmetric(horizontal: 6, vertical: 2) |
| counterMinWidth     | 20.0    |

### Static instances

`DsBadgeTheme.light` — all light-theme token values (see light column in style.md).
`DsBadgeTheme.dark`  — all dark-theme token values.
`DsBadgeTheme.defaults` = `DsBadgeTheme.light`.

## semantics

- label: the `label` parameter value
- button: false (DsBadge container is not interactive)
- remove button: Semantics(label: 'Remove', button: true) wrapping the GestureDetector

## callbacks

| callback   | signature     | description                              |
|------------|---------------|------------------------------------------|
| onRemove   | VoidCallback? | tapped on remove icon; only when removable=true |

## platform-notes

- **gradient**: `BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [gradientFrom, gradientTo]))` — matches CSS `linear-gradient(0deg, from, to)` (0deg = bottom→top in CSS).

- **outline variant**: `BoxDecoration(color: Colors.transparent, border: Border.all(color: outlineColor, width: 1.0))` + `TextStyle(color: outlineColor)`. No gradient.

- **text-transform uppercase**: `label.toUpperCase()` + `TextStyle(letterSpacing: textSize * 0.04)`.
  // UX REVIEW: high parity-risk — CSS letter-spacing is in em units resolved against font-size; Flutter letterSpacing is in logical pixels. Formula `textSize * 0.04` approximates 0.04em correctly (e.g. 12px × 0.04 = 0.48px, 14px × 0.04 = 0.56px). Verify against React render.

- **responsive sizing**: `MediaQuery.of(context).size.width >= theme.desktopBreakpoint` selects `desktopTextSize` (14.0) vs `mobileTextSize` (12.0).
  // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.

- **dot child**: `Container(width: theme.dotSize, height: theme.dotSize, decoration: BoxDecoration(shape: BoxShape.circle, color: fg))`. Rendered first in the Row, followed by a SizedBox(width: theme.gap).

- **remove button**: `GestureDetector(onTap: onRemove, child: SizedBox(width: theme.removeIconSize, height: theme.removeIconSize, child: CustomPaint(painter: _XIconPainter(color: fg))))`. `_XIconPainter` draws two diagonal lines with strokeWidth 1.5, StrokeCap.round. No haptic — badge is not a primary action.

- **gap between children**: `SizedBox(width: theme.gap)` inserted between each visible child in the Row (not a Wrap or Flex gap — Row with explicit separators).

- **counter tabular figures**: `TextStyle(fontFeatures: [FontFeature.tabularFigures()])` from `dart:ui`.

- **DsBadgeTheme.lerp**: `DsBadgeColorSet.lerp` uses `Color.lerp` on each field. `DsCounterBadgeColorSet.lerp` same. `lerpDouble` for all double fields.

## notes

- `DsBadgeColorSet` and `DsCounterBadgeColorSet` are plain immutable data classes (not ThemeExtension). Only `DsBadgeTheme` extends ThemeExtension.
- `DsBadgeColorSet.lerp(other, t)` returns a new `DsBadgeColorSet` with all colors lerped — called inside `DsBadgeTheme.lerp`.
- No size prop, no disabled state, no loading state, no hover, no focus ring on the badge container.
- Badge is a `StatelessWidget`. No state management needed.
