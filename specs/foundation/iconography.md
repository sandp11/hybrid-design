# Iconography

## Icon Library

**Lucide** is the canonical glyph set.
- Web: `lucide-react` package
- Flutter: `lucide_icons` on pub.dev

Do not mix other icon libraries.

## Arrow vs Chevron — Semantic Distinction

### Arrow → "Go" / "Perform an action"

Arrows signal momentum, directional intent, progression to a new state.

| context                          | icon         | example                                           |
|----------------------------------|--------------|---------------------------------------------------|
| Primary CTA / submit             | ArrowRight   | Continue button                                   |
| Back navigation (with label)     | ArrowLeft    | "Go back" button                                  |
| Back navigation (icon-only)      | ArrowLeft    | Ghost icon-only button                            |
| External link                    | ArrowUpRight | "Visit site" link button                          |
| Pagination next/prev             | ArrowRight / ArrowLeft | Moves to a new page                    |
| Download / send                  | Download / Send | Action that leaves current context             |

### Chevron → "Reveal" / "Browse within context"

Chevrons are structural — they reveal more content without leaving the current context.

| context                          | icon           | example                                         |
|----------------------------------|----------------|-------------------------------------------------|
| Accordion expand/collapse        | ChevronDown/Up | Toggle content visibility                       |
| Dropdown menu trigger            | ChevronDown    | Open a select list                              |
| Side navigation expand           | ChevronRight   | Reveal nested nav items                         |
| Carousel / slider                | ChevronLeft/Right | Browse items within a container             |
| Stepper / breadcrumb separator   | ChevronRight   | Visual separator                                |

### Decision Rule

> Will the user **leave the current context** or trigger a **state change**?
> - **Yes** → Arrow
> - **No, content reveals in place** → Chevron

## Icon Sizing

| component size | icon size | tailwind utility |
|----------------|-----------|------------------|
| xs             | 12px      | `size-12`        |
| sm             | 16px      | `size-16`        |
| md             | 16px      | `size-16`        |
| lg             | 24px      | `size-24`        |
| xl             | 32px      | `size-32`        |

- Always use Tailwind `size-*` utilities — never typography tokens for icon dimensions
- Icons inherit the component size via CSS layer — do not set `size` props on Lucide icons inside components
- Always use `currentColor` for fill so icons inherit text color from the theme

## Icon Placement

| position          | meaning                         | prop      |
|-------------------|---------------------------------|-----------|
| Leading (left)    | Reinforces the label — "what"   | iconLeft  |
| Trailing (right)  | Indicates direction — "where"   | iconRight |

- CTA buttons: arrow on the **right** (points where you're going)
- Back buttons: arrow on the **left** (points where you came from)
- Destructive actions: icon on the **left** (reinforces the label)

## Anti-Patterns

| don't                                  | do                                         |
|----------------------------------------|--------------------------------------------|
| ChevronRight on a primary CTA button   | Use ArrowRight — it's an action, not reveal|
| ArrowDown for accordion toggle         | Use ChevronDown — it's an expand           |
| ArrowRight for dropdown trigger        | Use ChevronDown — it opens a menu in place |
| Mixed icon libraries in one project    | Stick to Lucide throughout                 |
| `--font-*` tokens for icon dimensions  | Use Tailwind `size-*` utilities            |
| Decorative icon without aria-hidden    | Always `aria-hidden="true"` on decorative  |
