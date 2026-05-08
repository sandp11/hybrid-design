import 'dart:ui';
import 'package:flutter/material.dart';
import '../../foundation/primitives.dart';
import '../../foundation/tokens.dart';

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
      gradientFrom: DsPrimitives.purple200,
      gradientTo:   DsPrimitives.purple100,
      border:       DsPrimitives.purple200,
      text:         DsPrimitives.purple800,
      outlineColor: DsPrimitives.purple600,
    ),
    green: DsBadgeColorSet(
      gradientFrom: DsPrimitives.lime200,
      gradientTo:   DsPrimitives.lime100,
      border:       DsPrimitives.lime200,
      text:         DsPrimitives.green800,
      outlineColor: DsPrimitives.lime600,
    ),
    blue: DsBadgeColorSet(
      gradientFrom: DsPrimitives.blue200,
      gradientTo:   DsPrimitives.blue100,
      border:       DsPrimitives.blue200,
      text:         DsPrimitives.blue800,
      outlineColor: DsPrimitives.blue600,
    ),
    orange: DsBadgeColorSet(
      gradientFrom: DsPrimitives.orange200,
      gradientTo:   DsPrimitives.orange100,
      border:       DsPrimitives.orange200,
      text:         DsPrimitives.orange800,
      outlineColor: DsPrimitives.orange600,
    ),
    pink: DsBadgeColorSet(
      gradientFrom: DsPrimitives.red200,
      gradientTo:   DsPrimitives.red100,
      border:       DsPrimitives.red200,
      text:         DsPrimitives.red800,
      outlineColor: DsPrimitives.red600,
    ),
    gray: DsBadgeColorSet(
      gradientFrom: DsPrimitives.grey200,
      gradientTo:   DsPrimitives.grey100,
      border:       DsPrimitives.grey200,
      text:         DsPrimitives.grey600,
      outlineColor: DsPrimitives.grey600,
    ),
    counterPurple: DsCounterBadgeColorSet(
      gradientFrom: DsPrimitives.purple500,
      gradientTo:   DsPrimitives.purple400,
      border:       DsPrimitives.purple500,
    ),
    counterPink: DsCounterBadgeColorSet(
      gradientFrom: DsPrimitives.red500,
      gradientTo:   DsPrimitives.red400,
      border:       DsPrimitives.red500,
    ),
    counterBlue: DsCounterBadgeColorSet(
      gradientFrom: DsPrimitives.blue500,
      gradientTo:   DsPrimitives.blue400,
      border:       DsPrimitives.blue500,
    ),
    counterText:      DsTokens.colorOnPrimary,
    padding:          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    gap:              4.0,
    dotSize:          6.0,
    removeIconSize:   8.0,
    mobileTextSize:   12.0,
    desktopTextSize:  14.0,
    desktopBreakpoint: 768.0,
    borderRadius:     BorderRadius.all(Radius.circular(DsTokens.radiusFull)),
    counterPadding:   EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    counterMinWidth:  20.0,
  );

  // ─── Dark defaults ───────────────────────────────────────────────────────────
  // Gradient fills use 90% opacity (0xE6 alpha) matching CSS color-mix(... 90%, transparent).

  static const dark = DsBadgeTheme(
    purple: DsBadgeColorSet(
      gradientFrom: Color(0xE6241362), // purple950 @ 90%
      gradientTo:   Color(0xE62B1678), // purple900 @ 90%
      border:       DsPrimitives.purple900,
      text:         DsPrimitives.purple200,
      outlineColor: DsPrimitives.purple400,
    ),
    green: DsBadgeColorSet(
      gradientFrom: Color(0xE6132E05), // lime950 @ 90%
      gradientTo:   Color(0xE6214210), // lime900 @ 90%
      border:       DsPrimitives.lime900,
      text:         DsPrimitives.green200,
      outlineColor: DsPrimitives.lime600,
    ),
    blue: DsBadgeColorSet(
      gradientFrom: Color(0xE6172554), // blue950 @ 90%
      gradientTo:   Color(0xE61E3A8A), // blue900 @ 90%
      border:       DsPrimitives.blue900,
      text:         DsPrimitives.blue200,
      outlineColor: DsPrimitives.blue600,
    ),
    orange: DsBadgeColorSet(
      gradientFrom: Color(0xE6300212), // orange950 @ 90%
      gradientTo:   Color(0xE6521F00), // orange900 @ 90%
      border:       DsPrimitives.orange900,
      text:         DsPrimitives.orange200,
      outlineColor: DsPrimitives.orange600,
    ),
    pink: DsBadgeColorSet(
      gradientFrom: Color(0xE6450A0A), // red950 @ 90%
      gradientTo:   Color(0xE67F1D1D), // red900 @ 90%
      border:       DsPrimitives.red900,
      text:         DsPrimitives.red200,
      outlineColor: DsPrimitives.red600,
    ),
    gray: DsBadgeColorSet(
      gradientFrom: Color(0xE6343434), // grey800 @ 90%
      gradientTo:   Color(0xE6505050), // grey700 @ 90%
      border:       DsPrimitives.grey600,
      text:         DsPrimitives.grey200,
      outlineColor: DsPrimitives.grey500,
    ),
    counterPurple: DsCounterBadgeColorSet(
      gradientFrom: Color(0xE6241362), // purple950 @ 90%
      gradientTo:   Color(0xE62B1678), // purple900 @ 90%
      border:       DsPrimitives.purple900,
    ),
    counterPink: DsCounterBadgeColorSet(
      gradientFrom: Color(0xE6450A0A), // red950 @ 90%
      gradientTo:   Color(0xE67F1D1D), // red900 @ 90%
      border:       DsPrimitives.red900,
    ),
    counterBlue: DsCounterBadgeColorSet(
      gradientFrom: Color(0xE6172554), // blue950 @ 90%
      gradientTo:   Color(0xE61E3A8A), // blue900 @ 90%
      border:       DsPrimitives.blue900,
    ),
    counterText:      DsTokens.colorOnPrimary,
    padding:          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    gap:              4.0,
    dotSize:          6.0,
    removeIconSize:   8.0,
    mobileTextSize:   12.0,
    desktopTextSize:  14.0,
    desktopBreakpoint: 768.0,
    borderRadius:     BorderRadius.all(Radius.circular(DsTokens.radiusFull)),
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
