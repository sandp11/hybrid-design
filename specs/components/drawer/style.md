# Drawer — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.

## anatomy
- root-shell: fixed fullscreen container that hosts backdrop and panel; always in the DOM on web (visibility toggled); controls z-stacking and pointer-events.
- backdrop: translucent overlay filling the root-shell; fades in on open, fades out on close.
- panel: surface that slides in from one viewport edge; contains all drawer content.
- header: top section of the panel with a dividing border below; holds the heading slot and close button.
- heading: vertical stack inside the header for title and optional description.
- title: primary label for the drawer's purpose.
- description: optional supporting text beneath the title.
- close-button: circular icon button at the trailing end of the header.
- body: scrollable content area that fills the remaining panel height.
- footer: optional action row at the panel bottom with a dividing border above.

## variants
- side/right (default): panel anchored to the right viewport edge; slides in from right.
- side/left: panel anchored to the left viewport edge; slides in from left.
- side/bottom: panel anchored to the bottom viewport edge; slides in from bottom.
- side/top: panel anchored to the top viewport edge; slides in from top.

## sizes
### left / right panels (controls width)
- sm:   280px fixed width
- md:   380px fixed width (default)
- lg:   520px fixed width
- full: 100% viewport width

### bottom / top panels (controls max-height)
- sm:   30vh
- md:   50vh (default)
- lg:   75vh
- full: 100vh

## states
- closed: root-shell present in DOM; visibility hidden, pointer-events none; panel at offset position.
- open: backdrop visible; panel at rest position (transform: none); pointer-events active.
- close-button-hover: close button surface shows ghost hover tint.
- close-button-focus: close button shows 3px focus ring.

## visual properties

### root-shell
- layout.position: fixed, fullscreen (inset 0)
- stack.z-index: z-modal
- interaction [closed]: visibility hidden, pointer-events none
- interaction [open]: visibility visible, pointer-events auto

### backdrop
- surface.background: color-surface-overlay
- layout.position: absolute, fullscreen (inset 0)
- motion.opacity [closed → open]: 0 → 1, 250ms, ease-out-cubic
- motion.opacity [open → closed]: 1 → 0, 250ms, ease-out-cubic

### panel
- surface.background: color-surface-raised
- elevation.shadow: shadow-modal
- layout.position: fixed at viewport edge (per side)
- layout.overflow: hidden (clips children to radius)

#### panel shape — interior corners only
- side/right: radius-4xl on top-left and bottom-left corners; 0 on right corners
- side/left:  radius-4xl on top-right and bottom-right corners; 0 on left corners
- side/bottom: radius-4xl on top-left and top-right corners; 0 on bottom corners
- side/top:   radius-4xl on bottom-left and bottom-right corners; 0 on top corners

#### panel dimensions
- side/right + side/left: full viewport height; width per size token
- side/bottom + side/top: full viewport width; max-height per size token

#### panel motion (slide)
- motion.transform [closed, right]:  translateX(100%) → translateX(0)
- motion.transform [closed, left]:   translateX(-100%) → translateX(0)
- motion.transform [closed, bottom]: translateY(100%) → translateY(0)
- motion.transform [closed, top]:    translateY(-100%) → translateY(0)
- motion.duration: 300ms
- motion.easing: ease-out-quart
- motion.property: transform only (GPU-accelerated)

### header
- layout.direction: horizontal, items-start
- layout.gap: 12px
- layout.padding: 20px all sides
- border.bottom: 1px, color-border-subtle

### heading
- layout.direction: vertical (flex-col)
- layout.gap: 4px
- layout.flex: 1 (fills remaining header width)

### title
- typography: font-body-lg, weight 600 (semibold)
- color: color-text-default

### description
- typography: font-body-sm
- color: color-text-secondary

### close-button
- layout.size: 32×32px
- shape.radius: radius-full
- surface.background [default]: transparent
- surface.background [hover]: color-surface-ghost-hover
- icon.color: color-text-secondary
- focus.ring: shadow-focus-ring (3px ring using color-primary-ring)
- motion.background: 150ms ease

### body
- layout.flex: 1 (fills remaining panel height)
- layout.overflow: vertical scroll only
- layout.padding: 20px all sides
- color: color-text-default

### footer
- layout.direction: horizontal, items-center, justify-end
- layout.gap: 12px
- layout.padding: 16px top/bottom, 20px left/right
- border.top: 1px, color-border-subtle

## platform-bridge

  visibility-vs-unmount:
    intent: smooth CSS transform transition requires the element to already be in the DOM.
    perceptual-goal: slide-in/out plays in both directions (open and close).
    react: root-shell always rendered; visibility:hidden + pointer-events:none when closed; CSS transition on transform.
    flutter: showGeneralDialog / Navigator route — widget is mounted on open and removed on close; exit animation handled by transitionBuilder reverse curve.
    parity-risk: high
    ux-acceptance: close animation plays at the same speed as open; no pop/flash on dismiss.

  vh-size-units:
    intent: bottom/top drawer heights expressed as viewport fractions (30vh / 50vh / 75vh / 100vh).
    perceptual-goal: drawer covers a predictable portion of the screen on all device sizes.
    react: CSS max-height with vh units natively.
    flutter: MediaQuery.of(context).size.height * fraction — compute at build time.
    parity-risk: high
    ux-acceptance: panel height matches design reference on a 375px-wide phone and a 1440px desktop.

  interior-radius-only:
    intent: only the two corners touching the interior of the viewport are rounded; edge corners are flush.
    perceptual-goal: panel reads as an extension of the viewport edge, not a floating card.
    react: CSS border-radius per-corner (e.g. border-top-left-radius + border-bottom-left-radius for right panel).
    flutter: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)) for right panel, etc.
    parity-risk: low

  body-scroll-lock:
    intent: prevent viewport scroll while drawer is open.
    perceptual-goal: body content does not shift beneath the backdrop.
    react: document.body.style.overflow = 'hidden' on open; restored on close.
    flutter: not required — Flutter overlay blocks scroll propagation automatically.
    parity-risk: low

  focus-trap:
    intent: keyboard focus stays within the drawer while open.
    perceptual-goal: Tab/Shift-Tab cycles only through drawer interactive elements.
    react: explicit focus-trap on open; focus restored to trigger on close.
    flutter: handled automatically by Navigator modal route.
    parity-risk: low

## accessibility notes
- role="dialog", aria-modal="true" on the panel at all times (open and closed).
- aria-labelledby wired to title element id when title is provided.
- aria-describedby wired to description element id when description is provided.
- Close button: aria-label="Close drawer".
- Escape key closes when dismissible=true.
- Backdrop click closes when dismissible=true.
- Focus moves into panel on open; returns to trigger element on close.
