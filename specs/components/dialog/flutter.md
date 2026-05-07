# Dialog — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.

## export

class-name: `DsDialog`
file: `lib/src/components/dialog/ds_dialog.dart`
theme-class: `DsDialogTheme`
theme-file: `lib/src/components/dialog/ds_dialog_theme.dart`
helper: `showDsDialog` — top-level function wrapping `showGeneralDialog`

## parameters

| parameter   | type                  | default              | required | description |
|-------------|-----------------------|----------------------|----------|-------------|
| title       | `String?`             | —                    | no       | Panel heading; sets Semantics label |
| description | `String?`             | —                    | no       | Supporting text below title |
| size        | `DsDialogSize`        | `DsDialogSize.md`    | no       | Panel max-width constraint |
| dismissible | `bool`                | `true`               | no       | Barrier tap + back-button close |
| body        | `Widget`              | —                    | yes      | Scrollable content |
| footer      | `Widget?`             | —                    | no       | Action row below divider |

## enums

```dart
enum DsDialogSize { sm, md, lg, xl, full }
```

Max-width per size:
- `sm` → 360
- `md` → 480
- `lg` → 600
- `xl` → 760
- `full` → `double.infinity` (no radius)

## showDsDialog helper

```dart
Future<T?> showDsDialog<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool dismissible = true,
})
```

Internally calls `showGeneralDialog` with:
- `barrierDismissible: dismissible`
- `barrierColor: DsTokens.colorSurfaceOverlay`
- `transitionDuration: const Duration(milliseconds: 250)`
- Custom `transitionBuilder` — see entrance animation below

## theme-extension-keys

Map style.md → theme fields (defaults mirror `DsTokens` constants):

| style concept        | theme field              | default reference                        |
|----------------------|--------------------------|------------------------------------------|
| backdrop color       | `backdropColor`          | DsTokens.colorSurfaceOverlay             |
| panel background     | `panelColor`             | DsTokens.colorSurfaceRaised              |
| panel radius         | `panelRadius`            | BorderRadius.circular(20) — radius-4xl   |
| panel shadow         | `panelShadow`            | BoxShadow(blurRadius:16, spreadRadius:4, offset:Offset(0,2)) — shadow-lg |
| title text style     | `titleStyle`             | TextStyle(fontSize:18, fontWeight:w600)  |
| description style    | `descriptionStyle`       | TextStyle(fontSize:14, height:1.43)      |
| footer border color  | `footerBorderColor`      | DsTokens.colorBorderSubtle               |
| close button hover   | `closeButtonHoverColor`  | DsTokens.colorSurfaceGhostHover          |
| close icon color     | `closeIconColor`         | DsTokens.colorTextSecondary              |

## entrance animation

Use the `transitionBuilder` parameter of `showGeneralDialog`:

```dart
transitionBuilder: (context, animation, secondaryAnimation, child) {
  // Backdrop opacity handled by barrierColor + barrierDismissible in showGeneralDialog.
  // Panel: FadeTransition + ScaleTransition + SlideTransition
  final curved = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOut, // ease-out-quart approximation
  );
  return FadeTransition(
    opacity: curved,
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1.0).animate(curved),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.02), // ~8px at typical dialog height
          end: Offset.zero,
        ).animate(curved),
        child: child,
      ),
    ),
  );
},
```

- duration: 250ms (Curves.easeOut ≈ ease-out-quart from motion.md)
- Backdrop opacity: 200ms via `showGeneralDialog` barrier animation (separate from panel)

## widget structure

```
showGeneralDialog
└── Center
    └── ConstrainedBox(maxWidth: size.maxWidth)
        └── Material (elevation 0, borderRadius: panelRadius, color: panelColor)
            └── DecoratedBox (boxShadow: panelShadow)
                └── Column
                    ├── _DsDialogHeader (title + close button)
                    ├── _DsDialogDescription (optional)
                    ├── Expanded → SingleChildScrollView → body
                    └── _DsDialogFooter (optional, with divider)
```

## sub-widgets

### _DsDialogHeader
- `Row(mainAxisAlignment: MainAxisAlignment.spaceBetween)`
- Title: `Text` with `titleStyle` from theme
- Close button: `GestureDetector` wrapping a 32×32 `Container` with `BoxDecoration(shape: BoxShape.circle)`
  - Default background: transparent
  - Hover background: `closeButtonHoverColor` via `MouseRegion`
  - `// UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.`
  - Icon: close SVG / `Icon(Icons.close)` sized 18×18, color `closeIconColor`
  - `HapticFeedback.lightImpact()` on iOS/Android inside `onTap`
  - Semantics: `label: 'Close dialog'`, `button: true`

### _DsDialogDescription
- Rendered only when `description` is not null
- `Text` with `descriptionStyle` from theme

### _DsDialogFooter
- Rendered only when `footer` is not null
- `Column`: `Divider(height:1, thickness:1, color: footerBorderColor)` + `Align(alignment: Alignment.centerRight, child: footer)`

## focus

- Flutter `showGeneralDialog` places focus inside the dialog automatically via `FocusScope`.
- No manual focus-trap needed — the route modal barrier blocks interaction outside.
- Close button: `FocusNode` with `FocusDecoration` of 3px border using `DsTokens.colorPrimaryRing`.

## semantics

- Dialog container: `Semantics(container: true, label: title ?? '', namesRoute: true)`
- Close button: `Semantics(label: 'Close dialog', button: true)`
- Body: no explicit semantics — children carry their own

## callbacks

| callback | signature            | description |
|----------|----------------------|-------------|
| (none on widget) | — | Dialog is dismissed by `Navigator.pop(context)` inside the close button and barrier; caller awaits `showDsDialog` future |

## platform-notes

- Body scroll lock: not required on Flutter — `showGeneralDialog` overlay blocks all interaction beneath. `// UX REVIEW: high parity-risk — verify against React.`
- Hover on close button: `MouseRegion` on desktop/web only — `// UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.`
- `full` size: pass `maxWidth: double.infinity` and `panelRadius: BorderRadius.zero` to `DsDialogTheme` or override locally.
- Haptics: `HapticFeedback.lightImpact()` on close button tap, iOS/Android only.

## notes

- `DsDialogTheme` implements `copyWith()` (all fields nullable) and `lerp()` per field type.
- `lerp()` for `TextStyle`: `TextStyle.lerp(a, b, t)`.
- `lerp()` for `Color?`: `Color.lerp(a, b, t)`.
- `lerp()` for `BorderRadius?`: `BorderRadius.lerp(a, b, t)`.
- `lerp()` for `BoxShadow?`: `BoxShadow.lerp(a, b, t)`.
- `dismissible=false` maps to `barrierDismissible: false` AND disabling back-button via `WillPopScope` / `PopScope(canPop: false)`.
