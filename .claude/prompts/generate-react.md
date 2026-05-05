# React Code Generation — Sub-Prompt

Follow these rules exactly when generating a React component package.

## Naming conventions

- Package name:       `@acko/[name]`             (e.g. `@acko/button`)
- CSS class prefix:   `acko-[name]-*`             (e.g. `acko-btn-*`)
- Component name:     PascalCase, no prefix       (e.g. `Button`, not `DsButton`)
- CSS sheet:          `@acko/css/[name].css`      (e.g. `@acko/css/button.css`)

## Architecture

**Zero Tailwind utilities in TSX.** All visual styling lives in `@acko/css/[name].css`.
The component composes `acko-[name]-*` CSS class names only via `clsx`. No `cva`, no `twMerge`, no inline styles.

```
style.md → @acko/css/[name].css (@apply + raw CSS) → [Component].tsx (clsx class composition)
```

The CSS file uses `@apply` for layout, alignment, spacing, sizing, typography, radius, cursor, and `select-none`.
Raw CSS handles multi-property `transition`, `@keyframes`, `[data-theme]` overrides,
`@media (hover:hover)` blocks, and compound `box-shadow` stacks.

**CSS is not imported inside the component package.** Consumers import it in their app root:
```
@import "@acko/css/[name].css";
```

## Package structure

```
packages/[name]/
  package.json
  tsconfig.json
  src/
    [ComponentName].tsx
    index.ts
```

No `tailwind.config.ts` — Tailwind v4 theming is handled centrally by `@acko/tokens/theme.css`.

## package.json

```json
{
  "name": "@acko/[name]",
  "version": "1.0.0",
  "private": true,
  "type": "module",
  "sideEffects": false,
  "main": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "import": "./dist/index.js"
    }
  },
  "scripts": {
    "build": "tsc -p tsconfig.json",
    "typecheck": "tsc --noEmit"
  },
  "peerDependencies": {
    "react": ">=18",
    "react-dom": ">=18"
  },
  "dependencies": {
    "clsx": "^2.1.1"
  },
  "devDependencies": {
    "@acko/tsconfig": "workspace:*",
    "@types/react": "^19.0.0",
    "typescript": "~5.7.0"
  }
}
```

Do NOT add `@acko/tokens`, `@acko/css`, `class-variance-authority`, or `tailwind-merge` as dependencies.

## tsconfig.json

```json
{
  "extends": "@acko/tsconfig/react-library.json",
  "compilerOptions": {
    "outDir": "dist",
    "rootDir": "src",
    "declaration": true,
    "declarationMap": true
  },
  "include": ["src"]
}
```

## [ComponentName].tsx rules

- First line: `"use client";`
- Use TypeScript. No `any` types.
- Props interface name: `[ComponentName]Props` (e.g. `ButtonProps`)
- Props must match the `props` table in react.md exactly — same names, same types, same defaults.
- Extend the appropriate HTML element attributes (e.g. `ButtonHTMLAttributes<HTMLButtonElement>`).
  Use `Omit<>` to drop conflicting native attributes as noted in react.md.
- Use `forwardRef<HTMLElement, Props>` — all components forward their ref.
- Set `[ComponentName].displayName = "[ComponentName]"` at the end of the file.
- Use `clsx` for all class composition. No other class utility.
- DOM structure must match the `DOM structure` section in react.md exactly — same element hierarchy,
  same `acko-*` class names, same aria attributes.
- All design values come from CSS custom properties via the CSS class sheet — never hardcode hex, px, or numeric values in TSX.
- ARIA attributes must implement the `aria` section in react.md exactly.
- For any `parity-risk: high` entry in style.md, add inline comment:
  `// UX REVIEW: high parity-risk — verify against Flutter render`

## src/index.ts

```ts
export { [ComponentName] } from './[ComponentName]';
export type { [ComponentName]Props } from './[ComponentName]';
```

File extension is `.ts`, not `.tsx`.

## Required imports in component file

```tsx
"use client";

import { forwardRef, type [HTMLAttributeType], type ReactNode } from "react";
import { clsx } from "clsx";
```

No CSS import. No cva. No twMerge.

## CSS sheet — @acko/css/[name].css

When generating the CSS sheet, add a new export entry to `packages/css/package.json`:
```json
"./[name].css": "./src/[name].css"
```

CSS class names use `acko-[name]-*` prefix throughout. Update the class names in react.md accordingly
before generating — do not use `ds-[name]-*`.
