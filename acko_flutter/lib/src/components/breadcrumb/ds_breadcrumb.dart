import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ds_breadcrumb_theme.dart';

/// One segment in [DsBreadcrumb].
class DsBreadcrumbItem {
  const DsBreadcrumbItem({
    required this.label,
    this.href,
    this.icon,
  });

  final String label;
  final String? href;
  final Widget? icon;
}

/// Horizontal breadcrumb trail — pairs with [DsBreadcrumbTheme] on [ThemeData.extensions].
///
/// When an item has [DsBreadcrumbItem.href] with a scheme (`https:`, `mailto:`, …), set
/// [onLinkTap] to handle navigation (e.g. `url_launcher.launchUrl`). Without [onLinkTap],
/// crumbs still use link styling for URIs but are not tappable.
class DsBreadcrumb extends StatefulWidget {
  const DsBreadcrumb({
    super.key,
    required this.items,
    this.separator,
    this.maxItems,
    this.onLinkTap,
  });

  final List<DsBreadcrumbItem> items;
  final Widget? separator;
  final int? maxItems;

  /// Called when a crumb with a valid `href` that includes a URI scheme is activated.
  final void Function(Uri uri)? onLinkTap;

  @override
  State<DsBreadcrumb> createState() => _DsBreadcrumbState();
}

class _DsBreadcrumbState extends State<DsBreadcrumb> {
  bool _expanded = false;

  static List<_Piece> _buildPieces(
    int length,
    int? maxItems,
    bool expanded,
  ) {
    if (expanded ||
        maxItems == null ||
        length <= maxItems ||
        maxItems < 3) {
      return List<_Piece>.generate(
        length,
        (i) => _Piece.crumb(i),
      );
    }
    final lastCount = maxItems - 2;
    final lastStart = length - lastCount;
    if (lastStart <= 1) {
      return List<_Piece>.generate(length, (i) => _Piece.crumb(i));
    }
    final out = <_Piece>[_Piece.crumb(0), const _Piece.ellipsis()];
    for (var i = lastStart; i < length; i++) {
      out.add(_Piece.crumb(i));
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsBreadcrumbTheme>() ?? DsBreadcrumbTheme.defaults;
    final pieces = _buildPieces(
      widget.items.length,
      widget.maxItems,
      _expanded,
    );

    final sepWidget = widget.separator ??
        Icon(
          Icons.chevron_right,
          size: theme.separatorSize,
          color: theme.separatorColor,
        );

    final out = <Widget>[];
    for (var i = 0; i < pieces.length; i++) {
      final p = pieces[i];
      if (p.isEllipsis) {
        out.add(
          _EllipsisChip(
            onPressed: () => setState(() => _expanded = true),
            theme: theme,
          ),
        );
      } else {
        final idx = p.index!;
        out.add(
          _CrumbCell(
            item: widget.items[idx],
            isCurrent: idx == widget.items.length - 1,
            theme: theme,
            onLinkTap: widget.onLinkTap,
          ),
        );
      }
      if (i < pieces.length - 1) {
        out.add(
          Semantics(
            excludeSemantics: true,
            child: sepWidget,
          ),
        );
      }
    }

    return Semantics(
      container: true,
      label: 'Breadcrumb',
      child: Wrap(
        spacing: theme.gap,
        runSpacing: theme.gap,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: out,
      ),
    );
  }
}

class _Piece {
  const _Piece._(this.index, this.isEllipsis);
  const _Piece.crumb(int i) : this._(i, false);
  const _Piece.ellipsis() : this._(null, true);

  final int? index;
  final bool isEllipsis;
}

class _CrumbCell extends StatefulWidget {
  const _CrumbCell({
    required this.item,
    required this.isCurrent,
    required this.theme,
    this.onLinkTap,
  });

  final DsBreadcrumbItem item;
  final bool isCurrent;
  final DsBreadcrumbTheme theme;
  final void Function(Uri uri)? onLinkTap;

  @override
  State<_CrumbCell> createState() => _CrumbCellState();
}

class _CrumbCellState extends State<_CrumbCell> {
  bool _hover = false;

  bool get _finePointer {
    if (kIsWeb) return true;
    return defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android;
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.theme;
    final item = widget.item;
    final baseStyle = TextStyle(
      fontFamily: 'Euclid Circular B',
      fontSize: t.linkFontSize,
      height: t.linkLineHeight / t.linkFontSize,
      fontWeight: FontWeight.w400,
    );

    final rowChildren = <Widget>[
      if (item.icon != null) ...[
        IconTheme(
          data: IconThemeData(size: t.linkFontSize, color: _iconColor(t, item)),
          child: item.icon!,
        ),
        SizedBox(width: t.gap),
      ],
    ];

    if (widget.isCurrent) {
      rowChildren.add(
        Text(
          item.label,
          style: baseStyle.copyWith(
            fontWeight: t.currentFontWeight,
            color: t.currentColor,
          ),
        ),
      );
      return Semantics(
        selected: true,
        child: Row(mainAxisSize: MainAxisSize.min, children: rowChildren),
      );
    }

    final textStyle = baseStyle.copyWith(
      color: item.href != null
          ? (_hover && _finePointer ? t.linkHoverColor : t.linkColor)
          : t.textColor,
      decoration: item.href != null && _hover && _finePointer
          ? TextDecoration.underline
          : TextDecoration.none,
    );

    final labelWidget = Text(item.label, style: textStyle);

    if (item.href != null) {
      final uri = Uri.tryParse(item.href!);
      if (uri != null &&
          uri.hasScheme &&
          widget.onLinkTap != null) {
        return MouseRegion(
          onEnter: (_) {
            if (_finePointer) setState(() => _hover = true);
          },
          onExit: (_) => setState(() => _hover = false),
          child: Semantics(
            link: true,
            label: item.label,
            child: InkWell(
              onTap: () => widget.onLinkTap!(uri),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [...rowChildren, labelWidget],
              ),
            ),
          ),
        );
      }
    }

    rowChildren.add(labelWidget);
    return Row(mainAxisSize: MainAxisSize.min, children: rowChildren);
  }

  Color _iconColor(DsBreadcrumbTheme t, DsBreadcrumbItem item) {
    if (widget.isCurrent) return t.currentColor;
    if (item.href != null) {
      return _hover && _finePointer ? t.linkHoverColor : t.linkColor;
    }
    return t.textColor;
  }
}

class _EllipsisChip extends StatefulWidget {
  const _EllipsisChip({
    required this.onPressed,
    required this.theme,
  });

  final VoidCallback onPressed;
  final DsBreadcrumbTheme theme;

  @override
  State<_EllipsisChip> createState() => _EllipsisChipState();
}

class _EllipsisChipState extends State<_EllipsisChip> {
  bool _hover = false;

  bool get _finePointer {
    if (kIsWeb) return true;
    return defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android;
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.theme;
    // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React render.
    return MouseRegion(
      onEnter: (_) {
        if (_finePointer) setState(() => _hover = true);
      },
      onExit: (_) => setState(() => _hover = false),
      child: Material(
        color: _hover && _finePointer ? t.ellipsisHoverBg : Colors.transparent,
        borderRadius: BorderRadius.circular(9999),
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(9999),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Semantics(
              button: true,
              label: 'Show more breadcrumb items',
              child: Text(
                '…',
                style: TextStyle(
                  fontFamily: 'Euclid Circular B',
                  fontSize: t.linkFontSize,
                  color: t.linkColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
