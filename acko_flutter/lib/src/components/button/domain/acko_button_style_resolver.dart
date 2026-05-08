import 'package:flutter/material.dart';
import '../../../foundation/primitives.dart';
import '../ds_button_theme.dart';

class ResolvedButtonStyle {
  const ResolvedButtonStyle({
    required this.bg,
    required this.fg,
    required this.shadows,
    this.border,
  });

  final Color bg;
  final Color fg;
  final List<BoxShadow> shadows;
  final BoxBorder? border;
}

ResolvedButtonStyle resolveButtonStyle({
  required DsButtonVariant variant,
  required DsButtonTheme theme,
  required bool isDisabled,
  required bool isPressed,
}) {
  Color bg;
  Color fg;
  List<BoxShadow> shadows = [];
  BoxBorder? border;

  if (isDisabled) {
    bg = variant == DsButtonVariant.link ? Colors.transparent : theme.disabledBg;
    fg = theme.disabledFg;
  } else {
    switch (variant) {
      case DsButtonVariant.primary:
        bg = theme.primaryBg;
        fg = theme.primaryFg;
        shadows = [theme.primaryShadowInner];
      case DsButtonVariant.secondary:
        bg = theme.secondaryBg;
        fg = theme.secondaryFg;
        border = Border.all(color: theme.secondaryBorderColor, width: 1);
      case DsButtonVariant.inverted:
        bg = theme.invertedBg;
        fg = theme.invertedFg;
      case DsButtonVariant.ghost:
        bg = Colors.transparent;
        fg = theme.ghostFg;
      case DsButtonVariant.link:
        bg = Colors.transparent;
        fg = theme.linkFg;
      case DsButtonVariant.danger:
        bg = theme.dangerBg;
        fg = theme.dangerFg;
    }

    if (isPressed) {
      bg = Color.alphaBlend(DsPrimitives.blackA2, bg);
    }
  }

  return ResolvedButtonStyle(bg: bg, fg: fg, shadows: shadows, border: border);
}
