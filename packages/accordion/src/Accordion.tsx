"use client";

import { clsx } from "clsx";
import {
  forwardRef,
  useCallback,
  useLayoutEffect,
  useRef,
  useState,
  type ReactNode,
} from "react";

export interface AccordionItem {
  value: string;
  trigger: ReactNode;
  content: ReactNode;
  disabled?: boolean;
}

export interface AccordionProps {
  type: "single" | "multiple";
  items: AccordionItem[];
  defaultValue?: string | string[];
  collapsible?: boolean;
  className?: string;
}

function safeId(value: string): string {
  return value.replace(/[^a-zA-Z0-9_-]/g, "-");
}

function initialOpenSet(
  type: AccordionProps["type"],
  defaultValue?: string | string[],
): Set<string> {
  if (defaultValue === undefined) {
    return new Set();
  }
  if (type === "single") {
    if (typeof defaultValue === "string") {
      return new Set(defaultValue ? [defaultValue] : []);
    }
    if (Array.isArray(defaultValue) && defaultValue.length > 0) {
      return new Set([defaultValue[0]]);
    }
    return new Set();
  }
  if (Array.isArray(defaultValue)) {
    return new Set(defaultValue);
  }
  if (typeof defaultValue === "string") {
    return new Set([defaultValue]);
  }
  return new Set();
}

function ChevronDownIcon() {
  return (
    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <path
        d="M6 9l6 6 6-6"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  );
}

interface PanelProps {
  itemValue: string;
  open: boolean;
  children: ReactNode;
}

function AccordionPanel({ itemValue, open, children }: PanelProps) {
  const innerRef = useRef<HTMLDivElement>(null);
  const [maxPx, setMaxPx] = useState(0);

  const measure = useCallback(() => {
    const el = innerRef.current;
    if (!el) return;
    setMaxPx(open ? el.scrollHeight : 0);
  }, [open]);

  useLayoutEffect(() => {
    measure();
  }, [measure, children, open]);

  useLayoutEffect(() => {
    if (!open) return;
    const el = innerRef.current;
    if (!el || typeof ResizeObserver === "undefined") return;
    const ro = new ResizeObserver(() => {
      setMaxPx(el.scrollHeight);
    });
    ro.observe(el);
    return () => ro.disconnect();
  }, [open]);

  return (
    <div
      className="acko-accordion-content-wrapper"
      data-state={open ? "open" : "closed"}
      id={`accordion-content-${safeId(itemValue)}`}
      role="region"
      aria-labelledby={`accordion-trigger-${safeId(itemValue)}`}
      style={{ maxHeight: maxPx }}
    >
      <div ref={innerRef} className="acko-accordion-content">
        {children}
      </div>
    </div>
  );
}

export const Accordion = forwardRef<HTMLDivElement, AccordionProps>(
  function Accordion(
    {
      type,
      items,
      defaultValue,
      collapsible = true,
      className,
    },
    ref,
  ) {
    const [openSet, setOpenSet] = useState(() =>
      initialOpenSet(type, defaultValue),
    );

    const toggle = useCallback(
      (value: string, disabled?: boolean) => {
        if (disabled) return;

        setOpenSet((prev) => {
          const next = new Set(prev);

          if (type === "multiple") {
            if (next.has(value)) {
              next.delete(value);
            } else {
              next.add(value);
            }
            return next;
          }

          // single
          if (next.has(value)) {
            if (collapsible) {
              next.delete(value);
            }
            return next;
          }

          next.clear();
          next.add(value);
          return next;
        });
      },
      [type, collapsible],
    );

    return (
      <div ref={ref} className={clsx("acko-accordion", className)}>
        {items.map((item) => {
          const open = openSet.has(item.value);
          const sid = safeId(item.value);
          const disabled = Boolean(item.disabled);

          return (
            <div
              key={item.value}
              className={clsx(
                "acko-accordion-item",
                disabled && "acko-accordion-item-disabled",
              )}
              data-state={open ? "open" : "closed"}
            >
              <button
                type="button"
                id={`accordion-trigger-${sid}`}
                className="acko-accordion-trigger"
                aria-expanded={open}
                aria-controls={`accordion-content-${sid}`}
                disabled={disabled}
                onClick={() => toggle(item.value, disabled)}
              >
                <span className="acko-accordion-trigger-slot">{item.trigger}</span>
                <span
                  className={clsx(
                    "acko-accordion-chevron",
                    open && "acko-accordion-chevron-open",
                  )}
                  aria-hidden="true"
                >
                  <ChevronDownIcon />
                </span>
              </button>
              <AccordionPanel itemValue={item.value} open={open}>
                {item.content}
              </AccordionPanel>
            </div>
          );
        })}
      </div>
    );
  },
);
