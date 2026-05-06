# Calendar — React Spec
> React and web-specific only. Visual decisions live in style.md.

## package

name: @acko/calendar
version: 1.0.0
directive: `"use client"`
css-dependency: `@acko/css/calendar.css`

## props

| prop           | type                                                                    | default      | required | description |
|----------------|-------------------------------------------------------------------------|--------------|----------|-------------|
| variant        | `'single' \| 'range' \| 'multi'`                                      | `'single'`   | no       | Selection mode |
| display        | `'inline' \| 'dropdown'`                                              | `'dropdown'` | no       | Inline embed vs trigger + floating panel |
| value          | `Date \| DateRange \| Date[]`                                           | —            | yes      | Controlled value |
| onChange       | `(value: Date \| DateRange \| Date[]) => void`                          | —            | yes      | Emits updated selection |
| minDate        | `Date`                                                                  | —            | no       | Days before this (local midnight) are disabled |
| maxDate        | `Date`                                                                  | —            | no       | Days after this (local midnight) are disabled |
| disabledDates  | `Date[]`                                                                | —            | no       | Additional individually disabled days |
| locale         | `string`                                                                | `'en-IN'`    | no       | Passed to `Intl` formatters |
| className      | `string`                                                                | —            | no       | Merged onto root (`acko-cal` or `acko-cal-wrapper`) |

Also inherits root HTML attributes on the outer container except `value` / `onChange` / `children` (children not used).

```typescript
interface DateRange {
  start: Date;
  end: Date;
}
```

## exports

```typescript
export { Calendar } from './Calendar';
export type { CalendarProps, DateRange } from './types';
```

## DOM structure

### Dropdown (`display="dropdown"`)

```html
<div class="acko-cal-wrapper [className]" ref="…">
  <button type="button"
    class="acko-cal-trigger [acko-cal-trigger-open] [acko-cal-trigger-placeholder]"
    aria-haspopup="dialog"
    aria-expanded="…">
    <span class="acko-cal-trigger-icon"><svg … /></span>
    <span>label text</span>
  </button>
  <!-- when open: -->
  <div class="acko-cal-panel acko-cal-panel-dropdown">
    <!-- header + active view (same as inline panel body) -->
  </div>
</div>
```

### Inline (`display="inline"`)

```html
<div class="acko-cal [className]" ref="…">
  <div class="acko-cal-panel">
    <!-- shared inner structure -->
  </div>
</div>
```

### Shared panel inner (abbreviated)

```html
<div class="acko-cal-header">
  <button type="button" class="acko-cal-nav-btn" aria-label="Previous">…chevron…</button>
  <button type="button" class="acko-cal-header-label" aria-label="Select month | Select year">…</button>
  <button type="button" class="acko-cal-nav-btn" aria-label="Next">…chevron…</button>
</div>

<!-- days view -->
<div role="grid" aria-label="March 2026" class="acko-cal-day-grid">
  <div role="row" class="acko-cal-weekdays">
    <div role="columnheader" class="acko-cal-weekday">…</div>
    <!-- ×7 -->
  </div>
  <div role="rowgroup" class="acko-cal-days">
    <div role="row" class="acko-cal-day-row">
      <button type="button" role="gridcell" class="acko-cal-day …" aria-selected="…" tabindex="0|-1" />
      <!-- ×7 per row ×6 rows -->
    </div>
  </div>
</div>

<!-- months view -->
<div role="grid" aria-label="2026" class="acko-cal-picker-grid …">
  <button type="button" role="gridcell" class="acko-cal-picker-cell …">Jan</button>
  <!-- ×12 -->
</div>

<!-- years view -->
<div role="grid" class="acko-cal-picker-grid …" aria-label="2020 – 2031">
  <button type="button" role="gridcell" class="acko-cal-picker-cell …">2020</button>
  <!-- ×12 -->
</div>
```

Icons are inline SVG only (chevron 18×18, calendar icon 18×18); no external icon libraries.

## CSS class reference

| class | role |
|-------|------|
| `.acko-cal-wrapper` | Dropdown root; relative inline-block positioning |
| `.acko-cal` | Inline root |
| `.acko-cal-trigger` | Full-width flex trigger; input-like surface |
| `.acko-cal-trigger-open` | Open/active trigger ring |
| `.acko-cal-trigger-placeholder` | Muted placeholder label |
| `.acko-cal-trigger-icon` | Leading calendar icon slot |
| `.acko-cal-panel` | Card panel (radius-4xl, shadow-md, padding) |
| `.acko-cal-panel-dropdown` | Dropdown attachment + enter animation |
| `.acko-cal-header` | Header flex row |
| `.acko-cal-header-label` | Drill-down title control |
| `.acko-cal-nav-btn` | 36px square prev/next |
| `.acko-cal-day-grid` | Days grid wrapper with `role="grid"` |
| `.acko-cal-weekdays` | Weekday header row |
| `.acko-cal-weekday` | Column header cell |
| `.acko-cal-days` | Rowgroup for weeks |
| `.acko-cal-day-row` | One week row |
| `.acko-cal-day` | Day button |
| `.acko-cal-today` | Today typographic emphasis |
| `.acko-cal-selected` | Selected / endpoint emphasis |
| `.acko-cal-range-start` | Range start cap |
| `.acko-cal-range-end` | Range end cap |
| `.acko-cal-range-middle` | Range span middle |
| `.acko-cal-outside` | Outside-month day |
| `.acko-cal-day-disabled` | Disabled day |
| `.acko-cal-picker-grid` | 3×4 picker |
| `.acko-cal-picker-cell` | Month/year tile |
| `.acko-cal-picker-cell-selected` | Selected picker tile |
| `.acko-cal-picker-cell-current` | “Now” month/year tile |

## behaviours

1. **Single**: selecting a valid day calls `onChange(Date)`; dropdown closes.
2. **Range**: first tap starts `{start,end}` both that day; second tap sets inclusive span (order-independent); hover updates preview band while awaiting second tap; dropdown closes after completing range.
3. **Multi**: toggles membership; dropdown stays open.
4. **Drilling**: header cycles views days → months → years; label `aria-label` reflects target (`Select month` / `Select year`).
5. **Year pagination**: shows 12-year windows; prev/next shift by 12 years.
6. **Bounds**: `minDate` / `maxDate` / `disabledDates` mark `.acko-cal-day-disabled`.
7. **Outside click** (dropdown): closes panel.
8. **Escape**: years → months → days → close dropdown (inline ignores close).
9. **Locale**: `Intl` formatters for weekday/month strings and trigger text.

### Trigger label formats

| variant | pattern |
|---------|---------|
| single | `d MMM yyyy` via locale |
| range | `d MMM — d MMM yyyy` or lone start when collapsed |
| multi | `N dates selected` |
| empty | `Select date` + placeholder class |

## aria

- Dropdown trigger: `aria-haspopup="dialog"`, `aria-expanded` synced with open state.
- Grids: `role="grid"` with descriptive `aria-label`.
- Day buttons: `role="gridcell"`, `aria-selected`, `aria-current="date"` on today’s cell when visible.
- Weekday cells: `role="columnheader"`.
- Nav buttons: `aria-label="Previous"` / `"Next"`.
- Focusability: `tabIndex={0}` only on current-month, non-disabled day cells; others `-1`.

## events

| event | when |
|-------|------|
| onChange | Selection committed per variant rules |
| onClick (outside) | Document capture closes dropdown |

## notes

- Hover styles for interactive elements are wrapped in `@media (hover: hover) and (pointer: fine)` in CSS.
- Dark theme uses semantic tokens; optional `[data-theme="dark"]` panel overrides may align surface tokens where card tokens differ.
