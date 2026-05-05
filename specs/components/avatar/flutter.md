# Avatar — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## export

class-name: DsAvatar
file: lib/src/components/avatar/ds_avatar.dart
theme-class: DsAvatarTheme
theme-file: lib/src/components/avatar/ds_avatar_theme.dart

## parameters

| parameter | type           | default              | required | description |
|-----------|----------------|----------------------|----------|-------------|
| src       | String?        | null                 | no       | Image URL |
| alt       | String?        | null                 | no       | Semantics label |
| initials  | String?        | null                 | no       | 1–2 chars shown when image absent or fails |
| size      | DsAvatarSize   | DsAvatarSize.md      | no       | Avatar dimension |
| shape     | DsAvatarShape  | DsAvatarShape.circle | no       | Clip shape |

## enums

```dart
enum DsAvatarSize  { xs, sm, md, lg, xl }
enum DsAvatarShape { circle, square }
```

Defined in ds_avatar_theme.dart; imported into ds_avatar.dart.

## theme-extension-keys

container.dimension [xs]:  sizeXs → 24.0
container.dimension [sm]:  sizeSm → 32.0
container.dimension [md]:  sizeMd → 40.0
container.dimension [lg]:  sizeLg → 48.0
container.dimension [xl]:  sizeXl → 64.0

initials.background:       initialsBackground → Color(0xFFEAEAFD) light / Color(0xFF3E2290) dark
initials.color:            initialsColor      → Color(0xFF6841E6) light / Color(0xFF7A62F0) dark
initials.fontWeight:       FontWeight.w500 (constant)

initials.fontSize [xs]:    initialsXsFontSize → 10.0
initials.fontSize [sm]:    initialsSmFontSize → 12.0
initials.fontSize [md]:    initialsMdFontSize → 14.0
initials.fontSize [lg]:    initialsLgFontSize → 16.0
initials.fontSize [xl]:    initialsXlFontSize → 20.0

fallback.iconSize [xs]:    iconXsSize → 12.0
fallback.iconSize [sm]:    iconSmSize → 16.0
fallback.iconSize [md]:    iconMdSize → 20.0
fallback.iconSize [lg]:    iconLgSize → 24.0
fallback.iconSize [xl]:    iconXlSize → 32.0

shape.borderRadius [square]: squareBorderRadius → BorderRadius.circular(8)
shape.borderRadius [circle]: ClipOval (no radius param needed)

## semantics

- label: alt param if set; else initials if set; else 'Avatar' as final fallback
- image: true
- button: false
- focusable: false (presentational)

## callbacks

None — DsAvatar is purely presentational.

## platform-notes

- image-load-fade: Image.network frameBuilder wraps child in AnimatedOpacity(duration:200ms, curve:Curves.ease); opacity 0.0 when frame==null, 1.0 once first frame arrives
  // UX REVIEW: medium parity-risk — frameBuilder fade-in vs CSS opacity transition, verify timing matches React
- fallback-hierarchy: DsAvatar is StatefulWidget; bool _imgFailed tracked in State; Image.network errorBuilder renders initials/icon immediately and schedules setState via addPostFrameCallback; didUpdateWidget resets _imgFailed when src changes
- shape-clipping: circle → ClipOval wrapping the content; square → ClipRRect(borderRadius: squareBorderRadius)
- no hover, press, focus, disabled, or haptic behavior
- DsAvatarTheme has light/dark static const instances; resolved via Theme.of(context).extension<DsAvatarTheme>()

## notes

- _imgFailed resets in didUpdateWidget when src prop changes; this prevents stale failure state when src is updated dynamically
- initials are caller-supplied; DsAvatar does NOT auto-generate initials from a name string
- _UserIconPainter uses CustomPainter with head circle + body ellipse clipped to lower half
