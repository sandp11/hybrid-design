'use client';

import clsx from 'clsx';
import {
  useEffect,
  useId,
  useRef,
  type ReactNode,
} from 'react';
import ReactDOM from 'react-dom';

export interface DialogProps {
  open: boolean;
  onClose: () => void;
  title?: string;
  description?: string;
  size?: 'sm' | 'md' | 'lg' | 'xl' | 'full';
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

export function Dialog({
  open,
  onClose,
  title,
  description,
  size = 'md',
  dismissible = true,
  children,
  footer,
  className,
}: DialogProps) {
  const titleId = useId();
  const descId = useId();
  const panelRef = useRef<HTMLDivElement>(null);
  const previousFocusRef = useRef<HTMLElement | null>(null);

  // Body scroll lock + focus management
  useEffect(() => {
    if (!open) return;

    // Store previously focused element
    previousFocusRef.current = document.activeElement as HTMLElement;

    // Lock body scroll
    const prev = document.body.style.overflow;
    document.body.style.overflow = 'hidden';

    // Move focus into dialog
    const frame = requestAnimationFrame(() => {
      const focusable = panelRef.current?.querySelector<HTMLElement>(
        'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])',
      );
      focusable?.focus();
    });

    return () => {
      cancelAnimationFrame(frame);
      document.body.style.overflow = prev;
      // Restore focus on close
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

  if (!open) return null;

  const sizeClass = size === 'md' ? 'acko-dialog-md'
    : size === 'sm' ? 'acko-dialog-sm'
    : size === 'lg' ? 'acko-dialog-lg'
    : size === 'xl' ? 'acko-dialog-xl'
    : size === 'full' ? 'acko-dialog-full'
    : 'acko-dialog-md';

  return ReactDOM.createPortal(
    <>
      {/* Backdrop */}
      <div
        className="acko-dialog-backdrop"
        aria-hidden="true"
        onClick={dismissible ? onClose : undefined}
      />

      {/* Panel */}
      <div
        ref={panelRef}
        className={clsx('acko-dialog', sizeClass, className)}
        role="dialog"
        aria-modal="true"
        aria-labelledby={title ? titleId : undefined}
        aria-describedby={description ? descId : undefined}
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        {(title != null) && (
          <div className="acko-dialog-header">
            <h2 id={titleId} className="acko-dialog-title">
              {title}
            </h2>
            <button
              type="button"
              className="acko-dialog-close"
              aria-label="Close dialog"
              onClick={onClose}
            >
              <IconClose />
            </button>
          </div>
        )}

        {/* Description */}
        {description != null && (
          <p id={descId} className="acko-dialog-description">
            {description}
          </p>
        )}

        {/* Body */}
        <div className="acko-dialog-body">{children}</div>

        {/* Footer */}
        {footer != null && (
          <div className="acko-dialog-footer">{footer}</div>
        )}
      </div>
    </>,
    document.body,
  );
}
