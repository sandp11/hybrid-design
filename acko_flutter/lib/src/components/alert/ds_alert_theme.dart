import 'dart:ui';
import 'package:flutter/material.dart';
import '../../foundation/tokens.dart';

enum DsAlertVariant { info, success, warning, error }

/// Semantic colors for one alert variant (background, border, icon/title accent).
class DsAlertPalette {
  const DsAlertPalette({
    required this.background,
    required this.border,
    required this.accent,
  });

  final Color background;
  final Color border;
  final Color accent;

  DsAlertPalette lerp(DsAlertPalette other, double t) => DsAlertPalette(
        background: Color.lerp(background, other.background, t)!,
        border: Color.lerp(border, other.border, t)!,
        accent: Color.lerp(accent, other.accent, t)!,
      );
}

class DsAlertTheme extends ThemeExtension<DsAlertTheme> {
  const DsAlertTheme({
    required this.info,
    required this.success,
    required this.warning,
    required this.error,
    required this.padding,
    required this.gap,
    required this.iconSize,
    required this.dismissSize,
    required this.borderRadius,
  });

  final DsAlertPalette info;
  final DsAlertPalette success;
  final DsAlertPalette warning;
  final DsAlertPalette error;

  final EdgeInsets padding;
  final double gap;
  final double iconSize;
  final double dismissSize;
  final BorderRadius borderRadius;

  static const light = DsAlertTheme(
    info: DsAlertPalette(
      background: DsTokens.colorInfoSubtle,
      border: DsTokens.colorInfoBorder,
      accent: DsTokens.colorInfoText,
    ),
    success: DsAlertPalette(
      background: DsTokens.colorSuccessSubtle,
      border: DsTokens.colorSuccessBorder,
      accent: DsTokens.colorSuccessText,
    ),
    warning: DsAlertPalette(
      background: DsTokens.colorWarningSubtle,
      border: DsTokens.colorWarningBorder,
      accent: DsTokens.colorWarningText,
    ),
    error: DsAlertPalette(
      background: DsTokens.colorErrorSubtle,
      border: DsTokens.colorErrorBorder,
      accent: DsTokens.colorErrorText,
    ),
    padding: EdgeInsets.all(12),
    gap: 12,
    iconSize: 20,
    dismissSize: 20,
    borderRadius: BorderRadius.all(Radius.circular(DsTokens.radius3xl)),
  );

  static const dark = DsAlertTheme(
    info: DsAlertPalette(
      background: DsTokens.colorInfoSubtleDark,
      border: DsTokens.colorInfoBorderDark,
      accent: DsTokens.colorInfoTextDark,
    ),
    success: DsAlertPalette(
      background: DsTokens.colorSuccessSubtleDark,
      border: DsTokens.colorSuccessBorderDark,
      accent: DsTokens.colorSuccessTextDark,
    ),
    warning: DsAlertPalette(
      background: DsTokens.colorWarningSubtleDark,
      border: DsTokens.colorWarningBorderDark,
      accent: DsTokens.colorWarningTextDark,
    ),
    error: DsAlertPalette(
      background: DsTokens.colorErrorSubtleDark,
      border: DsTokens.colorErrorBorderDark,
      accent: DsTokens.colorErrorTextDark,
    ),
    padding: EdgeInsets.all(12),
    gap: 12,
    iconSize: 20,
    dismissSize: 20,
    borderRadius: BorderRadius.all(Radius.circular(DsTokens.radius3xl)),
  );

  static const defaults = light;

  DsAlertPalette paletteFor(DsAlertVariant variant) => switch (variant) {
        DsAlertVariant.info => info,
        DsAlertVariant.success => success,
        DsAlertVariant.warning => warning,
        DsAlertVariant.error => error,
      };

  @override
  DsAlertTheme copyWith({
    DsAlertPalette? info,
    DsAlertPalette? success,
    DsAlertPalette? warning,
    DsAlertPalette? error,
    EdgeInsets? padding,
    double? gap,
    double? iconSize,
    double? dismissSize,
    BorderRadius? borderRadius,
  }) {
    return DsAlertTheme(
      info: info ?? this.info,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      padding: padding ?? this.padding,
      gap: gap ?? this.gap,
      iconSize: iconSize ?? this.iconSize,
      dismissSize: dismissSize ?? this.dismissSize,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  DsAlertTheme lerp(DsAlertTheme? other, double t) {
    if (other == null) return this;
    return DsAlertTheme(
      info: info.lerp(other.info, t),
      success: success.lerp(other.success, t),
      warning: warning.lerp(other.warning, t),
      error: error.lerp(other.error, t),
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      iconSize: lerpDouble(iconSize, other.iconSize, t)!,
      dismissSize: lerpDouble(dismissSize, other.dismissSize, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }
}
