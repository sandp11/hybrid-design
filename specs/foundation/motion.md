# Motion Tokens

## Easing Curves

Defined as CSS custom properties. No `--duration-*` tokens exist — use raw values (e.g. `150ms`, `200ms`, `300ms`) or define local variables per component.

| token               | value                               | use                                  |
|---------------------|-------------------------------------|--------------------------------------|
| ease-out-quad       | cubic-bezier(0.25, 0.46, 0.45, 0.94) | Standard exit transitions          |
| ease-out-cubic      | cubic-bezier(0.215, 0.61, 0.355, 1) | Dropdown/modal enter                |
| ease-out-quart      | cubic-bezier(0.165, 0.84, 0.44, 1)  | Strong deceleration                 |
| ease-in-out-cubic   | cubic-bezier(0.645, 0.045, 0.355, 1)| On-screen movement                  |
| ease-in-out-quart   | cubic-bezier(0.77, 0, 0.175, 1)     | Emphatic transitions                |

## Decision Guide

| scenario                    | easing              |
|-----------------------------|---------------------|
| Element entering/exiting    | ease-out            |
| On-screen movement          | ease-in-out         |
| Hover / color transitions   | `ease` (CSS default)|
| Seen 100+ times daily       | Don't animate       |

## Duration Guidelines (no tokens — use inline values)

| use                              | suggested value |
|----------------------------------|-----------------|
| Micro-interactions, hover color  | 100–150ms       |
| State transitions, small enters  | 150–200ms       |
| Dropdowns, modals entering       | 200–300ms       |
| Exit animations                  | 20–30% faster than entrance |

## Shared Keyframes

Define in the component CSS file that needs them.

### acko-spin
```css
@keyframes acko-spin { to { transform: rotate(360deg); } }
```
Button loading spinner. Duration: 600ms linear infinite.

### acko-shake
```css
@keyframes acko-shake {
  0%, 100% { transform: translateX(0); }
  20% { transform: translateX(-4px); }
  40% { transform: translateX(4px); }
  60% { transform: translateX(-3px); }
  80% { transform: translateX(2px); }
}
```
TextInput / Dropdown on error. Duration: 300ms ease-out.

### acko-check-pop
```css
@keyframes acko-check-pop {
  0% { opacity: 0; transform: scale(0.5); }
  60% { opacity: 1; transform: scale(1.15); }
  100% { opacity: 1; transform: scale(1); }
}
```
TextInput success indicator. Duration: 300ms ease-out.

### acko-menu-enter
```css
@keyframes acko-menu-enter {
  from { opacity: 0; transform: translateY(-8px); }
  to   { opacity: 1; transform: translateY(0); }
}
```
Dropdown menu. Duration: 150ms ease-out-cubic.

## Platform Mapping

| token             | react / css                                    | flutter                               |
|-------------------|------------------------------------------------|---------------------------------------|
| ease-out-quad     | cubic-bezier(0.25, 0.46, 0.45, 0.94)          | Curves.decelerate (approx)            |
| ease-out-cubic    | cubic-bezier(0.215, 0.61, 0.355, 1)           | Curves.easeOutCubic                   |
| ease-out-quart    | cubic-bezier(0.165, 0.84, 0.44, 1)            | Curves.easeOut                        |
| ease-in-out-cubic | cubic-bezier(0.645, 0.045, 0.355, 1)          | Curves.easeInOut                      |
| ease-in-out-quart | cubic-bezier(0.77, 0, 0.175, 1)               | Curves.easeInOutQuart (approx)        |

## Performance Rules

- Only animate `transform` and `opacity` — GPU-accelerated
- Never animate `padding`, `margin`, `height`, `width`
- Use `will-change: transform` for frequently animated elements
- Respect `prefers-reduced-motion` on web; `MediaQuery.disableAnimations` on Flutter

Motion tokens are **theme-agnostic**.
