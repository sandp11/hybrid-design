'use client';

import clsx from 'clsx';
import {
  useCallback,
  useEffect,
  useMemo,
  useRef,
  useState,
} from 'react';
import {
  buildMonthMatrix,
  chunk,
  compareDay,
  initialCursor,
  isDisabledDay,
  isSameDay,
  monthNames,
  normalizeRange,
  startOfDay,
  weekdayLabels,
} from './calendar-utils';
import type { CalendarProps, CalendarValue, DateRange } from './types';

function addMonths(d: Date, delta: number): Date {
  const x = new Date(d);
  x.setMonth(x.getMonth() + delta);
  return x;
}

function addYears(d: Date, delta: number): Date {
  const x = new Date(d);
  x.setFullYear(x.getFullYear() + delta);
  return x;
}

function formatTriggerDisplay(
  variant: NonNullable<CalendarProps['variant']>,
  value: CalendarValue,
  locale: string,
): { text: string; placeholder: boolean } {
  if (variant === 'single') {
    const d = value as Date;
    if (!d || Number.isNaN(d.getTime())) return { text: 'Select date', placeholder: true };
    const fmt = new Intl.DateTimeFormat(locale, {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
    });
    return { text: fmt.format(d), placeholder: false };
  }
  if (variant === 'range') {
    const r = value as DateRange;
    if (!r?.start || Number.isNaN(r.start.getTime())) return { text: 'Select date', placeholder: true };
    const fs = new Intl.DateTimeFormat(locale, { day: 'numeric', month: 'short' });
    if (!r.end || isSameDay(r.start, r.end)) {
      return { text: fs.format(r.start), placeholder: false };
    }
    const fe = new Intl.DateTimeFormat(locale, {
      day: 'numeric',
      month: 'short',
      year: 'numeric',
    });
    return { text: `${fs.format(r.start)} — ${fe.format(r.end)}`, placeholder: false };
  }
  const arr = value as Date[];
  if (!arr?.length) return { text: 'Select date', placeholder: true };
  return { text: `${arr.length} dates selected`, placeholder: false };
}

function IconCalendar() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M8 7V5m8 2V5m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
      />
    </svg>
  );
}

function IconChevronLeft() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M15 18l-6-6 6-6"
      />
    </svg>
  );
}

function IconChevronRight() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M9 18l6-6-6-6"
      />
    </svg>
  );
}

type PanelView = 'days' | 'months' | 'years';
type RangePhase = 'idle' | 'need-end';

export function Calendar({
  variant = 'single',
  display = 'dropdown',
  value,
  onChange,
  minDate,
  maxDate,
  disabledDates,
  locale = 'en-IN',
  className,
  ...rest
}: CalendarProps) {
  const wrapperRef = useRef<HTMLDivElement>(null);
  const [open, setOpen] = useState(display === 'inline');
  const [panelView, setPanelView] = useState<PanelView>('days');
  const [cursorDate, setCursorDate] = useState(() => initialCursor(value, variant));
  const [yearPageStart, setYearPageStart] = useState(
    () => Math.floor(initialCursor(value, variant).getFullYear() / 12) * 12,
  );
  const [rangePhase, setRangePhase] = useState<RangePhase>('idle');
  const [hoverDate, setHoverDate] = useState<Date | null>(null);

  useEffect(() => {
    setCursorDate(initialCursor(value, variant));
  }, [value, variant]);

  useEffect(() => {
    if (variant !== 'range') {
      setRangePhase('idle');
      setHoverDate(null);
      return;
    }
    const r = value as DateRange;
    if (r?.start && r?.end && !isSameDay(r.start, r.end)) {
      setRangePhase('idle');
    }
  }, [variant, value]);

  useEffect(() => {
    if (!open || display !== 'dropdown') return;
    function handleDoc(e: MouseEvent) {
      if (!wrapperRef.current?.contains(e.target as Node)) {
        setOpen(false);
      }
    }
    document.addEventListener('mousedown', handleDoc, true);
    return () => document.removeEventListener('mousedown', handleDoc, true);
  }, [open, display]);

  useEffect(() => {
    function onKey(e: globalThis.KeyboardEvent) {
      if (e.key !== 'Escape') return;
      if (panelView === 'years') {
        setPanelView('months');
        return;
      }
      if (panelView === 'months') {
        setPanelView('days');
        return;
      }
      if (display === 'dropdown' && open) setOpen(false);
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [panelView, display, open]);

  const weekdays = useMemo(() => weekdayLabels(locale), [locale]);
  const months = useMemo(() => monthNames(locale), [locale]);
  const matrix = useMemo(() => buildMonthMatrix(cursorDate), [cursorDate]);

  const today = useMemo(() => startOfDay(new Date()), []);

  const triggerDisplay = useMemo(
    () => formatTriggerDisplay(variant, value, locale),
    [variant, value, locale],
  );

  const headerMainLabel = useMemo(() => {
    if (panelView === 'days') {
      return new Intl.DateTimeFormat(locale, { month: 'long', year: 'numeric' }).format(cursorDate);
    }
    if (panelView === 'months') {
      return String(cursorDate.getFullYear());
    }
    return `${yearPageStart} – ${yearPageStart + 11}`;
  }, [panelView, cursorDate, locale, yearPageStart]);

  const gridAriaLabel = useMemo(() => {
    if (panelView === 'days') {
      return new Intl.DateTimeFormat(locale, { month: 'long', year: 'numeric' }).format(cursorDate);
    }
    if (panelView === 'months') {
      return String(cursorDate.getFullYear());
    }
    return `${yearPageStart} – ${yearPageStart + 11}`;
  }, [panelView, cursorDate, locale, yearPageStart]);

  const headerDrillAria =
    panelView === 'days' ? 'Select month' : panelView === 'months' ? 'Select year' : 'Select year';

  const handlePrev = useCallback(() => {
    if (panelView === 'days') {
      setCursorDate((d) => addMonths(d, -1));
    } else if (panelView === 'months') {
      setCursorDate((d) => addYears(d, -1));
    } else {
      setYearPageStart((y) => y - 12);
    }
  }, [panelView]);

  const handleNext = useCallback(() => {
    if (panelView === 'days') {
      setCursorDate((d) => addMonths(d, 1));
    } else if (panelView === 'months') {
      setCursorDate((d) => addYears(d, 1));
    } else {
      setYearPageStart((y) => y + 12);
    }
  }, [panelView]);

  const handleHeaderClick = useCallback(() => {
    if (panelView === 'days') {
      setPanelView('months');
    } else if (panelView === 'months') {
      setYearPageStart(Math.floor(cursorDate.getFullYear() / 12) * 12);
      setPanelView('years');
    }
  }, [panelView, cursorDate]);

  const dayClassFor = useCallback(
    (date: Date, outside: boolean) => {
      const dis = isDisabledDay(date, minDate, maxDate, disabledDates);
      const classes: Record<string, boolean> = {
        'acko-cal-day': true,
        'acko-cal-outside': outside,
        'acko-cal-day-disabled': dis,
      };

      if (isSameDay(date, today)) {
        classes['acko-cal-today'] = true;
      }

      if (variant === 'single') {
        const sel = value as Date;
        if (sel && !Number.isNaN(sel.getTime()) && isSameDay(date, sel)) {
          classes['acko-cal-selected'] = true;
        }
        return clsx(classes);
      }

      if (variant === 'multi') {
        const arr = value as Date[];
        if (arr?.some((x) => isSameDay(x, date))) {
          classes['acko-cal-selected'] = true;
        }
        return clsx(classes);
      }

      const r = value as DateRange;
      const start = r?.start ? startOfDay(r.start) : today;
      const endBase = r?.end ? startOfDay(r.end) : start;
      let lo: Date;
      let hi: Date;
      if (rangePhase === 'need-end' && hoverDate) {
        [lo, hi] = normalizeRange(start, hoverDate);
      } else {
        [lo, hi] = normalizeRange(start, endBase);
      }

      if (compareDay(date, lo) < 0 || compareDay(date, hi) > 0) {
        return clsx(classes);
      }

      if (isSameDay(lo, hi)) {
        if (isSameDay(date, lo)) {
          classes['acko-cal-selected'] = true;
        }
      } else if (isSameDay(date, lo)) {
        classes['acko-cal-range-start'] = true;
      } else if (isSameDay(date, hi)) {
        classes['acko-cal-range-end'] = true;
      } else {
        classes['acko-cal-range-middle'] = true;
      }

      return clsx(classes);
    },
    [
      variant,
      value,
      minDate,
      maxDate,
      disabledDates,
      today,
      rangePhase,
      hoverDate,
    ],
  );

  const onDayClick = useCallback(
    (date: Date, outside: boolean) => {
      if (outside) return;
      if (isDisabledDay(date, minDate, maxDate, disabledDates)) return;

      if (variant === 'single') {
        onChange(startOfDay(date));
        if (display === 'dropdown') setOpen(false);
        return;
      }

      if (variant === 'multi') {
        const arr = [...(value as Date[])];
        const ix = arr.findIndex((x) => isSameDay(x, date));
        if (ix >= 0) arr.splice(ix, 1);
        else arr.push(startOfDay(date));
        onChange(arr);
        return;
      }

      const r = value as DateRange;
      const anchorStart = r?.start ? startOfDay(r.start) : startOfDay(date);

      if (rangePhase === 'idle') {
        const next: DateRange = { start: startOfDay(date), end: startOfDay(date) };
        onChange(next);
        setRangePhase('need-end');
        return;
      }

      const [lo, hi] = normalizeRange(anchorStart, date);
      onChange({ start: lo, end: hi });
      setRangePhase('idle');
      setHoverDate(null);
      if (display === 'dropdown') setOpen(false);
    },
    [
      variant,
      value,
      onChange,
      display,
      minDate,
      maxDate,
      disabledDates,
      rangePhase,
    ],
  );

  const panelBody = (
    <>
      <div className="acko-cal-header">
        <button type="button" className="acko-cal-nav-btn" aria-label="Previous" onClick={handlePrev}>
          <IconChevronLeft />
        </button>
        <button
          type="button"
          className="acko-cal-header-label"
          aria-label={headerDrillAria}
          onClick={handleHeaderClick}
        >
          {headerMainLabel}
        </button>
        <button type="button" className="acko-cal-nav-btn" aria-label="Next" onClick={handleNext}>
          <IconChevronRight />
        </button>
      </div>

      {panelView === 'days' && (
        <div role="grid" aria-label={gridAriaLabel} className="acko-cal-matrix">
          <div role="row" className="acko-cal-matrix-row acko-cal-weekdays-row">
            {weekdays.map((w) => (
              <div key={w} role="columnheader" className="acko-cal-weekday">
                {w}
              </div>
            ))}
          </div>
          {chunk(matrix, 7).map((row, ri) => (
            <div key={ri} role="row" className="acko-cal-matrix-row">
              {row.map((cell, ci) => {
                  const dis = isDisabledDay(cell.date, minDate, maxDate, disabledDates);
                  const tab = !cell.outside && !dis ? 0 : -1;

                  let ariaSel = false;
                  if (variant === 'single') {
                    const sel = value as Date;
                    ariaSel =
                      !!sel &&
                      !Number.isNaN(sel.getTime()) &&
                      isSameDay(cell.date, sel);
                  } else if (variant === 'multi') {
                    ariaSel = !!(value as Date[])?.some((x) => isSameDay(x, cell.date));
                  } else {
                    const r = value as DateRange;
                    const start = r?.start ? startOfDay(r.start) : today;
                    const endBase = r?.end ? startOfDay(r.end) : start;
                    let lo: Date;
                    let hi: Date;
                    if (rangePhase === 'need-end' && hoverDate) {
                      [lo, hi] = normalizeRange(start, hoverDate);
                    } else {
                      [lo, hi] = normalizeRange(start, endBase);
                    }
                    ariaSel =
                      compareDay(cell.date, lo) >= 0 && compareDay(cell.date, hi) <= 0;
                  }

                  const isTodayCell = isSameDay(cell.date, today);

                  return (
                    <button
                      key={`${ri}-${ci}`}
                      type="button"
                      role="gridcell"
                      tabIndex={tab}
                      aria-selected={ariaSel}
                      aria-current={isTodayCell ? 'date' : undefined}
                      disabled={dis}
                      className={dayClassFor(cell.date, cell.outside)}
                      onClick={() => onDayClick(cell.date, cell.outside)}
                      onMouseEnter={() => {
                        if (variant === 'range' && rangePhase === 'need-end') {
                          setHoverDate(startOfDay(cell.date));
                        }
                      }}
                    >
                      {cell.date.getDate()}
                    </button>
                  );
                })}
            </div>
          ))}
        </div>
      )}

      {panelView === 'months' && (
        <div role="grid" aria-label={gridAriaLabel} className="acko-cal-picker-grid">
          {months.map((label, mi) => {
            const selected = cursorDate.getMonth() === mi;
            const currentNow =
              new Date().getFullYear() === cursorDate.getFullYear() && new Date().getMonth() === mi;
            return (
              <button
                key={label}
                type="button"
                role="gridcell"
                className={clsx(
                  'acko-cal-picker-cell',
                  selected && 'acko-cal-picker-cell-selected',
                  currentNow && 'acko-cal-picker-cell-current',
                )}
                onClick={() => {
                  const next = new Date(cursorDate.getFullYear(), mi, 1);
                  setCursorDate(next);
                  setPanelView('days');
                }}
              >
                {label}
              </button>
            );
          })}
        </div>
      )}

      {panelView === 'years' && (
        <div role="grid" aria-label={gridAriaLabel} className="acko-cal-picker-grid">
          {Array.from({ length: 12 }, (_, i) => yearPageStart + i).map((year) => {
            const selected = cursorDate.getFullYear() === year;
            const currentNow = new Date().getFullYear() === year;
            return (
              <button
                key={year}
                type="button"
                role="gridcell"
                className={clsx(
                  'acko-cal-picker-cell',
                  selected && 'acko-cal-picker-cell-selected',
                  currentNow && 'acko-cal-picker-cell-current',
                )}
                onClick={() => {
                  const next = new Date(year, cursorDate.getMonth(), 1);
                  setCursorDate(next);
                  setPanelView('months');
                }}
              >
                {year}
              </button>
            );
          })}
        </div>
      )}
    </>
  );

  const panel = (
    <div
      className={clsx(
        'acko-cal-panel',
        display === 'dropdown' && 'acko-cal-panel-dropdown',
      )}
      onMouseLeave={() => {
        if (variant === 'range' && rangePhase === 'need-end') setHoverDate(null);
      }}
    >
      {panelBody}
    </div>
  );

  if (display === 'inline') {
    return (
      <div ref={wrapperRef} className={clsx('acko-cal', className)} {...rest}>
        {panel}
      </div>
    );
  }

  return (
    <div ref={wrapperRef} className={clsx('acko-cal-wrapper', className)} {...rest}>
      <button
        type="button"
        className={clsx(
          'acko-cal-trigger',
          open && 'acko-cal-trigger-open',
          triggerDisplay.placeholder && 'acko-cal-trigger-placeholder',
        )}
        aria-haspopup="dialog"
        aria-expanded={open}
        onClick={() => setOpen((o) => !o)}
      >
        <span className="acko-cal-trigger-icon">
          <IconCalendar />
        </span>
        <span>{triggerDisplay.text}</span>
      </button>
      {open && panel}
    </div>
  );
}
