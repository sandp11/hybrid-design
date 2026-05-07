import type { Meta, StoryObj } from "@storybook/react";
import { useState } from "react";
import { Drawer } from "@acko/drawer";
import type { DrawerSide } from "@acko/drawer";
import { Button } from "@acko/button";

const meta = {
  title: "Components/Drawer",
  component: Drawer,
  tags: ["autodocs"],
  parameters: {
    layout: "fullscreen",
  },
  args: {
    open: false,
    side: "right" as const,
    size: "md" as const,
    title: "Drawer title",
    description: "Optional supporting text under the title.",
    dismissible: true,
  },
  argTypes: {
    side: {
      control: "select",
      options: ["left", "right", "bottom", "top"],
    },
    size: {
      control: "select",
      options: ["sm", "md", "lg", "full"],
    },
  },
} satisfies Meta<typeof Drawer>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Playground: Story = {
  render: function PlaygroundStory(args) {
    const [open, setOpen] = useState(false);
    return (
      <div className="flex min-h-[100vh] w-full flex-col items-center justify-center gap-8 p-20">
        <Button variant="primary" onClick={() => setOpen(true)}>
          Open drawer
        </Button>
        <Drawer
          {...args}
          open={open}
          onClose={() => setOpen(false)}
          footer={
            <div className="flex flex-wrap justify-end gap-8">
              <Button variant="secondary" onClick={() => setOpen(false)}>
                Cancel
              </Button>
              <Button variant="primary" onClick={() => setOpen(false)}>
                Save
              </Button>
            </div>
          }
        >
          <p className="m-0 text-[length:var(--font-body-sm-size)] leading-[var(--font-body-sm-line)] text-[color:var(--color-text-primary)]">
            Main content: navigation lists, filters, or forms. The panel stays in
            the DOM and toggles visibility for enter/exit transitions.
          </p>
        </Drawer>
      </div>
    );
  },
};

const sides: DrawerSide[] = ["left", "right", "bottom", "top"];

export const Sides: Story = {
  name: "Sides",
  render: function SidesStory() {
    const [open, setOpen] = useState<DrawerSide | null>(null);
    return (
      <div className="flex min-h-[100vh] w-full flex-col items-center justify-center gap-8 p-20">
        <div className="flex flex-wrap justify-center gap-8">
          {sides.map((side) => (
            <Button
              key={side}
              variant="secondary"
              onClick={() => setOpen(side)}
            >
              Open {side}
            </Button>
          ))}
        </div>
        {sides.map((side) => (
          <Drawer
            key={side}
            open={open === side}
            onClose={() => setOpen(null)}
            side={side}
            title={`Side: ${side}`}
            description="Width or max-height follows the size token for this anchor."
            footer={
              <Button variant="primary" onClick={() => setOpen(null)}>
                Close
              </Button>
            }
          >
            <p className="m-0 text-[length:var(--font-body-sm-size)] leading-[var(--font-body-sm-line)] text-[color:var(--color-text-primary)]">
              Edge-anchored panel — compare slide direction per side.
            </p>
          </Drawer>
        ))}
      </div>
    );
  },
};

export const SizesRight: Story = {
  name: "Sizes (right)",
  render: function SizesRightStory() {
    const [open, setOpen] = useState<
      "sm" | "md" | "lg" | "full" | null
    >(null);
    const sizes = ["sm", "md", "lg", "full"] as const;
    return (
      <div className="flex min-h-[100vh] w-full flex-col items-center justify-center gap-8 p-20">
        <div className="flex flex-wrap justify-center gap-8">
          {sizes.map((size) => (
            <Button
              key={size}
              variant="secondary"
              onClick={() => setOpen(size)}
            >
              Open {size}
            </Button>
          ))}
        </div>
        {sizes.map((size) => (
          <Drawer
            key={size}
            open={open === size}
            onClose={() => setOpen(null)}
            side="right"
            size={size}
            title={`Width: ${size}`}
            footer={
              <Button variant="primary" onClick={() => setOpen(null)}>
                Close
              </Button>
            }
          >
            <p className="m-0 text-[length:var(--font-body-sm-size)] leading-[var(--font-body-sm-line)] text-[color:var(--color-text-primary)]">
              Left/right drawers use fixed widths; bottom/top use max-height.
            </p>
          </Drawer>
        ))}
      </div>
    );
  },
};
