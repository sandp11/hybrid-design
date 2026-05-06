import type { Meta, StoryObj } from "@storybook/react";
import { useState } from "react";
import { Calendar } from "@acko/calendar";
import type { DateRange } from "@acko/calendar";

const meta = {
  title: "Components/Calendar",
  parameters: {
    layout: "centered",
  },
  tags: ["autodocs"],
} satisfies Meta;

export default meta;

type Story = StoryObj<typeof meta>;

export const SingleInline: Story = {
  name: "Single · inline",
  render: function SingleInlineStory() {
    const [value, setValue] = useState(() => new Date());
    return (
      <Calendar
        display="inline"
        variant="single"
        value={value}
        onChange={(v) => setValue(v as Date)}
      />
    );
  },
};

export const SingleDropdown: Story = {
  name: "Single · dropdown",
  render: function SingleDropdownStory() {
    const [value, setValue] = useState(() => new Date());
    return (
      <div style={{ width: 360 }}>
        <Calendar
          display="dropdown"
          variant="single"
          value={value}
          onChange={(v) => setValue(v as Date)}
        />
      </div>
    );
  },
};

export const RangeInline: Story = {
  name: "Range · inline",
  render: function RangeInlineStory() {
    const [value, setValue] = useState<DateRange>(() => {
      const d = new Date();
      return { start: d, end: d };
    });
    return (
      <Calendar
        display="inline"
        variant="range"
        value={value}
        onChange={(v) => setValue(v as DateRange)}
      />
    );
  },
};

export const MultiInline: Story = {
  name: "Multi · inline",
  render: function MultiInlineStory() {
    const [value, setValue] = useState<Date[]>([]);
    return (
      <Calendar
        display="inline"
        variant="multi"
        value={value}
        onChange={(v) => setValue(v as Date[])}
      />
    );
  },
};

export const WithBounds: Story = {
  name: "Min / max dates",
  render: function WithBoundsStory() {
    const [value, setValue] = useState(() => new Date());
    const min = new Date();
    min.setMonth(min.getMonth() - 1);
    const max = new Date();
    max.setMonth(max.getMonth() + 2);
    return (
      <Calendar
        display="inline"
        variant="single"
        value={value}
        onChange={(v) => setValue(v as Date)}
        minDate={min}
        maxDate={max}
      />
    );
  },
};
