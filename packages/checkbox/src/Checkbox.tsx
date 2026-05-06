'use client';

import React, { useRef, useEffect } from 'react';
import clsx from 'clsx';

export type CheckboxSize = 'sm' | 'md' | 'lg';

export interface CheckboxProps {
  checked:        boolean;
  onChange:       (checked: boolean) => void;
  label?:         string;
  description?:   string;
  size?:          CheckboxSize;
  indeterminate?: boolean;
  disabled?:      boolean;
  error?:         boolean;
  className?:     string;
}

export function Checkbox({
  checked,
  onChange,
  label,
  description,
  size          = 'md',
  indeterminate = false,
  disabled      = false,
  error         = false,
  className,
}: CheckboxProps) {
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (inputRef.current) {
      inputRef.current.indeterminate = indeterminate;
    }
  }, [indeterminate]);

  return (
    <label
      className={clsx(
        'acko-checkbox',
        `acko-checkbox-${size}`,
        checked       && 'acko-checkbox-checked',
        indeterminate && 'acko-checkbox-indeterminate',
        disabled      && 'acko-checkbox-disabled',
        error         && 'acko-checkbox-error',
        className,
      )}
    >
      <input
        ref={inputRef}
        className="acko-checkbox-native"
        type="checkbox"
        checked={checked}
        disabled={disabled}
        aria-invalid={error || undefined}
        aria-checked={indeterminate ? 'mixed' : checked}
        onChange={(e) => onChange(e.target.checked)}
      />
      <span className="acko-checkbox-box" aria-hidden="true">
        {(checked || indeterminate) && (
          <svg
            className="acko-checkbox-icon"
            viewBox="0 0 12 12"
            fill="none"
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="1.5"
            aria-hidden="true"
          >
            {indeterminate
              ? <line x1="2" y1="6" x2="10" y2="6" stroke="currentColor" />
              : <path d="M2,6 L5,9 L10,3" stroke="currentColor" />
            }
          </svg>
        )}
      </span>
      {(label || description) && (
        <span className="acko-checkbox-content">
          {label       && <span className="acko-checkbox-label">{label}</span>}
          {description && <span className="acko-checkbox-description">{description}</span>}
        </span>
      )}
    </label>
  );
}
