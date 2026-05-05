# Spacing & Sizing Scale

## System

Spacing uses a **1px base** via Tailwind v4's `--spacing` variable. The utility number equals the pixel value — no math, no indirection.

```css
@theme inline {
  --spacing: 0.0625rem; /* 1px at 16px root */
}
```

- `gap-12` = 12px
- `p-16` = 16px
- `h-48` = 48px

**Rules:**
1. Never use `var(--scale-*)` or `var(--space-*)` — these tokens do not exist
2. Never use raw `px` values for spacing in CSS — always use a Tailwind utility via `@apply`
3. All spacing in component CSS goes through `@apply`

## Spacing Reference

| utility    | pixels | use case                              |
|------------|--------|---------------------------------------|
| gap-4 / p-4  | 4px  | Micro gaps                            |
| gap-8 / p-8  | 8px  | Icon padding, tight gaps, inline      |
| gap-12 / p-12| 12px | Form field gaps, small padding        |
| gap-16 / p-16| 16px | Standard padding, card gaps           |
| gap-20 / p-20| 20px | Medium gaps, card padding md          |
| gap-24 / p-24| 24px | Card padding lg, section gaps         |
| gap-28       | 28px | Component internal spacing            |
| gap-32       | 32px | Large component gaps                  |
| gap-40       | 40px | Large spacing                         |
| gap-48       | 48px | Section margins                       |
| gap-64       | 64px | Page sections                         |
| gap-80       | 80px | Hero spacing                          |

## Component Sizing Scale (heights)

| utility | pixels | used by                                   |
|---------|--------|-------------------------------------------|
| h-32    | 32px   | Button xs                                 |
| h-36    | 36px   | Switch sm track, InputGroup sm            |
| h-40    | 40px   | Button sm, TextInput sm, Dropdown sm      |
| h-44    | 44px   | Switch md track, InputGroup md, min tap   |
| h-48    | 48px   | Button md, TextInput md, Dropdown md      |
| h-52    | 52px   | InputGroup lg                             |
| h-56    | 56px   | Button lg, TextInput lg, Dropdown lg      |
| h-64    | 64px   | Button xl                                 |

## Inter-Component Spacing

| between                      | utility       |
|------------------------------|---------------|
| Label and input              | gap-8 (8px)   |
| Input and helper/error text  | gap-8 (8px)   |
| Form fields                  | gap-20 (20px) |
| Section heading and content  | gap-32 (32px) |
| Cards in a grid              | gap-16 mobile, gap-24 desktop |
| Buttons in a group           | gap-12 (12px) |
| Icon and adjacent text       | gap-8 (8px)   |

## Hairline Border

Renders as 0.5px on retina displays:

```css
:root { --border-hairline: 1px; }
@media (min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
  :root { --border-hairline: 0.5px; }
}
```

## Anti-Patterns

| don't                       | do              |
|-----------------------------|-----------------|
| `gap-2` for 8px (old base)  | `gap-8`         |
| `h-12` for 48px (old base)  | `h-48`          |
| `width: 240px`              | `@apply w-240`  |
| `height: 48px`              | `@apply h-48`   |
