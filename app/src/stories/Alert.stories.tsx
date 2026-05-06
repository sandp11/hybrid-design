import type { Meta, StoryObj } from "@storybook/react";
import { useState } from "react";
import { Alert } from "@acko/alert";
import { CheckboxGroup } from "@acko/checkbox";

const variants = ["info", "success", "warning", "error"] as const;

const meta = {
  title: "Components/Alert",
  component: Alert,
  tags: ["autodocs"],
  args: {
    variant: "info" as const,
    title: "Heads up",
    children: "This is the alert message body. It uses the caption text style.",
    dismissible: false,
  },
  argTypes: {
    variant: {
      control: "select",
      options: [...variants],
    },
  },
} satisfies Meta<typeof Alert>;

export default meta;

type Story = StoryObj<typeof meta>;

export const WithTitle: Story = {};

export const BodyOnly: Story = {
  name: "Body only",
  args: {
    title: undefined,
    children: "Short message without a title row.",
  },
};

export const Dismissible: Story = {
  args: {
    dismissible: true,
    onDismiss: () => {},
  },
};

export const AllVariants: Story = {
  name: "All variants",
  render: () => (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        gap: 16,
        width: "100%",
        maxWidth: 480,
      }}
    >
      {variants.map((variant) => (
        <Alert key={variant} variant={variant} title={variant} dismissible onDismiss={() => {}}>
          This is a {variant} alert with a dismiss control.
        </Alert>
      ))}
    </div>
  ),
};

export const WithCheckboxGroup: Story = {
  name: "With checkbox group",
  render: function WithCheckbox() {
    const [value, setValue] = useState<string[]>([]);
    return (
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          gap: 20,
          width: "100%",
          maxWidth: 440,
        }}
      >
        <Alert variant="info" title="Choose add-ons" dismissible onDismiss={() => {}}>
          Select any options below. This pattern pairs an inline alert with a checkbox list.
        </Alert>
        <CheckboxGroup
          label="Optional extras"
          options={[
            { value: "a", label: "Extra A", description: "Supporting line." },
            { value: "b", label: "Extra B", description: "Another line." },
            { value: "c", label: "Extra C" },
          ]}
          value={value}
          onChange={setValue}
        />
      </div>
    );
  },
};
