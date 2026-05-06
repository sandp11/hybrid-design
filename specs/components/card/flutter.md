# Card — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.

## export

class-names:
  - `DsCard` — shell container
  - `DsCardHeader` — header region
  - `DsCardContent` — body region
  - `DsCardFooter` — footer region
  - `DsCardInset` — nested inset surface

files:
  - `lib/src/components/card/ds_card.dart` — widgets + `DsCardVariant`, `DsCardPadding` enums
  - `lib/src/components/card/ds_card_theme.dart` — `DsCardTheme`

## parameters

### DsCard

| parameter | type              | default              | required | description |
|-----------|-------------------|----------------------|----------|-------------|
| variant   | `DsCardVariant`   | `DsCardVariant.standard` | no       | Maps React `default` → `standard` |
| padding   | `DsCardPadding`   | `DsCardPadding.lg`   | no       | Inner inset |
| child     | `Widget`          | —                    | yes      | Body |

### DsCardHeader / DsCardContent / DsCardFooter / DsCardInset

| parameter | type       | default | required | description |
|-----------|------------|---------|----------|-------------|
| child / children | `Widget` | — | yes | Region content |

Use `child` for single-slot APIs consistent with Flutter conventions.

## enums

- `DsCardVariant` — `standard` (React `default`), `secondary`, `elevated`, `outline`, `demoted`
- `DsCardPadding` — `none`, `sm`, `md`, `lg`

## theme-extension-keys

| visual (style.md) | theme field | default reference |
|-------------------|-------------|-------------------|
| header/footer divider | `dividerColor` | DsTokens.colorBorderSubtle |
| elevated shadow | `elevatedShadows` | BoxShadow list mirroring shadow-lg |

Surface colors per variant resolve from `DsTokens` (`colorCardBg`, `colorCardSecondaryBg`, …).

## semantics

- Shell and regions are passive layout surfaces unless consumers wrap interactive children.
- No default `Semantics` labels — consumers supply headings and buttons.

## callbacks

None — presentational only.

## platform-notes

- Responsive geometry uses `MediaQuery.sizeOf(context).width >= DsTokens.cardBreakpointWidth` to mirror `tokens.css` (769px).
- No hover/press/haptics on the shell — purely layout/clipping.

## notes

- Nested radius uses `DsTokens.radius2xl` / `radius3xl` chosen by breakpoint to mirror `radius-card-nested`.
