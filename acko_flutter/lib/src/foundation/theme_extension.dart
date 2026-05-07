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
    required this.colorSurfaceRaisedActive,
    required this.colorSurfaceOverlay,
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
    required this.colorTextStatic,
    required this.colorBorder,
    required this.colorBorderStrong,
    required this.colorBorderSubtle,
    required this.colorDisabledBg,
    required this.colorDisabledText,
    required this.colorDisabledBorder,
    required this.colorError,
    required this.colorErrorText,
    required this.colorErrorSubtle,
    required this.colorErrorBorder,
    required this.colorSuccess,
    required this.colorSuccessText,
    required this.colorSuccessSubtle,
    required this.colorSuccessBorder,
    required this.colorWarning,
    required this.colorWarningText,
    required this.colorWarningSubtle,
    required this.colorWarningBorder,
    required this.colorInfo,
    required this.colorInfoText,
    required this.colorInfoSubtle,
    required this.colorInfoBorder,
    required this.colorCardBg,
    required this.colorCardBorder,
    required this.colorCardSecondaryBg,
    required this.colorCardSecondaryBorder,
    required this.colorCardElevatedBg,
    required this.colorCardDemotedBg,
    required this.colorCardDemotedBorder,
    required this.colorCardOutlineBorder,
    required this.colorDivider,
    required this.colorDividerStrong,
    required this.colorDividerSubtle,
    required this.colorReadonlyBg,
    required this.colorReadonlyText,
    required this.colorReadonlyBorder,
    required this.colorErrorBadgeBg,
    required this.colorSuccessBadgeBg,
    required this.colorWarningBadgeBg,
    required this.colorInfoBadgeBg,
    required this.colorErrorGradientFrom,
    required this.colorErrorGradientTo,
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
  final Color colorSurfaceRaisedActive;
  final Color colorSurfaceOverlay;
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
  final Color colorTextStatic;
  final Color colorBorder;
  final Color colorBorderStrong;
  final Color colorBorderSubtle;
  final Color colorDisabledBg;
  final Color colorDisabledText;
  final Color colorDisabledBorder;
  final Color colorError;
  final Color colorErrorText;
  final Color colorErrorSubtle;
  final Color colorErrorBorder;
  final Color colorSuccess;
  final Color colorSuccessText;
  final Color colorSuccessSubtle;
  final Color colorSuccessBorder;
  final Color colorWarning;
  final Color colorWarningText;
  final Color colorWarningSubtle;
  final Color colorWarningBorder;
  final Color colorInfo;
  final Color colorInfoText;
  final Color colorInfoSubtle;
  final Color colorInfoBorder;
  final Color colorCardBg;
  final Color colorCardBorder;
  final Color colorCardSecondaryBg;
  final Color colorCardSecondaryBorder;
  final Color colorCardElevatedBg;
  final Color colorCardDemotedBg;
  final Color colorCardDemotedBorder;
  final Color colorCardOutlineBorder;
  final Color colorDivider;
  final Color colorDividerStrong;
  final Color colorDividerSubtle;
  final Color colorReadonlyBg;
  final Color colorReadonlyText;
  final Color colorReadonlyBorder;
  final Color colorErrorBadgeBg;
  final Color colorSuccessBadgeBg;
  final Color colorWarningBadgeBg;
  final Color colorInfoBadgeBg;
  final Color colorErrorGradientFrom;
  final Color colorErrorGradientTo;

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
    colorSurfaceRaisedActive: DsTokens.colorSurfaceRaisedActive,
    colorSurfaceOverlay:      DsTokens.colorSurfaceOverlay,
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
    colorTextStatic:          DsTokens.colorTextStatic,
    colorBorder:              DsTokens.colorBorder,
    colorBorderStrong:        DsTokens.colorBorderStrong,
    colorBorderSubtle:        DsTokens.colorBorderSubtle,
    colorDisabledBg:          DsTokens.colorDisabledBg,
    colorDisabledText:        DsTokens.colorDisabledText,
    colorDisabledBorder:      DsTokens.colorDisabledBorder,
    colorError:               DsTokens.colorError,
    colorErrorText:           DsTokens.colorErrorText,
    colorErrorSubtle:         DsTokens.colorErrorSubtle,
    colorErrorBorder:         DsTokens.colorErrorBorder,
    colorSuccess:             DsTokens.colorSuccess,
    colorSuccessText:         DsTokens.colorSuccessText,
    colorSuccessSubtle:       DsTokens.colorSuccessSubtle,
    colorSuccessBorder:       DsTokens.colorSuccessBorder,
    colorWarning:             DsTokens.colorWarning,
    colorWarningText:         DsTokens.colorWarningText,
    colorWarningSubtle:       DsTokens.colorWarningSubtle,
    colorWarningBorder:       DsTokens.colorWarningBorder,
    colorInfo:                DsTokens.colorInfo,
    colorInfoText:            DsTokens.colorInfoText,
    colorInfoSubtle:          DsTokens.colorInfoSubtle,
    colorInfoBorder:          DsTokens.colorInfoBorder,
    colorCardBg:              DsTokens.colorCardBg,
    colorCardBorder:          DsTokens.colorCardBorder,
    colorCardSecondaryBg:     DsTokens.colorCardSecondaryBg,
    colorCardSecondaryBorder: DsTokens.colorCardSecondaryBorder,
    colorCardElevatedBg:      DsTokens.colorCardElevatedBg,
    colorCardDemotedBg:       DsTokens.colorCardDemotedBg,
    colorCardDemotedBorder:   DsTokens.colorCardDemotedBorder,
    colorCardOutlineBorder:   DsTokens.colorCardOutlineBorder,
    colorDivider:             DsTokens.colorDivider,
    colorDividerStrong:       DsTokens.colorDividerStrong,
    colorDividerSubtle:       DsTokens.colorDividerSubtle,
    colorReadonlyBg:          DsTokens.colorReadonlyBg,
    colorReadonlyText:        DsTokens.colorReadonlyText,
    colorReadonlyBorder:      DsTokens.colorReadonlyBorder,
    colorErrorBadgeBg:        DsTokens.colorErrorBadgeBg,
    colorSuccessBadgeBg:      DsTokens.colorSuccessBadgeBg,
    colorWarningBadgeBg:      DsTokens.colorWarningBadgeBg,
    colorInfoBadgeBg:         DsTokens.colorInfoBadgeBg,
    colorErrorGradientFrom:   DsTokens.colorErrorGradientFrom,
    colorErrorGradientTo:     DsTokens.colorErrorGradientTo,
  );

  static const dark = DsThemeExtension(
    colorPrimary:             Color(0xFF795DEE), // purple500
    colorPrimaryHover:        Color(0xFF8E7CF4), // purple400
    colorPrimaryActive:       Color(0xFFA69CF9), // purple300
    colorPrimaryMuted:        Color(0xFF6841E6), // purple600
    colorPrimarySubtle:       Color(0xFF2B1678), // purple900
    colorPrimaryRing:         Color(0xFF3A1BA5), // purple800
    colorOnPrimary:           Color(0xFFFFFFFF),
    colorSurface:             Color(0xFF424242), // grey750
    colorSurfaceRaised:       Color(0xFF505050), // grey700
    colorSurfaceRaisedHover:  Color(0xFF5E5E5E), // grey650
    colorSurfaceRaisedActive: Color(0xFF6C6C6C), // grey600
    colorSurfaceOverlay:      Color(0xB3000000), // rgba(0,0,0,0.7)
    colorSurfaceGhostHover:   Color(0x0DFFFFFF), // rgba(255,255,255,0.05)
    colorTextPrimary:         Color(0xFFFBFBFB), // grey50
    colorTextDefault:         Color(0xFFF5F5F5), // grey100
    colorTextSupporting:      Color(0xFFDCDCDC), // grey200
    colorTextSecondary:       Color(0xFFB2B2B2), // grey350
    colorTextDisabled:        Color(0xFF969696), // grey450
    colorTextInvert:          Color(0xFFFFFFFF),
    colorTextBrand:           Color(0xFF795DEE), // purple500
    colorTextError:           Color(0xFFF87171), // red400
    colorTextSuccess:         Color(0xFF4ADE80), // green400
    colorTextStatic:          Color(0xFFFFFFFF),
    colorBorder:              Color(0xFF6C6C6C), // grey600
    colorBorderStrong:        Color(0xFF7A7A7A), // grey550
    colorBorderSubtle:        Color(0xFF5E5E5E), // grey650
    colorDisabledBg:          Color(0xFF6C6C6C), // grey600
    colorDisabledText:        Color(0xFF969696), // grey450
    colorDisabledBorder:      Color(0xFF6C6C6C), // grey600
    colorError:               Color(0xFFDC2626), // red600
    colorErrorText:           Color(0xFFF87171), // red400
    colorErrorSubtle:         Color(0xFF450A0A), // red950
    colorErrorBorder:         Color(0xFF991B1B), // red800
    colorSuccess:             Color(0xFF22C55E), // green500
    colorSuccessText:         Color(0xFF4ADE80), // green400
    colorSuccessSubtle:       Color(0xFF052E16), // green950
    colorSuccessBorder:       Color(0xFF166534), // green800
    colorWarning:             Color(0xFFFF8D28), // orange500
    colorWarningText:         Color(0xFFFFA85C), // orange400
    colorWarningSubtle:       Color(0xFF300212), // orange950
    colorWarningBorder:       Color(0xFF8D4301), // orange800
    colorInfo:                Color(0xFF795DEE), // purple500
    colorInfoText:            Color(0xFF8E7CF4), // purple400
    colorInfoSubtle:          Color(0xFF241362), // purple950
    colorInfoBorder:          Color(0xFF3A1BA5), // purple800
    colorCardBg:              Color(0xFF5E5E5E), // grey650
    colorCardBorder:          Color(0xFF6C6C6C), // grey600
    colorCardSecondaryBg:     Color(0xFF505050), // grey700
    colorCardSecondaryBorder: Color(0xFF6C6C6C), // grey600
    colorCardElevatedBg:      Color(0xFF6C6C6C), // grey600
    colorCardDemotedBg:       Color(0xFF424242), // grey750
    colorCardDemotedBorder:   Color(0xFF5E5E5E), // grey650
    colorCardOutlineBorder:   Color(0xFF6C6C6C), // grey600
    colorDivider:             DsTokens.colorDividerDark,
    colorDividerStrong:       DsTokens.colorDividerStrongDark,
    colorDividerSubtle:       DsTokens.colorDividerSubtleDark,
    colorReadonlyBg:          DsTokens.colorReadonlyBgDark,
    colorReadonlyText:        DsTokens.colorReadonlyTextDark,
    colorReadonlyBorder:      DsTokens.colorReadonlyBorderDark,
    colorErrorBadgeBg:        DsTokens.colorErrorBadgeBgDark,
    colorSuccessBadgeBg:      DsTokens.colorSuccessBadgeBgDark,
    colorWarningBadgeBg:      DsTokens.colorWarningBadgeBgDark,
    colorInfoBadgeBg:         DsTokens.colorInfoBadgeBgDark,
    colorErrorGradientFrom:   DsTokens.colorErrorGradientFromDark,
    colorErrorGradientTo:     DsTokens.colorErrorGradientToDark,
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
    Color? colorSurfaceRaisedActive,
    Color? colorSurfaceOverlay,
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
    Color? colorTextStatic,
    Color? colorBorder,
    Color? colorBorderStrong,
    Color? colorBorderSubtle,
    Color? colorDisabledBg,
    Color? colorDisabledText,
    Color? colorDisabledBorder,
    Color? colorError,
    Color? colorErrorText,
    Color? colorErrorSubtle,
    Color? colorErrorBorder,
    Color? colorSuccess,
    Color? colorSuccessText,
    Color? colorSuccessSubtle,
    Color? colorSuccessBorder,
    Color? colorWarning,
    Color? colorWarningText,
    Color? colorWarningSubtle,
    Color? colorWarningBorder,
    Color? colorInfo,
    Color? colorInfoText,
    Color? colorInfoSubtle,
    Color? colorInfoBorder,
    Color? colorCardBg,
    Color? colorCardBorder,
    Color? colorCardSecondaryBg,
    Color? colorCardSecondaryBorder,
    Color? colorCardElevatedBg,
    Color? colorCardDemotedBg,
    Color? colorCardDemotedBorder,
    Color? colorCardOutlineBorder,
    Color? colorDivider,
    Color? colorDividerStrong,
    Color? colorDividerSubtle,
    Color? colorReadonlyBg,
    Color? colorReadonlyText,
    Color? colorReadonlyBorder,
    Color? colorErrorBadgeBg,
    Color? colorSuccessBadgeBg,
    Color? colorWarningBadgeBg,
    Color? colorInfoBadgeBg,
    Color? colorErrorGradientFrom,
    Color? colorErrorGradientTo,
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
      colorSurfaceRaisedActive: colorSurfaceRaisedActive ?? this.colorSurfaceRaisedActive,
      colorSurfaceOverlay:      colorSurfaceOverlay ?? this.colorSurfaceOverlay,
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
      colorTextStatic:          colorTextStatic ?? this.colorTextStatic,
      colorBorder:              colorBorder ?? this.colorBorder,
      colorBorderStrong:        colorBorderStrong ?? this.colorBorderStrong,
      colorBorderSubtle:        colorBorderSubtle ?? this.colorBorderSubtle,
      colorDisabledBg:          colorDisabledBg ?? this.colorDisabledBg,
      colorDisabledText:        colorDisabledText ?? this.colorDisabledText,
      colorDisabledBorder:      colorDisabledBorder ?? this.colorDisabledBorder,
      colorError:               colorError ?? this.colorError,
      colorErrorText:           colorErrorText ?? this.colorErrorText,
      colorErrorSubtle:         colorErrorSubtle ?? this.colorErrorSubtle,
      colorErrorBorder:         colorErrorBorder ?? this.colorErrorBorder,
      colorSuccess:             colorSuccess ?? this.colorSuccess,
      colorSuccessText:         colorSuccessText ?? this.colorSuccessText,
      colorSuccessSubtle:       colorSuccessSubtle ?? this.colorSuccessSubtle,
      colorSuccessBorder:       colorSuccessBorder ?? this.colorSuccessBorder,
      colorWarning:             colorWarning ?? this.colorWarning,
      colorWarningText:         colorWarningText ?? this.colorWarningText,
      colorWarningSubtle:       colorWarningSubtle ?? this.colorWarningSubtle,
      colorWarningBorder:       colorWarningBorder ?? this.colorWarningBorder,
      colorInfo:                colorInfo ?? this.colorInfo,
      colorInfoText:            colorInfoText ?? this.colorInfoText,
      colorInfoSubtle:          colorInfoSubtle ?? this.colorInfoSubtle,
      colorInfoBorder:          colorInfoBorder ?? this.colorInfoBorder,
      colorCardBg:              colorCardBg ?? this.colorCardBg,
      colorCardBorder:          colorCardBorder ?? this.colorCardBorder,
      colorCardSecondaryBg:     colorCardSecondaryBg ?? this.colorCardSecondaryBg,
      colorCardSecondaryBorder: colorCardSecondaryBorder ?? this.colorCardSecondaryBorder,
      colorCardElevatedBg:      colorCardElevatedBg ?? this.colorCardElevatedBg,
      colorCardDemotedBg:       colorCardDemotedBg ?? this.colorCardDemotedBg,
      colorCardDemotedBorder:   colorCardDemotedBorder ?? this.colorCardDemotedBorder,
      colorCardOutlineBorder:   colorCardOutlineBorder ?? this.colorCardOutlineBorder,
      colorDivider:             colorDivider ?? this.colorDivider,
      colorDividerStrong:       colorDividerStrong ?? this.colorDividerStrong,
      colorDividerSubtle:       colorDividerSubtle ?? this.colorDividerSubtle,
      colorReadonlyBg:          colorReadonlyBg ?? this.colorReadonlyBg,
      colorReadonlyText:        colorReadonlyText ?? this.colorReadonlyText,
      colorReadonlyBorder:      colorReadonlyBorder ?? this.colorReadonlyBorder,
      colorErrorBadgeBg:        colorErrorBadgeBg ?? this.colorErrorBadgeBg,
      colorSuccessBadgeBg:      colorSuccessBadgeBg ?? this.colorSuccessBadgeBg,
      colorWarningBadgeBg:      colorWarningBadgeBg ?? this.colorWarningBadgeBg,
      colorInfoBadgeBg:         colorInfoBadgeBg ?? this.colorInfoBadgeBg,
      colorErrorGradientFrom:   colorErrorGradientFrom ?? this.colorErrorGradientFrom,
      colorErrorGradientTo:     colorErrorGradientTo ?? this.colorErrorGradientTo,
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
      colorSurfaceRaisedActive: Color.lerp(colorSurfaceRaisedActive, other.colorSurfaceRaisedActive, t)!,
      colorSurfaceOverlay:      Color.lerp(colorSurfaceOverlay, other.colorSurfaceOverlay, t)!,
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
      colorTextStatic:          Color.lerp(colorTextStatic, other.colorTextStatic, t)!,
      colorBorder:              Color.lerp(colorBorder, other.colorBorder, t)!,
      colorBorderStrong:        Color.lerp(colorBorderStrong, other.colorBorderStrong, t)!,
      colorBorderSubtle:        Color.lerp(colorBorderSubtle, other.colorBorderSubtle, t)!,
      colorDisabledBg:          Color.lerp(colorDisabledBg, other.colorDisabledBg, t)!,
      colorDisabledText:        Color.lerp(colorDisabledText, other.colorDisabledText, t)!,
      colorDisabledBorder:      Color.lerp(colorDisabledBorder, other.colorDisabledBorder, t)!,
      colorError:               Color.lerp(colorError, other.colorError, t)!,
      colorErrorText:           Color.lerp(colorErrorText, other.colorErrorText, t)!,
      colorErrorSubtle:         Color.lerp(colorErrorSubtle, other.colorErrorSubtle, t)!,
      colorErrorBorder:         Color.lerp(colorErrorBorder, other.colorErrorBorder, t)!,
      colorSuccess:             Color.lerp(colorSuccess, other.colorSuccess, t)!,
      colorSuccessText:         Color.lerp(colorSuccessText, other.colorSuccessText, t)!,
      colorSuccessSubtle:       Color.lerp(colorSuccessSubtle, other.colorSuccessSubtle, t)!,
      colorSuccessBorder:       Color.lerp(colorSuccessBorder, other.colorSuccessBorder, t)!,
      colorWarning:             Color.lerp(colorWarning, other.colorWarning, t)!,
      colorWarningText:         Color.lerp(colorWarningText, other.colorWarningText, t)!,
      colorWarningSubtle:       Color.lerp(colorWarningSubtle, other.colorWarningSubtle, t)!,
      colorWarningBorder:       Color.lerp(colorWarningBorder, other.colorWarningBorder, t)!,
      colorInfo:                Color.lerp(colorInfo, other.colorInfo, t)!,
      colorInfoText:            Color.lerp(colorInfoText, other.colorInfoText, t)!,
      colorInfoSubtle:          Color.lerp(colorInfoSubtle, other.colorInfoSubtle, t)!,
      colorInfoBorder:          Color.lerp(colorInfoBorder, other.colorInfoBorder, t)!,
      colorCardBg:              Color.lerp(colorCardBg, other.colorCardBg, t)!,
      colorCardBorder:          Color.lerp(colorCardBorder, other.colorCardBorder, t)!,
      colorCardSecondaryBg:     Color.lerp(colorCardSecondaryBg, other.colorCardSecondaryBg, t)!,
      colorCardSecondaryBorder: Color.lerp(colorCardSecondaryBorder, other.colorCardSecondaryBorder, t)!,
      colorCardElevatedBg:      Color.lerp(colorCardElevatedBg, other.colorCardElevatedBg, t)!,
      colorCardDemotedBg:       Color.lerp(colorCardDemotedBg, other.colorCardDemotedBg, t)!,
      colorCardDemotedBorder:   Color.lerp(colorCardDemotedBorder, other.colorCardDemotedBorder, t)!,
      colorCardOutlineBorder:   Color.lerp(colorCardOutlineBorder, other.colorCardOutlineBorder, t)!,
      colorDivider:             Color.lerp(colorDivider, other.colorDivider, t)!,
      colorDividerStrong:       Color.lerp(colorDividerStrong, other.colorDividerStrong, t)!,
      colorDividerSubtle:       Color.lerp(colorDividerSubtle, other.colorDividerSubtle, t)!,
      colorReadonlyBg:          Color.lerp(colorReadonlyBg, other.colorReadonlyBg, t)!,
      colorReadonlyText:        Color.lerp(colorReadonlyText, other.colorReadonlyText, t)!,
      colorReadonlyBorder:      Color.lerp(colorReadonlyBorder, other.colorReadonlyBorder, t)!,
      colorErrorBadgeBg:        Color.lerp(colorErrorBadgeBg, other.colorErrorBadgeBg, t)!,
      colorSuccessBadgeBg:      Color.lerp(colorSuccessBadgeBg, other.colorSuccessBadgeBg, t)!,
      colorWarningBadgeBg:      Color.lerp(colorWarningBadgeBg, other.colorWarningBadgeBg, t)!,
      colorInfoBadgeBg:         Color.lerp(colorInfoBadgeBg, other.colorInfoBadgeBg, t)!,
      colorErrorGradientFrom:   Color.lerp(colorErrorGradientFrom, other.colorErrorGradientFrom, t)!,
      colorErrorGradientTo:     Color.lerp(colorErrorGradientTo, other.colorErrorGradientTo, t)!,
    );
  }
}
