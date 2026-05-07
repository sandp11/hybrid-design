import 'package:flutter/material.dart';
import 'tokens.dart';

class DsThemeExtension extends ThemeExtension<DsThemeExtension> {
  const DsThemeExtension({
    required this.colorPrimary,
    required this.colorPrimaryHover,
    required this.colorPrimaryActive,
    required this.colorPrimaryMuted,
    required this.colorPrimarySubtle,
    required this.colorPrimaryRing,
    required this.colorOnPrimary,
    required this.colorSurface,
    required this.colorSurfaceRaised,
    required this.colorSurfaceRaisedHover,
    required this.colorSurfaceGhostHover,
    required this.colorTextPrimary,
    required this.colorTextDefault,
    required this.colorTextSupporting,
    required this.colorTextSecondary,
    required this.colorTextDisabled,
    required this.colorTextInvert,
    required this.colorTextBrand,
    required this.colorTextError,
    required this.colorTextSuccess,
    required this.colorBorder,
    required this.colorBorderStrong,
    required this.colorBorderSubtle,
    required this.colorDisabledBg,
    required this.colorDisabledText,
    required this.colorError,
    required this.colorErrorText,
    required this.colorErrorSubtle,
    required this.colorErrorBorder,
    required this.colorSuccess,
    required this.colorSuccessText,
    required this.colorSuccessSubtle,
    required this.colorWarning,
    required this.colorWarningText,
    required this.colorInfo,
    required this.colorInfoText,
    required this.colorCardBg,
    required this.colorCardBorder,
  });

  final Color colorPrimary;
  final Color colorPrimaryHover;
  final Color colorPrimaryActive;
  final Color colorPrimaryMuted;
  final Color colorPrimarySubtle;
  final Color colorPrimaryRing;
  final Color colorOnPrimary;
  final Color colorSurface;
  final Color colorSurfaceRaised;
  final Color colorSurfaceRaisedHover;
  final Color colorSurfaceGhostHover;
  final Color colorTextPrimary;
  final Color colorTextDefault;
  final Color colorTextSupporting;
  final Color colorTextSecondary;
  final Color colorTextDisabled;
  final Color colorTextInvert;
  final Color colorTextBrand;
  final Color colorTextError;
  final Color colorTextSuccess;
  final Color colorBorder;
  final Color colorBorderStrong;
  final Color colorBorderSubtle;
  final Color colorDisabledBg;
  final Color colorDisabledText;
  final Color colorError;
  final Color colorErrorText;
  final Color colorErrorSubtle;
  final Color colorErrorBorder;
  final Color colorSuccess;
  final Color colorSuccessText;
  final Color colorSuccessSubtle;
  final Color colorWarning;
  final Color colorWarningText;
  final Color colorInfo;
  final Color colorInfoText;
  final Color colorCardBg;
  final Color colorCardBorder;

  static const light = DsThemeExtension(
    colorPrimary:             DsTokens.colorPrimary,
    colorPrimaryHover:        DsTokens.colorPrimaryHover,
    colorPrimaryActive:       DsTokens.colorPrimaryActive,
    colorPrimaryMuted:        DsTokens.colorPrimaryMuted,
    colorPrimarySubtle:       DsTokens.colorPrimarySubtle,
    colorPrimaryRing:         DsTokens.colorPrimaryRing,
    colorOnPrimary:           DsTokens.colorOnPrimary,
    colorSurface:             DsTokens.colorSurface,
    colorSurfaceRaised:       DsTokens.colorSurfaceRaised,
    colorSurfaceRaisedHover:  DsTokens.colorSurfaceRaisedHover,
    colorSurfaceGhostHover:   DsTokens.colorSurfaceGhostHover,
    colorTextPrimary:         DsTokens.colorTextPrimary,
    colorTextDefault:         DsTokens.colorTextDefault,
    colorTextSupporting:      DsTokens.colorTextSupporting,
    colorTextSecondary:       DsTokens.colorTextSecondary,
    colorTextDisabled:        DsTokens.colorTextDisabled,
    colorTextInvert:          DsTokens.colorTextInvert,
    colorTextBrand:           DsTokens.colorTextBrand,
    colorTextError:           DsTokens.colorTextError,
    colorTextSuccess:         DsTokens.colorTextSuccess,
    colorBorder:              DsTokens.colorBorder,
    colorBorderStrong:        DsTokens.colorBorderStrong,
    colorBorderSubtle:        DsTokens.colorBorderSubtle,
    colorDisabledBg:          DsTokens.colorDisabledBg,
    colorDisabledText:        DsTokens.colorDisabledText,
    colorError:               DsTokens.colorError,
    colorErrorText:           DsTokens.colorErrorText,
    colorErrorSubtle:         DsTokens.colorErrorSubtle,
    colorErrorBorder:         DsTokens.colorErrorBorder,
    colorSuccess:             DsTokens.colorSuccess,
    colorSuccessText:         DsTokens.colorSuccessText,
    colorSuccessSubtle:       DsTokens.colorSuccessSubtle,
    colorWarning:             DsTokens.colorWarning,
    colorWarningText:         DsTokens.colorWarningText,
    colorInfo:                DsTokens.colorInfo,
    colorInfoText:            DsTokens.colorInfoText,
    colorCardBg:              DsTokens.colorCardBg,
    colorCardBorder:          DsTokens.colorCardBorder,
  );

  static const dark = DsThemeExtension(
    colorPrimary:             Color(0xFF7A62F0), // purple-500
    colorPrimaryHover:        Color(0xFF9B8FF6), // purple-400
    colorPrimaryActive:       Color(0xFFBDB8FA), // purple-300
    colorPrimaryMuted:        Color(0xFF6841E6), // purple-600
    colorPrimarySubtle:       Color(0xFF3E2290), // purple-900
    colorPrimaryRing:         Color(0xFF4E29BB), // purple-800
    colorOnPrimary:           Color(0xFFFFFFFF),
    colorSurface:             Color(0xFF0F0F10), // grey-750
    colorSurfaceRaised:       Color(0xFF141414), // grey-700
    colorSurfaceRaisedHover:  Color(0xFF19191A), // grey-650
    colorSurfaceGhostHover:   Color(0x0DFFFFFF), // rgba(255,255,255,0.05)
    colorTextPrimary:         Color(0xFFFBFBFB), // grey-50
    colorTextDefault:         Color(0xFFF5F5F5), // grey-100
    colorTextSupporting:      Color(0xFFE0E0E1), // grey-200
    colorTextSecondary:       Color(0xFF8F8E92), // grey-350
    colorTextDisabled:        Color(0xFF605F63), // grey-450
    colorTextInvert:          Color(0xFFFFFFFF),
    colorTextBrand:           Color(0xFF7A62F0), // purple-500
    colorTextError:           Color(0xFFF87171), // red-400
    colorTextSuccess:         Color(0xFF4ADE80), // green-400
    colorBorder:              Color(0xFF242324), // grey-600
    colorBorderStrong:        Color(0xFF333333), // grey-550
    colorBorderSubtle:        Color(0xFF19191A), // grey-650
    colorDisabledBg:          Color(0xFF242324), // grey-600
    colorDisabledText:        Color(0xFF605F63), // grey-450
    colorError:               Color(0xFFDC2626), // red-600
    colorErrorText:           Color(0xFFF87171), // red-400
    colorErrorSubtle:         Color(0xFF450A0A), // red-950
    colorErrorBorder:         Color(0xFF991B1B), // red-800
    colorSuccess:             Color(0xFF22C55E), // green-500
    colorSuccessText:         Color(0xFF4ADE80), // green-400
    colorSuccessSubtle:       Color(0xFF052E16), // green-950
    colorWarning:             Color(0xFFFF8D28), // orange-500
    colorWarningText:         Color(0xFFFFA85C), // orange-400
    colorInfo:                Color(0xFF7A62F0), // purple-500
    colorInfoText:            Color(0xFF9B8FF6), // purple-400
    colorCardBg:              Color(0xFF19191A), // grey-650
    colorCardBorder:          Color(0xFF19191A), // grey-650
  );

  @override
  DsThemeExtension copyWith({
    Color? colorPrimary,
    Color? colorPrimaryHover,
    Color? colorPrimaryActive,
    Color? colorPrimaryMuted,
    Color? colorPrimarySubtle,
    Color? colorPrimaryRing,
    Color? colorOnPrimary,
    Color? colorSurface,
    Color? colorSurfaceRaised,
    Color? colorSurfaceRaisedHover,
    Color? colorSurfaceGhostHover,
    Color? colorTextPrimary,
    Color? colorTextDefault,
    Color? colorTextSupporting,
    Color? colorTextSecondary,
    Color? colorTextDisabled,
    Color? colorTextInvert,
    Color? colorTextBrand,
    Color? colorTextError,
    Color? colorTextSuccess,
    Color? colorBorder,
    Color? colorBorderStrong,
    Color? colorBorderSubtle,
    Color? colorDisabledBg,
    Color? colorDisabledText,
    Color? colorError,
    Color? colorErrorText,
    Color? colorErrorSubtle,
    Color? colorErrorBorder,
    Color? colorSuccess,
    Color? colorSuccessText,
    Color? colorSuccessSubtle,
    Color? colorWarning,
    Color? colorWarningText,
    Color? colorInfo,
    Color? colorInfoText,
    Color? colorCardBg,
    Color? colorCardBorder,
  }) {
    return DsThemeExtension(
      colorPrimary:             colorPrimary ?? this.colorPrimary,
      colorPrimaryHover:        colorPrimaryHover ?? this.colorPrimaryHover,
      colorPrimaryActive:       colorPrimaryActive ?? this.colorPrimaryActive,
      colorPrimaryMuted:        colorPrimaryMuted ?? this.colorPrimaryMuted,
      colorPrimarySubtle:       colorPrimarySubtle ?? this.colorPrimarySubtle,
      colorPrimaryRing:         colorPrimaryRing ?? this.colorPrimaryRing,
      colorOnPrimary:           colorOnPrimary ?? this.colorOnPrimary,
      colorSurface:             colorSurface ?? this.colorSurface,
      colorSurfaceRaised:       colorSurfaceRaised ?? this.colorSurfaceRaised,
      colorSurfaceRaisedHover:  colorSurfaceRaisedHover ?? this.colorSurfaceRaisedHover,
      colorSurfaceGhostHover:   colorSurfaceGhostHover ?? this.colorSurfaceGhostHover,
      colorTextPrimary:         colorTextPrimary ?? this.colorTextPrimary,
      colorTextDefault:         colorTextDefault ?? this.colorTextDefault,
      colorTextSupporting:      colorTextSupporting ?? this.colorTextSupporting,
      colorTextSecondary:       colorTextSecondary ?? this.colorTextSecondary,
      colorTextDisabled:        colorTextDisabled ?? this.colorTextDisabled,
      colorTextInvert:          colorTextInvert ?? this.colorTextInvert,
      colorTextBrand:           colorTextBrand ?? this.colorTextBrand,
      colorTextError:           colorTextError ?? this.colorTextError,
      colorTextSuccess:         colorTextSuccess ?? this.colorTextSuccess,
      colorBorder:              colorBorder ?? this.colorBorder,
      colorBorderStrong:        colorBorderStrong ?? this.colorBorderStrong,
      colorBorderSubtle:        colorBorderSubtle ?? this.colorBorderSubtle,
      colorDisabledBg:          colorDisabledBg ?? this.colorDisabledBg,
      colorDisabledText:        colorDisabledText ?? this.colorDisabledText,
      colorError:               colorError ?? this.colorError,
      colorErrorText:           colorErrorText ?? this.colorErrorText,
      colorErrorSubtle:         colorErrorSubtle ?? this.colorErrorSubtle,
      colorErrorBorder:         colorErrorBorder ?? this.colorErrorBorder,
      colorSuccess:             colorSuccess ?? this.colorSuccess,
      colorSuccessText:         colorSuccessText ?? this.colorSuccessText,
      colorSuccessSubtle:       colorSuccessSubtle ?? this.colorSuccessSubtle,
      colorWarning:             colorWarning ?? this.colorWarning,
      colorWarningText:         colorWarningText ?? this.colorWarningText,
      colorInfo:                colorInfo ?? this.colorInfo,
      colorInfoText:            colorInfoText ?? this.colorInfoText,
      colorCardBg:              colorCardBg ?? this.colorCardBg,
      colorCardBorder:          colorCardBorder ?? this.colorCardBorder,
    );
  }

  @override
  DsThemeExtension lerp(DsThemeExtension? other, double t) {
    if (other == null) return this;
    return DsThemeExtension(
      colorPrimary:             Color.lerp(colorPrimary, other.colorPrimary, t)!,
      colorPrimaryHover:        Color.lerp(colorPrimaryHover, other.colorPrimaryHover, t)!,
      colorPrimaryActive:       Color.lerp(colorPrimaryActive, other.colorPrimaryActive, t)!,
      colorPrimaryMuted:        Color.lerp(colorPrimaryMuted, other.colorPrimaryMuted, t)!,
      colorPrimarySubtle:       Color.lerp(colorPrimarySubtle, other.colorPrimarySubtle, t)!,
      colorPrimaryRing:         Color.lerp(colorPrimaryRing, other.colorPrimaryRing, t)!,
      colorOnPrimary:           Color.lerp(colorOnPrimary, other.colorOnPrimary, t)!,
      colorSurface:             Color.lerp(colorSurface, other.colorSurface, t)!,
      colorSurfaceRaised:       Color.lerp(colorSurfaceRaised, other.colorSurfaceRaised, t)!,
      colorSurfaceRaisedHover:  Color.lerp(colorSurfaceRaisedHover, other.colorSurfaceRaisedHover, t)!,
      colorSurfaceGhostHover:   Color.lerp(colorSurfaceGhostHover, other.colorSurfaceGhostHover, t)!,
      colorTextPrimary:         Color.lerp(colorTextPrimary, other.colorTextPrimary, t)!,
      colorTextDefault:         Color.lerp(colorTextDefault, other.colorTextDefault, t)!,
      colorTextSupporting:      Color.lerp(colorTextSupporting, other.colorTextSupporting, t)!,
      colorTextSecondary:       Color.lerp(colorTextSecondary, other.colorTextSecondary, t)!,
      colorTextDisabled:        Color.lerp(colorTextDisabled, other.colorTextDisabled, t)!,
      colorTextInvert:          Color.lerp(colorTextInvert, other.colorTextInvert, t)!,
      colorTextBrand:           Color.lerp(colorTextBrand, other.colorTextBrand, t)!,
      colorTextError:           Color.lerp(colorTextError, other.colorTextError, t)!,
      colorTextSuccess:         Color.lerp(colorTextSuccess, other.colorTextSuccess, t)!,
      colorBorder:              Color.lerp(colorBorder, other.colorBorder, t)!,
      colorBorderStrong:        Color.lerp(colorBorderStrong, other.colorBorderStrong, t)!,
      colorBorderSubtle:        Color.lerp(colorBorderSubtle, other.colorBorderSubtle, t)!,
      colorDisabledBg:          Color.lerp(colorDisabledBg, other.colorDisabledBg, t)!,
      colorDisabledText:        Color.lerp(colorDisabledText, other.colorDisabledText, t)!,
      colorError:               Color.lerp(colorError, other.colorError, t)!,
      colorErrorText:           Color.lerp(colorErrorText, other.colorErrorText, t)!,
      colorErrorSubtle:         Color.lerp(colorErrorSubtle, other.colorErrorSubtle, t)!,
      colorErrorBorder:         Color.lerp(colorErrorBorder, other.colorErrorBorder, t)!,
      colorSuccess:             Color.lerp(colorSuccess, other.colorSuccess, t)!,
      colorSuccessText:         Color.lerp(colorSuccessText, other.colorSuccessText, t)!,
      colorSuccessSubtle:       Color.lerp(colorSuccessSubtle, other.colorSuccessSubtle, t)!,
      colorWarning:             Color.lerp(colorWarning, other.colorWarning, t)!,
      colorWarningText:         Color.lerp(colorWarningText, other.colorWarningText, t)!,
      colorInfo:                Color.lerp(colorInfo, other.colorInfo, t)!,
      colorInfoText:            Color.lerp(colorInfoText, other.colorInfoText, t)!,
      colorCardBg:              Color.lerp(colorCardBg, other.colorCardBg, t)!,
      colorCardBorder:          Color.lerp(colorCardBorder, other.colorCardBorder, t)!,
    );
  }
}
