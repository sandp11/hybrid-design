# Accordion — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/accordion
version: 1.0.0
directive: "use client"
peer-dependencies:
  - react: ^18
  - react-dom: ^18

## props

### AccordionItem (data shape)

| field     | type             | default | required | description |
|-----------|------------------|---------|----------|-------------|
| value     | string           | —       | yes      | Stable id for this section |
| trigger   | React.ReactNode  | —       | yes      | Trigger row content (heading area) |
| content   | React.ReactNode  | —       | yes      | Collapsible body |
| disabled  | boolean          | false   | no       | Non-interactive section |

### Accordion

| prop          | type                           | default | required | description |
|---------------|--------------------------------|---------|----------|-------------|
| type          | 'single' \| 'multiple'         | —       | yes      | Single-open vs independent panels |
| items         | AccordionItem[]                | —       | yes      | Sections to render |
| defaultValue  | string \| string[]             | —       | no       | Initially open value(s): string if single, array if multiple |
| collapsible   | boolean                        | true    | no       | When type=single: allow closing the open panel. Ignored for multiple. |
| className     | string                         | —       | no       | Root class |

Component forwards ref to root `div`.

## tailwind-classes

Documented in `@acko/css/accordion.css` — TSX uses only `acko-accordion-*` classes via `clsx`. No utilities in TSX.

## DOM structure

```html
<div class="acko-accordion {className}" ref={forwardedRef}>
  <div
    class="acko-accordion-item [acko-accordion-item-disabled]"
    data-state="open | closed"
  >
    <button
      type="button"
      class="acko-accordion-trigger"
      aria-expanded={boolean}
      aria-controls="accordion-content-{value}"
      id="accordion-trigger-{value}"
      disabled={item.disabled}
    >
      <!-- trigger slot: flex child -->
      <span class="acko-accordion-trigger-slot">{item.trigger}</span>
      <span
        class="acko-accordion-chevron [acko-accordion-chevron-open]"
        aria-hidden="true"
      >
        <svg viewBox="0 0 24 24" width="18" height="18">...</svg>
      </span>
    </button>
    <div
      id="accordion-content-{value}"
      role="region"
      aria-labelledby="accordion-trigger-{value}"
      class="acko-accordion-content-wrapper"
      data-state="open | closed"
      style={{ maxHeight: measuredPx }}
    >
      <div class="acko-accordion-content">
        {item.content}
      </div>
    </div>
  </div>
  <!-- repeat items -->
</div>
```

## CSS class reference

| class | description |
|-------|-------------|
| acko-accordion | Root flex column, full width |
| acko-accordion-item | Section; bottom border; last child has no border |
| acko-accordion-item-disabled | Muted text; cursor not-allowed on trigger |
| acko-accordion-trigger | Full-width flex row; font-body-md weight 500; hover primary (fine pointer) |
| acko-accordion-trigger-slot | Flexes to fill space beside chevron; min-width 0 |
| acko-accordion-chevron | Chevron icon container; transition rotate |
| acko-accordion-chevron-open | Rotated 180deg when expanded |
| acko-accordion-content-wrapper | overflow hidden; max-height transition |
| acko-accordion-content | font-body-sm; padding-bottom 16px; secondary text color |

## aria

- trigger: `aria-expanded` true/false
- content region: `role="region"`, `aria-labelledby` pointing to trigger id
- disabled: `disabled` on button; `aria-disabled` implied

## events

| event / behavior | description |
|------------------|-------------|
| click trigger | Toggle section per type and collapsible rules |

## component-dependencies

- none (clsx only)

## notes

- Open state is uncontrolled; initialized from `defaultValue` only.
- Content height is measured with a ref to inner `.acko-accordion-content` for `max-height` animation.
- Chevron is inline SVG 18×18, chevron-down path.
- All `:hover` visual styles on the trigger are scoped with `@media (hover: hover) and (pointer: fine)`.
