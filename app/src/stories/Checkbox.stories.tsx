import type { Meta, StoryObj } from "@storybook/react";
import { useState } from "react";
import { Alert } from "@acko/alert";
import { Checkbox, CheckboxGroup, CheckboxRow } from "@acko/checkbox";

const meta = {
  title: "Components/Checkbox",
  component: Checkbox,
  tags: ["autodocs"],
  args: {
    checked: false,
    size: "md" as const,
    disabled: false,
    error: false,
    indeterminate: false,
    label: "Accept terms and conditions",
  },
  argTypes: {
    size: {
      control: "select",
      options: ["sm", "md", "lg"],
    },
  },
} satisfies Meta<typeof Checkbox>;

export default meta;

type Story = StoryObj<typeof meta>;

export const AtomControlled: Story = {
  name: "Atom — interactive",
  render: function AtomInteractive(args) {
    const [checked, setChecked] = useState(args.checked ?? false);
    return (
      <Checkbox
        {...args}
        checked={checked}
        onChange={setChecked}
      />
    );
  },
};

export const WithDescription: Story = {
  name: "Atom — with description",
  render: function WithDescription(args) {
    const [checked, setChecked] = useState(false);
    return (
      <Checkbox
        {...args}
        checked={checked}
        onChange={setChecked}
        label="Marketing emails"
        description="Occasional product news. Unsubscribe anytime."
      />
    );
  },
};

export const AtomSizes: Story = {
  name: "Atom — sizes",
  render: () => {
    const [a, setA] = useState(false);
    const [b, setB] = useState(true);
    const [c, setC] = useState(false);
    return (
      <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
        <Checkbox checked={a} onChange={setA} size="sm" label="Small" />
        <Checkbox checked={b} onChange={setB} size="md" label="Medium" />
        <Checkbox checked={c} onChange={setC} size="lg" label="Large" />
      </div>
    );
  },
};

export const AtomStates: Story = {
  name: "Atom — disabled & error",
  render: () => (
    <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
      <Checkbox checked={false} onChange={() => {}} disabled label="Disabled unchecked" />
      <Checkbox checked={true} onChange={() => {}} disabled label="Disabled checked" />
      <Checkbox checked={false} onChange={() => {}} error label="Error state" />
    </div>
  ),
};

export const AtomIndeterminate: Story = {
  name: "Atom — indeterminate",
  render: function IndeterminateDemo() {
    const [checked, setChecked] = useState(false);
    const [indeterminate, setIndeterminate] = useState(true);
    return (
      <Checkbox
        checked={checked}
        indeterminate={indeterminate}
        onChange={(next) => {
          setIndeterminate(false);
          setChecked(next);
        }}
        label="Mixed until first interaction"
      />
    );
  },
};

export const RowDefault: Story = {
  name: "CheckboxRow",
  render: function RowDemo() {
    const [a, setA] = useState(false);
    const [b, setB] = useState(true);
    return (
      <div style={{ maxWidth: 420, border: "1px solid var(--color-border, #e0e0e0)", borderRadius: 8 }}>
        <CheckboxRow
          label="Push notifications"
          description="Alerts on this device only."
          checked={a}
          onChange={setA}
        />
        <CheckboxRow label="Title only row" checked={b} onChange={setB} />
      </div>
    );
  },
};

export const GroupDefault: Story = {
  name: "CheckboxGroup",
  render: function GroupDemo() {
    const [value, setValue] = useState<string[]>(["features"]);
    return (
      <CheckboxGroup
        label="Included coverage"
        options={[
          { value: "features", label: "Roadside assistance", description: "Towing and battery jump-start." },
          { value: "rental", label: "Rental car", description: "Up to 7 days replacement." },
          { value: "glass", label: "Glass repair only" },
        ]}
        value={value}
        onChange={setValue}
      />
    );
  },
};

export const AlertWithCheckboxGroup: Story = {
  name: "With Alert (composition)",
  render: function AlertWithGroup() {
    const [value, setValue] = useState<string[]>([]);
    return (
      <div style={{ display: "flex", flexDirection: "column", gap: 20, width: "100%", maxWidth: 440 }}>
        <Alert variant="info" title="Choose add-ons" dismissible onDismiss={() => {}}>
          Select any options below. Pricing updates when you continue.
        </Alert>
        <CheckboxGroup
          label="Optional extras"
          options={[
            { value: "a", label: "Extra A", description: "Short description." },
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
