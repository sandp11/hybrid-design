# Border Radius Tokens

## Scale

| token            | value   | use case                                          | tailwind            |
|------------------|---------|---------------------------------------------------|---------------------|
| radius-sm        | 4px     | Nested insets                                     | `rounded`           |
| radius-md        | 6px     | Checkboxes md/lg                                  | `rounded-md`        |
| radius-lg        | 8px     | Options, table cells                              | `rounded-lg`        |
| radius-xl        | 10px    | Tooltip                                           | `rounded-xl`        |
| radius-2xl       | 12px    | —                                                 | `rounded-2xl`       |
| radius-3xl       | 16px    | —                                                 | `rounded-[16px]`    |
| radius-4xl       | 20px    | Cards, dialogs, drawers, toasts, dropdown menus   | `rounded-[20px]`    |
| radius-full      | 9999px  | Buttons, inputs, pills                            | `rounded-full`      |

**`radius-4xl` (20px)** is the standard for surface containers: cards, dialogs, drawers, toasts, dropdown menus, calendar panels.

## Nested Radius Rule

When a rectangular element is nested inside a rounded container:

```
inner radius = outer radius − padding
```

Use `radius-inset-*` tokens when a child element fills the container edge-to-edge inside a `radius-4xl` (20px) card:

| token           | value | when                                                     |
|-----------------|-------|----------------------------------------------------------|
| radius-inset-sm | 8px   | Inner elements in `padding="sm"` (12px) cards → 20−12   |
| radius-inset-md | 4px   | Inner elements in `padding="md"` (16px) cards → 20−16   |
| radius-inset-lg | 0px   | Inner elements in `padding="lg"` (24px) cards → 20−24   |

**Applies to:** Icon wrapper boxes, image thumbnails, inset panels (CardInset).
**Exempt:** Buttons, badges, avatars — they have their own intentional pill/circular shape.

## Platform Mapping

| token       | react / css                      | flutter                                   |
|-------------|----------------------------------|-------------------------------------------|
| radius-full | border-radius: 9999px            | BorderRadius.circular(9999)               |
| radius-4xl  | border-radius: 20px              | BorderRadius.circular(20)                 |
| radius-3xl  | border-radius: 16px              | BorderRadius.circular(16)                 |
| radius-lg   | border-radius: 8px               | BorderRadius.circular(8)                  |
| radius-md   | border-radius: 6px               | BorderRadius.circular(6)                  |
| radius-sm   | border-radius: 4px               | BorderRadius.circular(4)                  |

Radius tokens are **theme-agnostic**.
