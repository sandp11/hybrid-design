# [Component Name] — Style Spec
> Platform-agnostic. No CSS class names. No Flutter widget names. Token references only.
> This is the only file UX edits directly.

## anatomy
List every visual part of this component.
- part-name: description of what it is

## variants
List all visual variants.
- variant-name: description

## sizes
List all size options if applicable.
- size-name: description

## states
List all interactive states and what triggers them.
- default:
- hover:
- focused:
- pressed:
- disabled:
- loading: (if applicable)
- error: (if applicable)

## visual properties
Map every part × state × variant to foundation tokens.
Format: part.property [variant] [state]: token-name

## platform-bridge
For any property with no native equivalent on one platform, define both implementations here.

  property-name:
    intent: what this should look like / feel like to the user
    perceptual-goal: one sentence describing the target visual outcome
    react: implementation using equivalence-table.md entry
    flutter: implementation using equivalence-table.md entry
    parity-risk: low | medium | high
    ux-acceptance: what UX will visually verify before approving

## accessibility notes
Platform-agnostic accessibility intent. ARIA attributes go in react.md, Semantics in flutter.md.
- keyboard: describe expected keyboard behaviour
- screen-reader: what should be announced and when
- focus: describe focus behaviour and visible indicator
