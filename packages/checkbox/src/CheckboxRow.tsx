'use client';

import React, { useRef, useEffect } from 'react';
import clsx from 'clsx';

export interface CheckboxRowOption {
  value:        string;
  label:        string;
  description?: string;
}

export interface CheckboxRowProps {
  label:          string;
  checked:        boolean;
  onChange:       (checked: boolean) => void;
  description?:   string;
  indeterminate?: boolean;
  error?:         boolean;
  className?:     string;
}

export interface CheckboxGroupProps {
  label:      string;
  options:    CheckboxRowOption[];
  value:      string[];
  onChange:   (value: string[]) => void;
  error?:     boolean;
  className?: string;
}

export function CheckboxRow({
  label,
  checked,
  onChange,
  description,
  indeterminate = false,
  error         = false,
  className,
}: CheckboxRowProps) {
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (inputRef.current) {
      inputRef.current.indeterminate = indeterminate;
    }
  }, [indeterminate]);

  return (
    <label
      className={clsx(
        'acko-cb-row',
        checked       && 'acko-cb-row-checked',
        indeterminate && 'acko-cb-row-indeterminate',
        error         && 'acko-cb-row-error',
        className,
      )}
    >
      <input
        ref={inputRef}
        className="acko-checkbox-native"
        type="checkbox"
        checked={checked}
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
      <span className="acko-cb-row-content">
        <span className="acko-cb-row-label">{label}</span>
        {description && (
          <span className="acko-cb-row-description">{description}</span>
        )}
      </span>
    </label>
  );
}

export function CheckboxGroup({
  label,
  options,
  value,
  onChange,
  error     = false,
  className,
}: CheckboxGroupProps) {
  const toggle = (optValue: string) => {
    if (value.includes(optValue)) {
      onChange(value.filter((v) => v !== optValue));
    } else {
      onChange([...value, optValue]);
    }
  };

  return (
    <div className={clsx('acko-cb-list', className)}>
      <span className="acko-cb-list-label">{label}</span>
      {options.map((opt) => (
        <CheckboxRow
          key={opt.value}
          label={opt.label}
          description={opt.description}
          checked={value.includes(opt.value)}
          error={error}
          onChange={() => toggle(opt.value)}
        />
      ))}
    </div>
  );
}
