# Alert — React Spec
> React and web-specific only. Visual decisions live in style.md.

## package

name: @acko/alert
version: 1.0.0
directive: `"use client"`
css-dependency: `@acko/css/alert.css`

## props

| prop        | type                                                                  | default | required | description |
|-------------|-----------------------------------------------------------------------|---------|----------|-------------|
| variant     | `'info' \| 'success' \| 'warning' \| 'error'`                         | —       | yes      | Semantic palette row |
| title       | `string`                                                              | —       | no       | Optional heading above body |
| children    | `React.ReactNode`                                                     | —       | yes      | Body message |
| icon        | `React.ReactNode`                                                     | —       | no       | Overrides built-in variant icon |
| dismissible | `boolean`                                                             | `false` | no       | Shows dismiss button |
| onDismiss   | `() => void`                                                          | —       | no       | Fired when dismiss is clicked |
| className   | `string`                                                              | —       | no       | Merged onto root via clsx |

## exports

```typescript
export { Alert } from './Alert';
export type { AlertProps } from './Alert';
```

## DOM structure

```html
<div role="alert" class="acko-alert acko-alert-slide-up acko-alert-{variant} [className]">
  <span class="acko-alert-icon" aria-hidden="true">
    <!-- built-in SVG or {icon} -->
  </span>
  <div class="acko-alert-content">
    <!-- optional: -->
    <div class="acko-alert-title">...</div>
    <div class="acko-alert-body">{children}</div>
  </div>
  <!-- optional when dismissible: -->
  <button type="button" class="acko-alert-dismiss" aria-label="Dismiss alert">
    <svg>...</svg>
  </button>
</div>
```

Rules:

- Omit `.acko-alert-title` node entirely when `title` is undefined.

- Built-in default icons when `icon` is undefined: info (circle + i), success (check-circle glyph), warning (triangle alert glyph), error (x-circle glyph). All inline SVG, stroke `currentColor`, sized via `.acko-alert-icon`.

## CSS class reference

| class | role |
|-------|------|
| `.acko-alert` | Flex row root; gap 12px; padding 12px; width 100%; relative; items centered; radius radius-3xl; border 1px |
| `.acko-alert-slide-up` | Applies entrance keyframe |
| `.acko-alert-info` | Background, border, inherits text palette per style.md |
| `.acko-alert-success` | Same pattern |
| `.acko-alert-warning` | Same pattern |
| `.acko-alert-error` | Same pattern |
| `.acko-alert-icon` | 20×20; shrink-0; color inherits variant text semantic |
| `.acko-alert-content` | flex-1 flex-col min-w-0 |
| `.acko-alert-title` | body-sm semibold; truncate |
| `.acko-alert-body` | caption; color-text-default; truncate |
| `.acko-alert-dismiss` | inline-flex center; 20×20 icon box; opacity 0.7 default; hover opacity 1 under fine-pointer hover media |

## events

| event     | when |
|-----------|------|
| onDismiss | dismiss button clicked |

## aria

- Root: `role="alert"`

- Icon wrapper: `aria-hidden="true"`

- Dismiss: `aria-label="Dismiss alert"`

## notes

Dark theme is token-driven via shared semantic tokens in tokens.css — no separate `[data-theme]` blocks inside alert.css beyond relying on global token values.

