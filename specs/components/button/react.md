# Button — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/button
version: 1.0.0
directive: "use client"
peer-dependencies:
  - react: >=18
  - react-dom: >=18
  - lucide-react: * (optional — icons passed by consumer)
dependencies:
  - clsx: ^2.1.1
  - @acko/css: * (provides acko-btn* CSS classes via @acko/css/button.css)

## architecture

**Zero Tailwind utilities in TSX.** All visual styling lives in `@acko/css/button.css`.
React component composes CSS class names only via `clsx`. No cva, no twMerge, no inline styles.

```
style.md → @acko/css/button.css (@apply + raw CSS) → Button.tsx (clsx class composition)
```

The CSS file uses `@apply` for layout, alignment, sizing, typography, radius, cursor, and `select-none`.
Raw CSS handles multi-property `transition`, `@keyframes`, `[data-theme]` overrides,
`@media (hover:hover)` blocks, and compound `box-shadow` stacks.

## props

| prop      | type                                                                         | default     | required | description                                                    |
|-----------|------------------------------------------------------------------------------|-------------|----------|----------------------------------------------------------------|
| variant   | `'primary' \| 'secondary' \| 'inverted' \| 'ghost' \| 'link' \| 'danger'`  | —           | yes      | visual variant — maps to acko-btn-{variant} class              |
| size      | `'xs' \| 'sm' \| 'md' \| 'lg' \| 'xl'`                                    | `'md'`      | no       | size — maps to acko-btn-{size} class                          |
| loading   | `boolean`                                                                    | `false`     | no       | shows loading dots, blocks interaction, sets aria-busy         |
| iconLeft  | `React.ReactNode`                                                            | `undefined` | no       | icon rendered before label                                     |
| iconRight | `React.ReactNode`                                                            | `undefined` | no       | icon rendered after label                                      |
| iconOnly  | `boolean`                                                                    | `false`     | no       | square button; label rendered as sr-only for screen readers    |
| fullWidth | `boolean`                                                                    | `false`     | no       | stretches button to fill container width                       |
| type      | `'button' \| 'submit' \| 'reset'`                                           | `'button'`  | no       | native HTML button type attribute                              |
| children  | `React.ReactNode`                                                            | —           | yes      | button label content                                           |
| disabled  | `boolean`                                                                    | `false`     | no       | disables interaction (inherited from ButtonHTMLAttributes)     |
| className | `string`                                                                     | `undefined` | no       | merged via clsx onto the container element                     |

Extends `Omit<ButtonHTMLAttributes<HTMLButtonElement>, 'type'>` — all native button attributes pass through.

## derived state

`isDisabled = disabled || loading`

## DOM structure

```tsx
"use client";

import { forwardRef, type ButtonHTMLAttributes, type ReactNode } from 'react';
import { clsx } from 'clsx';
import '@acko/css/button.css';

<button
  ref={ref}
  type={type}
  disabled={isDisabled}
  aria-busy={loading || undefined}
  aria-disabled={isDisabled || undefined}
  className={clsx(
    'acko-btn',
    `acko-btn-${variant}`,
    `acko-btn-${size}`,
    iconOnly && 'acko-btn-icon-only',
    loading && 'acko-btn-loading',
    isDisabled && 'acko-btn-disabled',
    fullWidth && 'acko-btn-full-width',
    className,
  )}
  {...rest}
>
  {/* Content wrapper — hidden via visibility:hidden during loading */}
  <span className="acko-btn-content">
    {iconLeft && (
      <span className="acko-btn-icon" aria-hidden="true">{iconLeft}</span>
    )}
    {iconOnly ? (
      <span className="sr-only">{children}</span>
    ) : (
      <span className="acko-btn-label">{children}</span>
    )}
    {iconRight && (
      <span className="acko-btn-icon" aria-hidden="true">{iconRight}</span>
    )}
  </span>

  {/* Loading dots — rendered conditionally; absolute-positioned over content */}
  {loading && (
    <>
      <span className="acko-btn-dots" aria-hidden="true">
        <span className="acko-btn-dot" />
        <span className="acko-btn-dot" />
        <span className="acko-btn-dot" />
      </span>
      <span className="sr-only">Loading, please wait</span>
    </>
  )}
</button>
```

## css class reference

### base

```css
.acko-btn {
  @apply inline-flex items-center justify-center font-medium
         leading-none border-none cursor-pointer select-none
         whitespace-nowrap no-underline relative gap-8;
  font-family: inherit;
  transition: background-color 150ms ease, color 150ms ease,
              border-color 150ms ease, transform 100ms ease,
              box-shadow 150ms ease;
}
```

### sizes

| class        | height | padding-h | font-size | line-height | tailwind v4                              |
|--------------|--------|-----------|-----------|-------------|------------------------------------------|
| acko-btn-xs  | 32px   | 16px      | 12px      | 16px        | `h-32 px-16 text-xs rounded-full`        |
| acko-btn-sm  | 40px   | 16px      | 14px      | 18px        | `h-40 px-16 text-sm rounded-full`        |
| acko-btn-md  | 48px   | 16px      | 16px      | 24px        | `h-48 px-16 text-base leading-24 rounded-full` |
| acko-btn-lg  | 56px   | 24px      | 18px      | 28px        | `h-56 px-24 text-lg rounded-full`        |
| acko-btn-xl  | 64px   | 32px      | 20px      | 32px        | `h-64 px-32 text-xl rounded-full`        |

All sizes: `rounded-full` (radius-full). Font-weight 500 on base `.acko-btn`.

### variants

| class              | background                       | color                          | shadow / border                                    |
|--------------------|----------------------------------|--------------------------------|----------------------------------------------------|
| acko-btn-primary   | `--color-primary`                | `--color-on-primary`           | `--shadow-btn-inner`                               |
| acko-btn-secondary | `--color-btn-secondary-bg`       | `--color-btn-secondary-text`   | `inset 0 0 0 1px var(--color-btn-secondary-border)`|
| acko-btn-inverted  | `--color-btn-inverted-bg`        | `--color-btn-inverted-text`    | none                                               |
| acko-btn-ghost     | `transparent`                    | `--color-btn-ghost-color`      | none                                               |
| acko-btn-link      | `transparent`                    | `--color-btn-link-color`       | none; padding-left/right: 0                        |
| acko-btn-danger    | `--color-btn-danger-bg`          | `--color-btn-danger-text`      | none                                               |

### icon sizing (within .acko-btn-icon)

| size class   | icon width / height |
|--------------|---------------------|
| acko-btn-xs  | 12px                |
| acko-btn-sm  | 16px                |
| acko-btn-md  | 16px                |
| acko-btn-lg  | 24px                |
| acko-btn-xl  | 32px                |

`.acko-btn-icon` uses `@apply inline-flex items-center justify-center shrink-0`.

### icon-only (square)

| compound class                      | width |
|-------------------------------------|-------|
| acko-btn-icon-only.acko-btn-xs      | 32px  |
| acko-btn-icon-only.acko-btn-sm      | 40px  |
| acko-btn-icon-only.acko-btn-md      | 48px  |
| acko-btn-icon-only.acko-btn-lg      | 56px  |
| acko-btn-icon-only.acko-btn-xl      | 64px  |

All use `@apply w-{n} p-0` (Tailwind v4: `w-32`, `w-40`, `w-48`, `w-56`, `w-64`).

### content structure

```css
.acko-btn-content { @apply inline-flex items-center justify-center gap-8; }
.acko-btn-label   { @apply leading-none; }
```

### full width

```css
.acko-btn-full-width { @apply w-full; }
```

### states

#### loading

```css
.acko-btn-loading { @apply pointer-events-none; }
.acko-btn-loading .acko-btn-content { visibility: hidden; }

.acko-btn-dots { @apply absolute inline-flex items-center justify-center gap-4; }
.acko-btn-dot  { @apply w-6 h-6; border-radius: 50%; background-color: currentColor;
                 animation: acko-dot-wave 1.2s ease-in-out infinite; }
.acko-btn-dot:nth-child(2) { animation-delay: 0.15s; }
.acko-btn-dot:nth-child(3) { animation-delay: 0.30s; }

/* dot color inherits from variant text color */
.acko-btn-primary   .acko-btn-dots { color: var(--color-on-primary); }
.acko-btn-secondary .acko-btn-dots { color: var(--color-btn-secondary-text); }
.acko-btn-inverted  .acko-btn-dots { color: var(--color-btn-inverted-text); }
.acko-btn-ghost     .acko-btn-dots { color: var(--color-btn-ghost-color); }
.acko-btn-link      .acko-btn-dots { color: var(--color-btn-link-color); }
.acko-btn-danger    .acko-btn-dots { color: var(--color-btn-danger-text); }

@keyframes acko-dot-wave {
  0%, 60%, 100% { transform: translateY(0);        opacity: 0.4; }
  30%           { transform: translateY(-0.375rem); opacity: 1;   }
}
```

#### disabled

```css
.acko-btn-disabled,
.acko-btn:disabled {
  @apply cursor-not-allowed;
  background-color: var(--color-btn-disabled-bg) !important;
  color: var(--color-btn-disabled-text) !important;
  box-shadow: none !important;
  opacity: 1;
  filter: none;
}
.acko-btn-disabled:active,
.acko-btn:disabled:active { transform: none; }

/* link variant keeps transparent bg when disabled */
.acko-btn-link:disabled,
.acko-btn-link.acko-btn-disabled { background-color: transparent !important; }
```

#### hover (pointer devices only)

All hover styles wrapped in `@media (hover: hover) and (pointer: fine)`.

| variant   | hover treatment                                                                          |
|-----------|------------------------------------------------------------------------------------------|
| primary   | `linear-gradient(rgba(0,0,0,0.08), rgba(0,0,0,0.08))` overlay + compound shadow-btn-inner + shadow-btn-hover |
| secondary | `filter: brightness(0.96)` (light) / `brightness(1.1)` (dark); retain inset border      |
| inverted  | `filter: brightness(0.96)` (light) / `brightness(0.9)` (dark)                           |
| ghost     | background → `--color-btn-ghost-hover-bg`                                                |
| link      | `text-decoration: underline` (no bg change)                                              |
| danger    | `filter: brightness(0.96)` (light) / `brightness(1.1)` (dark)                           |

Dark theme primary hover: swaps to `--color-primary-hover` flat fill, removes gradient overlay.

#### active / pressed

```css
.acko-btn:active:not(:disabled) { transform: scale(0.97); }
/* transition: transform 100ms ease (defined in base) */
```

#### focus

```css
.acko-btn:focus-visible {
  outline: none;
  box-shadow: var(--shadow-focus-ring);
}
.acko-btn-secondary:focus-visible {
  /* compound: inset border + focus ring */
  box-shadow: inset 0 0 0 1px var(--color-btn-secondary-border), var(--shadow-focus-ring);
}
.acko-btn-danger:focus-visible {
  box-shadow: 0 0 0 3px color-mix(in srgb, var(--color-error) 20%, transparent);
}
```

## aria

- `disabled` (HTML attr): set to `true` when `isDisabled` — keeps button in tab order and accessible
- `aria-disabled`: `"true"` when `disabled === true` OR `loading === true`
- `aria-busy`: `"true"` when `loading === true`
- `aria-hidden="true"`: on all `.acko-btn-icon` spans and `.acko-btn-dots` span
- sr-only span: `"Loading, please wait"` when loading; label text when `iconOnly`

## keyboard-interactions

| key       | action                                   |
|-----------|------------------------------------------|
| Space     | triggers button action                   |
| Enter     | triggers button action                   |
| Tab       | advances focus to next focusable element |
| Shift+Tab | returns focus to previous focusable      |

## events

| event   | payload                               | description                                          |
|---------|---------------------------------------|------------------------------------------------------|
| onClick | `React.MouseEvent<HTMLButtonElement>` | native; suppressed by disabled HTML attr when isDisabled |

## component-dependencies

- `@acko/css` — provides `button.css` with all `acko-btn*` CSS classes
- `@acko/tokens` — provides CSS custom properties (imported transitively via `@acko/css`)

## notes

- Component is implemented as `forwardRef` — ref forwarded to the underlying `<button>` element.
- The HTML `disabled` attribute is set (not just aria-disabled) because the actual Button.tsx uses `disabled={isDisabled}`. This is acceptable since forwardRef + disabled still keeps the element in accessibility tree. If focus-when-disabled is required in a future iteration, switch to aria-disabled + intercepted onClick only.
- Dark theme: all semantic token remapping happens in `@acko/tokens/tokens.css` under `[data-theme="dark"]` — no conditional logic in TSX.
- `variant` is required (no default). Consumer must always specify intent explicitly.
- CSS sizing rule: ALL dimensions in button.css must use Tailwind `@apply` utilities. Never write raw `width: Npx`, `height: Npx`, `padding: Npx`, `line-height: Nrem`, or `border-radius: 50%`. Use `@apply w-N h-N py-N px-N leading-N rounded-full` etc. The only exceptions are CSS custom-property references (`var(--color-*)`, `box-shadow`, `filter`), `@keyframes` bodies (Tailwind utilities cannot be used inside keyframe blocks), and explicit browser reset values like `border: none`, `background: none`.
