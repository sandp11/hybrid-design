'use client';

import clsx from 'clsx';
import {
  useEffect,
  useId,
  useRef,
  type ReactNode,
} from 'react';

export type DrawerSide = 'left' | 'right' | 'bottom' | 'top';

export interface DrawerProps {
  open: boolean;
  onClose: () => void;
  side?: DrawerSide;
  size?: 'sm' | 'md' | 'lg' | 'full';
  title?: string;
  description?: string;
  dismissible?: boolean;
  children: ReactNode;
  footer?: ReactNode;
  className?: string;
}

function IconClose() {
  return (
    <svg
      width="18"
      height="18"
      viewBox="0 0 24 24"
      fill="none"
      aria-hidden="true"
      focusable="false"
    >
      <path
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        d="M18 6L6 18M6 6l12 12"
      />
    </svg>
  );
}

export function Drawer({
  open,
  onClose,
  side = 'right',
  size = 'md',
  title,
  description,
  dismissible = true,
  children,
  footer,
  className,
}: DrawerProps) {
  const titleId = useId();
  const descId = useId();
  const panelRef = useRef<HTMLDivElement>(null);
  const previousFocusRef = useRef<HTMLElement | null>(null);

  // Body scroll lock + focus management
  useEffect(() => {
    if (!open) return;

    previousFocusRef.current = document.activeElement as HTMLElement;
    const prev = document.body.style.overflow;
    document.body.style.overflow = 'hidden';

    const frame = requestAnimationFrame(() => {
      const focusable = panelRef.current?.querySelector<HTMLElement>(
        'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])',
      );
      focusable?.focus();
    });

    return () => {
      cancelAnimationFrame(frame);
      document.body.style.overflow = prev;
      previousFocusRef.current?.focus();
    };
  }, [open]);

  // Escape key
  useEffect(() => {
    if (!open || !dismissible) return;
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [open, dismissible, onClose]);

  const hasHeading = title != null || description != null;

  return (
    // Root shell — always in DOM, visibility toggled via class
    <div className={clsx('acko-drawer-root', open && 'acko-drawer-open')}>

      {/* Backdrop */}
      <div
        className="acko-drawer-backdrop"
        aria-hidden="true"
        onClick={dismissible ? onClose : undefined}
      />

      {/* Panel */}
      <div
        ref={panelRef}
        className={clsx(
          'acko-drawer',
          `acko-drawer-${side}`,
          `acko-drawer-size-${size}`,
          className,
        )}
        role="dialog"
        aria-modal="true"
        aria-labelledby={title ? titleId : undefined}
        aria-describedby={description ? descId : undefined}
      >
        {/* Header */}
        {hasHeading && (
          <div className="acko-drawer-header">
            <div className="acko-drawer-heading">
              {title != null && (
                <h2 id={titleId} className="acko-drawer-title">
                  {title}
                </h2>
              )}
              {description != null && (
                <p id={descId} className="acko-drawer-description">
                  {description}
                </p>
              )}
            </div>
            <button
              type="button"
              className="acko-drawer-close"
              aria-label="Close drawer"
              onClick={onClose}
            >
              <IconClose />
            </button>
          </div>
        )}

        {/* Body */}
        <div className="acko-drawer-body">{children}</div>

        {/* Footer */}
        {footer != null && (
          <div className="acko-drawer-footer">{footer}</div>
        )}
      </div>
    </div>
  );
}
