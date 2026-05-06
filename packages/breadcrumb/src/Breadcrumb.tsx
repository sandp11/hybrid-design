import { clsx } from "clsx";
import {
  type ReactNode,
  useMemo,
  useState,
} from "react";

export interface BreadcrumbItem {
  label: string;
  href?: string;
  icon?: ReactNode;
}

export interface BreadcrumbProps {
  items: BreadcrumbItem[];
  separator?: ReactNode;
  maxItems?: number;
  className?: string;
}

type Piece =
  | { type: "crumb"; index: number }
  | { type: "ellipsis" };

function buildPieces(
  length: number,
  maxItems: number | undefined,
  expanded: boolean,
): Piece[] {
  if (
    expanded ||
    maxItems === undefined ||
    length <= maxItems ||
    maxItems < 3
  ) {
    return Array.from({ length }, (_, i) => ({ type: "crumb", index: i }));
  }

  const lastCount = maxItems - 2;
  const lastStart = length - lastCount;

  if (lastStart <= 1) {
    return Array.from({ length }, (_, i) => ({ type: "crumb", index: i }));
  }

  const pieces: Piece[] = [{ type: "crumb", index: 0 }, { type: "ellipsis" }];
  for (let i = lastStart; i < length; i++) {
    pieces.push({ type: "crumb", index: i });
  }
  return pieces;
}

function DefaultChevronSeparator() {
  return (
    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
      <path
        d="M9 6l6 6-6 6"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  );
}

function CrumbBody({ item }: { item: BreadcrumbItem }) {
  return (
    <>
      {item.icon ? (
        <span className="acko-breadcrumb-icon">{item.icon}</span>
      ) : null}
      {item.label}
    </>
  );
}

function renderCrumb(item: BreadcrumbItem, isCurrent: boolean) {
  if (isCurrent) {
    return (
      <span className="acko-breadcrumb-current" aria-current="page">
        <CrumbBody item={item} />
      </span>
    );
  }
  if (item.href) {
    return (
      <a className="acko-breadcrumb-link" href={item.href}>
        <CrumbBody item={item} />
      </a>
    );
  }
  return (
    <span className="acko-breadcrumb-text">
      <CrumbBody item={item} />
    </span>
  );
}

export function Breadcrumb({
  items,
  separator,
  maxItems,
  className,
}: BreadcrumbProps) {
  const [expanded, setExpanded] = useState(false);
  const sep = separator ?? <DefaultChevronSeparator />;

  const pieces = useMemo(
    () => buildPieces(items.length, maxItems, expanded),
    [items.length, maxItems, expanded],
  );

  const cells: ReactNode[] = [];

  pieces.forEach((piece, i) => {
    if (piece.type === "crumb") {
      const item = items[piece.index];
      const isCurrent = piece.index === items.length - 1;
      cells.push(
        <li key={`crumb-${piece.index}`} className="acko-breadcrumb-item">
          {renderCrumb(item, isCurrent)}
        </li>,
      );
    } else {
      cells.push(
        <li key="ellipsis" className="acko-breadcrumb-item">
          <button
            type="button"
            className="acko-breadcrumb-ellipsis"
            aria-label="Show more breadcrumb items"
            onClick={() => setExpanded(true)}
          >
            …
          </button>
        </li>,
      );
    }

    if (i < pieces.length - 1) {
      cells.push(
        <li
          key={`sep-${i}`}
          className="acko-breadcrumb-separator-item"
          aria-hidden="true"
        >
          <span className="acko-breadcrumb-separator-icon">{sep}</span>
        </li>,
      );
    }
  });

  return (
    <nav aria-label="Breadcrumb" className={clsx("acko-breadcrumb", className)}>
      <ol className="acko-breadcrumb-list">{cells}</ol>
    </nav>
  );
}
