import type { HTMLAttributes } from 'react';

export interface DateRange {
  start: Date;
  end: Date;
}

export type CalendarValue = Date | DateRange | Date[];

export interface CalendarProps
  extends Omit<HTMLAttributes<HTMLDivElement>, 'value' | 'onChange' | 'defaultValue'> {
  variant?: 'single' | 'range' | 'multi';
  display?: 'inline' | 'dropdown';
  value: CalendarValue;
  onChange: (value: CalendarValue) => void;
  minDate?: Date;
  maxDate?: Date;
  disabledDates?: Date[];
  locale?: string;
  className?: string;
}
