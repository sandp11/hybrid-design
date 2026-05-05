# Theme: ACKO Light

Default ACKO brand theme. Applied via `:root` or `[data-theme="light"]`.

## Visual Personality

| property       | value                                               |
|----------------|-----------------------------------------------------|
| Mood           | Clean, trustworthy, approachable                    |
| Button press   | `scale(0.97)` on `:active`                          |
| Card borders   | White highlight edge on grey-50 fill — floating feel|
| Input focus    | Border color change + 1px ring                      |
| Dropdown enter | `translateY(-8px→0)` + `opacity 0→1`               |
| Border radius  | Pill buttons (radius-full), 20px surfaces (radius-4xl) |
| Shadows        | Light and diffused — never harsh                    |
| Gradients      | Avoid in UI — solid colors only                     |

## Activation

```html
<html data-theme="light">
```

Or via system preference:
```js
const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
document.documentElement.setAttribute('data-theme', prefersDark ? 'dark' : 'light');
```

## Key Token Mappings

| semantic token          | primitive      | hex       |
|-------------------------|----------------|-----------|
| color-primary           | purple-600     | #6841E6   |
| color-primary-hover     | purple-700     | #582FD2   |
| color-primary-active    | purple-800     | #4E29BB   |
| color-primary-muted     | purple-400     | #9B8FF6   |
| color-primary-subtle    | purple-100     | #EAEAFD   |
| color-primary-ring      | purple-200     | #D9D8FC   |
| color-on-primary        | —              | #FFFFFF   |
| color-surface           | grey-100       | #F5F5F5   |
| color-surface-raised    | grey-100       | #F5F5F5   |
| color-text-primary      | grey-800       | #0A0A0A   |
| color-text-default      | grey-700       | #141414   |
| color-text-secondary    | grey-450       | #605F63   |
| color-border            | grey-300       | #B7B7B8   |
| color-card-bg           | grey-50        | #FBFBFB   |
| color-card-border       | grey-white     | #FFFFFF   |
| color-error             | red-600        | #DC2626   |
| color-error-text        | red-700        | #B91C1C   |
| color-success           | green-600      | #16A34A   |
| color-warning           | orange-600     | #EB740A   |
| shadow-btn-inner        | —              | inset 0 1px 2px rgba(255,255,255,0.28) |
| shadow-btn-hover        | —              | 0 4px 8px rgba(0,0,0,0.08) |

## Logo

Use **Primary Light BG** or **Horizontal Light BG** variant.
