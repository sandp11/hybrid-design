# Avatar — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/avatar
version: 1.0.0
peer-dependencies:
  - react: ^18
  - react-dom: ^18

## props

| prop      | type                                   | default    | required | description |
|-----------|----------------------------------------|------------|----------|-------------|
| src       | string                                 | —          | no       | Image URL |
| alt       | string                                 | —          | no       | Alt text; used as aria-label on root |
| initials  | string                                 | —          | no       | 1–2 char initials shown when image absent or fails |
| size      | 'xs' \| 'sm' \| 'md' \| 'lg' \| 'xl' | 'md'       | no       | Avatar dimensions |
| shape     | 'circle' \| 'square'                  | 'circle'   | no       | Border-radius shape |
| className | string                                 | —          | no       | Extra CSS classes appended to root |

Also spreads all `React.HTMLAttributes<HTMLDivElement>` onto the root element.

## tailwind-classes

base:
  acko-avatar — inline-flex items-center justify-center overflow-hidden shrink-0

size/xs:  acko-avatar-xs — h-24 w-24
size/sm:  acko-avatar-sm — h-32 w-32
size/md:  acko-avatar-md — h-40 w-40
size/lg:  acko-avatar-lg — h-48 w-48
size/xl:  acko-avatar-xl — h-64 w-64

shape/circle: acko-avatar-circle — rounded-full
shape/square: acko-avatar-square — rounded-lg

image:       acko-avatar-img       — w-full h-full object-cover (opacity fade via CSS transition)
initials:    acko-avatar-initials  — flex items-center justify-center w-full h-full font-medium
fallback:    acko-avatar-fallback  — flex items-center justify-center w-full h-full

initials-size/xs: acko-avatar-initials-xs — font-size: 10px
initials-size/sm: acko-avatar-initials-sm — font-size: 12px
initials-size/md: acko-avatar-initials-md — font-size: 14px
initials-size/lg: acko-avatar-initials-lg — font-size: 16px
initials-size/xl: acko-avatar-initials-xl — font-size: 20px

fallback-size/xs: acko-avatar-fallback-xs — targets child svg: @apply w-12 h-12 (12px)
fallback-size/sm: acko-avatar-fallback-sm — targets child svg: @apply w-16 h-16 (16px)
fallback-size/md: acko-avatar-fallback-md — targets child svg: @apply w-20 h-20 (20px)
fallback-size/lg: acko-avatar-fallback-lg — targets child svg: @apply w-24 h-24 (24px)
fallback-size/xl: acko-avatar-fallback-xl — targets child svg: @apply w-32 h-32 (32px)

## DOM structure

```html
<div
  class="acko-avatar acko-avatar-{size} acko-avatar-{shape} {className}"
  role="img"
  aria-label="{alt}"
>
  <!-- Layer 1: image (when src set and imgFailed is false) -->
  <img
    class="acko-avatar-img"
    src="{src}"
    alt="{alt}"
    onError={handleError}
  />

  <!-- Layer 2: initials (when no image and initials provided) -->
  <span class="acko-avatar-initials acko-avatar-initials-{size}" aria-hidden="true">
    {initials}
  </span>

  <!-- Layer 3: fallback icon (when neither image nor initials) -->
  <span class="acko-avatar-fallback acko-avatar-fallback-{size}" aria-hidden="true">
    <!-- UserIcon SVG, currentColor, size per table -->
  </span>
</div>
```

Only one of layers 1/2/3 renders at a time, determined by imgFailed state.

## CSS class reference

| class | description |
|-------|-------------|
| acko-avatar | base: inline-flex center, overflow:hidden, shrink-0 |
| acko-avatar-xs | 24×24px |
| acko-avatar-sm | 32×32px |
| acko-avatar-md | 40×40px |
| acko-avatar-lg | 48×48px |
| acko-avatar-xl | 64×64px |
| acko-avatar-circle | border-radius: 9999px |
| acko-avatar-square | border-radius: 8px |
| acko-avatar-img | w-full h-full object-cover; transition: opacity 200ms ease |
| acko-avatar-initials | centered, font-weight:500; bg: color-primary-subtle; color: color-primary |
| acko-avatar-initials-xs | font-size: 10px |
| acko-avatar-initials-sm | font-size: 12px |
| acko-avatar-initials-md | font-size: 14px |
| acko-avatar-initials-lg | font-size: 16px |
| acko-avatar-initials-xl | font-size: 20px |
| acko-avatar-fallback | centered icon; bg: color-primary-subtle; color: color-primary; w-full h-full |
| acko-avatar-fallback-xs | child svg → @apply w-12 h-12 (12px) |
| acko-avatar-fallback-sm | child svg → @apply w-16 h-16 (16px) |
| acko-avatar-fallback-md | child svg → @apply w-20 h-20 (20px) |
| acko-avatar-fallback-lg | child svg → @apply w-24 h-24 (24px) |
| acko-avatar-fallback-xl | child svg → @apply w-32 h-32 (32px) |

## aria

- role: img on root div
- aria-label: alt prop value (omitted when alt is undefined)
- keyboard-interactions: none (presentational by default)

## events

| event   | payload           | description |
|---------|-------------------|-------------|
| onError | SyntheticEvent    | Internal — img failure sets imgFailed state; not exposed as prop |

## notes

- imgFailed resets to false via useEffect when src prop changes
- Image opacity transition is entirely CSS — no JS animation; opacity starts at 0 when src first resolves and transitions to 1
- Always pass initials alongside src for unreliable sources (user uploads, external URLs)
- No hover, active, disabled, or loading states on Avatar itself
- CSS sizing rule: ALL dimensions in avatar.css must use Tailwind @apply utilities (e.g. @apply w-12 h-12). Never write raw `width: Npx` or `height: Npx`. To size a child element (e.g. svg inside a span), use a child selector: `.acko-avatar-fallback-xs svg { @apply w-12 h-12; }`
