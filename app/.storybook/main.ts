import type { StorybookConfig } from "@storybook/react-vite";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const configDir = dirname(fileURLToPath(import.meta.url));

const config: StorybookConfig = {
  stories: [
    "../src/**/*.mdx",
    "../src/**/*.stories.@(js|jsx|mjs|ts|tsx)",
  ],
  addons: ["@storybook/addon-essentials"],
  framework: {
    name: "@storybook/react-vite",
    options: {},
  },
  async viteFinal(config) {
    const { mergeConfig } = await import("vite");
    const { default: tailwindcss } = await import("@tailwindcss/vite");
    return mergeConfig(config, {
      plugins: [tailwindcss()],
      resolve: {
        alias: {
          "@acko/alert": resolve(configDir, "../../packages/alert/src"),
          "@acko/avatar": resolve(configDir, "../../packages/avatar/src"),
          "@acko/badge": resolve(configDir, "../../packages/badge/src"),
          "@acko/button": resolve(configDir, "../../packages/button/src"),
          "@acko/checkbox": resolve(configDir, "../../packages/checkbox/src"),
          "@acko/accordion": resolve(configDir, "../../packages/accordion/src"),
          "@acko/calendar": resolve(configDir, "../../packages/calendar/src"),
          "@acko/card": resolve(configDir, "../../packages/card/src"),
          "@acko/breadcrumb": resolve(configDir, "../../packages/breadcrumb/src"),
        },
      },
    });
  },
};

export default config;
