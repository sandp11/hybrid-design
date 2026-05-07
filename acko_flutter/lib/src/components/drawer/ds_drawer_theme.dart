import 'package:flutter/material.dart';
import '../../../../src/foundation/tokens.dart';

/// Theme extension for DsDrawer.
/// Apply via ThemeData.extensions or DsThemeExtension.
class DsDrawerTheme extends ThemeExtension<DsDrawerTheme> {
  const DsDrawerTheme({
    required this.backdropColor,
    required this.panelColor,
    required this.panelShadow,
    required this.headerBorderColor,
    required this.footerBorderColor,
    required this.titleStyle,
    required this.descriptionStyle,
    required this.bodyColor,
    required this.closeIconColor,
    required this.closeButtonHoverColor,
  });

  final Color backdropColor;
  final Color panelColor;
  final BoxShadow panelShadow;
  final Color headerBorderColor;
  final Color footerBorderColor;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final Color bodyColor;
  final Color closeIconColor;
  final Color closeButtonHoverColor;

  // ── Light theme defaults ──────────────────────────────────────────────────
  static const light = DsDrawerTheme(
    backdropColor: DsTokens.colorSurfaceOverlay,
    panelColor: DsTokens.colorSurfaceRaised,
    panelShadow: BoxShadow(
      // shadow-modal → shadow-xl: 0 4px 24px rgba(0,0,0,0.10)
      color: Color(0x1A000000),
      blurRadius: 24,
      offset: Offset(0, 4),
    ),
    headerBorderColor: DsTokens.colorBorderSubtle,
    footerBorderColor: DsTokens.colorBorderSubtle,
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
    bodyColor: DsTokens.colorTextDefault,
    closeIconColor: DsTokens.colorTextSecondary,
    closeButtonHoverColor: DsTokens.colorSurfaceGhostHover,
  );

  // ── Dark theme defaults ───────────────────────────────────────────────────
  static const dark = DsDrawerTheme(
    backdropColor: DsTokens.colorSurfaceOverlayDark,
    panelColor: DsTokens.colorSurfaceRaisedDark,
    panelShadow: BoxShadow(
      color: Color(0x33000000),
      blurRadius: 24,
      offset: Offset(0, 4),
    ),
    headerBorderColor: DsTokens.colorBorderSubtleDark,
    footerBorderColor: DsTokens.colorBorderSubtleDark,
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
    bodyColor: DsTokens.colorTextDefaultDark,
    closeIconColor: DsTokens.colorTextSecondaryDark,
    closeButtonHoverColor: DsTokens.colorSurfaceGhostHoverDark,
  );

  // ── ThemeExtension boilerplate ────────────────────────────────────────────
  @override
  DsDrawerTheme copyWith({
    Color? backdropColor,
    Color? panelColor,
    BoxShadow? panelShadow,
    Color? headerBorderColor,
    Color? footerBorderColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    Color? bodyColor,
    Color? closeIconColor,
    Color? closeButtonHoverColor,
  }) {
    return DsDrawerTheme(
      backdropColor: backdropColor ?? this.backdropColor,
      panelColor: panelColor ?? this.panelColor,
      panelShadow: panelShadow ?? this.panelShadow,
      headerBorderColor: headerBorderColor ?? this.headerBorderColor,
      footerBorderColor: footerBorderColor ?? this.footerBorderColor,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      bodyColor: bodyColor ?? this.bodyColor,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      closeButtonHoverColor: closeButtonHoverColor ?? this.closeButtonHoverColor,
    );
  }

  @override
  DsDrawerTheme lerp(DsDrawerTheme? other, double t) {
    if (other == null) return this;
    return DsDrawerTheme(
      backdropColor: Color.lerp(backdropColor, other.backdropColor, t)!,
      panelColor: Color.lerp(panelColor, other.panelColor, t)!,
      panelShadow: BoxShadow.lerp(panelShadow, other.panelShadow, t)!,
      headerBorderColor: Color.lerp(headerBorderColor, other.headerBorderColor, t)!,
      footerBorderColor: Color.lerp(footerBorderColor, other.footerBorderColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      descriptionStyle: TextStyle.lerp(descriptionStyle, other.descriptionStyle, t)!,
      bodyColor: Color.lerp(bodyColor, other.bodyColor, t)!,
      closeIconColor: Color.lerp(closeIconColor, other.closeIconColor, t)!,
      closeButtonHoverColor:
          Color.lerp(closeButtonHoverColor, other.closeButtonHoverColor, t)!,
    );
  }
}
