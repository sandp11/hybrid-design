import type { CalendarValue, DateRange } from './types';

export function startOfDay(d: Date): Date {
  const x = new Date(d);
  x.setHours(0, 0, 0, 0);
  return x;
}

export function isSameDay(a: Date, b: Date): boolean {
  return startOfDay(a).getTime() === startOfDay(b).getTime();
}

export function compareDay(a: Date, b: Date): number {
  return startOfDay(a).getTime() - startOfDay(b).getTime();
}

export function normalizeRange(a: Date, b: Date): [Date, Date] {
  const sa = startOfDay(a);
  const sb = startOfDay(b);
  return sa <= sb ? [sa, sb] : [sb, sa];
}

export function daysInMonth(year: number, monthIndex: number): number {
  return new Date(year, monthIndex + 1, 0).getDate();
}

export interface MonthCell {
  date: Date;
  outside: boolean;
}

export function buildMonthMatrix(cursorMonth: Date): MonthCell[] {
  const year = cursorMonth.getFullYear();
  const month = cursorMonth.getMonth();
  const first = new Date(year, month, 1);
  const startWeekday = first.getDay();
  const dim = daysInMonth(year, month);
  const cells: MonthCell[] = [];
  const prevMonthLast = new Date(year, month, 0);
  const prevDim = prevMonthLast.getDate();
  for (let i = 0; i < startWeekday; i++) {
    const dayNum = prevDim - startWeekday + i + 1;
    cells.push({ date: new Date(year, month - 1, dayNum), outside: true });
  }
  for (let d = 1; d <= dim; d++) {
    cells.push({ date: new Date(year, month, d), outside: false });
  }
  let nextDay = 1;
  while (cells.length < 42) {
    cells.push({ date: new Date(year, month + 1, nextDay++), outside: true });
  }
  return cells;
}

export function chunk<T>(arr: T[], size: number): T[][] {
  const out: T[][] = [];
  for (let i = 0; i < arr.length; i += size) {
    out.push(arr.slice(i, i + size));
  }
  return out;
}

export function weekdayLabels(locale: string): string[] {
  const fmt = new Intl.DateTimeFormat(locale, { weekday: 'short' });
  const base = new Date(2023, 0, 1);
  const labels: string[] = [];
  for (let i = 0; i < 7; i++) {
    const d = new Date(base);
    d.setDate(base.getDate() + i);
    labels.push(fmt.format(d));
  }
  return labels;
}

export function isDisabledDay(
  date: Date,
  minDate?: Date,
  maxDate?: Date,
  disabledDates?: Date[],
): boolean {
  const d = startOfDay(date);
  if (minDate && compareDay(d, startOfDay(minDate)) < 0) return true;
  if (maxDate && compareDay(d, startOfDay(maxDate)) > 0) return true;
  if (disabledDates?.some((x) => isSameDay(x, date))) return true;
  return false;
}

export function monthNames(locale: string): string[] {
  const fmt = new Intl.DateTimeFormat(locale, { month: 'short' });
  const out: string[] = [];
  for (let m = 0; m < 12; m++) {
    out.push(fmt.format(new Date(2020, m, 1)));
  }
  return out;
}

export function initialCursor(value: CalendarValue, variant: 'single' | 'range' | 'multi'): Date {
  const today = startOfDay(new Date());
  if (variant === 'single') {
    const d = value as Date;
    return d && !Number.isNaN(d.getTime()) ? startOfDay(d) : today;
  }
  if (variant === 'range') {
    const r = value as DateRange;
    return r?.start && !Number.isNaN(r.start.getTime()) ? startOfDay(r.start) : today;
  }
  const arr = value as Date[];
  if (arr?.length) {
    const sorted = [...arr].sort((a, b) => compareDay(a, b));
    return startOfDay(sorted[sorted.length - 1]);
  }
  return today;
}
