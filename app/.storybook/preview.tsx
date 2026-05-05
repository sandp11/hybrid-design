import type { Preview } from "@storybook/react";

import "../src/styles/preview.css";

const preview: Preview = {
  parameters: {
    layout: "centered",
    backgrounds: {
      default: "surface",
      values: [
        { name: "surface", value: "var(--color-surface, #f5f5f5)" },
        { name: "dark", value: "var(--color-surface, #0f0f0f)" },
      ],
    },
  },
  globalTypes: {
    theme: {
      description: "data-theme on the preview root",
      defaultValue: "light",
      toolbar: {
        title: "Theme",
        icon: "circlehollow",
        items: [
          { value: "light", title: "Light" },
          { value: "dark", title: "Dark" },
        ],
        dynamicTitle: true,
      },
    },
  },
  decorators: [
    (Story, context) => {
      const theme = context.globals.theme ?? "light";
      return (
        <div data-theme={theme} style={{ padding: "1.5rem" }}>
          <Story />
        </div>
      );
    },
  ],
};

export default preview;
