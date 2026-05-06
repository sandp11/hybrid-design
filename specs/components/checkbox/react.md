# Checkbox — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package

name: @acko/checkbox
version: 1.0.0
directive: "use client"
peer-dependencies:
  - react: ^18
  - react-dom: ^18

## component-hierarchy

```
Checkbox (atom)   — standalone toggle for single confirmations
CheckboxRow       — universal selection item for any multi-select list
CheckboxGroup     — convenience wrapper: list of CheckboxRows with shared state
```

## composition

`CheckboxRow` is the **single source of truth** for multi-select list items. The **container** changes by context; the row stays the same:

| Context | Pattern |
|---------|---------|
| Inline list (page / card) | `CheckboxRow` items directly in layout |
| Desktop multi-select | `Dropdown variant="multi"` renders `CheckboxRow` inside the menu panel |
| Mobile multi-select | `Dropdown variant="multi"` with `mobileMode="sheet"` (default) — bottom sheet with `CheckboxRow` items |

Use these patterns for **any** domain (filters, preferences, permissions, features, categories, tags). Not limited to a single product area.

## when-to-use

| Need | Component |
|------|-----------|
| User confirms a single statement (T&C, opt-in) | `Checkbox` (atom) |
| User selects multiple items from a **visible** list | `CheckboxRow` directly, or `CheckboxGroup` |
| User selects multiple items from a **collapsed** list (desktop) | `Dropdown variant="multi"` |
| User selects multiple items from a **collapsed** list (mobile) | `Dropdown variant="multi"` with `mobileMode="sheet"` (default for multi) |
| User picks **one** item from a list | `Dropdown variant="single"` (no checkbox) |

## multi-select-integration

- **Desktop:** never show an inline dropdown panel on mobile — use the sheet pattern on small viewports.
- **Mobile:** prefer `<Dropdown variant="multi" mobileMode="sheet" />` over hand-built `Drawer` + trigger unless you need custom chrome.
- **Platform rule:** do not render a dropdown panel on mobile for multi-select; do not render a bottom sheet on desktop for the same flow — match viewport to container.

`Dropdown` applies menu chrome (positioning, border, shadow, scroll). Scoped CSS in `@acko/css/dropdown.css` adjusts `CheckboxRow` inside `.acko-dropdown-menu-multi` on desktop (separator visibility, horizontal inset, corner radius, hover tint).

## interaction-rules

- The **entire row** is the tap/click target, not only the box.
- Indeterminate: product semantics are parent-driven (e.g. parent checks or clears children).
- Desktop (fine pointer): hover background on the row.
- Mobile: `:active` / press background — no hover affordance.

## do-not

- Do not render an inline dropdown panel on mobile — use bottom sheet (`mobileMode="sheet"`).
- Do not place the checkbox on the right on desktop or on the left on mobile (viewport rules above).
- Do not use the **atom** for list selection — use `CheckboxRow` or `CheckboxGroup`.
- Do not override atom token colors per instance.
- Do not assume multi-select is only for one domain.

## exports

```typescript
export { Checkbox } from './Checkbox';
export { CheckboxRow, CheckboxGroup } from './CheckboxRow';
export type { CheckboxProps } from './Checkbox';
export type { CheckboxRowProps, CheckboxGroupProps, CheckboxRowOption } from './CheckboxRow';
```

## props

### Checkbox (atom)

| prop          | type                      | default  | required | description |
|---------------|---------------------------|----------|----------|-------------|
| checked       | boolean                   | —        | yes      | Controlled checked state |
| onChange      | (checked: boolean) => void| —        | yes      | Called with new boolean on toggle |
| label         | string                    | —        | no       | Text label beside the box |
| description   | string                    | —        | no       | Supporting text below label |
| size          | 'sm' \| 'md' \| 'lg'     | 'md'     | no       | Box + font size |
| indeterminate | boolean                   | false    | no       | Shows minus icon; aria-checked="mixed" |
| disabled      | boolean                   | false    | no       | Prevents interaction; aria-disabled |
| error         | boolean                   | false    | no       | Error-colored border; aria-invalid |
| className     | string                    | —        | no       | Extra classes on root label |

### CheckboxRow

| prop          | type                      | default  | required | description |
|---------------|---------------------------|----------|----------|-------------|
| label         | string                    | —        | yes      | Row label |
| checked       | boolean                   | —        | yes      | Controlled checked state |
| onChange      | (checked: boolean) => void| —        | yes      | Called on row tap/click |
| description   | string                    | —        | no       | Supporting subtext below label |
| indeterminate | boolean                   | false    | no       | Indeterminate state |
| error         | boolean                   | false    | no       | Error state on box |
| className     | string                    | —        | no       | Extra classes on row |

### CheckboxGroup

| prop      | type                      | default | required | description |
|-----------|---------------------------|---------|----------|-------------|
| label     | string                    | —       | yes      | Group heading |
| options   | CheckboxRowOption[]       | —       | yes      | List of { value, label, description? } |
| value     | string[]                  | —       | yes      | Array of selected values |
| onChange  | (value: string[]) => void | —       | yes      | Called with updated selected array |
| error     | boolean                   | false   | no       | Propagated to all rows |
| className | string                    | —       | no       | Extra classes on list container |

## tailwind-classes

### Checkbox atom

base:            acko-checkbox     — inline-flex items-start gap-12 cursor-pointer select-none
native-input:    acko-checkbox-native — sr-only (visually hidden, accessible)
box (base):      acko-checkbox-box — flex items-center justify-center shrink-0 rounded-md transition-all duration-150
content:         acko-checkbox-content — flex flex-col gap-2
label:           acko-checkbox-label
description:     acko-checkbox-description

size/sm: acko-checkbox-sm — box @apply w-16 h-16 rounded-sm
size/md: acko-checkbox-md — box @apply w-20 h-20 rounded-md  [default]
size/lg: acko-checkbox-lg — box @apply w-24 h-24 rounded-md

icon: acko-checkbox-icon — block (SVG element; sized to parent box via CSS)

state/checked:      acko-checkbox-checked
state/indeterminate: acko-checkbox-indeterminate
state/disabled:     acko-checkbox-disabled
state/error:        acko-checkbox-error

### CheckboxRow

base:        acko-cb-row         — relative flex w-full cursor-pointer items-center gap-12
content:     acko-cb-row-content — flex flex-col flex-1 min-w-0
label:       acko-cb-row-label
description: acko-cb-row-description

state/checked:      acko-cb-row-checked
state/indeterminate: acko-cb-row-indeterminate
state/error:        acko-cb-row-error

### CheckboxGroup

container: acko-cb-list       — flex flex-col
label:     acko-cb-list-label — block mb-8

## DOM structure

### Checkbox atom

```html
<label class="acko-checkbox acko-checkbox-{size} [acko-checkbox-checked] [acko-checkbox-disabled] [acko-checkbox-error]">
  <input
    class="acko-checkbox-native"
    type="checkbox"
    checked={checked}
    disabled={disabled}
    aria-invalid={error}
    aria-checked={indeterminate ? 'mixed' : checked}
  />
  <span class="acko-checkbox-box" aria-hidden="true">
    <!-- rendered when checked or indeterminate -->
    <svg class="acko-checkbox-icon" viewBox="0 0 12 12" fill="none">
      <!-- checked: <path d="M2,6 L5,9 L10,3" stroke="currentColor" .../> -->
      <!-- indeterminate: <line x1="2" y1="6" x2="10" y2="6" stroke="currentColor" .../> -->
    </svg>
  </span>
  <!-- rendered when label or description present -->
  <span class="acko-checkbox-content">
    <span class="acko-checkbox-label">{label}</span>
    <span class="acko-checkbox-description">{description}</span>
  </span>
</label>
```

### CheckboxRow

```html
<label class="acko-cb-row [acko-cb-row-checked] [acko-cb-row-error]">
  <input
    class="acko-checkbox-native"
    type="checkbox"
    checked={checked}
    aria-invalid={error}
    aria-checked={indeterminate ? 'mixed' : checked}
  />
  <!-- box: reuses atom box classes; size controlled by responsive CSS -->
  <span class="acko-checkbox-box" aria-hidden="true">
    <svg class="acko-checkbox-icon" viewBox="0 0 12 12" fill="none">...</svg>
  </span>
  <span class="acko-cb-row-content">
    <span class="acko-cb-row-label">{label}</span>
    <!-- rendered when description present -->
    <span class="acko-cb-row-description">{description}</span>
  </span>
</label>
```

### CheckboxGroup

```html
<div class="acko-cb-list {className}">
  <span class="acko-cb-list-label">{label}</span>
  <!-- CheckboxRow for each option -->
  <label class="acko-cb-row ...">...</label>
  <label class="acko-cb-row ...">...</label>
</div>
```

## CSS class reference

| class | description |
|-------|-------------|
| acko-checkbox | atom root: inline-flex, items-start, gap-12, cursor-pointer, select-none |
| acko-checkbox-sm | box 16×16px, radius-sm (4px) |
| acko-checkbox-md | box 20×20px, radius-md (6px) |
| acko-checkbox-lg | box 24×24px, radius-md (6px) |
| acko-checkbox-native | visually hidden native input (sr-only) |
| acko-checkbox-box | custom box: border 1.5px, transition on border/bg/shadow |
| acko-checkbox-icon | SVG icon inside box; color:currentColor |
| acko-checkbox-content | label + description column |
| acko-checkbox-label | label text; color: color-text-default |
| acko-checkbox-description | subtext; font-caption; color: color-text-secondary |
| acko-checkbox-checked | filled bg + primary border; triggers icon draw animation |
| acko-checkbox-indeterminate | same fill as checked; minus icon |
| acko-checkbox-disabled | reduced colors; pointer-events:none |
| acko-checkbox-error | error border; shake animation on class add |
| acko-cb-row | row root: relative, flex, w-full, cursor-pointer |
| acko-cb-row-content | flex-col label + description |
| acko-cb-row-label | row label; responsive font size |
| acko-cb-row-description | row subtext; font-caption; color: color-text-secondary |
| acko-cb-row-checked | row with checked box |
| acko-cb-row-indeterminate | row with indeterminate box |
| acko-cb-row-error | row with error box |
| acko-cb-list | group container: flex-col |
| acko-cb-list-label | group heading; font-label-lg; mb-8 |

## aria

### Checkbox atom
- role: implicit checkbox (via `<input type="checkbox">`)
- aria-checked: true | false | "mixed" (indeterminate)
- aria-invalid: true when error=true
- aria-disabled: true when disabled=true
- keyboard: Space/Enter toggles; Tab moves focus to native input

### CheckboxRow
- role: implicit checkbox (via `<input type="checkbox">`)
- aria-checked: true | false | "mixed"
- aria-invalid: true when error=true
- The entire label is the click/tap target

### CheckboxGroup
- role: group (implicit via div; add role="group" + aria-labelledby if needed)

## events

| event    | component     | payload              | description |
|----------|---------------|----------------------|-------------|
| onChange | Checkbox      | boolean              | New checked state |
| onChange | CheckboxRow   | boolean              | New checked state |
| onChange | CheckboxGroup | string[]             | Full updated selection array |

## component-dependencies

- @acko/css — `checkbox.css` implements `acko-checkbox-*` and `acko-cb-*` classes
- @acko/css — optional `dropdown.css` — import when building `Dropdown variant="multi"`; scopes `CheckboxRow` inside `.acko-dropdown-menu-multi` (desktop separator hide, inset + radius, hover tint)

## notes

- CSS sizing rule: ALL dimensions in checkbox.css must use Tailwind @apply utilities. Never write raw `width: Npx` or `height: Npx`. Exception: `border: 1.5px solid var(--color-*)` is kept as-is (non-standard border width + CSS var reference); `line-height: 0` has no Tailwind equivalent.
- indeterminate state is set on the native input via `inputRef.current.indeterminate = true` in useEffect — it is not an HTML attribute.
- CheckboxRow responsive layout: below 768px `flex-direction: row-reverse` (checkbox right); from 768px `flex-direction: row` (checkbox left) — CSS-only, DOM order is native → box → content.
- Multi-select menu: import `@acko/css/dropdown.css` when implementing `Dropdown variant="multi"` so `.acko-dropdown-menu-multi` gains row separator and hover overrides on desktop.
- Separator is a CSS ::after pseudo-element on .acko-cb-row; hidden via :last-child::after { display:none } (desktop multi-select menu may additionally hide ::after — see dropdown.css).
- All hover styles are wrapped in @media (hover: hover) and (pointer: fine).
- CheckboxGroup toggle logic: if value already in array → remove; else → append.
