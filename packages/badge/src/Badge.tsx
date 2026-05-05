import { type ReactNode } from "react";
import { clsx } from "clsx";

export type BadgeTextCase = "uppercase" | "sentence";

export interface BadgeProps {
  variant?: "solid" | "outline" | "dot";
  color?: "purple" | "green" | "blue" | "orange" | "pink" | "gray";
  textCase?: BadgeTextCase;
  removable?: boolean;
  onRemove?: () => void;
  className?: string;
  children: ReactNode;
}

export interface CounterBadgeProps {
  count: number;
  max?: number;
  color?: "purple" | "pink" | "blue";
  className?: string;
}

export function Badge({
  variant = "solid",
  color = "purple",
  textCase = "uppercase",
  removable = false,
  onRemove,
  className,
  children,
}: BadgeProps) {
  return (
    <span
      className={clsx(
        "acko-badge",
        `acko-badge-${variant}-${color}`,
        textCase === "uppercase"
          ? "acko-badge-uppercase"
          : "acko-badge-sentence-case",
        className
      )}
    >
      {variant === "dot" && (
        <span className="acko-badge-dot" aria-hidden="true" />
      )}
      {children}
      {removable && (
        <button
          className="acko-badge-remove"
          type="button"
          aria-label="Remove"
          onClick={onRemove}
        >
          <svg
            width="12"
            height="12"
            viewBox="0 0 12 12"
            fill="none"
            aria-hidden="true"
          >
            <path
              d="M1 1L11 11M11 1L1 11"
              stroke="currentColor"
              strokeWidth="1.5"
              strokeLinecap="round"
            />
          </svg>
        </button>
      )}
    </span>
  );
}

Badge.displayName = "Badge";

export function CounterBadge({
  count,
  max,
  color = "purple",
  className,
}: CounterBadgeProps) {
  const display = max !== undefined && count > max ? `${max}+` : String(count);
  return (
    <span
      className={clsx("acko-counter-badge", `acko-counter-badge-${color}`, className)}
    >
      {display}
    </span>
  );
}

CounterBadge.displayName = "CounterBadge";
