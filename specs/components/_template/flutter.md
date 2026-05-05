# [Component Name] — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## export
class-name: Ds[ComponentName]
file: lib/src/components/[component-name]/ds_[component-name].dart
theme-class: Ds[ComponentName]Theme
theme-file: lib/src/components/[component-name]/ds_[component-name]_theme.dart

## parameters
| parameter  | type       | default    | required | description |
|------------|------------|------------|----------|-------------|

## enums
List any enums defined for this component (variant, size etc).

## theme-extension-keys
Map each visual property from style.md to its ThemeExtension key.
Format: part.property [variant] [state]: themeKeyName → DsTokens.constant

## semantics
- label:
- hint:
- button: true/false
- enabled: derived from which parameter
- focusable:

## callbacks
| callback   | signature  | description |
|------------|------------|-------------|

## platform-notes
- hover: desktop Flutter only via MouseRegion, omit on mobile
- haptic: describe haptic feedback if any
- animation-widget: which Flutter animation widget handles state transitions

## notes
Any Flutter-specific behaviour not covered above.
