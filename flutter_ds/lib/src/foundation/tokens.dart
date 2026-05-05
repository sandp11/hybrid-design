// Generated from specs/foundation/tokens.md + themes/acko-light.md
// Light mode defaults. Dark mode values live in DsThemeExtension.dark.
// Do not edit manually — modify tokens.md and regenerate via agent.

import 'package:flutter/material.dart';

abstract class DsTokens {
  // ─── Brand / Primary (Light defaults) ────────────────────────────────
  static const Color colorPrimary         = Color(0xFF6841E6); // purple-600
  static const Color colorPrimaryHover    = Color(0xFF582FD2); // purple-700
  static const Color colorPrimaryActive   = Color(0xFF4E29BB); // purple-800
  static const Color colorPrimaryMuted    = Color(0xFF9B8FF6); // purple-400
  static const Color colorPrimarySubtle   = Color(0xFFEAEAFD); // purple-100
  static const Color colorPrimaryRing     = Color(0xFFD9D8FC); // purple-200
  static const Color colorOnPrimary       = Color(0xFFFFFFFF);

  // ─── Surfaces (Light defaults) ───────────────────────────────────────
  static const Color colorSurface              = Color(0xFFF5F5F5); // grey-100
  static const Color colorSurfaceRaised        = Color(0xFFF5F5F5); // grey-100
  static const Color colorSurfaceRaisedHover   = Color(0xFFE0E0E1); // grey-200
  static const Color colorSurfaceRaisedActive  = Color(0xFFB7B7B8); // grey-300
  static const Color colorSurfaceGhostHover    = Color(0x0A000000); // rgba(0,0,0,0.04)

  // ─── Text (Light defaults) ───────────────────────────────────────────
  static const Color colorTextPrimary    = Color(0xFF0A0A0A); // grey-800
  static const Color colorTextDefault    = Color(0xFF141414); // grey-700
  static const Color colorTextSupporting = Color(0xFF333333); // grey-550
  static const Color colorTextSecondary  = Color(0xFF605F63); // grey-450
  static const Color colorTextDisabled   = Color(0xFFB7B7B8); // grey-300
  static const Color colorTextInvert     = Color(0xFFFFFFFF);
  static const Color colorTextBrand      = Color(0xFF6841E6); // purple-600
  static const Color colorTextError      = Color(0xFFB91C1C); // red-700
  static const Color colorTextSuccess    = Color(0xFF15803D); // green-700
  static const Color colorTextStatic     = Color(0xFFFFFFFF);

  // ─── Borders (Light defaults) ────────────────────────────────────────
  static const Color colorBorder        = Color(0xFFB7B7B8); // grey-300
  static const Color colorBorderStrong  = Color(0xFF605F63); // grey-450
  static const Color colorBorderSubtle  = Color(0xFFE0E0E1); // grey-200

  // ─── Disabled (Light defaults) ───────────────────────────────────────
  static const Color colorDisabledBg     = Color(0xFFEBEBEB); // grey-150
  static const Color colorDisabledText   = Color(0xFF8F8E92); // grey-350
  static const Color colorDisabledBorder = Color(0xFFE0E0E1); // grey-200

  // ─── Feedback (Light defaults) ───────────────────────────────────────
  static const Color colorError         = Color(0xFFDC2626); // red-600
  static const Color colorErrorText     = Color(0xFFB91C1C); // red-700
  static const Color colorErrorSubtle   = Color(0xFFFEE2E2); // red-100
  static const Color colorErrorBorder   = Color(0xFFFECACA); // red-200

  static const Color colorSuccess        = Color(0xFF16A34A); // green-600
  static const Color colorSuccessText    = Color(0xFF15803D); // green-700
  static const Color colorSuccessSubtle  = Color(0xFFDCFCE7); // green-100
  static const Color colorSuccessBorder  = Color(0xFFBBF7D0); // green-200

  static const Color colorWarning        = Color(0xFFEB740A); // orange-600
  static const Color colorWarningText    = Color(0xFFB65C0C); // orange-700
  static const Color colorWarningSubtle  = Color(0xFFFFF3E5); // orange-50
  static const Color colorWarningBorder  = Color(0xFFFFE5CC); // orange-100

  static const Color colorInfo           = Color(0xFF6841E6); // purple-600
  static const Color colorInfoText       = Color(0xFF582FD2); // purple-700
  static const Color colorInfoSubtle     = Color(0xFFEAEAFD); // purple-100
  static const Color colorInfoBorder     = Color(0xFFD9D8FC); // purple-200

  // ─── Button (Light defaults) ─────────────────────────────────────────
  static const Color colorBtnSecondaryBg     = Color(0xFFF5F3FF); // purple-50
  static const Color colorBtnSecondaryBorder = Color(0xFFBDB8FA); // purple-300
  static const Color colorBtnSecondaryText   = Color(0xFF582FD2); // purple-700
  static const Color colorBtnInvertedBg      = Color(0xFFFFFFFF); // grey-white
  static const Color colorBtnInvertedText    = Color(0xFF0A0A0A); // grey-800
  static const Color colorBtnGhostColor      = Color(0xFF6841E6); // purple-600
  static const Color colorBtnGhostHoverBg    = Color(0xFFF5F3FF); // purple-50
  static const Color colorBtnLinkColor       = Color(0xFF2563EB); // blue-600
  static const Color colorBtnDangerBg        = Color(0xFFFEE2E2); // red-100
  static const Color colorBtnDangerText      = Color(0xFFEF4444); // red-500
  static const Color colorBtnDisabledBg      = Color(0xFFF5F5F5); // grey-100
  static const Color colorBtnDisabledText    = Color(0xFF8F8E92); // grey-350

  // ─── Cards (Light defaults) ──────────────────────────────────────────
  static const Color colorCardBg        = Color(0xFFFBFBFB); // grey-50
  static const Color colorCardBorder    = Color(0xFFFFFFFF); // grey-white
  static const Color colorCardElevatedBg= Color(0xFFFFFFFF); // grey-white
  static const Color colorCardDemotedBg = Color(0xFFEBEBEB); // grey-150

  // ─── Border Radius ───────────────────────────────────────────────────
  static const double radiusSm     = 4.0;
  static const double radiusMd     = 6.0;
  static const double radiusLg     = 8.0;
  static const double radiusXl     = 10.0;
  static const double radius2xl    = 12.0;
  static const double radius3xl    = 16.0;
  static const double radius4xl    = 20.0;
  static const double radiusFull   = 9999.0;
  static const double radiusInsetSm = 8.0;
  static const double radiusInsetMd = 4.0;
  static const double radiusInsetLg = 0.0;

  // ─── Motion ──────────────────────────────────────────────────────────
  // No duration tokens — use inline Duration values:
  // micro:   Duration(milliseconds: 100)
  // normal:  Duration(milliseconds: 200)
  // slow:    Duration(milliseconds: 300)

  static const Curve easeOutQuad     = Cubic(0.25, 0.46, 0.45, 0.94);
  static const Curve easeOutCubic    = Cubic(0.215, 0.61, 0.355, 1.0);
  static const Curve easeOutQuart    = Cubic(0.165, 0.84, 0.44, 1.0);
  static const Curve easeInOutCubic  = Cubic(0.645, 0.045, 0.355, 1.0);
  static const Curve easeInOutQuart  = Cubic(0.77, 0.0, 0.175, 1.0);

  // ─── Z-Index (for use with Stack ordering) ───────────────────────────
  static const int zDropdown = 100;
  static const int zSticky   = 150;
  static const int zModal    = 200;
  static const int zTooltip  = 300;
  static const int zToast    = 400;
}
