import type { Meta, StoryObj } from "@storybook/react";
import { fn } from "@storybook/test";
import { Badge, CounterBadge } from "@acko/badge";

const colors = [
  "purple",
  "green",
  "blue",
  "orange",
  "pink",
  "gray",
] as const;

const meta = {
  title: "Components/Badge",
  component: Badge,
  tags: ["autodocs"],
  args: {
    children: "Label",
    variant: "solid" as const,
    color: "purple" as const,
    textCase: "uppercase" as const,
    removable: false,
  },
  argTypes: {
    variant: {
      control: "select",
      options: ["solid", "outline", "dot"],
    },
    color: {
      control: "select",
      options: [...colors],
    },
    textCase: {
      control: "select",
      options: ["uppercase", "sentence"],
    },
  },
} satisfies Meta<typeof Badge>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Default: Story = {};

export const Outline: Story = {
  args: { variant: "outline" },
};

export const Dot: Story = {
  args: { variant: "dot", children: "Status" },
};

export const SentenceCase: Story = {
  args: { textCase: "sentence", children: "Draft" },
};

export const Removable: Story = {
  args: {
    removable: true,
    onRemove: fn(),
  },
};

export const AllSolidColors: Story = {
  name: "All colors (solid)",
  render: () => (
    <div
      style={{
        display: "flex",
        flexWrap: "wrap",
        gap: 12,
        alignItems: "center",
      }}
    >
      {colors.map((color) => (
        <Badge key={color} variant="solid" color={color}>
          {color}
        </Badge>
      ))}
    </div>
  ),
};

export const AllOutlineColors: Story = {
  name: "All colors (outline)",
  render: () => (
    <div
      style={{
        display: "flex",
        flexWrap: "wrap",
        gap: 12,
        alignItems: "center",
      }}
    >
      {colors.map((color) => (
        <Badge key={color} variant="outline" color={color}>
          {color}
        </Badge>
      ))}
    </div>
  ),
};

export const CounterBadges: StoryObj = {
  name: "Counter badge",
  render: () => (
    <div
      style={{
        display: "flex",
        flexWrap: "wrap",
        gap: 16,
        alignItems: "center",
      }}
    >
      <CounterBadge count={1} />
      <CounterBadge count={12} />
      <CounterBadge count={150} max={99} />
      <CounterBadge count={4} color="pink" />
      <CounterBadge count={9} color="blue" />
    </div>
  ),
};
