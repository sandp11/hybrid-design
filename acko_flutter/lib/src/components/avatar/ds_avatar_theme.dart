import 'dart:ui';
import 'package:flutter/material.dart';
import '../../foundation/tokens.dart';

enum DsAvatarSize  { xs, sm, md, lg, xl }
enum DsAvatarShape { circle, square }

// ─── Theme extension ───────────────────────────────────────────────────────────

class DsAvatarTheme extends ThemeExtension<DsAvatarTheme> {
  const DsAvatarTheme({
    required this.sizeXs,
    required this.sizeSm,
    required this.sizeMd,
    required this.sizeLg,
    required this.sizeXl,
    required this.initialsBackground,
    required this.initialsColor,
    required this.initialsXsFontSize,
    required this.initialsSmFontSize,
    required this.initialsMdFontSize,
    required this.initialsLgFontSize,
    required this.initialsXlFontSize,
    required this.iconXsSize,
    required this.iconSmSize,
    required this.iconMdSize,
    required this.iconLgSize,
    required this.iconXlSize,
    required this.squareBorderRadius,
  });

  final double sizeXs;
  final double sizeSm;
  final double sizeMd;
  final double sizeLg;
  final double sizeXl;

  final Color initialsBackground;
  final Color initialsColor;

  final double initialsXsFontSize;
  final double initialsSmFontSize;
  final double initialsMdFontSize;
  final double initialsLgFontSize;
  final double initialsXlFontSize;

  final double iconXsSize;
  final double iconSmSize;
  final double iconMdSize;
  final double iconLgSize;
  final double iconXlSize;

  final BorderRadius squareBorderRadius;

  // ─── Light defaults ───────────────────────────────────────────────────────────

  static const light = DsAvatarTheme(
    sizeXs: 24.0,
    sizeSm: 32.0,
    sizeMd: 40.0,
    sizeLg: 48.0,
    sizeXl: 64.0,
    initialsBackground: DsTokens.colorPrimarySubtle,
    initialsColor:      DsTokens.colorPrimary,
    initialsXsFontSize: 10.0,
    initialsSmFontSize: 12.0,
    initialsMdFontSize: 14.0,
    initialsLgFontSize: 16.0,
    initialsXlFontSize: 20.0,
    iconXsSize: 12.0,
    iconSmSize: 16.0,
    iconMdSize: 20.0,
    iconLgSize: 24.0,
    iconXlSize: 32.0,
    squareBorderRadius: BorderRadius.all(Radius.circular(DsTokens.radiusLg)),
  );

  // ─── Dark defaults ────────────────────────────────────────────────────────────

  static const dark = DsAvatarTheme(
    sizeXs: 24.0,
    sizeSm: 32.0,
    sizeMd: 40.0,
    sizeLg: 48.0,
    sizeXl: 64.0,
    initialsBackground: Color(0xFF2B1678), // color-primary-subtle dark — purple900
    initialsColor:      Color(0xFF795DEE), // color-primary dark — purple500
    initialsXsFontSize: 10.0,
    initialsSmFontSize: 12.0,
    initialsMdFontSize: 14.0,
    initialsLgFontSize: 16.0,
    initialsXlFontSize: 20.0,
    iconXsSize: 12.0,
    iconSmSize: 16.0,
    iconMdSize: 20.0,
    iconLgSize: 24.0,
    iconXlSize: 32.0,
    squareBorderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const defaults = light;

  // ─── Helpers ─────────────────────────────────────────────────────────────────

  double dimensionFor(DsAvatarSize size) => switch (size) {
    DsAvatarSize.xs => sizeXs,
    DsAvatarSize.sm => sizeSm,
    DsAvatarSize.md => sizeMd,
    DsAvatarSize.lg => sizeLg,
    DsAvatarSize.xl => sizeXl,
  };

  double initialsFontSizeFor(DsAvatarSize size) => switch (size) {
    DsAvatarSize.xs => initialsXsFontSize,
    DsAvatarSize.sm => initialsSmFontSize,
    DsAvatarSize.md => initialsMdFontSize,
    DsAvatarSize.lg => initialsLgFontSize,
    DsAvatarSize.xl => initialsXlFontSize,
  };

  double iconSizeFor(DsAvatarSize size) => switch (size) {
    DsAvatarSize.xs => iconXsSize,
    DsAvatarSize.sm => iconSmSize,
    DsAvatarSize.md => iconMdSize,
    DsAvatarSize.lg => iconLgSize,
    DsAvatarSize.xl => iconXlSize,
  };

  // ─── ThemeExtension ───────────────────────────────────────────────────────────

  @override
  DsAvatarTheme copyWith({
    double? sizeXs,
    double? sizeSm,
    double? sizeMd,
    double? sizeLg,
    double? sizeXl,
    Color? initialsBackground,
    Color? initialsColor,
    double? initialsXsFontSize,
    double? initialsSmFontSize,
    double? initialsMdFontSize,
    double? initialsLgFontSize,
    double? initialsXlFontSize,
    double? iconXsSize,
    double? iconSmSize,
    double? iconMdSize,
    double? iconLgSize,
    double? iconXlSize,
    BorderRadius? squareBorderRadius,
  }) {
    return DsAvatarTheme(
      sizeXs:             sizeXs             ?? this.sizeXs,
      sizeSm:             sizeSm             ?? this.sizeSm,
      sizeMd:             sizeMd             ?? this.sizeMd,
      sizeLg:             sizeLg             ?? this.sizeLg,
      sizeXl:             sizeXl             ?? this.sizeXl,
      initialsBackground: initialsBackground ?? this.initialsBackground,
      initialsColor:      initialsColor      ?? this.initialsColor,
      initialsXsFontSize: initialsXsFontSize ?? this.initialsXsFontSize,
      initialsSmFontSize: initialsSmFontSize ?? this.initialsSmFontSize,
      initialsMdFontSize: initialsMdFontSize ?? this.initialsMdFontSize,
      initialsLgFontSize: initialsLgFontSize ?? this.initialsLgFontSize,
      initialsXlFontSize: initialsXlFontSize ?? this.initialsXlFontSize,
      iconXsSize:         iconXsSize         ?? this.iconXsSize,
      iconSmSize:         iconSmSize         ?? this.iconSmSize,
      iconMdSize:         iconMdSize         ?? this.iconMdSize,
      iconLgSize:         iconLgSize         ?? this.iconLgSize,
      iconXlSize:         iconXlSize         ?? this.iconXlSize,
      squareBorderRadius: squareBorderRadius ?? this.squareBorderRadius,
    );
  }

  @override
  DsAvatarTheme lerp(DsAvatarTheme? other, double t) {
    if (other == null) return this;
    return DsAvatarTheme(
      sizeXs:             lerpDouble(sizeXs,             other.sizeXs,             t)!,
      sizeSm:             lerpDouble(sizeSm,             other.sizeSm,             t)!,
      sizeMd:             lerpDouble(sizeMd,             other.sizeMd,             t)!,
      sizeLg:             lerpDouble(sizeLg,             other.sizeLg,             t)!,
      sizeXl:             lerpDouble(sizeXl,             other.sizeXl,             t)!,
      initialsBackground: Color.lerp(initialsBackground, other.initialsBackground, t)!,
      initialsColor:      Color.lerp(initialsColor,      other.initialsColor,      t)!,
      initialsXsFontSize: lerpDouble(initialsXsFontSize, other.initialsXsFontSize, t)!,
      initialsSmFontSize: lerpDouble(initialsSmFontSize, other.initialsSmFontSize, t)!,
      initialsMdFontSize: lerpDouble(initialsMdFontSize, other.initialsMdFontSize, t)!,
      initialsLgFontSize: lerpDouble(initialsLgFontSize, other.initialsLgFontSize, t)!,
      initialsXlFontSize: lerpDouble(initialsXlFontSize, other.initialsXlFontSize, t)!,
      iconXsSize:         lerpDouble(iconXsSize,         other.iconXsSize,         t)!,
      iconSmSize:         lerpDouble(iconSmSize,         other.iconSmSize,         t)!,
      iconMdSize:         lerpDouble(iconMdSize,         other.iconMdSize,         t)!,
      iconLgSize:         lerpDouble(iconLgSize,         other.iconLgSize,         t)!,
      iconXlSize:         lerpDouble(iconXlSize,         other.iconXlSize,         t)!,
      squareBorderRadius: BorderRadius.lerp(squareBorderRadius, other.squareBorderRadius, t)!,
    );
  }
}
