# Drawer — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.

## export

class-name: `DsDrawer`
file: `lib/src/components/drawer/ds_drawer.dart`
theme-class: `DsDrawerTheme`
theme-file: `lib/src/components/drawer/ds_drawer_theme.dart`
helper: `showDsDrawer` — top-level function wrapping `showGeneralDialog`

## parameters

| parameter   | type             | default              | required | description |
|-------------|------------------|----------------------|----------|-------------|
| side        | `DsDrawerSide`   | `DsDrawerSide.right` | no       | Viewport edge the panel anchors to |
| size        | `DsDrawerSize`   | `DsDrawerSize.md`    | no       | Panel width (left/right) or max-height (bottom/top) |
| title       | `String?`        | —                    | no       | Heading text; used in Semantics label |
| description | `String?`        | —                    | no       | Supporting text below title |
| dismissible | `bool`           | `true`               | no       | Barrier tap + back-button close |
| body        | `Widget`         | —                    | yes      | Scrollable content |
| footer      | `Widget?`        | —                    | no       | Action row below divider |

## enums

```dart
enum DsDrawerSide { left, right, bottom, top }

enum DsDrawerSize { sm, md, lg, full }
```

Size resolution per side axis:

```dart
extension DsDrawerSizeX on DsDrawerSize {
  // left / right → fixed width in logical pixels
  double widthFor(BuildContext context) => switch (this) {
    DsDrawerSize.sm   => 280,
    DsDrawerSize.md   => 380,
    DsDrawerSize.lg   => 520,
    DsDrawerSize.full => MediaQuery.of(context).size.width,
  };

  // bottom / top → max-height as viewport fraction
  // UX REVIEW: high parity-risk — vh units computed via MediaQuery; verify against CSS vh on web.
  double maxHeightFor(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return switch (this) {
      DsDrawerSize.sm   => h * 0.30,
      DsDrawerSize.md   => h * 0.50,
      DsDrawerSize.lg   => h * 0.75,
      DsDrawerSize.full => h,
    };
  }
}
```

## showDsDrawer helper

```dart
Future<T?> showDsDrawer<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  DsDrawerSide side = DsDrawerSide.right,
  DsDrawerSize size = DsDrawerSize.md,
  bool dismissible = true,
  DsDrawerTheme? theme,
})
```

Internally calls `showGeneralDialog` with:
- `barrierDismissible: dismissible`
- `barrierColor: Colors.transparent` — backdrop drawn inside widget tree for full control
- `transitionDuration: const Duration(milliseconds: 300)`
- Custom `transitionBuilder` — slide per side axis + fade backdrop

## theme-extension-keys

| style concept        | theme field              | default reference                                      |
|----------------------|--------------------------|--------------------------------------------------------|
| backdrop color       | `backdropColor`          | DsTokens.colorSurfaceOverlay                           |
| panel background     | `panelColor`             | DsTokens.colorSurfaceRaised                            |
| panel shadow         | `panelShadow`            | BoxShadow(blurRadius:24, offset:Offset(0,4)) — shadow-xl / shadow-modal |
| header border color  | `headerBorderColor`      | DsTokens.colorBorderSubtle                             |
| footer border color  | `footerBorderColor`      | DsTokens.colorBorderSubtle                             |
| title text style     | `titleStyle`             | TextStyle(fontSize:18, fontWeight:w600)                |
| description style    | `descriptionStyle`       | TextStyle(fontSize:14, height:1.43)                    |
| body text color      | `bodyColor`              | DsTokens.colorTextDefault                              |
| close icon color     | `closeIconColor`         | DsTokens.colorTextSecondary                            |
| close button hover   | `closeButtonHoverColor`  | DsTokens.colorSurfaceGhostHover                        |

## entrance animation

`transitionBuilder` in `showGeneralDialog`:

```dart
transitionBuilder: (context, animation, secondaryAnimation, child) {
  // Backdrop fade — 250ms ease-out-cubic
  final backdropCurve = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
  );
  // Panel slide — 300ms ease-out-quart (≈ Curves.easeOut)
  final panelCurve = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOut,
  );

  // Slide offset per side
  Offset beginOffset = switch (side) {
    DsDrawerSide.right  => const Offset(1.0, 0),
    DsDrawerSide.left   => const Offset(-1.0, 0),
    DsDrawerSide.bottom => const Offset(0, 1.0),
    DsDrawerSide.top    => const Offset(0, -1.0),
  };

  return Stack(
    children: [
      // Backdrop
      FadeTransition(
        opacity: backdropCurve,
        child: GestureDetector(
          onTap: dismissible ? () => Navigator.of(context).pop() : null,
          child: Container(color: theme.backdropColor),
        ),
      ),
      // Panel slide
      SlideTransition(
        position: Tween<Offset>(begin: beginOffset, end: Offset.zero)
            .animate(panelCurve),
        child: child,
      ),
    ],
  );
},
```

## widget structure

```
showGeneralDialog
└── _DsDrawerPanel (Align to edge + size constraints)
    └── DecoratedBox (panelColor, per-side BorderRadius, panelShadow)
        └── ClipRRect (same per-side BorderRadius)
            └── Column
                ├── _DsDrawerHeader (heading + close button)
                ├── Expanded → SingleChildScrollView → body
                └── _DsDrawerFooter (optional)
```

## panel alignment and radius per side

```dart
// Alignment
Alignment alignmentFor(DsDrawerSide side) => switch (side) {
  DsDrawerSide.right  => Alignment.centerRight,
  DsDrawerSide.left   => Alignment.centerLeft,
  DsDrawerSide.bottom => Alignment.bottomCenter,
  DsDrawerSide.top    => Alignment.topCenter,
};

// Interior-corners-only radius (style.md: interior-radius-only bridge)
BorderRadius radiusFor(DsDrawerSide side, BorderRadius full) => switch (side) {
  DsDrawerSide.right  => BorderRadius.only(
      topLeft: full.topLeft, bottomLeft: full.bottomLeft),
  DsDrawerSide.left   => BorderRadius.only(
      topRight: full.topRight, bottomRight: full.bottomRight),
  DsDrawerSide.bottom => BorderRadius.only(
      topLeft: full.topLeft, topRight: full.topRight),
  DsDrawerSide.top    => BorderRadius.only(
      bottomLeft: full.bottomLeft, bottomRight: full.bottomRight),
};
```

## panel size constraints

```dart
// left / right — fixed width, full height
SizedBox(
  width: size.widthFor(context),
  height: double.infinity,
  child: panel,
)

// bottom / top — full width, max-height
// UX REVIEW: high parity-risk — vh computed via MediaQuery; verify against CSS vh on web.
ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: double.infinity,
    maxHeight: size.maxHeightFor(context),
  ),
  child: panel,
)
```

## sub-widgets

### _DsDrawerHeader
- `Row(crossAxisAlignment: CrossAxisAlignment.start)`
- Heading column (`Expanded` → `Column`): title `Text` + optional description `Text`
- Gap between heading and close: 12px (`SizedBox(width: 12)`)
- Padding: `EdgeInsets.all(20)`
- Bottom border: `BoxDecoration` with `Border(bottom: BorderSide(color: headerBorderColor, width: 1))`

### _DsDrawerCloseButton
- `GestureDetector` wrapping 32×32 `AnimatedContainer` with `BoxShape.circle`
- Hover: `MouseRegion` — `// UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.`
- Focus: `FocusNode` toggling `Border.all(color: DsTokens.colorPrimaryRing, width: 3)` on the circle container
- Icon: `Icon(Icons.close, size: 18, color: closeIconColor)`
- Haptics: `HapticFeedback.lightImpact()` on iOS/Android inside `onTap`
- Semantics: `label: 'Close drawer'`, `button: true`

### _DsDrawerFooter
- Rendered only when `footer != null`
- `Column`: `Divider(height:1, thickness:1, color: footerBorderColor)` + `Padding(EdgeInsets.fromLTRB(20,16,20,16))` → `Align(Alignment.centerRight, child: footer)`

## focus

- `showGeneralDialog` modal route places focus inside the drawer automatically via `FocusScope`.
- Close button uses `FocusNode` with 3px ring decoration using `DsTokens.colorPrimaryRing`.
- `PopScope(canPop: dismissible)` on the panel prevents back-button dismissal when `dismissible=false`.

## platform-notes

- **visibility-vs-unmount**: web keeps the DOM always present for CSS transitions; Flutter mounts/unmounts via route — exit animation is the reverse `transitionBuilder`. `// UX REVIEW: high parity-risk — verify close animation plays on Flutter vs CSS transition on web.`
- **vh sizes**: `size.maxHeightFor(context)` uses `MediaQuery.of(context).size.height` fractions. `// UX REVIEW: high parity-risk — vh units computed via MediaQuery; verify against CSS vh on web.`
- **hover**: `MouseRegion` on close button for desktop/web only.
- **haptics**: `HapticFeedback.lightImpact()` on close button, iOS/Android only.
- **body scroll lock**: not required — Flutter overlay blocks scroll naturally.

## notes

- `DsDrawerTheme` implements `copyWith()` (all fields nullable) and `lerp()` per field type.
- `lerp()` for `Color?`: `Color.lerp(a, b, t)`.
- `lerp()` for `TextStyle?`: `TextStyle.lerp(a, b, t)`.
- `lerp()` for `BoxShadow?`: `BoxShadow.lerp(a, b, t)`.
- `DsDrawerSize.full` for left/right uses `MediaQuery.of(context).size.width` (not `double.infinity`) so the panel fills edge-to-edge on the slide axis.
