# Card — React Spec
> React and web-specific only. Visual decisions live in style.md.

## package

name: @acko/card
version: 1.0.0
directive: none (Server Components compatible — no client directive)
css-dependency: `@acko/css/card.css`

## props

### Card

| prop      | type                                                                      | default     | required | description |
|-----------|---------------------------------------------------------------------------|-------------|----------|-------------|
| variant   | `'default' \| 'secondary' \| 'elevated' \| 'outline' \| 'demoted'`       | `'default'` | no       | Surface visual hierarchy |
| padding   | `'none' \| 'sm' \| 'md' \| 'lg'`                                          | `'lg'`      | no       | Inner inset of the shell |
| children  | `React.ReactNode`                                                         | —           | yes      | Card body |
| className | `string`                                                                  | —           | no       | Merged onto root |

Also inherits `React.HTMLAttributes<HTMLDivElement>` except where narrowed by the component.

### CardHeader

| prop      | type                     | default | required | description |
|-----------|--------------------------|---------|----------|-------------|
| children  | `React.ReactNode`        | —       | yes      | Header slot |
| className | `string`                 | —       | no       | Merged onto root |

Also inherits `React.HTMLAttributes<HTMLDivElement>`.

### CardContent

| prop      | type                     | default | required | description |
|-----------|--------------------------|---------|----------|-------------|
| children  | `React.ReactNode`        | —       | yes      | Main content |
| className | `string`                 | —       | no       | Merged onto root |

Also inherits `React.HTMLAttributes<HTMLDivElement>`.

### CardFooter

| prop      | type                     | default | required | description |
|-----------|--------------------------|---------|----------|-------------|
| children  | `React.ReactNode`        | —       | yes      | Footer actions |
| className | `string`                 | —       | no       | Merged onto root |

Also inherits `React.HTMLAttributes<HTMLDivElement>`.

### CardInset

| prop      | type                     | default | required | description |
|-----------|--------------------------|---------|----------|-------------|
| children  | `React.ReactNode`        | —       | yes      | Nested recessed surface |
| className | `string`                 | —       | no       | Merged onto root |

Also inherits `React.HTMLAttributes<HTMLDivElement>`.

## exports

```typescript
export { Card, CardHeader, CardContent, CardFooter, CardInset } from './Card';
export type {
  CardProps,
  CardHeaderProps,
  CardContentProps,
  CardFooterProps,
  CardInsetProps,
} from './Card';
```

## DOM structure

```html
<div class="acko-card acko-card-{variant} acko-card-pad-{padding} [className]">
  <!-- consumer children; typical compound usage: -->
  <div class="acko-card-header">...</div>
  <div class="acko-card-content">
    <div class="acko-card-inset">...</div>
  </div>
  <div class="acko-card-footer">...</div>
</div>
```

Rules:

- Sub-components render as simple `div` shells with only their structural class plus optional `className`.

## CSS class reference

| class | role |
|-------|------|
| `.acko-card` | Root shell; responsive outer radius via token |
| `.acko-card-default` | Default surface + border |
| `.acko-card-secondary` | Secondary surface + border |
| `.acko-card-elevated` | Elevated fill + shadow-lg |
| `.acko-card-outline` | Transparent + outline border |
| `.acko-card-demoted` | Demoted surface + border |
| `.acko-card-pad-none` | Zero padding |
| `.acko-card-pad-sm` | Responsive sm inset |
| `.acko-card-pad-md` | Responsive md inset (= gutter) |
| `.acko-card-pad-lg` | Responsive lg inset |
| `.acko-card-header` | Header row + bottom divider |
| `.acko-card-content` | Vertical padded content region |
| `.acko-card-footer` | Footer row + top divider |
| `.acko-card-inset` | Nested demoted inset + nested radius |

## notes

- Responsive geometry (`radius-card-outer`, `radius-card-nested`, `card-content-gutter`) is owned by `@acko/tokens` breakpoint remapping — card.css does not declare its own `@media` for radius or gutter.
