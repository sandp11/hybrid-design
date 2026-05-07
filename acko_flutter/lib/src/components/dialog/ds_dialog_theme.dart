import 'package:flutter/material.dart';
import '../../../../src/foundation/tokens.dart';

/// Theme extension for DsDialog.
/// Apply via ThemeData.extensions or DsThemeExtension.
class DsDialogTheme extends ThemeExtension<DsDialogTheme> {
  const DsDialogTheme({
    required this.backdropColor,
    required this.panelColor,
    required this.panelRadius,
    required this.panelShadow,
    required this.titleStyle,
    required this.descriptionStyle,
    required this.footerBorderColor,
    required this.closeButtonHoverColor,
    required this.closeIconColor,
  });

  final Color backdropColor;
  final Color panelColor;
  final BorderRadius panelRadius;
  final BoxShadow panelShadow;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final Color footerBorderColor;
  final Color closeButtonHoverColor;
  final Color closeIconColor;

  // ── Light theme defaults ──────────────────────────────────────────────────
  static const light = DsDialogTheme(
    backdropColor: DsTokens.colorSurfaceOverlay,
    panelColor: DsTokens.colorSurfaceRaised,
    panelRadius: BorderRadius.all(Radius.circular(20)), // radius-4xl
    panelShadow: BoxShadow(
      // shadow-lg: 0px 2px 16px 4px rgba(0,0,0,0.04)
      color: Color(0x0A000000),
      blurRadius: 16,
      spreadRadius: 4,
      offset: Offset(0, 2),
    ),
    titleStyle: TextStyle(
      fontSize: 18, // font-body-lg
      height: 1.33,
      fontWeight: FontWeight.w600,
      color: DsTokens.colorTextDefault,
    ),
    descriptionStyle: TextStyle(
      fontSize: 14, // font-body-sm
      height: 1.43,
      fontWeight: FontWeight.w400,
      color: DsTokens.colorTextSecondary,
    ),
    footerBorderColor: DsTokens.colorBorderSubtle,
    closeButtonHoverColor: DsTokens.colorSurfaceGhostHover,
    closeIconColor: DsTokens.colorTextSecondary,
  );

  // ── Dark theme defaults ───────────────────────────────────────────────────
  static const dark = DsDialogTheme(
    backdropColor: DsTokens.colorSurfaceOverlayDark,
    panelColor: DsTokens.colorSurfaceRaisedDark,
    panelRadius: BorderRadius.all(Radius.circular(20)),
    panelShadow: BoxShadow(
      color: Color(0x29000000),
      blurRadius: 16,
      spreadRadius: 4,
      offset: Offset(0, 2),
    ),
    titleStyle: TextStyle(
      fontSize: 18,
      height: 1.33,
      fontWeight: FontWeight.w600,
      color: DsTokens.colorTextDefaultDark,
    ),
    descriptionStyle: TextStyle(
      fontSize: 14,
      height: 1.43,
      fontWeight: FontWeight.w400,
      color: DsTokens.colorTextSecondaryDark,
    ),
    footerBorderColor: DsTokens.colorBorderSubtleDark,
    closeButtonHoverColor: DsTokens.colorSurfaceGhostHoverDark,
    closeIconColor: DsTokens.colorTextSecondaryDark,
  );

  // ── ThemeExtension boilerplate ────────────────────────────────────────────
  @override
  DsDialogTheme copyWith({
    Color? backdropColor,
    Color? panelColor,
    BorderRadius? panelRadius,
    BoxShadow? panelShadow,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    Color? footerBorderColor,
    Color? closeButtonHoverColor,
    Color? closeIconColor,
  }) {
    return DsDialogTheme(
      backdropColor: backdropColor ?? this.backdropColor,
      panelColor: panelColor ?? this.panelColor,
      panelRadius: panelRadius ?? this.panelRadius,
      panelShadow: panelShadow ?? this.panelShadow,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      footerBorderColor: footerBorderColor ?? this.footerBorderColor,
      closeButtonHoverColor: closeButtonHoverColor ?? this.closeButtonHoverColor,
      closeIconColor: closeIconColor ?? this.closeIconColor,
    );
  }

  @override
  DsDialogTheme lerp(DsDialogTheme? other, double t) {
    if (other == null) return this;
    return DsDialogTheme(
      backdropColor: Color.lerp(backdropColor, other.backdropColor, t)!,
      panelColor: Color.lerp(panelColor, other.panelColor, t)!,
      panelRadius: BorderRadius.lerp(panelRadius, other.panelRadius, t)!,
      panelShadow: BoxShadow.lerp(panelShadow, other.panelShadow, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      descriptionStyle: TextStyle.lerp(descriptionStyle, other.descriptionStyle, t)!,
      footerBorderColor: Color.lerp(footerBorderColor, other.footerBorderColor, t)!,
      closeButtonHoverColor: Color.lerp(closeButtonHoverColor, other.closeButtonHoverColor, t)!,
      closeIconColor: Color.lerp(closeIconColor, other.closeIconColor, t)!,
    );
  }
}
