import type { Meta, StoryObj } from "@storybook/react";
import { Avatar } from "@acko/avatar";

const sizes = ["xs", "sm", "md", "lg", "xl"] as const;

const meta = {
  title: "Components/Avatar",
  component: Avatar,
  tags: ["autodocs"],
  args: {
    src: "https://picsum.photos/seed/acko-avatar/128/128",
    alt: "Profile photo",
    size: "md" as const,
    shape: "circle" as const,
  },
  argTypes: {
    size: {
      control: "select",
      options: [...sizes],
    },
    shape: {
      control: "select",
      options: ["circle", "square"],
    },
  },
} satisfies Meta<typeof Avatar>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Photo: Story = {};

export const Initials: Story = {
  args: {
    src: undefined,
    initials: "SP",
    alt: undefined,
  },
};

export const FallbackIcon: Story = {
  name: "Fallback (icon)",
  args: {
    src: undefined,
    initials: undefined,
    alt: "User avatar",
  },
};

export const AllSizes: Story = {
  name: "All sizes",
  render: () => (
    <div
      style={{
        display: "flex",
        flexWrap: "wrap",
        gap: 16,
        alignItems: "flex-end",
      }}
    >
      {sizes.map((size) => (
        <div
          key={size}
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            gap: 8,
          }}
        >
          <Avatar src="https://picsum.photos/seed/acko-avatar/128/128" alt="" size={size} />
          <span style={{ fontSize: 11, opacity: 0.7 }}>{size}</span>
        </div>
      ))}
    </div>
  ),
};

export const Square: Story = {
  args: {
    shape: "square",
    initials: "DS",
    src: undefined,
    alt: undefined,
  },
};

export const SquareSizes: Story = {
  name: "Square — all sizes",
  render: () => (
    <div style={{ display: "flex", flexWrap: "wrap", gap: 16, alignItems: "flex-end" }}>
      {sizes.map((size) => (
        <Avatar
          key={size}
          shape="square"
          initials="A"
          size={size}
        />
      ))}
    </div>
  ),
};
