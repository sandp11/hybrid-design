import 'package:flutter/material.dart';
import '../ds_button_theme.dart';

List<BoxShadow> resolveButtonShadows({
  required DsButtonVariant variant,
  required DsButtonTheme theme,
  required bool isFocused,
  required bool isDisabled,
  required List<BoxShadow> baseShadows,
}) {
  if (!isFocused || isDisabled) return baseShadows;

  final Color ringColor = variant == DsButtonVariant.danger
      ? theme.dangerFocusRingColor.withOpacity(0.20)
      : theme.focusRingColor;

  return [
    ...baseShadows,
    BoxShadow(
      color: ringColor,
      blurRadius: 0,
      spreadRadius: 3,
    ),
  ];
}
