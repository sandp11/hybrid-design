# Layout System

Structural layout primitives: width, containment, gutters, full-bleed, and desktop scaling.
All pages and sections adhere to this system unless a component specification explicitly overrides.

## Breakpoints

Mobile-first only. Use `min-width` media queries exclusively. Never mix with `max-width`.

| name    | range         | media query                        |
|---------|---------------|------------------------------------|
| Mobile  | 0 – 767px     | Base styles (no media query)       |
| Tablet  | 768px – 1023px| `@media (min-width: 768px)`        |
| Desktop | ≥ 1024px      | `@media (min-width: 1024px)`       |

## Section Container

The standard constrained wrapper. Use this for all content sections.

```css
.section-container {
  width: 100%;
  padding-left: 16px;
  padding-right: 16px;
}
@media (min-width: 768px) {
  .section-container { padding-left: 32px; padding-right: 32px; }
}
@media (min-width: 1024px) {
  .section-container { max-width: 1280px; margin: 0 auto; padding-left: 40px; padding-right: 40px; }
}
```

### Effective Content Width (Desktop)

| viewport   | container   | usable content |
|------------|-------------|----------------|
| 1024px     | 1024px      | 944px          |
| 1280px     | 1280px      | 1200px         |
| > 1280px   | 1280px      | 1200px         |

### Gutters

| breakpoint | gutter | utility |
|------------|--------|---------|
| Mobile     | 16px   | `p-16`  |
| Tablet     | 32px   | `p-32`  |
| Desktop    | 40px   | `p-40`  |

Gutters are **internal padding**, not margin.

## Full-bleed Sections

For hero banners, image/video/animation backgrounds, and edge-to-edge media. Must use the two-layer structure:

```html
<!-- Outer: full viewport width (background edge-to-edge) -->
<section class="full-bleed">
  <!-- Inner: constrains content using Section Container rules -->
  <div class="section-container">
    ...content...
  </div>
</section>
```

## Desktop Typography Scaling

Between **1024px and 1280px**, only typography scales. Grid column count, spacing, and component density remain constant.

- Preferred: fluid scaling with `clamp()`
- Acceptable: stepped increase at `@media (min-width: 1280px)`

## Grid Rules

- Use relative units (`fr`, `%`) — no fixed pixel widths for layout columns
- Avoid `100vw` inside constrained containers (use `100%` relative to parent)
- Use `minmax(0, 1fr)` to prevent overflow
- Grid structure must not change between 1024px and 1280px

## Non-Negotiable Rules

1. Desktop layout begins at **1024px**
2. Section Container is fluid until 1280px, then capped and centered
3. Desktop gutters: **40px** (`p-40`)
4. Tablet gutters: **32px** (`p-32`)
5. Mobile gutters: **16px** (`p-16`)
6. Typography is the **only** scaling variable between 1024px–1280px
7. Full-bleed sections **must** use the two-layer structure
8. No additional container variants without system-level review
