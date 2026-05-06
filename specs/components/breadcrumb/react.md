# Breadcrumb — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/breadcrumb
version: 1.0.0
directive: none (presentational)

peer-dependencies:
  - react: ^18
  - react-dom: ^18

## props

### BreadcrumbItem

| field   | type            | default | required | description |
|---------|-----------------|---------|----------|-------------|
| label   | string          | —       | yes      | Visible crumb text |
| href    | string          | —       | no       | If set, crumb renders as a link |
| icon    | React.ReactNode | —       | no       | Optional leading icon |

### Breadcrumb

| prop       | type             | default | required | description |
|------------|------------------|---------|----------|-------------|
| items      | BreadcrumbItem[] | —       | yes      | Trail segments in order |
| separator  | React.ReactNode  | chevron | no       | Content between crumbs |
| maxItems   | number           | —       | no       | When set and items exceed it, middle collapses to ellipsis until expanded |
| className  | string           | —       | no       | Root class |

## tailwind-classes

Defined in `@acko/css/breadcrumb.css`. TSX references only `acko-breadcrumb-*` classes via `clsx`.

## DOM structure

```html
<nav aria-label="Breadcrumb" class="acko-breadcrumb {className}">
  <ol class="acko-breadcrumb-list">
    <li class="acko-breadcrumb-item">
      <!-- link OR span.acko-breadcrumb-text OR span.acko-breadcrumb-current -->
      <a class="acko-breadcrumb-link" href="...">...</a>
      <!-- OR -->
      <span class="acko-breadcrumb-text">...</span>
      <!-- OR current -->
      <span class="acko-breadcrumb-current" aria-current="page">...</span>
      <!-- optional: span.acko-breadcrumb-icon wraps icon -->
    </li>
    <li class="acko-breadcrumb-separator-item" aria-hidden="true">
      <span class="acko-breadcrumb-separator-icon">{separator}</span>
    </li>
    <li class="acko-breadcrumb-item">
      <button type="button" class="acko-breadcrumb-ellipsis" aria-label="Show more breadcrumb items">…</button>
    </li>
    <!-- … -->
  </ol>
</nav>
```

Last item is always `span.acko-breadcrumb-current` with `aria-current="page"`.

## CSS class reference

| class | description |
|-------|-------------|
| acko-breadcrumb | Nav wrapper; full width |
| acko-breadcrumb-list | Ordered list; flex row; wrap; gap 4px; list-style none |
| acko-breadcrumb-item | List cell wrapping one crumb |
| acko-breadcrumb-link | Anchor crumb; font-body-sm; breadcrumb link tokens; hover underline + hover color (fine pointer) |
| acko-breadcrumb-text | Non-link crumb that is not current |
| acko-breadcrumb-current | Current page crumb; label-lg weight; breadcrumb current color |
| acko-breadcrumb-icon | Icon slot inside a crumb |
| acko-breadcrumb-separator-item | Separator list cell; aria-hidden |
| acko-breadcrumb-separator-icon | Separator glyph wrapper |
| acko-breadcrumb-ellipsis | Ellipsis expand control; pill radius; hover surface |

## aria

- `nav` has `aria-label="Breadcrumb"`
- `ol` ordered list
- Last crumb: `aria-current="page"`
- Separators: `aria-hidden` on separator list items (and decorative separator inner)
- Ellipsis button: `aria-label="Show more breadcrumb items"` when used

## events

| behavior | description |
|----------|-------------|
| ellipsis click | Sets internal expanded state so full trail renders |

## component-dependencies

- none (clsx only)

## notes

- Default separator is a chevron-right SVG (inline).
- When `maxItems` is set and `items.length > maxItems` and `maxItems >= 3`, render first crumb, ellipsis button, then last `(maxItems - 2)` crumbs until expanded; if `maxItems < 3`, collapse behavior does not apply (full trail shown).
- Internal `expanded` state defaults to false; ellipsis sets it true (presentational expansion).

## exports

```typescript
export { Breadcrumb } from './Breadcrumb';
export type { BreadcrumbProps, BreadcrumbItem } from './Breadcrumb';
```
