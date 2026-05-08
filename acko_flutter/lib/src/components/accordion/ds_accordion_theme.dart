import 'dart:ui';

import 'package:flutter/material.dart';

import '../../foundation/primitives.dart';
import '../../foundation/tokens.dart';

/// Theme for [DsAccordion] — register on [ThemeData.extensions].
class DsAccordionTheme extends ThemeExtension<DsAccordionTheme> {
  const DsAccordionTheme({
    required this.triggerFontSize,
    required this.triggerLineHeight,
    required this.triggerFontWeight,
    required this.triggerColor,
    required this.triggerHoverColor,
    required this.triggerDisabledColor,
    required this.contentFontSize,
    required this.contentLineHeight,
    required this.contentColor,
    required this.contentPaddingBottom,
    required this.chevronSize,
    required this.borderColor,
    required this.expandDuration,
    required this.triggerColorDuration,
  });

  final double triggerFontSize;
  final double triggerLineHeight;
  final FontWeight triggerFontWeight;
  final Color triggerColor;
  final Color triggerHoverColor;
  final Color triggerDisabledColor;

  final double contentFontSize;
  final double contentLineHeight;
  final Color contentColor;
  final double contentPaddingBottom;

  final double chevronSize;
  final Color borderColor;

  final Duration expandDuration;
  final Duration triggerColorDuration;

  static const light = DsAccordionTheme(
    triggerFontSize: 16,
    triggerLineHeight: 24,
    triggerFontWeight: FontWeight.w500,
    triggerColor: DsTokens.colorTextDefault,
    triggerHoverColor: DsTokens.colorPrimary,
    triggerDisabledColor: DsTokens.colorTextDisabled,
    contentFontSize: 14,
    contentLineHeight: 20,
    contentColor: DsTokens.colorTextSecondary,
    contentPaddingBottom: 16,
    chevronSize: 18,
    borderColor: DsTokens.colorBorderSubtle,
    expandDuration: Duration(milliseconds: 200),
    triggerColorDuration: Duration(milliseconds: 150),
  );

  static const dark = DsAccordionTheme(
    triggerFontSize: 16,
    triggerLineHeight: 24,
    triggerFontWeight: FontWeight.w500,
    triggerColor: DsTokens.colorTextDefaultDark,
    triggerHoverColor: DsPrimitives.purple500,
    triggerDisabledColor: DsPrimitives.grey450,
    contentFontSize: 14,
    contentLineHeight: 20,
    contentColor: DsTokens.colorTextSecondaryDark,
    contentPaddingBottom: 16,
    chevronSize: 18,
    borderColor: DsPrimitives.grey600,
    expandDuration: Duration(milliseconds: 200),
    triggerColorDuration: Duration(milliseconds: 150),
  );

  static const defaults = light;

  @override
  DsAccordionTheme copyWith({
    double? triggerFontSize,
    double? triggerLineHeight,
    FontWeight? triggerFontWeight,
    Color? triggerColor,
    Color? triggerHoverColor,
    Color? triggerDisabledColor,
    double? contentFontSize,
    double? contentLineHeight,
    Color? contentColor,
    double? contentPaddingBottom,
    double? chevronSize,
    Color? borderColor,
    Duration? expandDuration,
    Duration? triggerColorDuration,
  }) {
    return DsAccordionTheme(
      triggerFontSize: triggerFontSize ?? this.triggerFontSize,
      triggerLineHeight: triggerLineHeight ?? this.triggerLineHeight,
      triggerFontWeight: triggerFontWeight ?? this.triggerFontWeight,
      triggerColor: triggerColor ?? this.triggerColor,
      triggerHoverColor: triggerHoverColor ?? this.triggerHoverColor,
      triggerDisabledColor: triggerDisabledColor ?? this.triggerDisabledColor,
      contentFontSize: contentFontSize ?? this.contentFontSize,
      contentLineHeight: contentLineHeight ?? this.contentLineHeight,
      contentColor: contentColor ?? this.contentColor,
      contentPaddingBottom: contentPaddingBottom ?? this.contentPaddingBottom,
      chevronSize: chevronSize ?? this.chevronSize,
      borderColor: borderColor ?? this.borderColor,
      expandDuration: expandDuration ?? this.expandDuration,
      triggerColorDuration: triggerColorDuration ?? this.triggerColorDuration,
    );
  }

  @override
  DsAccordionTheme lerp(DsAccordionTheme? other, double t) {
    if (other == null) return this;
    return DsAccordionTheme(
      triggerFontSize: lerpDouble(triggerFontSize, other.triggerFontSize, t)!,
      triggerLineHeight: lerpDouble(triggerLineHeight, other.triggerLineHeight, t)!,
      triggerFontWeight: t < 0.5 ? triggerFontWeight : other.triggerFontWeight,
      triggerColor: Color.lerp(triggerColor, other.triggerColor, t)!,
      triggerHoverColor: Color.lerp(triggerHoverColor, other.triggerHoverColor, t)!,
      triggerDisabledColor:
          Color.lerp(triggerDisabledColor, other.triggerDisabledColor, t)!,
      contentFontSize: lerpDouble(contentFontSize, other.contentFontSize, t)!,
      contentLineHeight: lerpDouble(contentLineHeight, other.contentLineHeight, t)!,
      contentColor: Color.lerp(contentColor, other.contentColor, t)!,
      contentPaddingBottom:
          lerpDouble(contentPaddingBottom, other.contentPaddingBottom, t)!,
      chevronSize: lerpDouble(chevronSize, other.chevronSize, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      expandDuration: t < 0.5 ? expandDuration : other.expandDuration,
      triggerColorDuration:
          t < 0.5 ? triggerColorDuration : other.triggerColorDuration,
    );
  }
}
