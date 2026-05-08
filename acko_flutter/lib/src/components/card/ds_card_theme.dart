import 'dart:ui';

import 'package:flutter/material.dart';

import '../../foundation/primitives.dart';
import '../../foundation/tokens.dart';

/// Mirrors `--shadow-lg` in `tokens.css` (light theme opacity).
const List<BoxShadow> _kCardElevatedShadow = [
  BoxShadow(
    color: DsPrimitives.blackA04,
    offset: Offset(0, 2),
    blurRadius: 16,
    spreadRadius: 4,
  ),
];

class DsCardTheme extends ThemeExtension<DsCardTheme> {
  const DsCardTheme({
    required this.dividerColor,
    required this.elevatedShadows,
    required this.headerPaddingBottom,
    required this.contentPaddingVertical,
    required this.footerPaddingTop,
  });

  final Color dividerColor;
  final List<BoxShadow> elevatedShadows;
  final double headerPaddingBottom;
  final double contentPaddingVertical;
  final double footerPaddingTop;

  static const defaults = DsCardTheme(
    dividerColor: DsTokens.colorBorderSubtle,
    elevatedShadows: _kCardElevatedShadow,
    headerPaddingBottom: 16,
    contentPaddingVertical: 20,
    footerPaddingTop: 16,
  );

  @override
  DsCardTheme copyWith({
    Color? dividerColor,
    List<BoxShadow>? elevatedShadows,
    double? headerPaddingBottom,
    double? contentPaddingVertical,
    double? footerPaddingTop,
  }) {
    return DsCardTheme(
      dividerColor: dividerColor ?? this.dividerColor,
      elevatedShadows: elevatedShadows ?? this.elevatedShadows,
      headerPaddingBottom: headerPaddingBottom ?? this.headerPaddingBottom,
      contentPaddingVertical: contentPaddingVertical ?? this.contentPaddingVertical,
      footerPaddingTop: footerPaddingTop ?? this.footerPaddingTop,
    );
  }

  @override
  DsCardTheme lerp(DsCardTheme? other, double t) {
    if (other == null) return this;
    return DsCardTheme(
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      elevatedShadows: t < 0.5 ? elevatedShadows : other.elevatedShadows,
      headerPaddingBottom:
          lerpDouble(headerPaddingBottom, other.headerPaddingBottom, t)!,
      contentPaddingVertical:
          lerpDouble(contentPaddingVertical, other.contentPaddingVertical, t)!,
      footerPaddingTop:
          lerpDouble(footerPaddingTop, other.footerPaddingTop, t)!,
    );
  }
}
