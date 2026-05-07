import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ds_drawer_theme.dart';

/// Which viewport edge the drawer panel anchors to.
enum DsDrawerSide { left, right, bottom, top }

/// Panel size — controls width for left/right, max-height for bottom/top.
enum DsDrawerSize { sm, md, lg, full }

extension _DsDrawerSizeX on DsDrawerSize {
  /// Fixed width in logical pixels for left / right drawers.
  double widthFor(BuildContext context) => switch (this) {
        DsDrawerSize.sm => 280,
        DsDrawerSize.md => 380,
        DsDrawerSize.lg => 520,
        DsDrawerSize.full => MediaQuery.of(context).size.width,
      };

  /// Max-height as a viewport fraction for bottom / top drawers.
  // UX REVIEW: high parity-risk — vh computed via MediaQuery; verify against CSS vh on web.
  double maxHeightFor(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return switch (this) {
      DsDrawerSize.sm => h * 0.30,
      DsDrawerSize.md => h * 0.50,
      DsDrawerSize.lg => h * 0.75,
      DsDrawerSize.full => h,
    };
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Radius helpers
// ─────────────────────────────────────────────────────────────────────────────

BorderRadius _radiusFor(DsDrawerSide side) {
  const r = Radius.circular(20); // radius-4xl
  return switch (side) {
    DsDrawerSide.right  => const BorderRadius.only(topLeft: r, bottomLeft: r),
    DsDrawerSide.left   => const BorderRadius.only(topRight: r, bottomRight: r),
    DsDrawerSide.bottom => const BorderRadius.only(topLeft: r, topRight: r),
    DsDrawerSide.top    => const BorderRadius.only(bottomLeft: r, bottomRight: r),
  };
}

Alignment _alignmentFor(DsDrawerSide side) => switch (side) {
      DsDrawerSide.right  => Alignment.centerRight,
      DsDrawerSide.left   => Alignment.centerLeft,
      DsDrawerSide.bottom => Alignment.bottomCenter,
      DsDrawerSide.top    => Alignment.topCenter,
    };

Offset _slideBeginFor(DsDrawerSide side) => switch (side) {
      DsDrawerSide.right  => const Offset(1.0, 0),
      DsDrawerSide.left   => const Offset(-1.0, 0),
      DsDrawerSide.bottom => const Offset(0, 1.0),
      DsDrawerSide.top    => const Offset(0, -1.0),
    };

// ─────────────────────────────────────────────────────────────────────────────
// showDsDrawer — top-level helper
// ─────────────────────────────────────────────────────────────────────────────

/// Opens a [DsDrawer] with a slide + fade backdrop entrance.
///
/// Note: Flutter mounts/unmounts via route — unlike web which keeps the DOM
/// present. Exit animation plays via the reverse transitionBuilder.
/// // UX REVIEW: high parity-risk — verify close animation plays on Flutter vs CSS transition on web.
Future<T?> showDsDrawer<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  DsDrawerSide side = DsDrawerSide.right,
  DsDrawerSize size = DsDrawerSize.md,
  bool dismissible = true,
  DsDrawerTheme? theme,
}) {
  final effectiveTheme = theme ??
      Theme.of(context).extension<DsDrawerTheme>() ??
      DsDrawerTheme.light;

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: false, // handled manually in transitionBuilder
    barrierLabel: '',
    barrierColor: Colors.transparent, // backdrop drawn inside transitionBuilder
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (ctx, _, __) => builder(ctx),
    transitionBuilder: (ctx, animation, _, child) {
      // Backdrop: 250ms ease-out-cubic
      final backdropCurve = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      // Panel slide: 300ms ease-out-quart ≈ Curves.easeOut
      final panelCurve = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      );

      return Stack(
        fit: StackFit.expand,
        children: [
          // Backdrop
          FadeTransition(
            opacity: backdropCurve,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: dismissible
                  ? () => Navigator.of(ctx).pop()
                  : null,
              child: ColoredBox(color: effectiveTheme.backdropColor),
            ),
          ),
          // Panel slide
          Align(
            alignment: _alignmentFor(side),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: _slideBeginFor(side),
                end: Offset.zero,
              ).animate(panelCurve),
              child: child,
            ),
          ),
        ],
      );
    },
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// DsDrawer widget
// ─────────────────────────────────────────────────────────────────────────────

class DsDrawer extends StatelessWidget {
  const DsDrawer({
    super.key,
    this.side = DsDrawerSide.right,
    this.size = DsDrawerSize.md,
    this.title,
    this.description,
    this.dismissible = true,
    required this.body,
    this.footer,
  });

  final DsDrawerSide side;
  final DsDrawerSize size;
  final String? title;
  final String? description;
  final bool dismissible;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsDrawerTheme>() ?? DsDrawerTheme.light;
    final radius = _radiusFor(side);

    final isVertical =
        side == DsDrawerSide.left || side == DsDrawerSide.right;

    Widget panel = Semantics(
      container: true,
      label: title ?? '',
      namesRoute: true,
      child: PopScope(
        canPop: dismissible,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.panelColor,
            borderRadius: radius,
            boxShadow: [theme.panelShadow],
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null || description != null)
                  _DsDrawerHeader(
                    title: title,
                    description: description,
                    theme: theme,
                  ),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: DefaultTextStyle(
                      style: TextStyle(color: theme.bodyColor),
                      child: body,
                    ),
                  ),
                ),
                if (footer != null)
                  _DsDrawerFooter(footer: footer!, theme: theme),
              ],
            ),
          ),
        ),
      ),
    );

    // Apply size constraints per axis
    if (isVertical) {
      panel = SizedBox(
        width: size.widthFor(context),
        height: double.infinity,
        child: panel,
      );
    } else {
      // UX REVIEW: high parity-risk — vh computed via MediaQuery; verify against CSS vh on web.
      panel = ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: size.maxHeightFor(context),
        ),
        child: panel,
      );
    }

    return panel;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _DsDrawerHeader
// ─────────────────────────────────────────────────────────────────────────────

class _DsDrawerHeader extends StatelessWidget {
  const _DsDrawerHeader({
    required this.title,
    required this.description,
    required this.theme,
  });

  final String? title;
  final String? description;
  final DsDrawerTheme theme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.headerBorderColor, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(title!, style: theme.titleStyle),
                  if (title != null && description != null)
                    const SizedBox(height: 4),
                  if (description != null)
                    Text(description!, style: theme.descriptionStyle),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _DsDrawerCloseButton(theme: theme),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _DsDrawerCloseButton
// ─────────────────────────────────────────────────────────────────────────────

class _DsDrawerCloseButton extends StatefulWidget {
  const _DsDrawerCloseButton({required this.theme});
  final DsDrawerTheme theme;

  @override
  State<_DsDrawerCloseButton> createState() => _DsDrawerCloseButtonState();
}

class _DsDrawerCloseButtonState extends State<_DsDrawerCloseButton> {
  bool _hovered = false;
  final _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTap() {
    final isMobile = !kIsWeb && (Platform.isIOS || Platform.isAndroid);
    if (isMobile) HapticFeedback.lightImpact();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: Semantics(
          label: 'Close drawer',
          button: true,
          child: Focus(
            focusNode: _focusNode,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _hovered
                    ? widget.theme.closeButtonHoverColor
                    : Colors.transparent,
                border: _focused
                    ? Border.all(
                        color: const Color(0xFFD9D8FC), // color-primary-ring light
                        width: 3,
                      )
                    : null,
              ),
              child: Center(
                child: Icon(
                  Icons.close,
                  size: 18,
                  color: widget.theme.closeIconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _DsDrawerFooter
// ─────────────────────────────────────────────────────────────────────────────

class _DsDrawerFooter extends StatelessWidget {
  const _DsDrawerFooter({required this.footer, required this.theme});
  final Widget footer;
  final DsDrawerTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: 1, thickness: 1, color: theme.footerBorderColor),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: footer,
          ),
        ),
      ],
    );
  }
}
