import React, { useState, useEffect } from 'react';
import clsx from 'clsx';

export type AvatarSize  = 'xs' | 'sm' | 'md' | 'lg' | 'xl';
export type AvatarShape = 'circle' | 'square';

export interface AvatarProps extends React.HTMLAttributes<HTMLDivElement> {
  src?:       string;
  alt?:       string;
  initials?:  string;
  size?:      AvatarSize;
  shape?:     AvatarShape;
  className?: string;
}

const iconSizes: Record<AvatarSize, number> = {
  xs: 12,
  sm: 16,
  md: 20,
  lg: 24,
  xl: 32,
};

function UserIcon({ size }: { size: number }) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="currentColor"
      aria-hidden="true"
    >
      <path d="M12 12c2.761 0 5-2.239 5-5s-2.239-5-5-5-5 2.239-5 5 2.239 5 5 5zm0 2c-3.333 0-10 1.667-10 5v1h20v-1c0-3.333-6.667-5-10-5z" />
    </svg>
  );
}

export function Avatar({
  src,
  alt,
  initials,
  size      = 'md',
  shape     = 'circle',
  className,
  ...rest
}: AvatarProps) {
  const [imgFailed, setImgFailed] = useState(false);

  useEffect(() => {
    setImgFailed(false);
  }, [src]);

  const showImage    = Boolean(src) && !imgFailed;
  const showInitials = !showImage && Boolean(initials);
  const showFallback = !showImage && !showInitials;

  return (
    <div
      className={clsx(
        'acko-avatar',
        `acko-avatar-${size}`,
        `acko-avatar-${shape}`,
        className,
      )}
      role="img"
      aria-label={alt}
      {...rest}
    >
      {showImage && (
        <img
          className="acko-avatar-img"
          src={src}
          alt={alt}
          onError={() => setImgFailed(true)}
        />
      )}
      {showInitials && (
        <span
          className={clsx('acko-avatar-initials', `acko-avatar-initials-${size}`)}
          aria-hidden="true"
        >
          {initials}
        </span>
      )}
      {showFallback && (
        <span
          className={clsx('acko-avatar-fallback', `acko-avatar-fallback-${size}`)}
          aria-hidden="true"
        >
          <UserIcon size={iconSizes[size]} />
        </span>
      )}
    </div>
  );
}
