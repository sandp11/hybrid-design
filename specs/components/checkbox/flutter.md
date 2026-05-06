# Checkbox — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## export

class-name: DsCheckbox, DsCheckboxRow, DsCheckboxGroup
file: lib/src/components/checkbox/ds_checkbox.dart
theme-class: DsCheckboxTheme
theme-file: lib/src/components/checkbox/ds_checkbox_theme.dart

## composition

- **DsCheckbox** — atom for single confirmations and inline toggles.
- **DsCheckboxRow** — reusable row for any multi-select list; responsive checkbox alignment matches `style.md` / React (`desktopBreakpoint`).
- **DsCheckboxGroup** — maps options to rows with shared selection state.

### Containers (implemented elsewhere)

| Context | Flutter pattern |
|---------|-------------------|
| Visible list | `DsCheckboxRow` / `DsCheckboxGroup` in page or card layout |
| Desktop collapsed multi-select | Embed rows inside `Dropdown` multi-panel when that component ships — row hover in menu should use **color-primary-subtle** (see `style.md` platform-bridge `dropdown-multi-row-hover`) |
| Mobile collapsed multi-select | Bottom sheet / modal listing `DsCheckboxRow`; separators remain visible on phone-sized widths |

Do **not** show a desktop dropdown panel on narrow viewports; use a sheet pattern instead.

## parameters

### DsCheckbox

| parameter     | type                    | default           | required | description |
|---------------|-------------------------|-------------------|----------|-------------|
| checked       | bool                    | —                 | yes      | Controlled checked state |
| onChange      | ValueChanged\<bool\>    | —                 | yes      | Called with new bool on toggle |
| label         | String?                 | null              | no       | Text label beside box |
| description   | String?                 | null              | no       | Supporting text below label |
| size          | DsCheckboxSize          | DsCheckboxSize.md | no       | Box + font size |
| indeterminate | bool                    | false             | no       | Shows minus icon; aria mixed |
| disabled      | bool                    | false             | no       | Blocks interaction; explicit disabled colors |
| error         | bool                    | false             | no       | Error border; triggers shake animation |

### DsCheckboxRow

| parameter     | type                    | default | required | description |
|---------------|-------------------------|---------|----------|-------------|
| label         | String                  | —       | yes      | Row label |
| checked       | bool                    | —       | yes      | Controlled checked state |
| onChange      | ValueChanged\<bool\>    | —       | yes      | Called on tap |
| description   | String?                 | null    | no       | Supporting subtext |
| indeterminate | bool                    | false   | no       | Indeterminate state |
| error         | bool                    | false   | no       | Error state |
| isLast        | bool                    | false   | no       | Hides bottom separator when true |

### DsCheckboxGroup

| parameter | type                       | default | required | description |
|-----------|----------------------------|---------|----------|-------------|
| label     | String                     | —       | yes      | Group heading |
| options   | List\<DsCheckboxOption\>   | —       | yes      | Items to render |
| value     | List\<String\>             | —       | yes      | Currently selected values |
| onChange  | ValueChanged\<List\<String\>\> | —   | yes      | Called with updated selection |
| error     | bool                       | false   | no       | Propagated to all rows |

## enums

```dart
enum DsCheckboxSize { sm, md, lg }

class DsCheckboxOption {
  const DsCheckboxOption({ required this.value, required this.label, this.description });
  final String  value;
  final String  label;
  final String? description;
}
```

Defined in ds_checkbox_theme.dart.

## theme-extension-keys

### Box dimensions
box.width  [sm]: boxSizeSm → 16.0
box.width  [md]: boxSizeMd → 20.0
box.width  [lg]: boxSizeLg → 24.0
box.border-radius [sm]: borderRadiusSm → BorderRadius.circular(4)
box.border-radius [md]: borderRadiusMd → BorderRadius.circular(6)
box.border-radius [lg]: borderRadiusLg → BorderRadius.circular(6)
box.border-width: 1.5 (constant, not in theme)

### Icon dimensions
icon.size [sm]: iconSizeSm → 10.0
icon.size [md]: iconSizeMd → 12.0
icon.size [lg]: iconSizeLg → 14.0

### Label font sizes
label.fontSize [sm]: labelFontSizeSm → 14.0
label.fontSize [md]: labelFontSizeMd → 16.0
label.fontSize [lg]: labelFontSizeLg → 18.0

### Box colors
box.border [unchecked]:            borderUnchecked    → Color(0xFFE0E0E1) light / Color(0xFF474649) dark  (color-control-border-selector)
box.background [unchecked]:        bgUnchecked        → Color(0xFFFBFBFB) light / Color(0xFF19191A) dark
box.border [checked]:              borderChecked      → Color(0xFF6841E6) light / Color(0xFF7A62F0) dark
box.background [checked]:          bgChecked          → Color(0xFF6841E6) light / Color(0xFF7A62F0) dark
box.border [hover-unchecked]:      borderHoverUnchecked    → Color(0xFF9B8FF6) light / Color(0xFF6841E6) dark
box.background [hover-unchecked]:  bgHoverUnchecked        → Color(0xFFEAEAFD) light / Color(0xFF3E2290) dark
box.border [hover-checked]:        borderHoverChecked      → Color(0xFF582FD2) light / Color(0xFF9B8FF6) dark
box.background [hover-checked]:    bgHoverChecked          → Color(0xFF582FD2) light / Color(0xFF9B8FF6) dark
box.border [disabled-unchecked]:   borderDisabledUnchecked → Color(0xFFE0E0E1) light / Color(0xFF19191A) dark
box.background [disabled-unchecked]: bgDisabledUnchecked   → Color(0xFFF5F5F5) light / Color(0xFF141414) dark
box.border [disabled-checked]:     borderDisabledChecked   → Color(0xFFE0E0E1) light / Color(0xFF242324) dark
box.background [disabled-checked]: bgDisabledChecked       → Color(0xFFEBEBEB) light / Color(0xFF242324) dark
box.border [error]:                borderError        → Color(0xFFDC2626) light+dark
box.background [error]:            bgError            → Color(0xFFFBFBFB) light / Color(0xFF19191A) dark

### Icon colors
icon.color [checked]:           iconColor         → Color(0xFFFFFFFF)
icon.color [disabled-checked]:  iconColorDisabled → Color(0xFF8F8E92) light / Color(0xFF605F63) dark

### Focus ring
box.focusRingColor: focusRingColor → Color(0xFFD9D8FC) light / Color(0xFF4E29BB) dark

### Row
row.minHeightDesktop:   44.0
row.minHeightMobile:    52.0
row.paddingVerticalDesktop: 12.0
row.paddingVerticalMobile:  16.0
row.gap:                12.0
row.hoverBackground: rowHoverBg → Color(0x0A000000) light / Color(0x0DFFFFFF) dark

### Row typography
row.labelFontSizeDesktop:     16.0
row.labelFontSizeMobile:      18.0
row.descriptionFontSize:      12.0
row.labelColor:         color-text-default
row.descriptionColor:   color-text-secondary

### Separator
separator.color: separatorColor → Color(0xFFB7B7B8) light / Color(0xFF242324) dark
separator.height: 1.0

### Group label
groupLabelFontSize:   14.0
groupLabelFontWeight: FontWeight.w500
groupLabelColor: color-text-default
groupLabelMarginBottom: 8.0

### Responsive
desktopBreakpoint: 768.0

## semantics

- DsCheckbox: Semantics(checked: widget.checked, label: widget.label, enabled: !widget.disabled)
- DsCheckboxRow: Semantics(checked: widget.checked, label: widget.label, button: true)
- DsCheckboxGroup: no wrapping Semantics; individual rows handle their own

## callbacks

| callback | component      | signature                        |
|----------|----------------|----------------------------------|
| onChange | DsCheckbox     | ValueChanged\<bool\>             |
| onChange | DsCheckboxRow  | ValueChanged\<bool\>             |
| onChange | DsCheckboxGroup| ValueChanged\<List\<String\>\>   |

## platform-notes

- hover: MouseRegion on desktop/web only
  // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React render
- responsive-checkbox-position: MediaQuery.of(context).size.width >= theme.desktopBreakpoint → box placed first in Row (left); else last (right)
  // UX REVIEW: high parity-risk — CSS @media vs Flutter MediaQuery, verify against React render
- checkmark animation: AnimationController (300ms) + _CheckmarkPainter using Path.computeMetrics().extractPath(0, length * t)
- box bounce: AnimatedScale(scale: _bounceScale.value) wraps box; spring from 0.85 → 1.05 → 1.0
- error shake: AnimationController (300ms) + SlideTransition(position: _shakeAnimation) on the atom row
- disabled: IgnorePointer wraps entire widget; explicit borderDisabledUnchecked/bgDisabledUnchecked colors; no Opacity widget
- haptic: HapticFeedback.lightImpact() on check/uncheck on iOS/Android
- focus: FocusNode listener toggles BoxShadow(blurRadius:0, spreadRadius:3, color:focusRingColor) on box decoration
- separator: conditional BoxDecoration(border: Border(bottom: BorderSide(color, 1.0))) on row; omitted when isLast=true

## notes

- DsCheckbox and DsCheckboxRow are StatefulWidget (animation controllers, focus, hover state)
- DsCheckboxGroup is StatelessWidget — maps options to DsCheckboxRow list, passes isLast to last item
- _CheckmarkPainter draws checkmark progressively using Path.computeMetrics; draws minus line for indeterminate
- Box color resolves per priority: disabled > error > hover > checked > unchecked
- DsCheckboxTheme has .light and .dark static const instances
