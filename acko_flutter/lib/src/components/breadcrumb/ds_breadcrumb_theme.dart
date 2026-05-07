import 'dart:ui';

import 'package:flutter/material.dart';

import '../../foundation/tokens.dart';

/// Theme for [DsBreadcrumb] — register on [ThemeData.extensions].
class DsBreadcrumbTheme extends ThemeExtension<DsBreadcrumbTheme> {
  const DsBreadcrumbTheme({
    required this.linkColor,
    required this.linkHoverColor,
    required this.currentColor,
    required this.textColor,
    required this.separatorColor,
    required this.ellipsisHoverBg,
    required this.linkFontSize,
    required this.linkLineHeight,
    required this.currentFontWeight,
    required this.gap,
    required this.separatorSize,
  });

  final Color linkColor;
  final Color linkHoverColor;
  final Color currentColor;
  final Color textColor;
  final Color separatorColor;
  final Color ellipsisHoverBg;

  final double linkFontSize;
  final double linkLineHeight;
  final FontWeight currentFontWeight;

  final double gap;
  final double separatorSize;

  /// Light — aligned with `tokens.css` light breadcrumb roles.
  static const light = DsBreadcrumbTheme(
    linkColor: Color(0xFF888888),       // grey500
    linkHoverColor: DsTokens.colorPrimary,
    currentColor: DsTokens.colorTextDefault,
    textColor: Color(0xFFA4A4A4),       // grey400
    separatorColor: DsTokens.colorBorder,
    ellipsisHoverBg: DsTokens.colorBorderSubtle,
    linkFontSize: 14,
    linkLineHeight: 20,
    currentFontWeight: FontWeight.w500,
    gap: 4,
    separatorSize: 16,
  );

  /// Dark — aligned with `tokens.css` dark breadcrumb roles.
  static const dark = DsBreadcrumbTheme(
    linkColor: DsTokens.colorTextSecondaryDark,
    linkHoverColor: Color(0xFF8E7CF4),  // purple400
    currentColor: DsTokens.colorTextDefaultDark,
    textColor: Color(0xFFA4A4A4),       // grey400 — same as light
    separatorColor: Color(0xFF7A7A7A),  // grey550
    ellipsisHoverBg: DsTokens.colorBorderSubtleDark,
    linkFontSize: 14,
    linkLineHeight: 20,
    currentFontWeight: FontWeight.w500,
    gap: 4,
    separatorSize: 16,
  );

  static const defaults = light;

  @override
  DsBreadcrumbTheme copyWith({
    Color? linkColor,
    Color? linkHoverColor,
    Color? currentColor,
    Color? textColor,
    Color? separatorColor,
    Color? ellipsisHoverBg,
    double? linkFontSize,
    double? linkLineHeight,
    FontWeight? currentFontWeight,
    double? gap,
    double? separatorSize,
  }) {
    return DsBreadcrumbTheme(
      linkColor: linkColor ?? this.linkColor,
      linkHoverColor: linkHoverColor ?? this.linkHoverColor,
      currentColor: currentColor ?? this.currentColor,
      textColor: textColor ?? this.textColor,
      separatorColor: separatorColor ?? this.separatorColor,
      ellipsisHoverBg: ellipsisHoverBg ?? this.ellipsisHoverBg,
      linkFontSize: linkFontSize ?? this.linkFontSize,
      linkLineHeight: linkLineHeight ?? this.linkLineHeight,
      currentFontWeight: currentFontWeight ?? this.currentFontWeight,
      gap: gap ?? this.gap,
      separatorSize: separatorSize ?? this.separatorSize,
    );
  }

  @override
  DsBreadcrumbTheme lerp(DsBreadcrumbTheme? other, double t) {
    if (other == null) return this;
    return DsBreadcrumbTheme(
      linkColor: Color.lerp(linkColor, other.linkColor, t)!,
      linkHoverColor: Color.lerp(linkHoverColor, other.linkHoverColor, t)!,
      currentColor: Color.lerp(currentColor, other.currentColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      separatorColor: Color.lerp(separatorColor, other.separatorColor, t)!,
      ellipsisHoverBg:
          Color.lerp(ellipsisHoverBg, other.ellipsisHoverBg, t)!,
      linkFontSize: lerpDouble(linkFontSize, other.linkFontSize, t)!,
      linkLineHeight: lerpDouble(linkLineHeight, other.linkLineHeight, t)!,
      currentFontWeight:
          t < 0.5 ? currentFontWeight : other.currentFontWeight,
      gap: lerpDouble(gap, other.gap, t)!,
      separatorSize:
          lerpDouble(separatorSize, other.separatorSize, t)!,
    );
  }
}
