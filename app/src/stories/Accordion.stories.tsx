import type { Meta, StoryObj } from "@storybook/react";
import { Accordion } from "@acko/accordion";

const sampleItems = [
  {
    value: "one",
    trigger: <span>First section</span>,
    content: (
      <p style={{ margin: 0 }}>
        Body copy uses the secondary text style. Add any nested layout here.
      </p>
    ),
  },
  {
    value: "two",
    trigger: <span>Second section</span>,
    content: (
      <p style={{ margin: 0 }}>
        Another panel — independent animation and height measurement per row.
      </p>
    ),
  },
];

const meta = {
  title: "Components/Accordion",
  component: Accordion,
  tags: ["autodocs"],
  args: {
    type: "single" as const,
    collapsible: true,
    defaultValue: "one",
    items: sampleItems,
    className: undefined as string | undefined,
  },
  argTypes: {
    type: {
      control: "select",
      options: ["single", "multiple"],
    },
  },
} satisfies Meta<typeof Accordion>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Single: Story = {
  args: {
    type: "single",
    defaultValue: "one",
    collapsible: true,
    items: sampleItems,
  },
};

export const SingleNonCollapsible: Story = {
  name: "Single — non-collapsible",
  args: {
    type: "single",
    defaultValue: "one",
    collapsible: false,
    items: sampleItems,
  },
};

export const Multiple: Story = {
  args: {
    type: "multiple",
    defaultValue: ["one"],
    items: sampleItems,
  },
};

export const WithDisabled: Story = {
  name: "With disabled item",
  args: {
    type: "single",
    defaultValue: "open",
    items: [
      {
        value: "open",
        trigger: <span>Open section</span>,
        content: <p style={{ margin: 0 }}>Available content.</p>,
      },
      {
        value: "locked",
        trigger: <span>Unavailable</span>,
        content: <p style={{ margin: 0 }}>Hidden when disabled.</p>,
        disabled: true,
      },
    ],
  },
};
