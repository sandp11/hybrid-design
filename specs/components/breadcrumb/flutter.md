# Breadcrumb — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## export

class-name: DsBreadcrumb
file: lib/src/components/breadcrumb/ds_breadcrumb.dart
theme-class: DsBreadcrumbTheme
theme-file: lib/src/components/breadcrumb/ds_breadcrumb_theme.dart

## parameters

| parameter   | type                     | default | required | description |
|-------------|--------------------------|---------|----------|-------------|
| items       | List\<DsBreadcrumbItem\> | —       | yes      | Trail segments |
| separator   | Widget?                  | null    | no       | Between crumbs; default chevron |
| maxItems    | int?                     | null    | no       | Collapse middle when length exceeds |

## models

```dart
class DsBreadcrumbItem {
  const DsBreadcrumbItem({
    required this.label,
    this.href,
    this.icon,
  });
  final String label;
  final String? href;
  final Widget? icon;
}
```

## theme-extension-keys

link.color → linkColor (DsTokens / resolved grey + purple hover)
link.hoverColor → linkHoverColor
current.color → currentColor
text.color → textColor (non-link, non-current)
separator.color → separatorColor
ellipsis.hoverSurface → ellipsisHoverBg (color-surface-raised-hover)
typography: font-body-sm for links/text; font-label-lg weight for current

## semantics

- Wrap trail in `Semantics(container: true)` with label “Breadcrumb” where appropriate, or rely on `MergeSemantics` + parent `Semantics`
- Current crumb: `Semantics(selected: true)` / `Semantics(currentValue: label)` as appropriate for platform
- Ellipsis: `Semantics(button: true, label: 'Show more breadcrumb items')`

## callbacks

Optional future: `onTapUrl` — not in React source; navigation via `href` handled with `Link`/`url_launcher` per app — document that apps should wrap crumbs or use `Router`.

## platform-notes

- Link vs span: when `href != null`, use `Link`/`TapGestureRecognizer` pattern appropriate for target platform; otherwise `Text`/`RichText` with theme colors
  // UX REVIEW: high parity-risk — verify link behavior on web vs mobile vs React `<a>`
- Hover underline + color on links: `MouseRegion` desktop/web only
  // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React render
- Ellipsis expansion: `StatefulWidget` internal `_expanded` flag

## notes

- Collapse rules mirror React: same `maxItems >= 3` guard and last `(maxItems - 2)` slice.
