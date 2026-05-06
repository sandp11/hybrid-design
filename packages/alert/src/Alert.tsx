"use client";

import { clsx } from "clsx";
import type { HTMLAttributes, ReactNode } from "react";

export interface AlertProps extends Omit<HTMLAttributes<HTMLDivElement>, "title"> {
  variant: "info" | "success" | "warning" | "error";
  title?: string;
  children: ReactNode;
  icon?: ReactNode;
  dismissible?: boolean;
  onDismiss?: () => void;
  className?: string;
}

const defaultIcons: Record<AlertProps["variant"], ReactNode> = {
  info: (
    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <circle cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="2" />
      <path
        d="M12 16v-4M12 8h.01"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
      />
    </svg>
  ),
  success: (
    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <circle cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="2" />
      <path
        d="M8 12l2.5 2.5L16 9"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  ),
  warning: (
    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <path
        d="M12 2L2 20h20L12 2z"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinejoin="round"
      />
      <path
        d="M12 9v4M12 17h.01"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
      />
    </svg>
  ),
  error: (
    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <circle cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="2" />
      <path
        d="M15 9l-6 6M9 9l6 6"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
      />
    </svg>
  ),
};

function DismissGlyph() {
  return (
    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <path
        d="M18 6L6 18M6 6l12 12"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
      />
    </svg>
  );
}

export function Alert({
  variant,
  title,
  children,
  icon,
  dismissible = false,
  onDismiss,
  className,
  ...rest
}: AlertProps) {
  return (
    <div
      role="alert"
      className={clsx(
        "acko-alert",
        "acko-alert-slide-up",
        `acko-alert-${variant}`,
        className
      )}
      {...rest}
    >
      <span className="acko-alert-icon">{icon ?? defaultIcons[variant]}</span>
      <div className="acko-alert-content">
        {title ? <div className="acko-alert-title">{title}</div> : null}
        <div className="acko-alert-body">{children}</div>
      </div>
      {dismissible ? (
        <button
          type="button"
          className="acko-alert-dismiss"
          aria-label="Dismiss alert"
          onClick={onDismiss}
        >
          <DismissGlyph />
        </button>
      ) : null}
    </div>
  );
}

Alert.displayName = "Alert";
