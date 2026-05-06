# Calendar — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.

## anatomy
- dropdown-wrapper: optional outer shell when the calendar opens from a field-style trigger (inline-block positioning context).
- trigger: field-style control showing the current selection or placeholder; opens the panel when display mode is dropdown.
- trigger-icon: leading calendar glyph beside trigger text.
- panel: card-like surface holding navigation, grid content, and animations.
- header: month/year title that drills into coarser views; previous/next affordances.
- header-label: tappable label cycling days → months → years drill-down.
- nav-control: square icon buttons for previous/next (meaning depends on active view).
- weekday-row: seven abbreviated weekday titles above the day grid.
- day-grid: six rows of seven cells covering the visible month plus leading/trailing overflow days.
- day-cell: circular/tall pill hit target for a calendar day; supports selection, range band, outside-month, disabled, and today emphasis.
- picker-grid: three-by-four grid for month labels or year numerals.
- picker-cell: rounded interactive tile for one month or one year in picker views.

## variants
- single: one date value; selection completes in one tap on a valid day.
- range: two-step selection (anchor then end); optional hover preview between anchor and pointer while awaiting the second tap.
- multi: independent toggling of many dates; selection state is a set.

## sizes
- trigger: full width of its container in dropdown mode; intrinsic height from horizontal padding and typography line-height.
- panel: fixed content width; internal spacing and cell heights are fixed for rhythm across platforms.
- day-cell: fixed square footprint with full corner rounding on the circle/pill shape.
- picker-cell: taller than day-cell for legibility in dense grids.
- nav-control: fixed square footprint.

## states
- default: trigger closed (dropdown), panel hidden or inline panel visible; neutral borders and surfaces.
- trigger-hover: border emphasis on the trigger (pointer devices only).
- trigger-open: trigger shows active/open border and focus-ring shadow while the dropdown panel is visible.
- trigger-placeholder: muted label text when no value is committed.
- panel-enter: short opacity + vertical motion entrance for the dropdown panel.
- header-label-hover: subtle surface tint when hovering the drill-down title.
- nav-hover: subtle surface behind prev/next affordances.
- day-hover: non-selected day cell shows hover fill when pointer-capable.
- day-selected: solid selected fill and contrasting label for the active day (single or endpoints).
- day-range-middle: band fill between range endpoints; labels use range text token.
- day-range-start: rounded band on the start edge only (pill clipped left).
- day-range-end: rounded band on the end edge only (pill clipped right).
- day-today: typographic emphasis for “today” without implying selection.
- day-outside: muted label for days outside the displayed month.
- day-disabled: not interactive; reduced contrast; no pointer affordance.
- picker-selected: selected month or year tile matches selected-day emphasis.
- picker-current: highlights the month/year that matches the real calendar “now” when distinct from selection.

## visual properties

### dropdown-wrapper
- layout.position: intent fixed positioning context for anchored panel — not tokenized; spacing from panel edge uses spacing tokens in implementation bridge.

### trigger
- surface.background [default]: color-input-bg
- border.color [default]: color-input-border
- border.width [default]: 1px primitive (structural; bridge if Flutter uses decoration stroke width)
- layout.padding-x [default]: spacing-md (16px semantic spacing)
- layout.padding-y [default]: spacing-sm (12px) — align with form controls
- layout.align [default]: horizontal space-between, vertical center (bridge)
- typography.label [default]: font-body-sm — primary text; placeholder uses color-text-secondary
- icon.color [default]: color-text-secondary
- shape.radius [default]: radius-lg

### trigger-hover
- border.color: color-input-hover-border

### trigger-open
- border.color: color-input-focus-border
- elevation.shadow: two-layer ring using color-input-focus-ring at 2px spread (bridge: equivalent focus ring)

### panel
- surface.background [default]: color-card-bg
- border.color [default]: color-card-border
- border.width [default]: 1px
- shape.radius [default]: radius-4xl (20px)
- elevation.shadow [default]: shadow-md
- layout.width [default]: 340px fixed content width (bridge)
- layout.padding [default]: spacing-md (16px inner padding)
- stack.z-index [dropdown]: z-dropdown

### header
- layout.direction [default]: horizontal space-between, vertical center
- typography.title [default]: font-body-md weight 600 — month/year label
- gap.nav [default]: spacing-sm

### header-label (drill control)
- typography.weight [default]: font-body-md semibold intent
- surface.hover [header-label-hover]: color-cal-cell-hover-bg
- shape.radius [default]: radius-lg

### nav-control
- layout.size [default]: 36×36px
- surface.background [default]: transparent
- icon.color [default]: color-text-primary
- surface.hover [nav-hover]: color-cal-cell-hover-bg
- shape.radius [default]: radius-lg
- focus.ring: color-primary-ring at 3px outer equivalence (see foundation equivalence-table)

### weekday-row
- typography.label [default]: font-label-sm uppercase; color-text-secondary

### day-grid
- layout.columns [default]: 7 equal columns
- gap [default]: spacing-2xs (4px) bridge — tight rhythm between cells

### day-cell
- layout.height [default]: 40px
- layout.width [default]: stretch column (square intent)
- typography.numeral [default]: font-body-sm tabular lining figures; color-text-primary
- shape.radius [default]: radius-full
- surface.hover [day-hover]: color-cal-cell-hover-bg

### day-today
- typography.color: color-cal-today-text
- typography.weight: 700

### day-selected
- surface.background: color-cal-selected-bg
- typography.color: color-cal-selected-text

### day-range-middle
- surface.background: color-cal-range-bg
- typography.color: color-cal-range-text
- shape.radius: 0 on flat middle segments

### day-range-start / day-range-end
- surface.background: color-cal-range-bg at middle band with endpoint caps using color-cal-selected-bg on endpoint circle (bridge: split styling between band and cap)
- typography.color on cap: color-cal-selected-text
- shape.radius: radius-full on outer corner only (bridge)

### day-outside
- typography.color: color-text-disabled

### day-disabled
- typography.color: color-text-secondary
- interaction.opacity intent: visually muted; bridge ensures no misleading saturation

### picker-grid
- layout.columns [default]: 3
- layout.rows [default]: 4
- gap [default]: spacing-xs

### picker-cell
- layout.height [default]: 48px
- typography.label [default]: font-body-sm weight 500
- shape.radius [default]: radius-full
- surface.hover: color-cal-cell-hover-bg

### picker-selected
- surface.background: color-cal-selected-bg
- typography.color: color-cal-selected-text
- typography.weight: 700

### picker-current (non-selected)
- typography.color: color-cal-today-text
- typography.weight: 700

### panel-enter motion
- motion.opacity [from]: 0 → 1
- motion.translateY [from]: 8px → 0
- motion.duration: 150ms
- motion.easing: ease-out-cubic

## platform-bridge

  panel-fixed-width-340:
    intent: compact calendar width matching design reference.
    perceptual-goal: readable grid without excessive horizontal stretch on desktop.
    react: max-width / width 340px on panel container.
    flutter: SizedBox(width: 340) or constrained BoxConstraints; verify on narrow phones.
    parity-risk: medium
    ux-acceptance: panel does not overflow common mobile viewports; horizontal scroll never appears for the grid.

  trigger-focus-ring-2px:
    intent: visible focus/open ring consistent with form inputs.
    perceptual-goal: same purple-ring semantics as text inputs when open.
    react: box-shadow 0 0 0 2px color-input-focus-ring when trigger-open.
    flutter: BoxDecoration boxShadow spread 2 with color-input-focus-ring equivalent.
    parity-risk: low
    ux-acceptance: ring reads equally strong on light/dark.

  range-band-split-endpoint:
    intent: middle dates show softer band; endpoints stay solid selected chips.
    perceptual-goal: readable contiguous span with clear endpoints.
    react: combine range-middle background with selected circle caps via layered classes.
    flutter: Stack or CustomPainter split cell backgrounds; verify overlap seams.
    parity-risk: high
    ux-acceptance: no gap/hairline between middle band and endpoint discs at any density.

  dropdown-overlay-vs-inline-stack:
    intent: dropdown panel floats above content with shadow; inline embeds in layout flow.
    perceptual-goal: dropdown reads as ephemeral popover; inline reads embedded.
    react: absolute positioning + z-dropdown for dropdown; static flow for inline.
    flutter: Overlay/portal vs Column — pointer occlusion differs.
    parity-risk: high
    ux-acceptance: dropdown never clipped by parents with overflow:hidden in reference layouts.

  elevated-theme-glass:
    intent: optional glassmorphism for marketing “elevated” shell.
    perceptual-goal: brighter framed controls with blur when product enables elevated theme.
    react: requires dedicated elevated shadow/blur tokens when/if added to foundation.
    flutter: BackdropFilter when tokens exist; otherwise omit.
    parity-risk: high
    ux-acceptance: only ship when matching tokens exist on both platforms.

## accessibility notes
- keyboard: Escape collapses drill-down (years→months→days) before closing the dropdown; arrow navigation intent should eventually align with grid traversal (future enhancement).
- screen-reader: grid semantics for day matrix; selection state reflected per cell; trigger exposes popup expanded state.
