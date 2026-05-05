import 'package:flutter/material.dart';

// Euclid Circular B must be included in pubspec.yaml assets or via package.
// fontFamily: 'Euclid Circular B'

abstract class DsTypography {
  static const String fontFamily = 'Euclid Circular B';

  // ─── Size Ramp (15 steps) ────────────────────────────────────────────
  static const TextStyle size10 = TextStyle(fontFamily: fontFamily, fontSize: 10, height: 1.2);
  static const TextStyle size12 = TextStyle(fontFamily: fontFamily, fontSize: 12, height: 1.333);
  static const TextStyle size14 = TextStyle(fontFamily: fontFamily, fontSize: 14, height: 1.429);
  static const TextStyle size16 = TextStyle(fontFamily: fontFamily, fontSize: 16, height: 1.5);
  static const TextStyle size18 = TextStyle(fontFamily: fontFamily, fontSize: 18, height: 1.333);
  static const TextStyle size20 = TextStyle(fontFamily: fontFamily, fontSize: 20, height: 1.4);
  static const TextStyle size24 = TextStyle(fontFamily: fontFamily, fontSize: 24, height: 1.333);
  static const TextStyle size30 = TextStyle(fontFamily: fontFamily, fontSize: 30, height: 1.2);
  static const TextStyle size36 = TextStyle(fontFamily: fontFamily, fontSize: 36, height: 1.222);
  static const TextStyle size48 = TextStyle(fontFamily: fontFamily, fontSize: 48, height: 1.167);
  static const TextStyle size60 = TextStyle(fontFamily: fontFamily, fontSize: 60, height: 1.2);
  static const TextStyle size72 = TextStyle(fontFamily: fontFamily, fontSize: 72, height: 1.111);
  static const TextStyle size96 = TextStyle(fontFamily: fontFamily, fontSize: 96, height: 1.125);

  // ─── Semantic Aliases: Display ────────────────────────────────────────
  static final TextStyle displayXl = size72.copyWith(fontWeight: FontWeight.w700, letterSpacing: -2.0);
  static final TextStyle displayLg = size60.copyWith(fontWeight: FontWeight.w700, letterSpacing: -1.5);
  static final TextStyle displayMd = size48.copyWith(fontWeight: FontWeight.w700, letterSpacing: -1.0);
  static final TextStyle displaySm = size36.copyWith(fontWeight: FontWeight.w500, letterSpacing: -0.5);

  // ─── Semantic Aliases: Heading ────────────────────────────────────────
  static final TextStyle headingXl = size30.copyWith(fontWeight: FontWeight.w500, letterSpacing: -0.5);
  static final TextStyle headingLg = size24.copyWith(fontWeight: FontWeight.w500, letterSpacing: -0.3);
  static final TextStyle headingMd = size20.copyWith(fontWeight: FontWeight.w500, letterSpacing: -0.2);
  static final TextStyle headingSm = size18.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.0);

  // ─── Semantic Aliases: Body ───────────────────────────────────────────
  static final TextStyle bodyLg = size18.copyWith(fontWeight: FontWeight.w400);
  static final TextStyle bodyMd = size16.copyWith(fontWeight: FontWeight.w400);
  static final TextStyle bodySm = size14.copyWith(fontWeight: FontWeight.w400);

  // ─── Semantic Aliases: Labels & Utility ──────────────────────────────
  static final TextStyle labelLg   = size14.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1);
  static final TextStyle labelMd   = size12.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.2);
  static final TextStyle labelSm   = size10.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.3);
  static final TextStyle caption   = size12.copyWith(fontWeight: FontWeight.w400);
  static final TextStyle overline  = size10.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.5);
}
