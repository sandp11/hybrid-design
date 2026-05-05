import 'dart:ui';
import 'package:flutter/material.dart';
import '../../foundation/tokens.dart';

class DsTemplateTheme extends ThemeExtension<DsTemplateTheme> {
  const DsTemplateTheme({
    required this.primaryBackground,
    required this.disabledBackground,
    required this.disabledOpacity,
  });

  final Color primaryBackground;
  final Color disabledBackground;
  final double disabledOpacity;

  static const defaults = DsTemplateTheme(
    primaryBackground: DsTokens.colorPrimary,
    disabledBackground: DsTokens.colorSurfaceSubtle,
    disabledOpacity: 0.4,
  );

  @override
  DsTemplateTheme copyWith({
    Color? primaryBackground,
    Color? disabledBackground,
    double? disabledOpacity,
  }) {
    return DsTemplateTheme(
      primaryBackground: primaryBackground ?? this.primaryBackground,
      disabledBackground: disabledBackground ?? this.disabledBackground,
      disabledOpacity: disabledOpacity ?? this.disabledOpacity,
    );
  }

  @override
  DsTemplateTheme lerp(DsTemplateTheme? other, double t) {
    if (other == null) return this;
    return DsTemplateTheme(
      primaryBackground: Color.lerp(primaryBackground, other.primaryBackground, t)!,
      disabledBackground: Color.lerp(disabledBackground, other.disabledBackground, t)!,
      disabledOpacity: lerpDouble(disabledOpacity, other.disabledOpacity, t)!,
    );
  }
}
