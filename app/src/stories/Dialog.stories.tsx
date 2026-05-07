import type { Meta, StoryObj } from "@storybook/react";
import { useState } from "react";
import { Dialog } from "@acko/dialog";
import { Button } from "@acko/button";

const meta = {
  title: "Components/Dialog",
  component: Dialog,
  tags: ["autodocs"],
  parameters: {
    layout: "centered",
  },
  args: {
    open: false,
    title: "Dialog title",
    description:
      "Supporting copy uses the description slot. Keep it short for modal context.",
    size: "md" as const,
    dismissible: true,
  },
  argTypes: {
    size: {
      control: "select",
      options: ["sm", "md", "lg", "xl", "full"],
    },
  },
} satisfies Meta<typeof Dialog>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Playground: Story = {
  render: function PlaygroundStory(args) {
    const [open, setOpen] = useState(false);
    return (
      <div className="flex flex-col items-center gap-4">
        <Button variant="primary" onClick={() => setOpen(true)}>
          Open dialog
        </Button>
        <Dialog
          {...args}
          open={open}
          onClose={() => setOpen(false)}
          footer={
            <div className="flex flex-wrap justify-end gap-8">
              <Button variant="secondary" onClick={() => setOpen(false)}>
                Cancel
              </Button>
              <Button variant="primary" onClick={() => setOpen(false)}>
                Confirm
              </Button>
            </div>
          }
        >
          <p className="m-0 text-[length:var(--font-body-sm-size)] leading-[var(--font-body-sm-line)] text-[color:var(--color-text-primary)]">
            Body content: forms, lists, or any markup. Scroll when content is
            long.
          </p>
        </Dialog>
      </div>
    );
  },
};

export const Sizes: Story = {
  name: "Sizes",
  render: function SizesStory() {
    const [openSize, setOpenSize] = useState<
      "sm" | "md" | "lg" | "xl" | "full" | null
    >(null);
    const sizes = ["sm", "md", "lg", "xl", "full"] as const;
    return (
      <div className="flex flex-col gap-8">
        <div className="flex flex-wrap gap-8">
          {sizes.map((size) => (
            <Button
              key={size}
              variant="secondary"
              onClick={() => setOpenSize(size)}
            >
              Open {size}
            </Button>
          ))}
        </div>
        {sizes.map((size) => (
          <Dialog
            key={size}
            open={openSize === size}
            onClose={() => setOpenSize(null)}
            title={`Size: ${size}`}
            description="Max width follows the design scale for this token."
            size={size}
            footer={
              <Button variant="primary" onClick={() => setOpenSize(null)}>
                Close
              </Button>
            }
          >
            <p className="m-0 text-[length:var(--font-body-sm-size)] leading-[var(--font-body-sm-line)] text-[color:var(--color-text-primary)]">
              Panel width token <code className="tabular-nums">{size}</code>.
            </p>
          </Dialog>
        ))}
      </div>
    );
  },
};

export const NonDismissible: Story = {
  name: "Non-dismissible",
  render: function NonDismissibleStory() {
    const [open, setOpen] = useState(false);
    return (
      <div className="flex flex-col items-center gap-4">
        <Button variant="primary" onClick={() => setOpen(true)}>
          Open (backdrop tap disabled)
        </Button>
        <Dialog
          open={open}
          onClose={() => setOpen(false)}
          dismissible={false}
          title="Confirm action"
          description="Backdrop click is disabled. Use the header close control or the primary action to exit."
          footer={
            <Button variant="primary" onClick={() => setOpen(false)}>
              I understand
            </Button>
          }
        >
          <p className="m-0 text-[length:var(--font-body-sm-size)] leading-[var(--font-body-sm-line)] text-[color:var(--color-text-primary)]">
            Use for destructive or billing flows where accidental dismiss is
            costly.
          </p>
        </Dialog>
      </div>
    );
  },
};
