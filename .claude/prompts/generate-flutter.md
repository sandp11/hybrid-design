# Flutter Code Generation — Sub-Prompt

Follow these rules exactly when generating a Flutter widget.

## Files to create
acko_flutter/lib/src/components/[name]/
  ds_[name].dart
  ds_[name]_theme.dart

## Files to update
acko_flutter/lib/acko_flutter.dart — append two export lines

## ds_[name].dart rules
- Class name must be Ds[ComponentName] — always Ds prefix, always PascalCase.
- Parameters must match the parameters table in flutter.md exactly.
- All token values must come from DsTokens constants. Never hardcode hex or numeric values.
- onPressed: null is the disabled pattern. Do not add a separate isDisabled parameter.
- Use InkWell inside Material(color: Colors.transparent) for ripple.
  Material must use the same BorderRadius as the button container.
- Wrap with MouseRegion for hover only on desktop/web targets.
  Add comment: // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.
- Call HapticFeedback.lightImpact() inside onPressed on mobile targets.
- Do NOT use Opacity widget for disabled state. Use explicit disabledBg / disabledFg color values — opacity stays at 1.0.
  Wrap in IgnorePointer when disabled or loading to block gesture detection while keeping focus accessible.
- Use AnimatedSwitcher with Duration(milliseconds: 100) to transition between content row and loading dots row.
  Never use duration tokens — raw Duration values inline, per motion.md.
- Semantics widget must wrap the pressable surface with values from the semantics section of flutter.md.
- For any parity-risk: high property, add:
  // UX REVIEW: high parity-risk — verify against React render

## ds_[name]_theme.dart rules
- Class name: Ds[ComponentName]Theme
- Extends ThemeExtension<Ds[ComponentName]Theme>
- All fields listed in theme-extension-keys in flutter.md must be present.
- All default values must reference DsTokens constants.
- Implement copyWith() — all parameters nullable in the method signature.
- Implement lerp() — use the correct interpolation per field type:
    Color fields: Color.lerp
    BorderRadius fields: BorderRadius.lerp
    double fields: lerpDouble from dart:ui
    Duration fields: do not lerp, return the end value directly

## acko_flutter/lib/acko_flutter.dart
Append these two lines after the comment // Components — append new exports below this line:
export 'src/components/[name]/ds_[name].dart';
export 'src/components/[name]/ds_[name]_theme.dart';
