import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../foundation/primitives.dart';
import 'ds_dialog_theme.dart';

/// Size options for DsDialog panel max-width.
enum DsDialogSize {
  sm,  // 360px
  md,  // 480px
  lg,  // 600px
  xl,  // 760px
  full // double.infinity, no radius
}

extension _DsDialogSizeX on DsDialogSize {
  double get maxWidth => switch (this) {
        DsDialogSize.sm   => 360,
        DsDialogSize.md   => 480,
        DsDialogSize.lg   => 600,
        DsDialogSize.xl   => 760,
        DsDialogSize.full => double.infinity,
      };

  bool get isFull => this == DsDialogSize.full;
}

// ─────────────────────────────────────────────────────────────────────────────
// showDsDialog — top-level helper
// ─────────────────────────────────────────────────────────────────────────────

/// Opens a [DsDialog] using [showGeneralDialog] with the design-system entrance
/// animation (panel scale 0.95→1 + fade + slight upward slide, 250ms ease-out-quart).
///
/// [barrierDismissible] maps to [dismissible] on the dialog widget.
Future<T?> showDsDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool dismissible = true,
  DsDialogTheme? theme,
}) {
  final effectiveTheme = theme ??
      Theme.of(context).extension<DsDialogTheme>() ??
      DsDialogTheme.light;

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: dismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: effectiveTheme.backdropColor,
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (ctx, _, __) => builder(ctx),
    transitionBuilder: (ctx, animation, _, child) {
      // ease-out-quart approximation → Curves.easeOut
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOut);

      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1.0).animate(curved),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.02), // ~8px at 400px height
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        ),
      );
    },
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// DsDialog widget
// ─────────────────────────────────────────────────────────────────────────────

class DsDialog extends StatelessWidget {
  const DsDialog({
    super.key,
    this.title,
    this.description,
    this.size = DsDialogSize.md,
    this.dismissible = true,
    required this.body,
    this.footer,
  });

  final String? title;
  final String? description;
  final DsDialogSize size;
  final bool dismissible;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DsDialogTheme>() ?? DsDialogTheme.light;
    final effectiveRadius = size.isFull ? BorderRadius.zero : theme.panelRadius;

    return Semantics(
      container: true,
      label: title ?? '',
      namesRoute: true,
      child: PopScope(
        canPop: dismissible,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.maxWidth),
            child: Material(
              color: Colors.transparent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.panelColor,
                  borderRadius: effectiveRadius,
                  boxShadow: [theme.panelShadow],
                ),
                child: ClipRRect(
                  borderRadius: effectiveRadius,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (title != null)
                        _DsDialogHeader(
                          title: title!,
                          theme: theme,
                          dismissible: dismissible,
                        ),
                      if (description != null)
                        _DsDialogDescription(
                          description: description!,
                          theme: theme,
                        ),
                      Flexible(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: body,
                        ),
                      ),
                      if (footer != null)
                        _DsDialogFooter(footer: footer!, theme: theme),
                    ],
                  ),
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
// _DsDialogHeader
// ─────────────────────────────────────────────────────────────────────────────

class _DsDialogHeader extends StatelessWidget {
  const _DsDialogHeader({
    required this.title,
    required this.theme,
    required this.dismissible,
  });

  final String title;
  final DsDialogTheme theme;
  final bool dismissible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(title, style: theme.titleStyle),
          ),
          const SizedBox(width: 12),
          _DsDialogCloseButton(theme: theme),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _DsDialogCloseButton
// ─────────────────────────────────────────────────────────────────────────────

class _DsDialogCloseButton extends StatefulWidget {
  const _DsDialogCloseButton({required this.theme});
  final DsDialogTheme theme;

  @override
  State<_DsDialogCloseButton> createState() => _DsDialogCloseButtonState();
}

class _DsDialogCloseButtonState extends State<_DsDialogCloseButton> {
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
    // Haptics on mobile
    final isMobile = !kIsWeb &&
        (Platform.isIOS || Platform.isAndroid);
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
          label: 'Close dialog',
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
                // Focus ring: 3px outer ring using color-primary-ring
                border: _focused
                    ? Border.all(
                        color: DsPrimitives.purple200,
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
// _DsDialogDescription
// ─────────────────────────────────────────────────────────────────────────────

class _DsDialogDescription extends StatelessWidget {
  const _DsDialogDescription({
    required this.description,
    required this.theme,
  });

  final String description;
  final DsDialogTheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Text(description, style: theme.descriptionStyle),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _DsDialogFooter
// ─────────────────────────────────────────────────────────────────────────────

class _DsDialogFooter extends StatelessWidget {
  const _DsDialogFooter({
    required this.footer,
    required this.theme,
  });

  final Widget footer;
  final DsDialogTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(
          height: 1,
          thickness: 1,
          color: theme.footerBorderColor,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Align(
            alignment: Alignment.centerRight,
            child: footer,
          ),
        ),
      ],
    );
  }
}
