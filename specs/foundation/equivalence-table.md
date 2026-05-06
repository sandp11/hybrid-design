# Platform Equivalence Table

Agents must consult this table for any visual effect before generating platform code.
Parity risk levels: low = near-identical result / medium = close but reviewable / high = different technique, UX sign-off required.

| intent-token       | perceptual goal                        | react / css                                      | flutter                                              | parity-risk |
|--------------------|----------------------------------------|--------------------------------------------------|------------------------------------------------------|-------------|
| elevation-1        | subtle lift, soft ambient shadow       | box-shadow: elevation-1 token value              | BoxShadow(blurRadius:3, offset:Offset(0,1))          | low         |
| elevation-2        | clear lift, card-level depth           | box-shadow: elevation-2 token value              | BoxShadow(blurRadius:12, offset:Offset(0,4))         | low         |
| elevation-3        | modal-level lift                       | box-shadow: elevation-3 token value              | BoxShadow(blurRadius:24, offset:Offset(0,8))         | low         |
| inset-depth-low    | recessed field, top-edge shadow        | box-shadow: inset 0 2px 4px rgba(0,0,0,0.06)    | Stack + Container(gradient top-edge 0→6% black)      | high        |
| inset-depth-medium | strongly recessed surface              | box-shadow: inset 0 4px 8px rgba(0,0,0,0.10)    | Stack + Container(gradient top-edge 0→10% black)     | high        |
| surface-blur-md    | frosted glass, 12px blur               | backdrop-filter: blur(12px)                      | BackdropFilter(filter: ImageFilter.blur(12,12))      | low         |
| surface-blur-heavy | heavy frost, 24px blur                 | backdrop-filter: blur(24px)                      | BackdropFilter(filter: ImageFilter.blur(24,24))      | low         |
| text-gradient      | gradient-filled text                   | background-clip:text + -webkit-text-fill-color   | ShaderMask(shader: LinearGradient.createShader)      | medium      |
| ripple-press       | touch feedback radiating from tap      | :active scale(0.97) + optional ripple library    | InkWell(splashColor, highlightColor)                 | medium      |
| hover-highlight    | surface tint on cursor hover           | :hover + background-color shift                  | MouseRegion (desktop Flutter only, omit on mobile)   | high        |
| focus-ring         | keyboard focus indicator               | outline: 2px solid color-primary, offset: 2px   | custom FocusDecoration overlay or Container border   | medium      |
| disabled-overlay   | reduced opacity, no interaction        | opacity: 0.4 + pointer-events: none              | Opacity(opacity:0.4) + IgnorePointer()               | low         |
| skeleton-shimmer   | loading placeholder shimmer            | CSS keyframe on background-position              | shimmer package or AnimationController               | medium      |
| accordion-expand   | collapsible panel height                    | max-height transition + measured inner height    | AnimatedAlign heightFactor or AnimatedSize + alignment top | medium     |

## Rules for agents
1. For any visual property in style.md, look up intent-token here first.
2. Use the react column verbatim for React generation.
3. Use the flutter column verbatim for Flutter generation.
4. If parity-risk is high, add a code comment: // UX REVIEW: high parity-risk, verify against React render.
5. If an effect has no entry here, add it to this table before generating — do not invent an ad-hoc solution per component.
