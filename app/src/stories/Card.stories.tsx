import type { Meta, StoryObj } from "@storybook/react";
import {
  Card,
  CardContent,
  CardFooter,
  CardHeader,
  CardInset,
} from "@acko/card";

const meta = {
  title: "Components/Card",
  component: Card,
  tags: ["autodocs"],
  args: {
    variant: "default" as const,
    padding: "lg" as const,
    children: "Card body content.",
  },
  argTypes: {
    variant: {
      control: "select",
      options: ["default", "secondary", "elevated", "outline", "demoted"],
    },
    padding: {
      control: "select",
      options: ["none", "sm", "md", "lg"],
    },
  },
} satisfies Meta<typeof Card>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Playground: Story = {
  render: (args) => (
    <Card {...args}>
      <p className="text-sm text-[color:var(--color-text-secondary)] m-0">
        {args.children}
      </p>
    </Card>
  ),
};

export const AllVariants: Story = {
  name: "All variants",
  render: () => (
    <div className="flex flex-col gap-4 max-w-lg w-full">
      {(
        ["default", "secondary", "elevated", "outline", "demoted"] as const
      ).map((variant) => (
        <Card key={variant} variant={variant} padding="md">
          <p className="text-sm text-[color:var(--color-text-primary)] m-0 capitalize">
            {variant}
          </p>
          <p className="text-sm text-[color:var(--color-text-secondary)] m-0 mt-1">
            Same geometry — surface treatment only.
          </p>
        </Card>
      ))}
    </div>
  ),
};

export const PaddingScale: Story = {
  name: "Padding scale",
  render: () => (
    <div className="flex flex-col gap-4 max-w-lg w-full">
      {(["none", "sm", "md", "lg"] as const).map((padding) => (
        <Card key={padding} variant="default" padding={padding}>
          <p className="text-sm text-[color:var(--color-text-primary)] m-0">
            padding=&quot;{padding}&quot;
          </p>
        </Card>
      ))}
    </div>
  ),
};

export const CompoundLayout: Story = {
  name: "Header · content · footer · inset",
  render: () => (
    <Card variant="default" padding="lg" className="max-w-md">
      <CardHeader>
        <div className="flex flex-col gap-1 min-w-0">
          <span className="font-semibold text-[color:var(--color-text-primary)]">
            Policy overview
          </span>
          <span className="text-sm text-[color:var(--color-text-secondary)]">
            Motor · comprehensive
          </span>
        </div>
      </CardHeader>
      <CardContent>
        <CardInset>
          <div className="grid grid-cols-2 gap-3 text-sm text-[color:var(--color-text-default)]">
            <div>
              <div className="text-[color:var(--color-text-secondary)] text-xs">
                Premium
              </div>
              <div className="font-medium">₹12,450 / yr</div>
            </div>
            <div>
              <div className="text-[color:var(--color-text-secondary)] text-xs">
                IDV
              </div>
              <div className="font-medium">₹4.2L</div>
            </div>
          </div>
        </CardInset>
      </CardContent>
      <CardFooter>
        <button
          type="button"
          className="text-sm font-medium text-[color:var(--color-primary)] px-3 py-2 rounded-lg hover:bg-[color:var(--color-surface-ghost-hover)]"
        >
          Details
        </button>
        <button
          type="button"
          className="text-sm font-medium text-[color:var(--color-on-primary)] bg-[color:var(--color-primary)] px-4 py-2 rounded-full"
        >
          Renew
        </button>
      </CardFooter>
    </Card>
  ),
};
