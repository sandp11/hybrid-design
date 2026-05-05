# Shadow Tokens

## Primitive Scale

| token       | light value                              | use case              |
|-------------|------------------------------------------|-----------------------|
| shadow-xs   | 0 1px 2px rgba(0,0,0,0.04)              | Subtle depth          |
| shadow-sm   | 0 1px 4px rgba(0,0,0,0.06)              | Light elevation       |
| shadow-md   | 0 2px 8px rgba(0,0,0,0.06)              | Medium elevation      |
| shadow-lg   | 0px 2px 16px 4px rgba(0,0,0,0.04)       | Cards, dropdowns      |
| shadow-xl   | 0 4px 24px rgba(0,0,0,0.10)             | Modals, dialogs       |
| shadow-2xl  | 0 8px 32px rgba(0,0,0,0.14)             | Maximum elevation     |

> Dark mode: shadow values are heavier to remain visible on dark surfaces. See `themes/acko-dark.md`.

## Semantic Aliases

| token            | maps to    | use case              |
|------------------|------------|-----------------------|
| shadow-card      | shadow-lg  | Elevated cards        |
| shadow-dropdown  | shadow-lg  | Dropdown menus        |
| shadow-modal     | shadow-xl  | Modals, dialogs       |
| shadow-subtle    | shadow-xs  | Small element depth   |

## Component Shadows

| token                      | light                                      | dark                                       | used by                  |
|----------------------------|--------------------------------------------|--------------------------------------------|--------------------------|
| shadow-btn-inner           | inset 0 1px 2px rgba(255,255,255,0.28)    | inset 0 1px 2px rgba(255,255,255,0.15)    | Primary/secondary button |
| shadow-btn-hover           | 0 4px 8px rgba(0,0,0,0.08)               | 0 4px 8px rgba(0,0,0,0.3)                | Button hover state       |
| shadow-btn-secondary-hover | inset 0 2px 4px rgba(255,255,255,0.48)   | inset 0 2px 4px rgba(0,0,0,0.2)          | Secondary button hover   |
| shadow-focus-ring          | 0 0 0 3px var(--color-primary-ring)       | same                                       | All focusable elements   |

## Platform Mapping (equivalence-table.md entries)

| intent-token  | react / css                                | flutter                                              | parity-risk |
|---------------|--------------------------------------------|------------------------------------------------------|-------------|
| shadow-xs     | box-shadow: shadow-xs value                | BoxShadow(blurRadius:2, offset:Offset(0,1))          | low         |
| shadow-sm     | box-shadow: shadow-sm value                | BoxShadow(blurRadius:4, offset:Offset(0,1))          | low         |
| shadow-md     | box-shadow: shadow-md value                | BoxShadow(blurRadius:8, offset:Offset(0,2))          | low         |
| shadow-lg     | box-shadow: shadow-lg value                | BoxShadow(blurRadius:16, spreadRadius:4, offset:Offset(0,2)) | low |
| shadow-xl     | box-shadow: shadow-xl value                | BoxShadow(blurRadius:24, offset:Offset(0,4))         | low         |
| shadow-focus-ring | outline via box-shadow                 | Custom FocusDecoration with Border                   | medium      |

## Rules

- Prefer `box-shadow` over `border` for hairline edges
- Never use harsh drop shadows — keep them diffused
- Shadows are heavier in dark mode to remain visible on dark surfaces
