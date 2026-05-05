# [Component Name] — React Spec
> React and web-specific only. Visual decisions live in style.md.
> Generated and maintained by agents. Developers may PR changes with a trace to style.md.

## package
name: @ds/[component-name]
version: 0.1.0
peer-dependencies:
  - react: ^18
  - react-dom: ^18
  - @ds/tokens: *

## props
| prop       | type       | default    | required | description |
|------------|------------|------------|----------|-------------|

## tailwind-classes
Map each visual property from style.md to its Tailwind utility class.
Format: part.property [variant] [state]: tailwind-class(es)

base: (classes applied to all instances)

variant/[name]: (classes for this variant)

size/[name]: (classes for this size)

## aria
- role:
- aria-attributes:
- keyboard-interactions:
  - key: action

## events
| event      | payload    | description |
|------------|------------|-------------|

## component-dependencies
List any @ds/* packages this component imports from.

## notes
Any React-specific behaviour not covered above.
