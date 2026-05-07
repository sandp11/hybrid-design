import 'dart:ui';
import 'package:flutter/material.dart';

enum DsBadgeVariant     { solid, outline, dot }
enum DsBadgeColor       { purple, green, blue, orange, pink, gray }
enum DsBadgeTextCase    { uppercase, sentence }
enum DsCounterBadgeColor { purple, pink, blue }

// ─── Color set data classes ────────────────────────────────────────────────────

class DsBadgeColorSet {
  const DsBadgeColorSet({
    required this.gradientFrom,
    required this.gradientTo,
    required this.border,
    required this.text,
    required this.outlineColor,
  });

  final Color gradientFrom;
  final Color gradientTo;
  final Color border;
  final Color text;
  final Color outlineColor;

  DsBadgeColorSet lerp(DsBadgeColorSet other, double t) => DsBadgeColorSet(
        gradientFrom: Color.lerp(gradientFrom, other.gradientFrom, t)!,
        gradientTo:   Color.lerp(gradientTo,   other.gradientTo,   t)!,
        border:       Color.lerp(border,        other.border,        t)!,
        text:         Color.lerp(text,          other.text,          t)!,
        outlineColor: Color.lerp(outlineColor,  other.outlineColor,  t)!,
      );
}

class DsCounterBadgeColorSet {
  const DsCounterBadgeColorSet({
    required this.gradientFrom,
    required this.gradientTo,
    required this.border,
  });

  final Color gradientFrom;
  final Color gradientTo;
  final Color border;

  DsCounterBadgeColorSet lerp(DsCounterBadgeColorSet other, double t) =>
      DsCounterBadgeColorSet(
        gradientFrom: Color.lerp(gradientFrom, other.gradientFrom, t)!,
        gradientTo:   Color.lerp(gradientTo,   other.gradientTo,   t)!,
        border:       Color.lerp(border,        other.border,        t)!,
      );
}

// ─── Theme extension ───────────────────────────────────────────────────────────

class DsBadgeTheme extends ThemeExtension<DsBadgeTheme> {
  const DsBadgeTheme({
    required this.purple,
    required this.green,
    required this.blue,
    required this.orange,
    required this.pink,
    required this.gray,
    required this.counterPurple,
    required this.counterPink,
    required this.counterBlue,
    required this.counterText,
    required this.padding,
    required this.gap,
    required this.dotSize,
    required this.removeIconSize,
    required this.mobileTextSize,
    required this.desktopTextSize,
    required this.desktopBreakpoint,
    required this.borderRadius,
    required this.counterPadding,
    required this.counterMinWidth,
  });

  final DsBadgeColorSet purple;
  final DsBadgeColorSet green;
  final DsBadgeColorSet blue;
  final DsBadgeColorSet orange;
  final DsBadgeColorSet pink;
  final DsBadgeColorSet gray;

  final DsCounterBadgeColorSet counterPurple;
  final DsCounterBadgeColorSet counterPink;
  final DsCounterBadgeColorSet counterBlue;
  final Color counterText;

  final EdgeInsets padding;
  final double     gap;
  final double     dotSize;
  final double     removeIconSize;
  final double     mobileTextSize;
  final double     desktopTextSize;
  final double     desktopBreakpoint;
  final BorderRadius borderRadius;
  final EdgeInsets counterPadding;
  final double     counterMinWidth;

  // ─── Light defaults ──────────────────────────────────────────────────────────

  static const light = DsBadgeTheme(
    purple: DsBadgeColorSet(
      gradientFrom: Color(0xFFD9D8FC), // purple-200
      gradientTo:   Color(0xFFEAEAFD), // purple-100
      border:       Color(0xFFD9D8FC), // purple-200
      text:         Color(0xFF4E29BB), // purple-800
      outlineColor: Color(0xFF6841E6), // purple-600
    ),
    green: DsBadgeColorSet(
      gradientFrom: Color(0xFFCFF7BB), // lime-200
      gradientTo:   Color(0xFFE7FCDC), // lime-100
      border:       Color(0xFFCFF7BB), // lime-200
      text:         Color(0xFF166534), // green-800
      outlineColor: Color(0xFF45A316), // lime-600
    ),
    blue: DsBadgeColorSet(
      gradientFrom: Color(0xFFBFDBFE), // blue-200
      gradientTo:   Color(0xFFDBEAFE), // blue-100
      border:       Color(0xFFBFDBFE), // blue-200
      text:         Color(0xFF1E40AF), // blue-800
      outlineColor: Color(0xFF2563EB), // blue-600
    ),
    orange: DsBadgeColorSet(
      gradientFrom: Color(0xFFFFCB9E), // orange-200
      gradientTo:   Color(0xFFFFE5CC), // orange-100
      border:       Color(0xFFFFCB9E), // orange-200
      text:         Color(0xFF8D4301), // orange-800
      outlineColor: Color(0xFFEB740A), // orange-600
    ),
    pink: DsBadgeColorSet(
      gradientFrom: Color(0xFFFECACA), // red-200
      gradientTo:   Color(0xFFFEE2E2), // red-100
      border:       Color(0xFFFECACA), // red-200
      text:         Color(0xFF991B1B), // red-800
      outlineColor: Color(0xFFDC2626), // red-600
    ),
    gray: DsBadgeColorSet(
      gradientFrom: Color(0xFFE0E0E1), // grey-200
      gradientTo:   Color(0xFFF5F5F5), // grey-100
      border:       Color(0xFFE0E0E1), // grey-200
      text:         Color(0xFF242324), // grey-600
      outlineColor: Color(0xFF242324), // grey-600
    ),
    counterPurple: DsCounterBadgeColorSet(
      gradientFrom: Color(0xFF7A62F0), // purple-500
      gradientTo:   Color(0xFF9B8FF6), // purple-400
      border:       Color(0xFF7A62F0), // purple-500
    ),
    counterPink: DsCounterBadgeColorSet(
      gradientFrom: Color(0xFFEF4444), // red-500
      gradientTo:   Color(0xFFF87171), // red-400
      border:       Color(0xFFEF4444), // red-500
    ),
    counterBlue: DsCounterBadgeColorSet(
      gradientFrom: Color(0xFF3B82F6), // blue-500
      gradientTo:   Color(0xFF60A5FA), // blue-400
      border:       Color(0xFF3B82F6), // blue-500
    ),
    counterText:      Color(0xFFFFFFFF), // color-on-primary
    padding:          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    gap:              4.0,
    dotSize:          6.0,
    removeIconSize:   8.0,
    mobileTextSize:   12.0,
    desktopTextSize:  14.0,
    desktopBreakpoint: 768.0,
    borderRadius:     BorderRadius.all(Radius.circular(9999)),
    counterPadding:   EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    counterMinWidth:  20.0,
  );

  // ─── Dark defaults ───────────────────────────────────────────────────────────
  // Gradient fills use 90% opacity (0xE6 alpha) matching CSS color-mix(... 90%, transparent).

  static const dark = DsBadgeTheme(
    purple: DsBadgeColorSet(
      gradientFrom: Color(0xE6241362), // purple-950 @ 90%
      gradientTo:   Color(0xE63E2290), // purple-900 @ 90%
      border:       Color(0xFF3E2290), // purple-900
      text:         Color(0xFFD9D8FC), // purple-200
      outlineColor: Color(0xFF9B8FF6), // purple-400
    ),
    green: DsBadgeColorSet(
      gradientFrom: Color(0xE6132E05), // lime-950 @ 90%
      gradientTo:   Color(0xE6214210), // lime-900 @ 90%
      border:       Color(0xFF214210), // lime-900
      text:         Color(0xFFBBF7D0), // green-200
      outlineColor: Color(0xFF45A316), // lime-600
    ),
    blue: DsBadgeColorSet(
      gradientFrom: Color(0xE6172554), // blue-950 @ 90%
      gradientTo:   Color(0xE61E3A8A), // blue-900 @ 90%
      border:       Color(0xFF1E3A8A), // blue-900
      text:         Color(0xFFBFDBFE), // blue-200
      outlineColor: Color(0xFF2563EB), // blue-600
    ),
    orange: DsBadgeColorSet(
      gradientFrom: Color(0xE6300212), // orange-950 @ 90%
      gradientTo:   Color(0xE6521F00), // orange-900 @ 90%
      border:       Color(0xFF521F00), // orange-900
      text:         Color(0xFFFFCB9E), // orange-200
      outlineColor: Color(0xFFEB740A), // orange-600
    ),
    pink: DsBadgeColorSet(
      gradientFrom: Color(0xE6450A0A), // red-950 @ 90%
      gradientTo:   Color(0xE67F1D1D), // red-900 @ 90%
      border:       Color(0xFF7F1D1D), // red-900
      text:         Color(0xFFFECACA), // red-200
      outlineColor: Color(0xFFDC2626), // red-600
    ),
    gray: DsBadgeColorSet(
      gradientFrom: Color(0xE60A0A0A), // grey-800 @ 90%
      gradientTo:   Color(0xE6141414), // grey-700 @ 90%
      border:       Color(0xFF242324), // grey-600
      text:         Color(0xFFE0E0E1), // grey-200
      outlineColor: Color(0xFF474649), // grey-500
    ),
    counterPurple: DsCounterBadgeColorSet(
      gradientFrom: Color(0xE6241362), // purple-950 @ 90%
      gradientTo:   Color(0xE63E2290), // purple-900 @ 90%
      border:       Color(0xFF3E2290), // purple-900
    ),
    counterPink: DsCounterBadgeColorSet(
      gradientFrom: Color(0xE6450A0A), // red-950 @ 90%
      gradientTo:   Color(0xE67F1D1D), // red-900 @ 90%
      border:       Color(0xFF7F1D1D), // red-900
    ),
    counterBlue: DsCounterBadgeColorSet(
      gradientFrom: Color(0xE6172554), // blue-950 @ 90%
      gradientTo:   Color(0xE61E3A8A), // blue-900 @ 90%
      border:       Color(0xFF1E3A8A), // blue-900
    ),
    counterText:      Color(0xFFFFFFFF),
    padding:          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    gap:              4.0,
    dotSize:          6.0,
    removeIconSize:   8.0,
    mobileTextSize:   12.0,
    desktopTextSize:  14.0,
    desktopBreakpoint: 768.0,
    borderRadius:     BorderRadius.all(Radius.circular(9999)),
    counterPadding:   EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    counterMinWidth:  20.0,
  );

  static const defaults = light;

  // ─── Helpers ─────────────────────────────────────────────────────────────────

  DsBadgeColorSet colorSetFor(DsBadgeColor color) => switch (color) {
    DsBadgeColor.purple => purple,
    DsBadgeColor.green  => green,
    DsBadgeColor.blue   => blue,
    DsBadgeColor.orange => orange,
    DsBadgeColor.pink   => pink,
    DsBadgeColor.gray   => gray,
  };

  DsCounterBadgeColorSet counterColorSetFor(DsCounterBadgeColor color) =>
      switch (color) {
        DsCounterBadgeColor.purple => counterPurple,
        DsCounterBadgeColor.pink   => counterPink,
        DsCounterBadgeColor.blue   => counterBlue,
      };

  // ─── ThemeExtension ───────────────────────────────────────────────────────────

  @override
  DsBadgeTheme copyWith({
    DsBadgeColorSet? purple,
    DsBadgeColorSet? green,
    DsBadgeColorSet? blue,
    DsBadgeColorSet? orange,
    DsBadgeColorSet? pink,
    DsBadgeColorSet? gray,
    DsCounterBadgeColorSet? counterPurple,
    DsCounterBadgeColorSet? counterPink,
    DsCounterBadgeColorSet? counterBlue,
    Color? counterText,
    EdgeInsets? padding,
    double? gap,
    double? dotSize,
    double? removeIconSize,
    double? mobileTextSize,
    double? desktopTextSize,
    double? desktopBreakpoint,
    BorderRadius? borderRadius,
    EdgeInsets? counterPadding,
    double? counterMinWidth,
  }) {
    return DsBadgeTheme(
      purple:            purple            ?? this.purple,
      green:             green             ?? this.green,
      blue:              blue              ?? this.blue,
      orange:            orange            ?? this.orange,
      pink:              pink              ?? this.pink,
      gray:              gray              ?? this.gray,
      counterPurple:     counterPurple     ?? this.counterPurple,
      counterPink:       counterPink       ?? this.counterPink,
      counterBlue:       counterBlue       ?? this.counterBlue,
      counterText:       counterText       ?? this.counterText,
      padding:           padding           ?? this.padding,
      gap:               gap               ?? this.gap,
      dotSize:           dotSize           ?? this.dotSize,
      removeIconSize:    removeIconSize    ?? this.removeIconSize,
      mobileTextSize:    mobileTextSize    ?? this.mobileTextSize,
      desktopTextSize:   desktopTextSize   ?? this.desktopTextSize,
      desktopBreakpoint: desktopBreakpoint ?? this.desktopBreakpoint,
      borderRadius:      borderRadius      ?? this.borderRadius,
      counterPadding:    counterPadding    ?? this.counterPadding,
      counterMinWidth:   counterMinWidth   ?? this.counterMinWidth,
    );
  }

  @override
  DsBadgeTheme lerp(DsBadgeTheme? other, double t) {
    if (other == null) return this;
    return DsBadgeTheme(
      purple:            purple.lerp(other.purple, t),
      green:             green.lerp(other.green, t),
      blue:              blue.lerp(other.blue, t),
      orange:            orange.lerp(other.orange, t),
      pink:              pink.lerp(other.pink, t),
      gray:              gray.lerp(other.gray, t),
      counterPurple:     counterPurple.lerp(other.counterPurple, t),
      counterPink:       counterPink.lerp(other.counterPink, t),
      counterBlue:       counterBlue.lerp(other.counterBlue, t),
      counterText:       Color.lerp(counterText, other.counterText, t)!,
      padding:           EdgeInsets.lerp(padding, other.padding, t)!,
      gap:               lerpDouble(gap, other.gap, t)!,
      dotSize:           lerpDouble(dotSize, other.dotSize, t)!,
      removeIconSize:    lerpDouble(removeIconSize, other.removeIconSize, t)!,
      mobileTextSize:    lerpDouble(mobileTextSize, other.mobileTextSize, t)!,
      desktopTextSize:   lerpDouble(desktopTextSize, other.desktopTextSize, t)!,
      desktopBreakpoint: lerpDouble(desktopBreakpoint, other.desktopBreakpoint, t)!,
      borderRadius:      BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      counterPadding:    EdgeInsets.lerp(counterPadding, other.counterPadding, t)!,
      counterMinWidth:   lerpDouble(counterMinWidth, other.counterMinWidth, t)!,
    );
  }
}
