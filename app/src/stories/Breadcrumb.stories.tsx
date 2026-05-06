import type { Meta, StoryObj } from "@storybook/react";
import { Breadcrumb } from "@acko/breadcrumb";
import type { BreadcrumbItem } from "@acko/breadcrumb";

const basicItems: BreadcrumbItem[] = [
  { label: "Home", href: "#" },
  { label: "Insurance", href: "#" },
  { label: "Motor", href: "#" },
  { label: "Renewal" },
];

const meta = {
  title: "Components/Breadcrumb",
  component: Breadcrumb,
  tags: ["autodocs"],
  args: {
    items: basicItems,
    maxItems: undefined as number | undefined,
  },
  parameters: {
    layout: "padded",
  },
} satisfies Meta<typeof Breadcrumb>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Default: Story = {};

export const PlainSegments: Story = {
  name: "Plain segments (no links)",
  args: {
    items: [
      { label: "Org" },
      { label: "Team" },
      { label: "Settings" },
    ],
  },
};

export const WithIcons: Story = {
  name: "With icons",
  args: {
    items: [
      {
        label: "Home",
        href: "#",
        icon: (
          <svg width={14} height={14} viewBox="0 0 24 24" aria-hidden="true">
            <path
              fill="currentColor"
              d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"
            />
          </svg>
        ),
      },
      { label: "Products", href: "#" },
      { label: "Checkout" },
    ],
  },
};

const manyItems: BreadcrumbItem[] = [
  { label: "Home", href: "#" },
  { label: "Level 1", href: "#" },
  { label: "Level 2", href: "#" },
  { label: "Level 3", href: "#" },
  { label: "Level 4", href: "#" },
  { label: "Level 5", href: "#" },
  { label: "Level 6", href: "#" },
  { label: "Current page" },
];

export const Collapsed: Story = {
  name: "Collapsed (maxItems)",
  args: {
    items: manyItems,
    maxItems: 4,
  },
};

export const CustomSeparator: Story = {
  name: "Custom separator",
  args: {
    items: basicItems,
    separator: <span className="text-[color:var(--color-text-secondary)] px-1">/</span>,
  },
};
