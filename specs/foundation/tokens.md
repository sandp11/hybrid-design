# Foundation Tokens

## Architecture

```
primitives → semantics → component code
--purple-600 → --color-primary → component CSS / DsTokens.colorPrimary
```

Components reference **only semantic tokens**. Primitives are looked up here only when adding a new semantic token or debugging a color value.

---

## Color — Primitives

### Grey (17 steps)

| token              | hex       |
|--------------------|-----------|
| grey-white         | #FFFFFF   |
| grey-50            | #FBFBFB   |
| grey-100           | #F5F5F5   |
| grey-150           | #EBEBEB   |
| grey-200           | #E0E0E1   |
| grey-250           | #CCCCCD   |
| grey-300           | #B7B7B8   |
| grey-350           | #8F8E92   |
| grey-400           | #7A7B7D   |
| grey-450           | #605F63   |
| grey-500           | #474649   |
| grey-550           | #333333   |
| grey-600           | #242324   |
| grey-650           | #19191A   |
| grey-700           | #141414   |
| grey-750           | #0F0F10   |
| grey-800           | #0A0A0A   |
| grey-black         | #000000   |

### Purple (Brand)

| token       | hex       |
|-------------|-----------|
| purple-50   | #F5F3FF   |
| purple-100  | #EAEAFD   |
| purple-200  | #D9D8FC   |
| purple-300  | #BDB8FA   |
| purple-400  | #9B8FF6   |
| purple-500  | #7A62F0   |
| purple-600  | #6841E6   |
| purple-700  | #582FD2   |
| purple-800  | #4E29BB   |
| purple-900  | #3E2290   |
| purple-950  | #241362   |

### Red

| token     | hex       |
|-----------|-----------|
| red-50    | #FEF2F2   |
| red-100   | #FEE2E2   |
| red-200   | #FECACA   |
| red-300   | #FCA5A5   |
| red-400   | #F87171   |
| red-500   | #EF4444   |
| red-600   | #DC2626   |
| red-700   | #B91C1C   |
| red-800   | #991B1B   |
| red-900   | #7F1D1D   |
| red-950   | #450A0A   |

### Green

| token       | hex       |
|-------------|-----------|
| green-50    | #F0FDF4   |
| green-100   | #DCFCE7   |
| green-200   | #BBF7D0   |
| green-300   | #86EFAC   |
| green-400   | #4ADE80   |
| green-500   | #22C55E   |
| green-600   | #16A34A   |
| green-700   | #15803D   |
| green-800   | #166534   |
| green-900   | #14532D   |
| green-950   | #052E16   |

### Orange

| token        | hex       |
|--------------|-----------|
| orange-50    | #FFF3E5   |
| orange-100   | #FFE5CC   |
| orange-200   | #FFCB9E   |
| orange-300   | #FFB56B   |
| orange-400   | #FFA85C   |
| orange-500   | #FF8D28   |
| orange-600   | #EB740A   |
| orange-700   | #B65C0C   |
| orange-800   | #8D4301   |
| orange-900   | #521F00   |
| orange-950   | #300212   |

### Blue

| token      | hex       |
|------------|-----------|
| blue-50    | #EFF6FF   |
| blue-100   | #DBEAFE   |
| blue-200   | #BFDBFE   |
| blue-300   | #93C5FD   |
| blue-400   | #60A5FA   |
| blue-500   | #3B82F6   |
| blue-600   | #2563EB   |
| blue-700   | #1D4ED8   |

### Pink

| token      | hex       |
|------------|-----------|
| pink-50    | #FDF2F8   |
| pink-100   | #FCE7F3   |
| pink-200   | #FBCFE8   |
| pink-300   | #F9ABD4   |
| pink-400   | #F472B6   |
| pink-500   | #EC4899   |
| pink-600   | #DB2777   |

### Lime

| token      | hex       |
|------------|-----------|
| lime-100   | #E7FCDC   |
| lime-200   | #CFF7BB   |
| lime-600   | #45A316   |
| lime-900   | #214210   |
| lime-950   | #132E05   |

---

## Color — Semantic

Components use ONLY these tokens. See `themes/acko-light.md` and `themes/acko-dark.md` for full resolved hex values.

### Brand / Primary

| token                   | light                | dark                 | role                          |
|-------------------------|----------------------|----------------------|-------------------------------|
| color-primary           | purple-600 #6841E6   | purple-500 #7A62F0   | Main CTA fill                 |
| color-primary-hover     | purple-700 #582FD2   | purple-400 #9B8FF6   | Hover state                   |
| color-primary-active    | purple-800 #4E29BB   | purple-300 #BDB8FA   | Pressed state                 |
| color-primary-muted     | purple-400 #9B8FF6   | purple-600 #6841E6   | Soft border hints             |
| color-primary-subtle    | purple-100 #EAEAFD   | purple-900 #3E2290   | Tinted backgrounds            |
| color-primary-ring      | purple-200 #D9D8FC   | purple-800 #4E29BB   | Focus ring                    |
| color-on-primary        | #FFFFFF              | #FFFFFF              | Text on primary bg            |

### Surfaces

| token                       | light                      | dark                      |
|-----------------------------|----------------------------|---------------------------|
| color-surface               | grey-100 #F5F5F5           | grey-750 #0F0F10          |
| color-surface-raised        | grey-100 #F5F5F5           | grey-700 #141414          |
| color-surface-raised-hover  | grey-200 #E0E0E1           | grey-650 #19191A          |
| color-surface-raised-active | grey-300 #B7B7B8           | grey-600 #242324          |
| color-surface-overlay       | rgba(10,10,10,0.5)         | rgba(0,0,0,0.7)           |
| color-surface-ghost-hover   | rgba(0,0,0,0.04)           | rgba(255,255,255,0.05)    |

### Text

| token                 | light                | dark                 | role                               |
|-----------------------|----------------------|----------------------|------------------------------------|
| color-text-primary    | grey-800 #0A0A0A     | grey-50 #FBFBFB      | Headings, values, main content     |
| color-text-default    | grey-700 #141414     | grey-100 #F5F5F5     | Labels, body text                  |
| color-text-supporting | grey-550 #333333     | grey-200 #E0E0E1     | Supporting / readonly text         |
| color-text-secondary  | grey-450 #605F63     | grey-350 #8F8E92     | Subtext, placeholders, helpers     |
| color-text-disabled   | grey-300 #B7B7B8     | grey-450 #605F63     | Disabled text                      |
| color-text-invert     | #FFFFFF              | #FFFFFF              | Text on dark/filled surfaces       |
| color-text-brand      | purple-600 #6841E6   | purple-500 #7A62F0   | Brand-colored text, links          |
| color-text-error      | red-700 #B91C1C      | red-400 #F87171      | Error messages                     |
| color-text-success    | green-700 #15803D    | green-400 #4ADE80    | Success messages                   |
| color-text-static     | #FFFFFF              | #FFFFFF              | Fixed — never changes with theme   |

### Borders

| token                    | light                | dark                 |
|--------------------------|----------------------|----------------------|
| color-border             | grey-300 #B7B7B8     | grey-600 #242324     |
| color-border-strong      | grey-450 #605F63     | grey-550 #333333     |
| color-border-subtle      | grey-200 #E0E0E1     | grey-650 #19191A     |
| color-control-border     | grey-300 #B7B7B8     | grey-500 #474649     |

### Disabled

| token                  | light                | dark                 |
|------------------------|----------------------|----------------------|
| color-disabled-bg      | grey-150 #EBEBEB     | grey-600 #242324     |
| color-disabled-text    | grey-350 #8F8E92     | grey-450 #605F63     |
| color-disabled-border  | grey-200 #E0E0E1     | grey-600 #242324     |

### Feedback — Error

| token                   | light                | dark                 |
|-------------------------|----------------------|----------------------|
| color-error             | red-600 #DC2626      | red-600 #DC2626      |
| color-error-text        | red-700 #B91C1C      | red-400 #F87171      |
| color-error-subtle      | red-100 #FEE2E2      | red-950 #450A0A      |
| color-error-border      | red-200 #FECACA      | red-800 #991B1B      |

### Feedback — Success

| token                    | light                | dark                 |
|--------------------------|----------------------|----------------------|
| color-success            | green-600 #16A34A    | green-500 #22C55E    |
| color-success-text       | green-700 #15803D    | green-400 #4ADE80    |
| color-success-subtle     | green-100 #DCFCE7    | green-950 #052E16    |
| color-success-border     | green-200 #BBF7D0    | green-800 #166534    |

### Feedback — Warning

| token                    | light                | dark                 |
|--------------------------|----------------------|----------------------|
| color-warning            | orange-600 #EB740A   | orange-500 #FF8D28   |
| color-warning-text       | orange-700 #B65C0C   | orange-400 #FFA85C   |
| color-warning-subtle     | orange-50 #FFF3E5    | orange-950 #300212   |
| color-warning-border     | orange-100 #FFE5CC   | orange-800 #8D4301   |

### Feedback — Info (uses brand purple)

| token               | light                | dark                 |
|---------------------|----------------------|----------------------|
| color-info          | purple-600 #6841E6   | purple-500 #7A62F0   |
| color-info-text     | purple-700 #582FD2   | purple-400 #9B8FF6   |
| color-info-subtle   | purple-100 #EAEAFD   | purple-950 #241362   |
| color-info-border   | purple-200 #D9D8FC   | purple-800 #4E29BB   |

### Cards

| token                    | light                | dark                 |
|--------------------------|----------------------|----------------------|
| color-card-bg            | grey-50 #FBFBFB      | grey-650 #19191A     |
| color-card-border        | grey-white #FFFFFF   | grey-650 #19191A     |
| color-card-elevated-bg   | grey-white #FFFFFF   | grey-650 #19191A     |
| color-card-demoted-bg    | grey-150 #EBEBEB     | grey-750 #0F0F10     |
| color-card-demoted-border| grey-200 #E0E0E1     | grey-600 #242324     |

### Button-specific

| token                      | light                | dark                 |
|----------------------------|----------------------|----------------------|
| color-btn-secondary-bg     | purple-50 #F5F3FF    | grey-650 #19191A     |
| color-btn-secondary-border | purple-300 #BDB8FA   | purple-600 #6841E6   |
| color-btn-secondary-text   | purple-700 #582FD2   | grey-50 #FBFBFB      |
| color-btn-inverted-bg      | grey-white #FFFFFF   | grey-700 #141414     |
| color-btn-inverted-text    | grey-800 #0A0A0A     | grey-50 #FBFBFB      |
| color-btn-ghost-color      | purple-600 #6841E6   | purple-500 #7A62F0   |
| color-btn-ghost-hover-bg   | purple-50 #F5F3FF    | grey-600 #242324     |
| color-btn-link-color       | blue-600 #2563EB     | blue-400 #60A5FA     |
| color-btn-danger-bg        | red-100 #FEE2E2      | red-900 #7F1D1D      |
| color-btn-danger-text      | red-500 #EF4444      | red-200 #FECACA      |
| color-btn-disabled-bg      | grey-100 #F5F5F5     | grey-600 #242324     |
| color-btn-disabled-text    | grey-350 #8F8E92     | grey-450 #605F63     |

### Badge-specific (solid + dot variants)

Dark gradient values use `color-mix(in srgb, <hue> 90%, transparent)` = hue at 90% opacity.

| token                              | light                    | dark                            |
|------------------------------------|--------------------------|-------------------------------|
| color-badge-purple-gradient-from   | purple-200 #D9D8FC       | purple-950 @ 90% opacity       |
| color-badge-purple-gradient-to     | purple-100 #EAEAFD       | purple-900 @ 90% opacity       |
| color-badge-purple-border          | purple-200 #D9D8FC       | purple-900 #3E2290             |
| color-badge-purple-text            | purple-800 #4E29BB       | purple-200 #D9D8FC             |
| color-badge-purple-outline-color   | purple-600 #6841E6       | purple-400 #9B8FF6             |
| color-badge-green-gradient-from    | lime-200 #CFF7BB         | lime-950 @ 90% opacity         |
| color-badge-green-gradient-to      | lime-100 #E7FCDC         | lime-900 @ 90% opacity         |
| color-badge-green-border           | lime-200 #CFF7BB         | lime-900 #214210               |
| color-badge-green-text             | green-800 #166534        | green-200 #BBF7D0              |
| color-badge-green-outline-color    | lime-600 #45A316         | lime-600 #45A316               |
| color-badge-blue-gradient-from     | blue-200 #BFDBFE         | blue-950 @ 90% opacity         |
| color-badge-blue-gradient-to       | blue-100 #DBEAFE         | blue-900 @ 90% opacity         |
| color-badge-blue-border            | blue-200 #BFDBFE         | blue-900 #1E3A8A               |
| color-badge-blue-text              | blue-800 #1E40AF         | blue-200 #BFDBFE               |
| color-badge-blue-outline-color     | blue-600 #2563EB         | blue-600 #2563EB               |
| color-badge-orange-gradient-from   | orange-200 #FFCB9E       | orange-950 @ 90% opacity       |
| color-badge-orange-gradient-to     | orange-100 #FFE5CC       | orange-900 @ 90% opacity       |
| color-badge-orange-border          | orange-200 #FFCB9E       | orange-900 #521F00             |
| color-badge-orange-text            | orange-800 #8D4301       | orange-200 #FFCB9E             |
| color-badge-orange-outline-color   | orange-600 #EB740A       | orange-600 #EB740A             |
| color-badge-pink-gradient-from     | red-200 #FECACA          | red-950 @ 90% opacity          |
| color-badge-pink-gradient-to       | red-100 #FEE2E2          | red-900 @ 90% opacity          |
| color-badge-pink-border            | red-200 #FECACA          | red-900 #7F1D1D                |
| color-badge-pink-text              | red-800 #991B1B          | red-200 #FECACA                |
| color-badge-pink-outline-color     | red-600 #DC2626          | red-600 #DC2626                |
| color-badge-gray-gradient-from     | grey-200 #E0E0E1         | grey-800 @ 90% opacity         |
| color-badge-gray-gradient-to       | grey-100 #F5F5F5         | grey-700 @ 90% opacity         |
| color-badge-gray-border            | grey-200 #E0E0E1         | grey-600 #242324               |
| color-badge-gray-text              | grey-600 #242324         | grey-200 #E0E0E1               |
| color-badge-gray-outline-color     | grey-600 #242324         | grey-500 #474649               |

### Counter badge-specific

| token                              | light                    | dark                            |
|------------------------------------|--------------------------|-------------------------------|
| color-counter-purple-gradient-from | purple-500 #7A62F0       | purple-950 @ 90% opacity       |
| color-counter-purple-gradient-to   | purple-400 #9B8FF6       | purple-900 @ 90% opacity       |
| color-counter-purple-border        | purple-500 #7A62F0       | purple-900 #3E2290             |
| color-counter-pink-gradient-from   | red-500 #EF4444          | red-950 @ 90% opacity          |
| color-counter-pink-gradient-to     | red-400 #F87171          | red-900 @ 90% opacity          |
| color-counter-pink-border          | red-500 #EF4444          | red-900 #7F1D1D                |
| color-counter-blue-gradient-from   | blue-500 #3B82F6         | blue-950 @ 90% opacity         |
| color-counter-blue-gradient-to     | blue-400 #60A5FA         | blue-900 @ 90% opacity         |
| color-counter-blue-border          | blue-500 #3B82F6         | blue-900 #1E3A8A               |

---

## Z-Index

| token        | value | use                       |
|--------------|-------|---------------------------|
| z-dropdown   | 100   | Dropdown menus, popovers  |
| z-sticky     | 150   | Sticky headers            |
| z-modal      | 200   | Modal dialogs, sheets     |
| z-tooltip    | 300   | Tooltips                  |
| z-toast      | 400   | Toast notifications       |

---

## Opacity

Token number = percentage value (e.g. opacity-48 = 0.48).

| token        | value | | token        | value |
|--------------| ------|-|--------------|-------|
| opacity-0    | 0     | | opacity-48   | 0.48  |
| opacity-4    | 0.04  | | opacity-56   | 0.56  |
| opacity-8    | 0.08  | | opacity-64   | 0.64  |
| opacity-10   | 0.10  | | opacity-72   | 0.72  |
| opacity-16   | 0.16  | | opacity-80   | 0.80  |
| opacity-20   | 0.20  | | opacity-88   | 0.88  |
| opacity-28   | 0.28  | | opacity-96   | 0.96  |
| opacity-32   | 0.32  | | opacity-100  | 1.00  |
| opacity-40   | 0.40  | |              |       |
