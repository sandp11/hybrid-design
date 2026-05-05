# Typography Tokens

## Font Family

**Euclid Circular B** — all text across the system.

```css
font-family: 'Euclid Circular B', -apple-system, BlinkMacSystemFont, sans-serif;
```

CDN base: `https://pub-c050457d48794d5bb9ffc2b4649de2c1.r2.dev/Euclid%20Font/`

Weights available: Light (300), Regular (400), Medium (500), Semibold (600), Bold (700).

Flutter: `fontFamily: 'Euclid Circular B'` via assets or Google Fonts equivalent.

---

## Size Ramp (15 steps)

Every text-bearing component must reference this scale. No hardcoded sizes.

| step | size  | line-height | css-token                       | tailwind                        |
|------|-------|-------------|----------------------------------|----------------------------------|
| 1    | 10px  | 12px        | `--font-10-size` / `--font-10-line` | `text-[10px] leading-[12px]` |
| 2    | 12px  | 16px        | `--font-12-size` / `--font-12-line` | `text-xs leading-[16px]`     |
| 3    | 14px  | 20px        | `--font-14-size` / `--font-14-line` | `text-sm leading-[20px]`     |
| 4    | 16px  | 24px        | `--font-16-size` / `--font-16-line` | `text-base leading-[24px]`   |
| 5    | 18px  | 24px        | `--font-18-size` / `--font-18-line` | `text-lg leading-[24px]`     |
| 6    | 20px  | 28px        | `--font-20-size` / `--font-20-line` | `text-xl leading-[28px]`     |
| 7    | 24px  | 32px        | `--font-24-size` / `--font-24-line` | `text-2xl leading-[32px]`    |
| 8    | 30px  | 36px        | `--font-30-size` / `--font-30-line` | `text-[30px] leading-[36px]` |
| 9    | 36px  | 44px        | `--font-36-size` / `--font-36-line` | `text-[36px] leading-[44px]` |
| 10   | 48px  | 56px        | `--font-48-size` / `--font-48-line` | `text-[48px] leading-[56px]` |
| 11   | 54px  | 64px        | `--font-54-size` / `--font-54-line` | `text-[54px] leading-[64px]` |
| 12   | 60px  | 72px        | `--font-60-size` / `--font-60-line` | `text-[60px] leading-[72px]` |
| 13   | 72px  | 80px        | `--font-72-size` / `--font-72-line` | `text-[72px] leading-[80px]` |
| 14   | 96px  | 108px       | `--font-96-size` / `--font-96-line` | `text-[96px] leading-[108px]`|
| 15   | 128px | 140px       | `--font-128-size` / `--font-128-line`| `text-[128px] leading-[140px]`|

---

## Style Variants (10 per size)

Each size carries 10 named style variants. Reference as `{size}/{variant}` — e.g. **14/medium**, **24/bold**.

| # | variant              | weight | italic | underline |
|---|----------------------|--------|--------|-----------|
| 1 | normal               | 400    | —      | —         |
| 2 | medium               | 500    | —      | —         |
| 3 | bold                 | 700    | —      | —         |
| 4 | italic               | 400    | yes    | —         |
| 5 | medium-italic        | 500    | yes    | —         |
| 6 | underline            | 400    | —      | yes       |
| 7 | medium-underline     | 500    | —      | yes       |
| 8 | bold-underline       | 700    | —      | yes       |
| 9 | underline-italic     | 400    | yes    | yes       |
| 10| medium-under-italic  | 500    | yes    | yes       |

Total: 15 × 10 = **150 text styles**.

---

## Semantic Aliases (Role-Based)

Prefer these aliases when the context matches. Fall back to numeric size for anything outside.

### Display (marketing, heroes)

| alias              | maps to      | letter-spacing | weight |
|--------------------|-------------|----------------|--------|
| font-display-xl    | 72px / 80px | -2px           | 700    |
| font-display-lg    | 60px / 72px | -1.5px         | 700    |
| font-display-md    | 48px / 56px | -1px           | 700    |
| font-display-sm    | 36px / 44px | -0.5px         | 500    |

### Heading (UI sections)

| alias              | maps to      | letter-spacing | weight |
|--------------------|-------------|----------------|--------|
| font-heading-xl    | 30px / 36px | -0.5px         | 500    |
| font-heading-lg    | 24px / 32px | -0.3px         | 500    |
| font-heading-md    | 20px / 28px | -0.2px         | 500    |
| font-heading-sm    | 18px / 24px | 0px            | 500    |

### Body (content)

| alias            | maps to      | letter-spacing | weight |
|------------------|-------------|----------------|--------|
| font-body-lg     | 18px / 24px | 0px            | 400    |
| font-body-md     | 16px / 24px | 0px            | 400    |
| font-body-sm     | 14px / 20px | 0px            | 400    |

### Labels & Utility

| alias            | maps to      | letter-spacing | weight |
|------------------|-------------|----------------|--------|
| font-label-lg    | 14px / 20px | +0.1px         | 500    |
| font-label-md    | 12px / 16px | +0.2px         | 500    |
| font-label-sm    | 10px / 12px | +0.3px         | 500    |
| font-caption     | 12px / 16px | 0px            | 400    |
| font-overline    | 10px / 12px | +0.5px         | 500    |

---

## Platform Mapping

| alias          | react / css                                                        | flutter                                              |
|----------------|--------------------------------------------------------------------|------------------------------------------------------|
| font-body-md   | font-size:16px, line-height:24px, font-weight:400                 | TextStyle(fontSize:16, height:1.5, fontWeight:w400)  |
| font-body-sm   | font-size:14px, line-height:20px, font-weight:400                 | TextStyle(fontSize:14, height:1.43, fontWeight:w400) |
| font-label-lg  | font-size:14px, line-height:20px, font-weight:500, ls:0.1px       | TextStyle(fontSize:14, fontWeight:w500)              |
| font-label-md  | font-size:12px, line-height:16px, font-weight:500, ls:0.2px       | TextStyle(fontSize:12, fontWeight:w500)              |
| font-label-sm  | font-size:10px, line-height:12px, font-weight:500, ls:0.3px       | TextStyle(fontSize:10, fontWeight:w500)              |
| font-heading-lg| font-size:24px, line-height:32px, font-weight:500, ls:-0.3px      | TextStyle(fontSize:24, fontWeight:w500)              |
| font-heading-md| font-size:20px, line-height:28px, font-weight:500, ls:-0.2px      | TextStyle(fontSize:20, fontWeight:w500)              |

---

## Rules

- Minimum: 14px body, 12px labels, 10px absolute minimum (use sparingly)
- Medium (500) for emphasis in body — not Bold (700)
- Bold (700) reserved for display-level only
- Tighter letter-spacing for large text, looser for small
- `text-wrap: balance` on headings
- `font-variant-numeric: tabular-nums` for dynamic numbers
- Typography tokens are **theme-agnostic** — they do not change between themes

## Text Casing

All UI text follows **sentence case**. Capitalize only the first word and proper nouns.

Exceptions that always retain their casing: `ACKO`, `IDV`, `NCB`, `KYC`, `GST`, `EMI`, `OTP`, `PAN`, `IRDAI`, city/state/country names.

All-caps emphasis (`FREE`, `NEW`) belongs in Badge only, never in text labels.

## Color Roles

| prop value  | token                  | use case                        |
|-------------|------------------------|---------------------------------|
| primary     | color-text-primary     | Headings, values, main content  |
| secondary   | color-text-secondary   | Subtext, captions, helpers      |
| invert      | color-text-invert      | Text on dark/filled surfaces    |
| brand       | color-text-brand       | Links, emphasis                 |
| error       | color-text-error       | Error messages                  |
| success     | color-text-success     | Success messages                |
| static      | color-text-static      | Fixed color across themes       |
