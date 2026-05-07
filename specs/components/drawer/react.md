# Drawer — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/drawer
version: 1.0.0
directive: "use client"
peer-dependencies:
  - react: ^18
  - react-dom: ^18

## component-hierarchy

```
Drawer   — single self-contained panel: root-shell + backdrop + panel + header + body + footer
```

## when-to-use

| Need | Component |
|------|-----------|
| Multi-step form or detail view from a list item | `Drawer` (right) |
| Mobile filter or options sheet | `Drawer` (bottom) |
| Navigation tray on mobile | `Drawer` (left) |
| Blocking confirmation that needs full focus | `Dialog` (not Drawer) |

## exports

```typescript
export { Drawer } from './Drawer';
export type { DrawerProps, DrawerSide } from './Drawer';
```

## props

| prop        | type                                         | default     | required | description |
|-------------|----------------------------------------------|-------------|----------|-------------|
| open        | boolean                                      | —           | yes      | Controls open/close state |
| onClose     | () => void                                   | —           | yes      | Called on Escape, backdrop click, or close button |
| side        | `'left' \| 'right' \| 'bottom' \| 'top'`   | `'right'`   | no       | Viewport edge the panel anchors to |
| size        | `'sm' \| 'md' \| 'lg' \| 'full'`           | `'md'`      | no       | Panel width (left/right) or max-height (bottom/top) |
| title       | string                                       | —           | no       | Drawer heading; sets aria-labelledby |
| description | string                                       | —           | no       | Supporting text below title; sets aria-describedby |
| dismissible | boolean                                      | true        | no       | Enables Escape + backdrop click to close |
| children    | ReactNode                                    | —           | yes      | Body content |
| footer      | ReactNode                                    | —           | no       | Action row rendered below a divider |
| className   | string                                       | —           | no       | Extra classes merged onto the panel element |

## DOM structure

```html
<!-- Root shell: always in DOM, visibility toggled -->
<div class="acko-drawer-root [acko-drawer-open]">

  <!-- Backdrop -->
  <div
    class="acko-drawer-backdrop"
    aria-hidden="true"
    <!-- click → onClose when dismissible -->
  />

  <!-- Panel -->
  <div
    class="acko-drawer acko-drawer-{side} acko-drawer-size-{size} [className]"
    role="dialog"
    aria-modal="true"
    aria-labelledby="acko-drawer-title"        <!-- only when title provided -->
    aria-describedby="acko-drawer-description" <!-- only when description provided -->
  >
    <div class="acko-drawer-header">
      <div class="acko-drawer-heading">
        <!-- rendered when title provided -->
        <h2 id="acko-drawer-title" class="acko-drawer-title">{title}</h2>
        <!-- rendered when description provided -->
        <p id="acko-drawer-description" class="acko-drawer-description">{description}</p>
      </div>
      <button type="button" class="acko-drawer-close" aria-label="Close drawer">
        <svg aria-hidden="true">…×icon…</svg>
      </button>
    </div>

    <div class="acko-drawer-body">
      {children}
    </div>

    <!-- rendered when footer provided -->
    <div class="acko-drawer-footer">
      {footer}
    </div>
  </div>

</div>
```

Key difference from Dialog: the root shell (`acko-drawer-root`) is **always present in the DOM**. The `acko-drawer-open` class drives visibility and pointer-events, enabling CSS transform transitions in both directions (open and close).

## CSS class reference

| class | description |
|-------|-------------|
| `acko-drawer-root` | Fixed fullscreen shell; z-modal; visibility:hidden + pointer-events:none by default |
| `acko-drawer-open` | Added to root when open=true; visibility:visible + pointer-events:auto |
| `acko-drawer-backdrop` | Absolute fullscreen overlay; color-surface-overlay; opacity transition 250ms ease-out-cubic |
| `acko-drawer` | Panel: flex-col, overflow:hidden, color-surface-raised, shadow-modal, transform transition 300ms ease-out-quart |
| `acko-drawer-right` | Right edge; full height; radius on left corners only; slides from translateX(100%) |
| `acko-drawer-left` | Left edge; full height; radius on right corners only; slides from translateX(-100%) |
| `acko-drawer-bottom` | Bottom edge; full width; radius on top corners only; slides from translateY(100%) |
| `acko-drawer-top` | Top edge; full width; radius on bottom corners only; slides from translateY(-100%) |
| `acko-drawer-size-sm` | left/right: width 280px — bottom/top: max-height 30vh |
| `acko-drawer-size-md` | left/right: width 380px — bottom/top: max-height 50vh |
| `acko-drawer-size-lg` | left/right: width 520px — bottom/top: max-height 75vh |
| `acko-drawer-size-full` | left/right: width 100% — bottom/top: max-height 100vh |
| `acko-drawer-header` | flex items-start; gap 12px; padding 20px; border-bottom 1px color-border-subtle |
| `acko-drawer-heading` | flex flex-col; gap 4px; flex-1 |
| `acko-drawer-title` | font-body-lg semibold (weight 600); color-text-default |
| `acko-drawer-description` | font-body-sm; color-text-secondary |
| `acko-drawer-close` | 32×32px circle icon button; transparent bg default; color-surface-ghost-hover on hover |
| `acko-drawer-body` | flex-1 overflow-y-auto; padding 20px; color-text-default |
| `acko-drawer-footer` | flex items-center justify-end; gap 12px; padding 16px 20px; border-top 1px color-border-subtle |

## behaviours

1. **Always-in-DOM**: the root-shell is never unmounted. `acko-drawer-open` is toggled to drive CSS transitions in both open and close directions.
2. **Body scroll lock**: `document.body.style.overflow = 'hidden'` when open; restored on close via `useEffect` cleanup.
3. **Focus management**: `useEffect` moves focus to first focusable element in panel when `open` becomes true; focus restored to previously focused element on close.
4. **Escape key**: `keydown` listener on `document`; calls `onClose` when `dismissible=true`.
5. **Backdrop click**: `onClick` on backdrop element; calls `onClose` when `dismissible=true`. Panel click does not propagate to backdrop.
6. **No portal**: root-shell rendered inline; fixed positioning achieves the overlay effect without `createPortal`.

## aria

- Panel: `role="dialog"`, `aria-modal="true"` — always present regardless of open state.
- `aria-labelledby="acko-drawer-title"` — added when `title` prop provided.
- `aria-describedby="acko-drawer-description"` — added when `description` prop provided.
- Close button: `aria-label="Close drawer"`.
- Backdrop: `aria-hidden="true"`.

## animations

### Backdrop
```css
/* Transition on .acko-drawer-backdrop */
opacity: 0;
transition: opacity 250ms var(--ease-out-cubic);

.acko-drawer-open .acko-drawer-backdrop {
  opacity: 1;
}
```

### Panel (per-side)
```css
/* Right */
.acko-drawer-right { transform: translateX(100%); }
/* Left  */
.acko-drawer-left  { transform: translateX(-100%); }
/* Bottom */
.acko-drawer-bottom { transform: translateY(100%); }
/* Top */
.acko-drawer-top   { transform: translateY(-100%); }

transition: transform 300ms var(--ease-out-quart);

.acko-drawer-open .acko-drawer { transform: translate(0); }
```

Both transitions respect `@media (prefers-reduced-motion: reduce)` — set `transition: none`.

## events

| event   | component | payload | description |
|---------|-----------|---------|-------------|
| onClose | Drawer    | —       | User dismissed via Escape, backdrop click, or close button |

## component-dependencies

- @acko/css — `drawer.css` implements all `acko-drawer-*` classes

## notes

- CSS sizing rule: all dimensions via Tailwind `@apply` utilities. Exceptions: `border: 1px solid var(--color-border-subtle)`, `box-shadow: var(--shadow-modal)`, `transition` values referencing CSS vars, keyframe bodies.
- Close button hover: `@media (hover: hover) and (pointer: fine)`.
- Size class applies to the **panel** element (`acko-drawer`), not the root-shell.
- The `heading` wrapper (`acko-drawer-heading`) is always rendered when either `title` or `description` is provided, even if only one is present.
- `acko-drawer-root` is not a portal — it relies on fixed positioning for full-viewport coverage.
