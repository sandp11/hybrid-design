// Light-mode static constants. Dark-mode values live in DsThemeExtension.dark.
// Dark-suffixed constants are provided here for component themes that declare
// separate static light/dark presets (e.g. DsDialogTheme.light / .dark).

import 'package:flutter/material.dart';
import 'primitives.dart';

abstract class DsTokens {
  // ─── Brand / Primary ─────────────────────────────────────────────────
  static const Color colorPrimary         = DsPrimitives.purple600;
  static const Color colorPrimaryHover    = DsPrimitives.purple700;
  static const Color colorPrimaryActive   = DsPrimitives.purple800;
  static const Color colorPrimaryMuted    = DsPrimitives.purple400;
  static const Color colorPrimarySubtle   = DsPrimitives.purple100;
  static const Color colorPrimaryRing     = DsPrimitives.purple200;
  static const Color colorOnPrimary       = DsPrimitives.greyWhite;

  // ─── Surfaces ────────────────────────────────────────────────────────
  static const Color colorSurface             = DsPrimitives.grey100;
  static const Color colorSurfaceRaised       = DsPrimitives.grey100;
  static const Color colorSurfaceRaisedHover  = DsPrimitives.grey200;
  static const Color colorSurfaceRaisedActive = DsPrimitives.grey300;
  static const Color colorSurfaceOverlay      = Color(0x80343434); // rgba(52,52,52,0.5)
  static const Color colorSurfaceGhostHover   = DsPrimitives.blackA04;

  // Dark surface variants
  static const Color colorSurfaceRaisedDark       = DsPrimitives.grey700;
  static const Color colorSurfaceOverlayDark      = DsPrimitives.blackA9;
  static const Color colorSurfaceGhostHoverDark   = DsPrimitives.whiteA1;

  // ─── Text ─────────────────────────────────────────────────────────────
  static const Color colorTextPrimary    = DsPrimitives.grey800;
  static const Color colorTextDefault    = DsPrimitives.grey700;
  static const Color colorTextSupporting = DsPrimitives.grey550;
  static const Color colorTextSecondary  = DsPrimitives.grey450;
  static const Color colorTextDisabled   = DsPrimitives.grey300;
  static const Color colorTextInvert     = DsPrimitives.greyWhite;
  static const Color colorTextBrand      = DsPrimitives.purple600;
  static const Color colorTextError      = DsPrimitives.red700;
  static const Color colorTextSuccess    = DsPrimitives.green700;
  static const Color colorTextStatic     = DsPrimitives.greyWhite;

  // Dark text variants
  static const Color colorTextDefaultDark   = DsPrimitives.grey100;
  static const Color colorTextSecondaryDark = DsPrimitives.grey350;

  // ─── Borders ──────────────────────────────────────────────────────────
  static const Color colorBorder        = DsPrimitives.grey300;
  static const Color colorBorderStrong  = DsPrimitives.grey450;
  static const Color colorBorderSubtle  = DsPrimitives.grey200;

  // Dark border variants
  static const Color colorBorderSubtleDark = DsPrimitives.grey650;

  // ─── Disabled ─────────────────────────────────────────────────────────
  static const Color colorDisabledBg     = DsPrimitives.grey150;
  static const Color colorDisabledText   = DsPrimitives.grey350;
  static const Color colorDisabledBorder = DsPrimitives.grey200;

  // ─── Feedback ─────────────────────────────────────────────────────────
  static const Color colorError         = DsPrimitives.red600;
  static const Color colorErrorText     = DsPrimitives.red700;
  static const Color colorErrorSubtle   = DsPrimitives.red100;
  static const Color colorErrorBorder   = DsPrimitives.red200;

  static const Color colorSuccess        = DsPrimitives.green600;
  static const Color colorSuccessText    = DsPrimitives.green700;
  static const Color colorSuccessSubtle  = DsPrimitives.green100;
  static const Color colorSuccessBorder  = DsPrimitives.green200;

  static const Color colorWarning        = DsPrimitives.orange600;
  static const Color colorWarningText    = DsPrimitives.orange700;
  static const Color colorWarningSubtle  = DsPrimitives.orange50;
  static const Color colorWarningBorder  = DsPrimitives.orange100;

  static const Color colorInfo           = DsPrimitives.purple600;
  static const Color colorInfoText       = DsPrimitives.purple700;
  static const Color colorInfoSubtle     = DsPrimitives.purple100;
  static const Color colorInfoBorder     = DsPrimitives.purple200;

  // Dark feedback variants
  static const Color colorErrorTextDark    = DsPrimitives.red400;
  static const Color colorErrorSubtleDark  = DsPrimitives.red950;
  static const Color colorErrorBorderDark  = DsPrimitives.red800;

  static const Color colorSuccessTextDark   = DsPrimitives.green400;
  static const Color colorSuccessSubtleDark = DsPrimitives.green950;
  static const Color colorSuccessBorderDark = DsPrimitives.green800;

  static const Color colorWarningTextDark   = DsPrimitives.orange400;
  static const Color colorWarningSubtleDark = DsPrimitives.orange950;
  static const Color colorWarningBorderDark = DsPrimitives.orange800;

  static const Color colorInfoTextDark   = DsPrimitives.purple400;
  static const Color colorInfoSubtleDark = DsPrimitives.purple950;
  static const Color colorInfoBorderDark = DsPrimitives.purple800;

  // ─── Dividers ─────────────────────────────────────────────────────────
  static const Color colorDivider       = DsPrimitives.grey200;
  static const Color colorDividerStrong = DsPrimitives.grey300;
  static const Color colorDividerSubtle = DsPrimitives.grey150;

  // Dark divider variants
  static const Color colorDividerDark       = DsPrimitives.grey650;
  static const Color colorDividerStrongDark = DsPrimitives.grey600;
  static const Color colorDividerSubtleDark = DsPrimitives.grey700;

  // ─── Readonly ─────────────────────────────────────────────────────────
  static const Color colorReadonlyBg     = DsPrimitives.grey100;
  static const Color colorReadonlyText   = DsPrimitives.grey700;
  static const Color colorReadonlyBorder = DsPrimitives.grey250;

  // Dark readonly variants
  static const Color colorReadonlyBgDark     = DsPrimitives.grey700;
  static const Color colorReadonlyTextDark   = DsPrimitives.grey200;
  static const Color colorReadonlyBorderDark = DsPrimitives.grey600;

  // ─── Feedback badge backgrounds ───────────────────────────────────────
  static const Color colorErrorBadgeBg   = DsPrimitives.red100;
  static const Color colorSuccessBadgeBg = DsPrimitives.green200;
  static const Color colorWarningBadgeBg = DsPrimitives.orange200;
  static const Color colorInfoBadgeBg    = DsPrimitives.purple200;

  // Dark badge bg variants
  static const Color colorErrorBadgeBgDark   = DsPrimitives.red900;
  static const Color colorSuccessBadgeBgDark = DsPrimitives.green900;
  static const Color colorWarningBadgeBgDark = DsPrimitives.orange900;
  static const Color colorInfoBadgeBgDark    = DsPrimitives.purple900;

  // ─── Error gradient (input error borders) ─────────────────────────────
  static const Color colorErrorGradientFrom = DsPrimitives.red200;
  static const Color colorErrorGradientTo   = DsPrimitives.grey150;

  // Dark error gradient variants
  static const Color colorErrorGradientFromDark = DsPrimitives.red800;
  static const Color colorErrorGradientToDark   = DsPrimitives.grey600;

  // ─── Button ───────────────────────────────────────────────────────────
  static const Color colorBtnSecondaryBg     = DsPrimitives.purple50;
  static const Color colorBtnSecondaryBorder = DsPrimitives.purple300;
  static const Color colorBtnSecondaryText   = DsPrimitives.purple700;
  static const Color colorBtnInvertedBg      = DsPrimitives.greyWhite;
  static const Color colorBtnInvertedText    = DsPrimitives.grey800;
  static const Color colorBtnGhostColor      = DsPrimitives.purple600;
  static const Color colorBtnGhostHoverBg    = DsPrimitives.purple50;
  static const Color colorBtnLinkColor       = DsPrimitives.blue600;
  static const Color colorBtnDangerBg        = DsPrimitives.red100;
  static const Color colorBtnDangerText      = DsPrimitives.red500;
  static const Color colorBtnDisabledBg      = DsPrimitives.grey150;
  static const Color colorBtnDisabledText    = DsPrimitives.grey350;

  // ─── Cards ────────────────────────────────────────────────────────────
  static const Color colorCardBg              = DsPrimitives.grey50;
  static const Color colorCardBorder          = DsPrimitives.greyWhite;
  static const Color colorCardSecondaryBg     = DsPrimitives.grey100;
  static const Color colorCardSecondaryBorder = DsPrimitives.grey150;
  static const Color colorCardElevatedBg      = DsPrimitives.greyWhite;
  static const Color colorCardDemotedBg       = DsPrimitives.grey150;
  static const Color colorCardDemotedBorder   = DsPrimitives.grey200;
  static const Color colorCardOutlineBorder   = DsPrimitives.grey200;

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
