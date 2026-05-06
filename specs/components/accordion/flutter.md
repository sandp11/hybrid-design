# Accordion — Flutter Spec
> Flutter-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## export

class-name: DsAccordion
file: lib/src/components/accordion/ds_accordion.dart
theme-class: DsAccordionTheme
theme-file: lib/src/components/accordion/ds_accordion_theme.dart

## parameters

| parameter    | type                       | default | required | description |
|--------------|----------------------------|---------|----------|-------------|
| type         | DsAccordionType            | —       | yes      | single vs multiple open |
| items        | List\<DsAccordionItem\>    | —       | yes      | Sections |
| defaultValue | List\<String\>             | empty   | no       | Initially open values (one entry for single type is typical) |
| collapsible  | bool                       | true    | no       | When type is single: allow all closed |
| expandDuration | Duration                 | 200ms   | no       | Panel height animation |

## enums / models

```dart
enum DsAccordionType { single, multiple }

class DsAccordionItem {
  const DsAccordionItem({
    required this.value,
    required this.trigger,
    required this.content,
    this.disabled = false,
  });
  final String value;
  final Widget trigger;
  final Widget content;
  final bool disabled;
}
```

Defined next to or inside `ds_accordion.dart` / theme file as appropriate.

## theme-extension-keys

trigger.fontSize: 16 → font-body-md
trigger.fontWeight: w500
trigger.color: color-text-default
trigger.colorHover: color-primary (fine pointer only)
chevron.size: 18
chevron.color: matches trigger
content.fontSize: 14 → font-body-sm
content.color: color-text-secondary
content.paddingBottom: 16
item.borderColor: color-border-subtle
animation.durationOpenClose: 200ms — maps to ease-out-quad via Curves.decelerate (approx per motion.md)
animation.durationTriggerColor: 150ms — trigger hover color

## semantics

- Each header: Semantics(button: true, expanded: bool, label: from trigger if plain text — callers may wrap Semantics)
- Content: Semantics(container: true) when expanded

## callbacks

None — purely visual toggle internal state.

## platform-notes

- expand/collapse: `AnimatedAlign` + `heightFactor` or `AnimatedSize` with `alignment: Alignment.topCenter`, `duration: expandDuration`, `curve: Curves.decelerate`; respect `MediaQuery.disableAnimations`
  // UX REVIEW: medium parity-risk — verify height animation vs CSS max-height
- trigger hover: `MouseRegion` on desktop/web only for primary color tint
  // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React render
- disabled items: `IgnorePointer` or non-null `onPressed` guard; muted colors from theme

## notes

- Internal state: `Set<String>` of open `value`s; `single` mode enforces at most one; `collapsible` applies only to single.
- No `Opacity` for disabled text — use explicit `colorTextDisabled` from theme.
