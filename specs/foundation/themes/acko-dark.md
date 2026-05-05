# Theme: ACKO Dark

Activated via `[data-theme="dark"]` on `<html>`.

## Dark Mode Principles

1. Surfaces get **darker** as they go "back" — opposite of light
2. Text uses lighter values — not pure `#FFFFFF` (too harsh)
3. Primary purple shifts **lighter** to maintain contrast on dark
4. Reduce shadow intensity — use surface color elevation instead
5. Feedback colors shift to 400–500 range for contrast on dark

## Activation

```js
document.documentElement.setAttribute('data-theme', 'dark');
```

Flutter: pass `DsThemeExtension.dark` to `ThemeData.extensions`.

## Key Token Mappings

| semantic token          | primitive      | hex       | notes                          |
|-------------------------|----------------|-----------|--------------------------------|
| color-primary           | purple-500     | #7A62F0   | Lighter for contrast on dark   |
| color-primary-hover     | purple-400     | #9B8FF6   | Hover goes lighter, not darker |
| color-primary-active    | purple-300     | #BDB8FA   |                                |
| color-primary-muted     | purple-600     | #6841E6   |                                |
| color-primary-subtle    | purple-900     | #3E2290   |                                |
| color-primary-ring      | purple-800     | #4E29BB   |                                |
| color-on-primary        | grey-white     | #FFFFFF   |                                |
| color-surface           | grey-750       | #0F0F10   | Deepest background             |
| color-surface-raised    | grey-700       | #141414   | Cards, inputs                  |
| color-text-primary      | grey-50        | #FBFBFB   | Headings                       |
| color-text-default      | grey-100       | #F5F5F5   | Body text                      |
| color-text-secondary    | grey-350       | #8F8E92   | Helpers, placeholders          |
| color-border            | grey-600       | #242324   | Default borders                |
| color-card-bg           | grey-700       | #141414   | Card fill                      |
| color-card-border       | grey-650       | #19191A   | Subtler stroke                 |
| color-error             | red-600        | #DC2626   |                                |
| color-error-text        | red-400        | #F87171   | Lighter for dark bg contrast   |
| color-success           | green-500      | #22C55E   | Lighter                        |
| color-warning           | orange-500     | #FF8D28   | Lighter                        |

## Visual Adjustments vs Light

| property              | light                  | dark                        |
|-----------------------|------------------------|-----------------------------|
| Card borders          | White highlight edge   | grey-650 — subtler stroke   |
| Input fill            | grey-white             | grey-750                    |
| Input border (default)| grey-150               | grey-600                    |
| Input border (filled) | grey-200               | grey-550                    |
| Dropdown menu         | White + shadow         | Raised surface + border     |
| Shadows               | Standard               | Heavier rgba values         |
| shadow-btn-inner      | rgba(255,255,255,0.28) | rgba(255,255,255,0.15)      |
| shadow-btn-hover      | rgba(0,0,0,0.08)       | rgba(0,0,0,0.3)             |

## Logo

Use **Primary Dark BG** or **Horizontal Dark BG** variant.
