import clsx from 'clsx';
import { forwardRef, type HTMLAttributes, type ReactNode } from 'react';

export interface CardProps extends HTMLAttributes<HTMLDivElement> {
  variant?: 'default' | 'secondary' | 'elevated' | 'outline' | 'demoted';
  padding?: 'none' | 'sm' | 'md' | 'lg';
  children: ReactNode;
  className?: string;
}

export interface CardHeaderProps extends HTMLAttributes<HTMLDivElement> {
  children: ReactNode;
  className?: string;
}

export interface CardContentProps extends HTMLAttributes<HTMLDivElement> {
  children: ReactNode;
  className?: string;
}

export interface CardFooterProps extends HTMLAttributes<HTMLDivElement> {
  children: ReactNode;
  className?: string;
}

export interface CardInsetProps extends HTMLAttributes<HTMLDivElement> {
  children: ReactNode;
  className?: string;
}

export const Card = forwardRef<HTMLDivElement, CardProps>(
  ({ variant = 'default', padding = 'lg', className, children, ...rest }, ref) => (
    <div
      ref={ref}
      className={clsx('acko-card', `acko-card-${variant}`, `acko-card-pad-${padding}`, className)}
      {...rest}
    >
      {children}
    </div>
  ),
);
Card.displayName = 'Card';

export const CardHeader = forwardRef<HTMLDivElement, CardHeaderProps>(
  ({ className, children, ...rest }, ref) => (
    <div ref={ref} className={clsx('acko-card-header', className)} {...rest}>
      {children}
    </div>
  ),
);
CardHeader.displayName = 'CardHeader';

export const CardContent = forwardRef<HTMLDivElement, CardContentProps>(
  ({ className, children, ...rest }, ref) => (
    <div ref={ref} className={clsx('acko-card-content', className)} {...rest}>
      {children}
    </div>
  ),
);
CardContent.displayName = 'CardContent';

export const CardFooter = forwardRef<HTMLDivElement, CardFooterProps>(
  ({ className, children, ...rest }, ref) => (
    <div ref={ref} className={clsx('acko-card-footer', className)} {...rest}>
      {children}
    </div>
  ),
);
CardFooter.displayName = 'CardFooter';

export const CardInset = forwardRef<HTMLDivElement, CardInsetProps>(
  ({ className, children, ...rest }, ref) => (
    <div ref={ref} className={clsx('acko-card-inset', className)} {...rest}>
      {children}
    </div>
  ),
);
CardInset.displayName = 'CardInset';
