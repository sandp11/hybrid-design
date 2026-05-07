# Dialog — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.

## anatomy
- backdrop: fixed fullscreen translucent overlay that blocks interaction with content beneath; dismissible on tap/click when dismissible=true.
- panel: centered surface container holding all dialog content; clips children to its rounded corners.
- header: horizontal row at the top of the panel; contains title text and the close icon button.
- title: primary label identifying the dialog's purpose.
- description: optional supporting text beneath the title; rendered before the body slot.
- close-button: circular icon button in the header trailing edge; always visible; activates onClose.
- body: scrollable content area accepting arbitrary children.
- footer: optional action row at the panel bottom; separated from the body by a hairline divider.

## variants
- — (none; single dialog type — all variation is via size prop)

## sizes
- default: 540px max-width (no explicit size prop or unrecognised value)
- sm: 360px max-width
- md: 480px max-width
- lg: 600px max-width
- xl: 760px max-width
- full: 100% width, no border radius (panel fills viewport edge-to-edge)

## states
- closed: dialog not mounted; no DOM / widget tree rendered.
- open: backdrop and panel visible; entrance animation plays on mount.
- focus: close-button and any interactive child element show a focus ring.
- backdrop-hover: no visual change (overlay surface does not tint on hover).

## visual properties

### backdrop
- surface.background: color-surface-overlay
- layout.position: fixed, fullscreen (inset 0)
- stack.z-index: z-modal
- motion.opacity [enter]: 0 → 1, 200ms, ease-out-cubic

### panel
- surface.background: color-surface-raised
- shape.radius [default]: radius-4xl (20px)
- shape.radius [full size]: 0 — panel fills edge-to-edge, no rounding
- elevation.shadow: shadow-lg
- layout.max-width [default]: 540px (no size class)
- layout.max-width [sm]: 360px
- layout.max-width [md]: 480px
- layout.max-width [lg]: 600px
- layout.max-width [xl]: 760px
- layout.max-width [full]: 100%
- layout.width [full]: 100%
- layout.align: horizontally centered in viewport
- motion.opacity [enter]: 0 → 1
- motion.scale [enter]: 0.95 → 1
- motion.translateY [enter]: 8px → 0
- motion.duration [enter]: 250ms
- motion.easing [enter]: ease-out-quart

### header
- layout.direction: horizontal, space-between, vertically centered
- layout.padding: spacing within panel (bridge)

### title
- typography: font-body-lg, weight 600 (semibold)
- color: color-text-default

### description
- typography: font-body-sm
- color: color-text-secondary

### close-button
- layout.size: 32×32px
- shape.radius: radius-full (pill / circle)
- surface.background [default]: transparent
- surface.background [hover]: color-surface-ghost-hover
- icon.color: color-text-secondary
- focus.ring: shadow-focus-ring (3px ring using color-primary-ring)

### body
- layout.overflow: scrollable (vertical scroll only)
- surface.background: inherits from panel

### footer
- border.top: 1px, color-border-subtle
- layout.align: actions right-aligned (trailing)

## platform-bridge

  body-scroll-lock:
    intent: prevent viewport scroll while dialog is open.
    perceptual-goal: body content does not shift or scroll beneath the backdrop.
    react: document.body.style.overflow = 'hidden' on open; restored on close.
    flutter: not required — Flutter overlay stack naturally blocks scroll propagation.
    parity-risk: low

  focus-trap:
    intent: keyboard focus stays within the dialog while open.
    perceptual-goal: Tab/Shift-Tab cycle only through dialog interactive elements.
    react: requires explicit focus-trap implementation (focus moved in on open, restored on close).
    flutter: handled automatically by the navigator/overlay modal barrier.
    parity-risk: low

  panel-entrance-scale:
    intent: panel grows from 95% to 100% scale as it enters.
    perceptual-goal: slight pop-in adds physical weight to the surface appearing.
    react: CSS transform scale(0.95) → scale(1) on the panel element.
    flutter: ScaleTransition 0.95 → 1.0 + FadeTransition combined with SlideTransition.
    parity-risk: medium

  overlay-portal:
    intent: dialog renders above all other page content regardless of DOM nesting.
    perceptual-goal: backdrop covers full viewport; panel floats above everything.
    react: ReactDOM.createPortal to document.body (or equivalent modal root).
    flutter: showGeneralDialog / Navigator.push replaces need for portal.
    parity-risk: low

## accessibility notes
- role="dialog", aria-modal="true" on the panel.
- aria-labelledby wired to the title element id when title prop is provided.
- aria-describedby wired to the description element id when description prop is provided.
- Focus moves into the dialog on open; returns to the trigger element on close.
- Escape key closes when dismissible=true.
- Backdrop tap/click closes when dismissible=true.
