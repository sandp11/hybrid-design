import 'package:flutter/material.dart';
import '../ds_button_theme.dart';

class AckoButtonContent extends StatelessWidget {
  const AckoButtonContent({
    super.key,
    required this.label,
    required this.variant,
    required this.size,
    required this.fg,
    required this.isDisabled,
    required this.theme,
    this.iconLeft,
    this.iconRight,
    this.iconOnly = false,
  });

  final String label;
  final DsButtonVariant variant;
  final DsButtonSize size;
  final Color fg;
  final bool isDisabled;
  final DsButtonTheme theme;
  final Widget? iconLeft;
  final Widget? iconRight;
  final bool iconOnly;

  @override
  Widget build(BuildContext context) {
    if (iconOnly) {
      return SizedBox(
        width: theme.iconSizeFor(size),
        height: theme.iconSizeFor(size),
        child: iconLeft ?? iconRight,
      );
    }

    final showUnderline = variant == DsButtonVariant.link && !isDisabled;
    final iconSize = theme.iconSizeFor(size);

    final labelWidget = Text(
      label,
      style: theme.textStyleFor(size).copyWith(
        color: fg,
        fontFamily: 'Euclid Circular B',
        decoration: showUnderline ? TextDecoration.underline : TextDecoration.none,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconLeft != null) ...[
          SizedBox(width: iconSize, height: iconSize, child: iconLeft),
          SizedBox(width: theme.iconGap),
        ],
        labelWidget,
        if (iconRight != null) ...[
          SizedBox(width: theme.iconGap),
          SizedBox(width: iconSize, height: iconSize, child: iconRight),
        ],
      ],
    );
  }
}
