# Button — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## export

class-name: DsButton
file: lib/src/components/button/ds_button.dart
theme-class: DsButtonTheme
theme-file: lib/src/components/button/ds_button_theme.dart

## parameters

| parameter  | type             | default   | required | description                                                          |
|------------|------------------|-----------|----------|----------------------------------------------------------------------|
| label      | String           | —         | yes      | button label text; always passed to Semantics for screen readers     |
| onPressed  | VoidCallback?    | null      | no       | null = disabled (Flutter idiomatic pattern)                          |
| variant    | DsButtonVariant  | primary   | no       | visual variant                                                       |
| size       | DsButtonSize     | md        | no       | size variant                                                         |
| isLoading  | bool             | false     | no       | shows loading dots, blocks interaction                               |
| iconLeft   | Widget?          | null      | no       | widget rendered before label; sized by SizedBox to icon size         |
| iconRight  | Widget?          | null      | no       | widget rendered after label; sized by SizedBox to icon size          |
| iconOnly   | bool             | false     | no       | square button; label passed to Semantics but visually hidden         |
| fullWidth  | bool             | false     | no       | stretches button to fill parent width                                |

## enums

DsButtonVariant: primary, secondary, inverted, ghost, link, danger
DsButtonSize: xs, sm, md, lg, xl

## theme-extension-keys

DsButtonTheme extends ThemeExtension<DsButtonTheme>. All defaults reference DsTokens constants.

### backgrounds
primaryBg:                DsTokens.colorPrimary
primaryHoverBg:           DsTokens.colorPrimaryHover
secondaryBg:              DsTokens.colorBtnSecondaryBg
secondaryBorderColor:     DsTokens.colorBtnSecondaryBorder
invertedBg:               DsTokens.colorBtnInvertedBg
ghostHoverBg:             DsTokens.colorBtnGhostHoverBg
dangerBg:                 DsTokens.colorBtnDangerBg
disabledBg:               DsTokens.colorBtnDisabledBg
linkBg:                   Colors.transparent
ghostBg:                  Colors.transparent

### foregrounds
primaryFg:                DsTokens.colorOnPrimary
secondaryFg:              DsTokens.colorBtnSecondaryText
invertedFg:               DsTokens.colorBtnInvertedText
ghostFg:                  DsTokens.colorBtnGhostColor
linkFg:                   DsTokens.colorBtnLinkColor
dangerFg:                 DsTokens.colorBtnDangerText
disabledFg:               DsTokens.colorBtnDisabledText

### shadows
primaryShadowInner:       BoxShadow(color: Color(0x47FFFFFF), blurRadius: 2, offset: Offset(0,1), blurStyle: BlurStyle.inner)
primaryHoverShadow:       BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0,4))
focusRingColor:           DsTokens.colorPrimaryRing
dangerFocusRingColor:     DsTokens.colorError  (applied at 0.20 opacity)

### dimensions
xsHeight:                 32.0
smHeight:                 40.0
mdHeight:                 48.0
lgHeight:                 56.0
xlHeight:                 64.0

xsPaddingH:               16.0
smPaddingH:               16.0
mdPaddingH:               16.0
lgPaddingH:               24.0
xlPaddingH:               32.0

linkPaddingH:             0.0   (link variant has no horizontal padding)

borderRadius:             BorderRadius.circular(DsTokens.radiusFull)

### icon sizing
xsIconSize:               12.0
smIconSize:               16.0
mdIconSize:               16.0
lgIconSize:               24.0
xlIconSize:               32.0

iconGap:                  8.0   (gap between icon and label)
dotsGap:                  4.0   (gap between dots)

### loading dots
dotSize:                  6.0
dotCount:                 3
dotAnimationDelay:        [0ms, 150ms, 300ms]
dotAnimationDuration:     1200ms total cycle

### animation
animationDuration:        Duration(milliseconds: 150)
animationCurve:           DsTokens.easeOutCubic
pressScale:               0.97
pressAnimationDuration:   Duration(milliseconds: 100)

## semantics

- label: the `label` parameter value. When `isLoading` is true: `'$label, loading'`
- button: true
- enabled: true when `onPressed != null && !isLoading`
- focusable: true always, including when disabled
- When `iconOnly` is true: label is passed to Semantics even though visually hidden

## callbacks

| callback  | signature     | description                                     |
|-----------|---------------|-------------------------------------------------|
| onPressed | VoidCallback? | null is the Flutter-idiomatic disabled pattern  |

## platform-notes

- **disabled state**: derive `_isDisabled = onPressed == null || isLoading`. Do NOT use Opacity widget. Use explicit `disabledBg` and `disabledFg` color values — opacity stays 1.0. Wrap the entire button in `IgnorePointer(ignoring: _isDisabled)` to block gesture detection while keeping focus accessible.

- **hover**: wrap with `MouseRegion` on desktop/web Flutter targets only. Detect via `kIsWeb` or `defaultTargetPlatform`. On mobile builds omit entirely.
  - primary hover: swap background from `primaryBg` → `primaryHoverBg` + add `primaryHoverShadow`
  - secondary hover: overlay `Colors.black.withOpacity(0.04)` (light) / `Colors.white.withOpacity(0.04)` (dark)
  - inverted hover: overlay `Colors.black.withOpacity(0.04)` (light) / `Colors.white.withOpacity(0.10)` (dark)
  - ghost hover: swap to `ghostHoverBg`
  - link hover: no background change (underline handled by TextStyle decoration)
  - danger hover: overlay `Colors.black.withOpacity(0.04)` (light) / `Colors.white.withOpacity(0.04)` (dark)
  - // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.

- **haptic**: call `HapticFeedback.lightImpact()` inside `onPressed` wrapper on iOS/Android.

- **active-press**: use `GestureDetector` `onTapDown` / `onTapUp` + `AnimatedScale(scale: _isPressed ? 0.97 : 1.0)` with `pressAnimationDuration`.

- **loading-dots**: use `AnimatedSwitcher` with `duration: Duration(milliseconds: 100)` to swap between content row and dots row. Dots row: three `AnimatedContainer` widgets cycling vertical translation (translateY equivalent via `Transform.translate`) using staggered `AnimationController` with `repeat()`. Constrain dots row to same height as content row using `SizedBox` to prevent layout shift.

- **focus-ring**: `FocusNode` listener toggles a `BoxDecoration` border of width 3px, color `focusRingColor`, `borderRadius: borderRadius`. Danger variant uses `dangerFocusRingColor.withOpacity(0.20)`.

- **animation-widget**: `AnimatedContainer` for background color transitions (duration: `animationDuration`, curve: `animationCurve`). `InkWell` inside `Material(color: Colors.transparent, shape: StadiumBorder())` for ripple effect on mobile. `Material` must use `StadiumBorder` to match radius-full container.

- **link underline**: render label with `TextStyle(decoration: TextDecoration.underline)` only in hover state (desktop); always underline for accessibility on mobile.

- **icon sizing**: icon widgets passed as `iconLeft` / `iconRight` must be wrapped in `SizedBox(width: iconSize, height: iconSize)` for the corresponding `DsButtonSize`.

- **icon-only**: label still passed to `Semantics(label: label)`; visually render no label text. Replace label widget with `SizedBox.shrink()`.

## notes

- `onPressed: null` is the correct Flutter pattern for disabled state. Do not add a separate `isDisabled` parameter.
- DsButtonTheme must implement `copyWith()` (all fields nullable) and `lerp()`:
  - Color fields: `Color.lerp`
  - BorderRadius fields: `BorderRadius.lerp`
  - double fields: `lerpDouble` from `dart:ui`
  - Duration / Curve fields: return end value directly (no interpolation)
- Do **not** use `Opacity` widget for disabled state. Explicit `disabledBg` / `disabledFg` colors keep opacity at 1.0 — matching React behavior.
- Dark theme values are resolved automatically through `DsThemeExtension.dark` at the app's `ThemeData` level. `DsButtonTheme` always reads from the active `DsTokens` defaults; override per-theme via `ThemeData.extensions`.
