import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../foundation/theme_extension.dart';
import '../../foundation/tokens.dart';
import 'ds_alert_theme.dart';

/// Design-system alert banner — pairs with [DsAlertTheme] on [ThemeData.extensions].
class DsAlert extends StatefulWidget {
  const DsAlert({
    super.key,
    required this.variant,
    required this.child,
    this.title,
    this.icon,
    this.dismissible = false,
    this.onDismiss,
  });

  final DsAlertVariant variant;
  final Widget child;
  final String? title;
  final Widget? icon;
  final bool dismissible;
  final VoidCallback? onDismiss;

  @override
  State<DsAlert> createState() => _DsAlertState();
}

class _DsAlertState extends State<DsAlert> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _dy;

  @override
  void initState() {
    super.initState();
    // UX REVIEW: medium parity-risk — verify timing/offset vs CSS acko-alert-slide-up
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curved = CurvedAnimation(
      parent: _controller,
      curve: const Cubic(0.215, 0.61, 0.355, 1),
    );
    _fade = Tween<double>(begin: 0, end: 1).animate(curved);
    _dy = Tween<double>(begin: 8, end: 0).animate(curved);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alertTheme =
        Theme.of(context).extension<DsAlertTheme>() ?? DsAlertTheme.defaults;
    final ds = Theme.of(context).extension<DsThemeExtension>();
    final bodyColor = ds?.colorTextDefault ?? DsTokens.colorTextDefault;
    final palette = alertTheme.paletteFor(widget.variant);

    final inner = Container(
      decoration: BoxDecoration(
        color: palette.background,
        borderRadius: alertTheme.borderRadius,
        border: Border.all(color: palette.border),
      ),
      padding: alertTheme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: alertTheme.iconSize,
            height: alertTheme.iconSize,
            child: ExcludeSemantics(
              child: widget.icon ??
                  _DefaultAlertIcon(
                    variant: widget.variant,
                    color: palette.accent,
                    size: alertTheme.iconSize,
                  ),
            ),
          ),
          SizedBox(width: alertTheme.gap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.title != null)
                  Text(
                    widget.title!,
                    style: TextStyle(
                      fontSize: 14,
                      height: 20 / 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Euclid Circular B',
                      color: palette.accent,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Euclid Circular B',
                    color: bodyColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  child: widget.child,
                ),
              ],
            ),
          ),
          if (widget.dismissible) ...[
            SizedBox(width: alertTheme.gap),
            _DismissControl(
              accent: palette.accent,
              size: alertTheme.dismissSize,
              onDismiss: widget.onDismiss,
            ),
          ],
        ],
      ),
    );

    return Semantics(
      container: true,
      liveRegion: true,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Opacity(
            opacity: _fade.value,
            child: Transform.translate(
              offset: Offset(0, _dy.value),
              child: inner,
            ),
          );
        },
      ),
    );
  }
}

class _DefaultAlertIcon extends StatelessWidget {
  const _DefaultAlertIcon({
    required this.variant,
    required this.color,
    required this.size,
  });

  final DsAlertVariant variant;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final IconData data = switch (variant) {
      DsAlertVariant.info => Icons.info_outline,
      DsAlertVariant.success => Icons.check_circle_outline,
      DsAlertVariant.warning => Icons.warning_amber_outlined,
      DsAlertVariant.error => Icons.highlight_off_outlined,
    };
    return Icon(data, size: size, color: color);
  }
}

class _DismissControl extends StatefulWidget {
  const _DismissControl({
    required this.accent,
    required this.size,
    required this.onDismiss,
  });

  final Color accent;
  final double size;
  final VoidCallback? onDismiss;

  @override
  State<_DismissControl> createState() => _DismissControlState();
}

class _DismissControlState extends State<_DismissControl> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React
    final opacity = !kIsWeb &&
            (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.android)
        ? 0.7
        : (_hover ? 1.0 : 0.7);

    return Semantics(
      button: true,
      label: 'Dismiss alert',
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onDismiss,
          behavior: HitTestBehavior.opaque,
          child: Opacity(
            opacity: opacity,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: Icon(Icons.close, size: widget.size, color: widget.accent),
            ),
          ),
        ),
      ),
    );
  }
}
