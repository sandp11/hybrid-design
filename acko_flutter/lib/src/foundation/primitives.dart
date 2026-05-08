import 'package:flutter/material.dart';

/// Raw color palette — Layer 1 of the ACKO token architecture.
///
/// Components should NOT reference these directly in widget code.
/// Use [DsTokens] (semantic layer) wherever possible.
/// Component *themes* may reference primitives for dark-mode presets
/// when no semantic alias exists yet.
abstract class DsPrimitives {
  // ─── Neutrals / Grey ───────────────────────────────────────────────────
  static const Color greyWhite = Color(0xFFFFFFFF);
  static const Color grey50    = Color(0xFFFBFBFB);
  static const Color grey100   = Color(0xFFF5F5F5);
  static const Color grey150   = Color(0xFFEBEBEB);
  static const Color grey200   = Color(0xFFDCDCDC);
  static const Color grey250   = Color(0xFFCECECE);
  static const Color grey300   = Color(0xFFC0C0C0);
  static const Color grey350   = Color(0xFFB2B2B2);
  static const Color grey400   = Color(0xFFA4A4A4);
  static const Color grey450   = Color(0xFF969696);
  static const Color grey500   = Color(0xFF888888);
  static const Color grey550   = Color(0xFF7A7A7A);
  static const Color grey600   = Color(0xFF6C6C6C);
  static const Color grey650   = Color(0xFF5E5E5E);
  static const Color grey700   = Color(0xFF505050);
  static const Color grey750   = Color(0xFF424242);
  static const Color grey800   = Color(0xFF343434);
  static const Color grey900   = Color(0xFF181818);
  static const Color grey950   = Color(0xFF0A0A0A);
  static const Color greyBlack = Color(0xFF000000);

  // ─── Brand / Purple ────────────────────────────────────────────────────
  static const Color purple50  = Color(0xFFF3F3FF);
  static const Color purple100 = Color(0xFFE1E0FE);
  static const Color purple150 = Color(0xFFD1CFFD);
  static const Color purple200 = Color(0xFFC1BDFC);
  static const Color purple300 = Color(0xFFA69CF9);
  static const Color purple400 = Color(0xFF8E7CF4);
  static const Color purple500 = Color(0xFF795DEE);
  static const Color purple600 = Color(0xFF6841E6);
  static const Color purple700 = Color(0xFF491FD4);
  static const Color purple800 = Color(0xFF3A1BA5);
  static const Color purple850 = Color(0xFF33198F);
  static const Color purple900 = Color(0xFF2B1678);
  static const Color purple950 = Color(0xFF241362);

  // ─── Red ───────────────────────────────────────────────────────────────
  static const Color red50  = Color(0xFFFEF2F2);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red200 = Color(0xFFFECACA);
  static const Color red300 = Color(0xFFFCA5A5);
  static const Color red400 = Color(0xFFF87171);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red600 = Color(0xFFDC2626);
  static const Color red700 = Color(0xFFB91C1C);
  static const Color red800 = Color(0xFF991B1B);
  static const Color red900 = Color(0xFF7F1D1D);
  static const Color red950 = Color(0xFF450A0A);

  // ─── Amber ─────────────────────────────────────────────────────────────
  static const Color amber50  = Color(0xFFFFFBEB);
  static const Color amber100 = Color(0xFFFEF3C7);
  static const Color amber200 = Color(0xFFFDE68A);
  static const Color amber300 = Color(0xFFFCD34D);
  static const Color amber400 = Color(0xFFFBBF24);
  static const Color amber500 = Color(0xFFF59E0B);
  static const Color amber600 = Color(0xFFD97706);
  static const Color amber700 = Color(0xFFB45309);
  static const Color amber800 = Color(0xFF92400E);
  static const Color amber900 = Color(0xFF78350F);
  static const Color amber950 = Color(0xFF451A03);

  // ─── Yellow ────────────────────────────────────────────────────────────
  static const Color yellow50  = Color(0xFFFEFAE8);
  static const Color yellow100 = Color(0xFFFEF9C3);
  static const Color yellow200 = Color(0xFFFEF08A);
  static const Color yellow300 = Color(0xFFFDE047);
  static const Color yellow400 = Color(0xFFFACC15);
  static const Color yellow500 = Color(0xFFEAB308);
  static const Color yellow600 = Color(0xFFD18C0A);
  static const Color yellow700 = Color(0xFFA76406);
  static const Color yellow800 = Color(0xFF875008);
  static const Color yellow900 = Color(0xFF62360F);
  static const Color yellow950 = Color(0xFF302012);

  // ─── Green ─────────────────────────────────────────────────────────────
  static const Color green50  = Color(0xFFF0FDF4);
  static const Color green100 = Color(0xFFDCFCE7);
  static const Color green200 = Color(0xFFBBF7D0);
  static const Color green300 = Color(0xFF86EFAC);
  static const Color green400 = Color(0xFF4ADE80);
  static const Color green500 = Color(0xFF22C55E);
  static const Color green600 = Color(0xFF16A34A);
  static const Color green700 = Color(0xFF15803D);
  static const Color green800 = Color(0xFF166534);
  static const Color green900 = Color(0xFF14532D);
  static const Color green950 = Color(0xFF052E16);

  // ─── Blue ──────────────────────────────────────────────────────────────
  static const Color blue50  = Color(0xFFEFF6FF);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color blue200 = Color(0xFFBFDBFE);
  static const Color blue300 = Color(0xFF93C5FD);
  static const Color blue400 = Color(0xFF60A5FA);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue800 = Color(0xFF1E40AF);
  static const Color blue900 = Color(0xFF1E3A8A);
  static const Color blue950 = Color(0xFF172554);

  // ─── Indigo ────────────────────────────────────────────────────────────
  static const Color indigo50  = Color(0xFFEEF2FF);
  static const Color indigo100 = Color(0xFFE0E7FF);
  static const Color indigo200 = Color(0xFFC7D2FE);
  static const Color indigo300 = Color(0xFFA5B4FC);
  static const Color indigo400 = Color(0xFF818CF8);
  static const Color indigo500 = Color(0xFF6366F1);
  static const Color indigo600 = Color(0xFF4F46E5);
  static const Color indigo700 = Color(0xFF4338CA);
  static const Color indigo800 = Color(0xFF3730A3);
  static const Color indigo900 = Color(0xFF312E81);
  static const Color indigo950 = Color(0xFF1E1B4B);

  // ─── Cyan ──────────────────────────────────────────────────────────────
  static const Color cyan50  = Color(0xFFECFEFF);
  static const Color cyan100 = Color(0xFFCFFAFE);
  static const Color cyan200 = Color(0xFFA5F3FC);
  static const Color cyan300 = Color(0xFF67E8F9);
  static const Color cyan400 = Color(0xFF22D3EE);
  static const Color cyan500 = Color(0xFF06B6D4);
  static const Color cyan600 = Color(0xFF0891B2);
  static const Color cyan700 = Color(0xFF0E7490);
  static const Color cyan800 = Color(0xFF155E75);
  static const Color cyan900 = Color(0xFF164E63);
  static const Color cyan950 = Color(0xFF083344);

  // ─── Teal ──────────────────────────────────────────────────────────────
  static const Color teal50  = Color(0xFFEDFDFE);
  static const Color teal100 = Color(0xFFD1FBFC);
  static const Color teal200 = Color(0xFFA9EFFB);
  static const Color teal300 = Color(0xFF6FE2F1);
  static const Color teal400 = Color(0xFF29CEE7);
  static const Color teal500 = Color(0xFF17B6D3);
  static const Color teal600 = Color(0xFF0891B2);
  static const Color teal700 = Color(0xFF0E7490);
  static const Color teal800 = Color(0xFF155E75);
  static const Color teal900 = Color(0xFF164E63);
  static const Color teal950 = Color(0xFF083344);

  // ─── Pink ──────────────────────────────────────────────────────────────
  static const Color pink50  = Color(0xFFFDF2F8);
  static const Color pink100 = Color(0xFFFCE7F3);
  static const Color pink200 = Color(0xFFFBCFE8);
  static const Color pink300 = Color(0xFFF9ABD4);
  static const Color pink400 = Color(0xFFF472B6);
  static const Color pink500 = Color(0xFFEC4899);
  static const Color pink600 = Color(0xFFDB2777);
  static const Color pink700 = Color(0xFFBE185D);
  static const Color pink800 = Color(0xFF9D174D);
  static const Color pink900 = Color(0xFF831843);
  static const Color pink950 = Color(0xFF500724);

  // ─── Orange ────────────────────────────────────────────────────────────
  static const Color orange50  = Color(0xFFFFF3E5);
  static const Color orange100 = Color(0xFFFFE5CC);
  static const Color orange200 = Color(0xFFFFCB9E);
  static const Color orange300 = Color(0xFFFFB56B);
  static const Color orange400 = Color(0xFFFFA85C);
  static const Color orange500 = Color(0xFFFF8D28);
  static const Color orange600 = Color(0xFFEB740A);
  static const Color orange700 = Color(0xFFB65C0C);
  static const Color orange800 = Color(0xFF8D4301);
  static const Color orange900 = Color(0xFF521F00);
  static const Color orange950 = Color(0xFF300212);

  // ─── Lime ──────────────────────────────────────────────────────────────
  static const Color lime50  = Color(0xFFF4FDF0);
  static const Color lime100 = Color(0xFFE7FCDC);
  static const Color lime200 = Color(0xFFCFF7BB);
  static const Color lime300 = Color(0xFFA9EF86);
  static const Color lime400 = Color(0xFF7BDE4A);
  static const Color lime500 = Color(0xFF58C522);
  static const Color lime600 = Color(0xFF45A316);
  static const Color lime700 = Color(0xFF398015);
  static const Color lime800 = Color(0xFF306516);
  static const Color lime900 = Color(0xFF214210);
  static const Color lime950 = Color(0xFF132E05);

  // ─── Alpha / Black ─────────────────────────────────────────────────────
  static const Color transparent = Color(0x00000000);
  static const Color blackA04 = Color(0x0A000000); // rgba(0,0,0,0.04)
  static const Color blackA08 = Color(0x14000000); // rgba(0,0,0,0.08)
  static const Color blackA1  = Color(0x0D000000); // rgba(0,0,0,0.05)
  static const Color blackA2  = Color(0x1A000000); // rgba(0,0,0,0.10)
  static const Color blackA3  = Color(0x26000000); // rgba(0,0,0,0.15)
  static const Color blackA4  = Color(0x33000000); // rgba(0,0,0,0.20)
  static const Color blackA5  = Color(0x4D000000); // rgba(0,0,0,0.30)
  static const Color blackA6  = Color(0x66000000); // rgba(0,0,0,0.40)
  static const Color blackA7  = Color(0x80000000); // rgba(0,0,0,0.50)
  static const Color blackA8  = Color(0x99000000); // rgba(0,0,0,0.60)
  static const Color blackA9  = Color(0xB3000000); // rgba(0,0,0,0.70)
  static const Color blackA10 = Color(0xCC000000); // rgba(0,0,0,0.80)
  static const Color blackA11 = Color(0xE6000000); // rgba(0,0,0,0.90)
  static const Color blackA12 = Color(0xF2000000); // rgba(0,0,0,0.95)

  // ─── Alpha / White ─────────────────────────────────────────────────────
  static const Color whiteA08 = Color(0x14FFFFFF); // rgba(255,255,255,0.08)
  static const Color whiteA1  = Color(0x0DFFFFFF); // rgba(255,255,255,0.05)
  static const Color whiteA2  = Color(0x1AFFFFFF); // rgba(255,255,255,0.10)
  static const Color whiteA3  = Color(0x26FFFFFF); // rgba(255,255,255,0.15)
  static const Color whiteA4  = Color(0x33FFFFFF); // rgba(255,255,255,0.20)
  static const Color whiteA5  = Color(0x4DFFFFFF); // rgba(255,255,255,0.30)
  static const Color whiteA6  = Color(0x66FFFFFF); // rgba(255,255,255,0.40)
  static const Color whiteA7  = Color(0x80FFFFFF); // rgba(255,255,255,0.50)
  static const Color whiteA8  = Color(0x99FFFFFF); // rgba(255,255,255,0.60)
  static const Color whiteA9  = Color(0xB3FFFFFF); // rgba(255,255,255,0.70)
  static const Color whiteA10 = Color(0xCCFFFFFF); // rgba(255,255,255,0.80)
  static const Color whiteA11 = Color(0xE6FFFFFF); // rgba(255,255,255,0.90)
  static const Color whiteA12 = Color(0xF2FFFFFF); // rgba(255,255,255,0.95)
}
