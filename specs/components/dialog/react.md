# Dialog — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/dialog
version: 1.0.0
directive: "use client"
peer-dependencies:
  - react: ^18
  - react-dom: ^18

## component-hierarchy

```
Dialog   — single self-contained modal: backdrop + panel + header + body + footer
```

## when-to-use

| Need | Component |
|------|-----------|
| Confirm a destructive or irreversible action | `Dialog` |
| Collect required input before continuing | `Dialog` |
| Display detail that needs full attention | `Dialog` |
| Lightweight dismissible message | Toast or Alert (not Dialog) |

## exports

```typescript
export { Dialog } from './Dialog';
export type { DialogProps } from './Dialog';
```

## props

| prop        | type                          | default  | required | description |
|-------------|-------------------------------|----------|----------|-------------|
| open        | boolean                       | —        | yes      | Controls visibility; mounts/unmounts the dialog |
| onClose     | () => void                    | —        | yes      | Called when Escape is pressed or backdrop is clicked (when dismissible) |
| title       | string                        | —        | no       | Dialog heading; sets aria-labelledby |
| description | string                        | —        | no       | Supporting text below title; sets aria-describedby |
| size        | `'sm' \| 'md' \| 'lg' \| 'xl' \| 'full'` | `'md'` | no | Panel max-width |
| dismissible | boolean                       | true     | no       | Enables Escape key + backdrop click to close |
| children    | ReactNode                     | —        | yes      | Body content |
| footer      | ReactNode                     | —        | no       | Action row rendered below a divider |
| className   | string                        | —        | no       | Extra classes merged onto the panel element |

## DOM structure

```html
<!-- Portalled to document.body -->
<div class="acko-dialog-backdrop" aria-hidden="true" />  <!-- click closes if dismissible -->

<div
  class="acko-dialog acko-dialog-{size} [className]"
  role="dialog"
  aria-modal="true"
  aria-labelledby="acko-dialog-title"       <!-- only when title provided -->
  aria-describedby="acko-dialog-description" <!-- only when description provided -->
>
  <div class="acko-dialog-header">
    <!-- rendered when title provided -->
    <h2 id="acko-dialog-title" class="acko-dialog-title">{title}</h2>
    <button type="button" class="acko-dialog-close" aria-label="Close dialog">
      <svg aria-hidden="true">…×icon…</svg>
    </button>
  </div>

  <!-- rendered when description provided -->
  <p id="acko-dialog-description" class="acko-dialog-description">{description}</p>

  <div class="acko-dialog-body">
    {children}
  </div>

  <!-- rendered when footer provided -->
  <div class="acko-dialog-footer">
    {footer}
  </div>
</div>
```

Both the backdrop and the panel are portalled to `document.body` via `ReactDOM.createPortal`.

## CSS class reference

| class | description |
|-------|-------------|
| `acko-dialog-backdrop` | Fixed fullscreen overlay; color-surface-overlay; z-modal; opacity animation 200ms |
| `acko-dialog` | Panel container: flex-col, centered, color-surface-raised, shadow-lg, radius-4xl, max-width 540px default |
| `acko-dialog-sm` | max-width 360px |
| `acko-dialog-md` | max-width 480px |
| `acko-dialog-lg` | max-width 600px |
| `acko-dialog-xl` | max-width 760px |
| `acko-dialog-full` | width 100%, max-width 100%, border-radius 0 |
| `acko-dialog-header` | flex row, space-between, items-center |
| `acko-dialog-title` | font-body-lg semibold (weight 600); color-text-default |
| `acko-dialog-description` | font-body-sm; color-text-secondary |
| `acko-dialog-close` | 32×32px circle icon button; transparent bg default; color-surface-ghost-hover on hover |
| `acko-dialog-body` | overflow-y auto; flex-grow |
| `acko-dialog-footer` | border-top 1px color-border-subtle; flex row; justify-end |

## tailwind-classes

### Panel
base:    acko-dialog — relative flex flex-col w-full max-w-[540px] mx-auto

### Size modifiers (on panel)
sm:   acko-dialog-sm  — max-w-[360px]
md:   acko-dialog-md  — max-w-[480px]
lg:   acko-dialog-lg  — max-w-[600px]
xl:   acko-dialog-xl  — max-w-[760px]
full: acko-dialog-full — max-w-full w-full rounded-none

### Close button
base: acko-dialog-close — inline-flex items-center justify-center w-32 h-32 rounded-full border-0 bg-transparent cursor-pointer shrink-0

## behaviours

1. **Mount/unmount**: renders `null` when `open` is false — no hidden DOM.
2. **Body scroll lock**: `document.body.style.overflow = 'hidden'` on open; restored via cleanup in `useEffect`.
3. **Focus management**: `useEffect` moves focus to the first focusable element inside the panel on open; focus returns to the trigger element on close via `useRef` to the previously focused element.
4. **Escape key**: `keydown` listener on `document`; calls `onClose` when `dismissible=true`.
5. **Backdrop click**: `onClick` on backdrop element; calls `onClose` when `dismissible=true`. Panel click does not propagate.
6. **Portal**: both backdrop and panel rendered via `ReactDOM.createPortal(…, document.body)`.

## aria

- Panel: `role="dialog"`, `aria-modal="true"`
- `aria-labelledby="acko-dialog-title"` — added to panel when `title` prop is provided
- `aria-describedby="acko-dialog-description"` — added to panel when `description` prop is provided
- Close button: `aria-label="Close dialog"`
- Backdrop: `aria-hidden="true"` (decorative overlay)

## animations

### Backdrop
keyframe: `acko-dialog-backdrop-in`
```css
@keyframes acko-dialog-backdrop-in {
  from { opacity: 0; }
  to   { opacity: 1; }
}
```
- duration: 200ms
- easing: ease-out-cubic
- fill: both

### Panel
keyframe: `acko-dialog-in`
```css
@keyframes acko-dialog-in {
  from { opacity: 0; transform: scale(0.95) translateY(8px); }
  to   { opacity: 1; transform: scale(1) translateY(0); }
}
```
- duration: 250ms
- easing: ease-out-quart
- fill: both

Both animations respect `@media (prefers-reduced-motion: reduce)` — set `animation: none`.

## events

| event      | component | payload    | description |
|------------|-----------|------------|-------------|
| onClose    | Dialog    | —          | User dismissed via Escape, backdrop click, or close button |

## component-dependencies

- @acko/css — `dialog.css` implements `acko-dialog-*` classes
- @acko/button — recommended for footer actions (not a hard dep; footer accepts any ReactNode)

## notes

- CSS sizing rule: all dimensions via Tailwind `@apply` utilities in dialog.css. Exceptions: `border: 1px solid var(--color-border-subtle)` (non-standard value + CSS var), `box-shadow: var(--shadow-lg)`, keyframe bodies.
- Close button hover: wrapped in `@media (hover: hover) and (pointer: fine)`.
- The `full` size removes border-radius (radius 0); all other sizes retain radius-4xl (20px).
- `children` prop is required — dialog must always have body content.
- `footer` is optional — omit the footer element entirely (no empty div) when not provided.
- `description` is optional — omit the `<p>` element entirely when not provided; do not render an empty tag.
