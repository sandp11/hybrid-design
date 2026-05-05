# Badge — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/badge
version: 1.0.0
directive: none (presentational — no "use client")
peer-dependencies:
  - react: >=18
  - react-dom: >=18
css-dependency: @acko/css/badge.css

## props

### Badge

| prop       | type                                            | default     | required | description                                     |
|------------|-------------------------------------------------|-------------|----------|-------------------------------------------------|
| variant    | 'solid' \| 'outline' \| 'dot'                  | 'solid'     | no       | visual style                                    |
| color      | 'purple' \| 'green' \| 'blue' \| 'orange' \| 'pink' \| 'gray' | 'purple' | no | color set |
| textCase   | 'uppercase' \| 'sentence'                      | 'uppercase' | no       | text-transform; see decision rules in style.md  |
| removable  | boolean                                         | false       | no       | shows the remove button                         |
| onRemove   | () => void                                      | undefined   | no       | fired when remove button clicked                |
| className  | string                                          | undefined   | no       | additional class names merged with clsx         |
| children   | ReactNode                                       | —           | yes      | badge label text                                |

### CounterBadge

| prop       | type                              | default   | required | description                                          |
|------------|-----------------------------------|-----------|----------|------------------------------------------------------|
| count      | number                            | —         | yes      | numeric value to display                             |
| max        | number                            | undefined | no       | when count > max, displays "{max}+" instead          |
| color      | 'purple' \| 'pink' \| 'blue'     | 'purple'  | no       | color set                                            |
| className  | string                            | undefined | no       | additional class names                               |

## exports

```typescript
export { Badge } from './Badge';
export type { BadgeProps, BadgeTextCase } from './Badge';
export { CounterBadge } from './Badge';
export type { CounterBadgeProps } from './Badge';
```

## DOM structure

### Badge

```html
<span class="acko-badge acko-badge-{variant}-{color} acko-badge-uppercase|acko-badge-sentence-case [className]">
  <!-- dot variant only: -->
  <span class="acko-badge-dot" aria-hidden="true"></span>
  <!-- label: -->
  {children}
  <!-- removable only: -->
  <button class="acko-badge-remove" type="button" aria-label="Remove">
    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" aria-hidden="true">
      <path d="M1 1L11 11M11 1L1 11" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
    </svg>
  </button>
</span>
```

### CounterBadge

```html
<span class="acko-counter-badge acko-counter-badge-{color} [className]">
  {count > max ? `${max}+` : count}
</span>
```

## CSS class reference

### Base

| class                     | role                                     |
|---------------------------|------------------------------------------|
| `.acko-badge`             | layout, spacing, radius, typography base |
| `.acko-badge-uppercase`   | text-transform: uppercase + letter-spacing: 0.04em (default) |
| `.acko-badge-sentence-case` | text-transform: none                   |
| `.acko-badge-dot`         | 6×6px circle dot indicator child        |
| `.acko-badge-remove`      | 12×12px remove button child             |

### Solid variant

| class                     | tokens used                                                    |
|---------------------------|----------------------------------------------------------------|
| `.acko-badge-solid-purple` | color-badge-purple-gradient-from/to, color-badge-purple-border, color-badge-purple-text |
| `.acko-badge-solid-green`  | color-badge-green-gradient-from/to, color-badge-green-border, color-badge-green-text |
| `.acko-badge-solid-blue`   | color-badge-blue-gradient-from/to, color-badge-blue-border, color-badge-blue-text |
| `.acko-badge-solid-orange` | color-badge-orange-gradient-from/to, color-badge-orange-border, color-badge-orange-text |
| `.acko-badge-solid-pink`   | color-badge-pink-gradient-from/to, color-badge-pink-border, color-badge-pink-text |
| `.acko-badge-solid-gray`   | color-badge-gray-gradient-from/to, color-badge-gray-border, color-badge-gray-text |

### Outline variant

| class                      | tokens used                             |
|----------------------------|-----------------------------------------|
| `.acko-badge-outline-purple` | color-badge-purple-outline-color (border + text) |
| `.acko-badge-outline-green`  | color-badge-green-outline-color |
| `.acko-badge-outline-blue`   | color-badge-blue-outline-color |
| `.acko-badge-outline-orange` | color-badge-orange-outline-color |
| `.acko-badge-outline-pink`   | color-badge-pink-outline-color |
| `.acko-badge-outline-gray`   | color-badge-gray-outline-color |

### Dot variant

Same as solid variant classes but prefixed `.acko-badge-dot-{color}`. The `.acko-badge-dot` child element is added inside the container.

### Counter badge

| class                        | tokens used                                                      |
|------------------------------|------------------------------------------------------------------|
| `.acko-counter-badge`        | layout, radius-full, font-caption, color-on-primary, tabular-nums |
| `.acko-counter-badge-purple` | color-counter-purple-gradient-from/to, color-counter-purple-border |
| `.acko-counter-badge-pink`   | color-counter-pink-gradient-from/to, color-counter-pink-border   |
| `.acko-counter-badge-blue`   | color-counter-blue-gradient-from/to, color-counter-blue-border   |

### Responsive sizing (baked into `.acko-badge`)

```css
/* Mobile (default) */
.acko-badge { padding: 6px 8px; font-size: var(--font-caption-size); }

/* Desktop (≥768px) */
@media (min-width: 768px) {
  .acko-badge { font-size: var(--font-body-sm-size); }
}
```

No size classes exist. Never add a size prop or size modifier class.

## aria

### Badge
- role: (none) — presentational `<span>`; no implicit role
- remove button: `type="button"`, `aria-label="Remove"`
- dot indicator: `aria-hidden="true"`

### CounterBadge
- role: (none) — `<span>` containing a number
- if used as a notification count, parent element should carry `aria-label` describing the count context

## events

| event      | payload    | component    | description                                 |
|------------|------------|--------------|---------------------------------------------|
| onRemove   | void       | Badge        | fired on remove button click; only when removable=true |

## text case decision rules

| content type        | textCase    | example                           |
|---------------------|-------------|-----------------------------------|
| Status label        | uppercase   | ACTIVE, PENDING, EXPIRED          |
| Emphasis tag        | uppercase   | NEW, FREE, PRO, BETA              |
| Category tag        | uppercase   | HEALTH, AUTO, TRAVEL              |
| Acronym             | uppercase   | KYC, OTP, IDV                     |
| Descriptive phrase  | sentence    | Zero depreciation                 |
| Multi-word label    | sentence    | 2 days left, Cashless available   |
| Feature callout     | sentence    | Limited offer                     |

Default is `uppercase`. When in doubt, use `uppercase`.

## component-dependencies

None. Badge is a leaf component.

## notes

- No size prop exists and none should be added. Sizing is fully controlled by CSS media query.
- The `textCase` prop only controls transform and letter-spacing — it does not change the casing of `children` in the DOM. Consumers pass text in its natural casing; CSS handles uppercase transform.
- CounterBadge max-overflow: when `count > max`, render `${max}+` (e.g. count=150, max=99 → "99+").
- Badge has no hover, focus, disabled, or loading states. It is purely presentational.
- Dark theme is automatic via `[data-theme="dark"]` scoped CSS; no prop needed.
- CSS sizing rule: ALL dimensions in badge.css must use Tailwind `@apply` utilities. Never write raw `width: Npx`, `height: Npx`, `padding: Npx`, or `min-width: Npx`. Use `@apply w-N h-N py-N px-N min-w-N` etc. The only exceptions are CSS custom-property references (`var(--color-*)`, `var(--font-*-size)`, `box-shadow`, `border`) and `line-height: 0` (no Tailwind equivalent for exactly zero).
