// Light-mode static constants. Dark-mode values live in DsThemeExtension.dark.
// Dark-suffixed constants are provided here for component themes that declare
// separate static light/dark presets (e.g. DsDialogTheme.light / .dark).

import 'package:flutter/material.dart';

abstract class DsTokens {
  // ─── Brand / Primary ─────────────────────────────────────────────────
  static const Color colorPrimary         = Color(0xFF6841E6); // purple600
  static const Color colorPrimaryHover    = Color(0xFF491FD4); // purple700
  static const Color colorPrimaryActive   = Color(0xFF3A1BA5); // purple800
  static const Color colorPrimaryMuted    = Color(0xFF8E7CF4); // purple400
  static const Color colorPrimarySubtle   = Color(0xFFE1E0FE); // purple100
  static const Color colorPrimaryRing     = Color(0xFFC1BDFC); // purple200
  static const Color colorOnPrimary       = Color(0xFFFFFFFF);

  // ─── Surfaces ────────────────────────────────────────────────────────
  static const Color colorSurface             = Color(0xFFF5F5F5); // grey100
  static const Color colorSurfaceRaised       = Color(0xFFF5F5F5); // grey100
  static const Color colorSurfaceRaisedHover  = Color(0xFFDCDCDC); // grey200
  static const Color colorSurfaceRaisedActive = Color(0xFFC0C0C0); // grey300
  static const Color colorSurfaceOverlay      = Color(0x80343434); // rgba(52,52,52,0.5) grey800
  static const Color colorSurfaceGhostHover   = Color(0x0A000000); // rgba(0,0,0,0.04)

  // Dark surface variants
  static const Color colorSurfaceRaisedDark       = Color(0xFF505050); // grey700
  static const Color colorSurfaceOverlayDark      = Color(0xB3000000); // rgba(0,0,0,0.7)
  static const Color colorSurfaceGhostHoverDark   = Color(0x0DFFFFFF); // rgba(255,255,255,0.05)

  // ─── Text ─────────────────────────────────────────────────────────────
  static const Color colorTextPrimary    = Color(0xFF343434); // grey800
  static const Color colorTextDefault    = Color(0xFF505050); // grey700
  static const Color colorTextSupporting = Color(0xFF7A7A7A); // grey550
  static const Color colorTextSecondary  = Color(0xFF969696); // grey450
  static const Color colorTextDisabled   = Color(0xFFC0C0C0); // grey300
  static const Color colorTextInvert     = Color(0xFFFFFFFF);
  static const Color colorTextBrand      = Color(0xFF6841E6); // purple600
  static const Color colorTextError      = Color(0xFFB91C1C); // red700
  static const Color colorTextSuccess    = Color(0xFF15803D); // green700
  static const Color colorTextStatic     = Color(0xFFFFFFFF);

  // Dark text variants
  static const Color colorTextDefaultDark   = Color(0xFFF5F5F5); // grey100
  static const Color colorTextSecondaryDark = Color(0xFFB2B2B2); // grey350

  // ─── Borders ──────────────────────────────────────────────────────────
  static const Color colorBorder        = Color(0xFFC0C0C0); // grey300
  static const Color colorBorderStrong  = Color(0xFF969696); // grey450
  static const Color colorBorderSubtle  = Color(0xFFDCDCDC); // grey200

  // Dark border variants
  static const Color colorBorderSubtleDark = Color(0xFF5E5E5E); // grey650

  // ─── Disabled ─────────────────────────────────────────────────────────
  static const Color colorDisabledBg     = Color(0xFFEBEBEB); // grey150
  static const Color colorDisabledText   = Color(0xFFB2B2B2); // grey350
  static const Color colorDisabledBorder = Color(0xFFDCDCDC); // grey200

  // ─── Feedback ─────────────────────────────────────────────────────────
  static const Color colorError         = Color(0xFFDC2626); // red600
  static const Color colorErrorText     = Color(0xFFB91C1C); // red700
  static const Color colorErrorSubtle   = Color(0xFFFEE2E2); // red100
  static const Color colorErrorBorder   = Color(0xFFFECACA); // red200

  static const Color colorSuccess        = Color(0xFF16A34A); // green600
  static const Color colorSuccessText    = Color(0xFF15803D); // green700
  static const Color colorSuccessSubtle  = Color(0xFFDCFCE7); // green100
  static const Color colorSuccessBorder  = Color(0xFFBBF7D0); // green200

  static const Color colorWarning        = Color(0xFFEB740A); // orange600
  static const Color colorWarningText    = Color(0xFFB65C0C); // orange700
  static const Color colorWarningSubtle  = Color(0xFFFFF3E5); // orange50
  static const Color colorWarningBorder  = Color(0xFFFFE5CC); // orange100

  static const Color colorInfo           = Color(0xFF6841E6); // purple600
  static const Color colorInfoText       = Color(0xFF491FD4); // purple700
  static const Color colorInfoSubtle     = Color(0xFFE1E0FE); // purple100
  static const Color colorInfoBorder     = Color(0xFFC1BDFC); // purple200

  // Dark feedback variants
  static const Color colorErrorTextDark    = Color(0xFFF87171); // red400
  static const Color colorErrorSubtleDark  = Color(0xFF450A0A); // red950
  static const Color colorErrorBorderDark  = Color(0xFF991B1B); // red800

  static const Color colorSuccessTextDark   = Color(0xFF4ADE80); // green400
  static const Color colorSuccessSubtleDark = Color(0xFF052E16); // green950
  static const Color colorSuccessBorderDark = Color(0xFF166534); // green800

  static const Color colorWarningTextDark   = Color(0xFFFFA85C); // orange400
  static const Color colorWarningSubtleDark = Color(0xFF300212); // orange950
  static const Color colorWarningBorderDark = Color(0xFF8D4301); // orange800

  static const Color colorInfoTextDark   = Color(0xFF8E7CF4); // purple400
  static const Color colorInfoSubtleDark = Color(0xFF241362); // purple950
  static const Color colorInfoBorderDark = Color(0xFF3A1BA5); // purple800

  // ─── Dividers ─────────────────────────────────────────────────────────
  static const Color colorDivider       = Color(0xFFDCDCDC); // grey200
  static const Color colorDividerStrong = Color(0xFFC0C0C0); // grey300
  static const Color colorDividerSubtle = Color(0xFFEBEBEB); // grey150

  // Dark divider variants
  static const Color colorDividerDark       = Color(0xFF5E5E5E); // grey650
  static const Color colorDividerStrongDark = Color(0xFF6C6C6C); // grey600
  static const Color colorDividerSubtleDark = Color(0xFF505050); // grey700

  // ─── Readonly ─────────────────────────────────────────────────────────
  static const Color colorReadonlyBg     = Color(0xFFF5F5F5); // grey100
  static const Color colorReadonlyText   = Color(0xFF505050); // grey700
  static const Color colorReadonlyBorder = Color(0xFFCECECE); // grey250

  // Dark readonly variants
  static const Color colorReadonlyBgDark     = Color(0xFF505050); // grey700
  static const Color colorReadonlyTextDark   = Color(0xFFDCDCDC); // grey200
  static const Color colorReadonlyBorderDark = Color(0xFF6C6C6C); // grey600

  // ─── Feedback badge backgrounds ───────────────────────────────────────
  static const Color colorErrorBadgeBg   = Color(0xFFFEE2E2); // red100
  static const Color colorSuccessBadgeBg = Color(0xFFBBF7D0); // green200
  static const Color colorWarningBadgeBg = Color(0xFFFFCB9E); // orange200
  static const Color colorInfoBadgeBg    = Color(0xFFC1BDFC); // purple200

  // Dark badge bg variants
  static const Color colorErrorBadgeBgDark   = Color(0xFF7F1D1D); // red900
  static const Color colorSuccessBadgeBgDark = Color(0xFF14532D); // green900
  static const Color colorWarningBadgeBgDark = Color(0xFF521F00); // orange900
  static const Color colorInfoBadgeBgDark    = Color(0xFF2B1678); // purple900

  // ─── Error gradient (input error borders) ─────────────────────────────
  static const Color colorErrorGradientFrom = Color(0xFFFECACA); // red200
  static const Color colorErrorGradientTo   = Color(0xFFEBEBEB); // grey150

  // Dark error gradient variants
  static const Color colorErrorGradientFromDark = Color(0xFF991B1B); // red800
  static const Color colorErrorGradientToDark   = Color(0xFF6C6C6C); // grey600

  // ─── Button ───────────────────────────────────────────────────────────
  static const Color colorBtnSecondaryBg     = Color(0xFFF3F3FF); // purple50
  static const Color colorBtnSecondaryBorder = Color(0xFFA69CF9); // purple300
  static const Color colorBtnSecondaryText   = Color(0xFF491FD4); // purple700
  static const Color colorBtnInvertedBg      = Color(0xFFFFFFFF); // greyWhite
  static const Color colorBtnInvertedText    = Color(0xFF343434); // grey800
  static const Color colorBtnGhostColor      = Color(0xFF6841E6); // purple600
  static const Color colorBtnGhostHoverBg    = Color(0xFFF3F3FF); // purple50
  static const Color colorBtnLinkColor       = Color(0xFF2563EB); // blue600
  static const Color colorBtnDangerBg        = Color(0xFFFEE2E2); // red100
  static const Color colorBtnDangerText      = Color(0xFFEF4444); // red500
  static const Color colorBtnDisabledBg      = Color(0xFFEBEBEB); // grey150
  static const Color colorBtnDisabledText    = Color(0xFFB2B2B2); // grey350

  // ─── Cards ────────────────────────────────────────────────────────────
  static const Color colorCardBg              = Color(0xFFFBFBFB); // grey50
  static const Color colorCardBorder          = Color(0xFFFFFFFF); // greyWhite
  static const Color colorCardSecondaryBg     = Color(0xFFF5F5F5); // grey100
  static const Color colorCardSecondaryBorder = Color(0xFFEBEBEB); // grey150
  static const Color colorCardElevatedBg      = Color(0xFFFFFFFF); // greyWhite
  static const Color colorCardDemotedBg       = Color(0xFFEBEBEB); // grey150
  static const Color colorCardDemotedBorder   = Color(0xFFDCDCDC); // grey200
  static const Color colorCardOutlineBorder   = Color(0xFFDCDCDC); // grey200

  // ─── Border Radius ────────────────────────────────────────────────────
  static const double radiusSm      = 4.0;
  static const double radiusMd      = 6.0;
  static const double radiusLg      = 8.0;
  static const double radiusXl      = 10.0;
  static const double radius2xl     = 12.0;
  static const double radius3xl     = 16.0;
  static const double radius4xl     = 20.0;
  static const double radius5xl     = 24.0;
  static const double radius6xl     = 32.0;
  static const double radiusFull    = 9999.0;
  static const double radiusInsetSm = 8.0;
  static const double radiusInsetMd = 4.0;
  static const double radiusInsetLg = 0.0;

  static const double cardBreakpointWidth     = 769.0;
  static const double cardContentGutterNarrow = 12.0;
  static const double cardContentGutterWide   = 16.0;

  // ─── Motion ───────────────────────────────────────────────────────────
  // Durations — use inline: micro 100ms · normal 200ms · slow 300ms
  static const Curve easeOutQuad    = Cubic(0.25, 0.46, 0.45, 0.94);
  static const Curve easeOutCubic   = Cubic(0.215, 0.61, 0.355, 1.0);
  static const Curve easeOutQuart   = Cubic(0.165, 0.84, 0.44, 1.0);
  static const Curve easeInOutCubic = Cubic(0.645, 0.045, 0.355, 1.0);
  static const Curve easeInOutQuart = Cubic(0.77, 0.0, 0.175, 1.0);

  // ─── Z-Index ──────────────────────────────────────────────────────────
  static const int zDropdown = 100;
  static const int zSticky   = 150;
  static const int zModal    = 200;
  static const int zTooltip  = 300;
  static const int zToast    = 400;

  // ─── Opacity ──────────────────────────────────────────────────────────
  static const double opacity0   = 0.00;
  static const double opacity2   = 0.02;
  static const double opacity4   = 0.04;
  static const double opacity6   = 0.06;
  static const double opacity8   = 0.08;
  static const double opacity10  = 0.10;
  static const double opacity12  = 0.12;
  static const double opacity16  = 0.16;
  static const double opacity20  = 0.20;
  static const double opacity24  = 0.24;
  static const double opacity28  = 0.28;
  static const double opacity32  = 0.32;
  static const double opacity36  = 0.36;
  static const double opacity40  = 0.40;
  static const double opacity44  = 0.44;
  static const double opacity48  = 0.48;
  static const double opacity52  = 0.52;
  static const double opacity56  = 0.56;
  static const double opacity64  = 0.64;
  static const double opacity72  = 0.72;
  static const double opacity80  = 0.80;
  static const double opacity88  = 0.88;
  static const double opacity96  = 0.96;
  static const double opacity100 = 1.00;

  // ─── Shadows ──────────────────────────────────────────────────────────
  // rgba(0,0,0,0.04)=0x0A  0.06=0x0F  0.10=0x1A  0.14=0x24
  static const BoxShadow shadowXs  = BoxShadow(color: Color(0x0A000000), blurRadius: 2,  offset: Offset(0, 1));
  static const BoxShadow shadowSm  = BoxShadow(color: Color(0x0F000000), blurRadius: 4,  offset: Offset(0, 1));
  static const BoxShadow shadowMd  = BoxShadow(color: Color(0x0F000000), blurRadius: 8,  offset: Offset(0, 2));
  static const BoxShadow shadowLg  = BoxShadow(color: Color(0x0A000000), blurRadius: 16, spreadRadius: 4, offset: Offset(0, 2));
  static const BoxShadow shadowXl  = BoxShadow(color: Color(0x1A000000), blurRadius: 24, offset: Offset(0, 4));
  static const BoxShadow shadow2xl = BoxShadow(color: Color(0x24000000), blurRadius: 32, offset: Offset(0, 8));
}
