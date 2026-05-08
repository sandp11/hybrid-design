import 'dart:ui';

import 'package:flutter/material.dart';

import '../../foundation/primitives.dart';
import '../../foundation/tokens.dart';

/// Inclusive date range for [DsCalendarVariant.range].
@immutable
class DsDateRange {
  const DsDateRange({required this.start, required this.end});

  final DateTime start;
  final DateTime end;
}

enum DsCalendarVariant { single, range, multi }

enum DsCalendarDisplay { inline, dropdown }

/// Semantic styling for [DsCalendar]. Mirrors `calendar.css` / `tokens.css`.
class DsCalendarTheme extends ThemeExtension<DsCalendarTheme> {
  const DsCalendarTheme({
    required this.triggerBackground,
    required this.triggerBorderColor,
    required this.triggerBorderWidth,
    required this.triggerHoverBorderColor,
    required this.triggerOpenBorderColor,
    required this.triggerFocusRingColor,
    required this.triggerFocusRingSpread,
    required this.triggerPadding,
    required this.triggerTextStyle,
    required this.placeholderColor,
    required this.panelWidth,
    required this.panelPadding,
    required this.panelBorderRadius,
    required this.panelBackground,
    required this.panelBorderColor,
    required this.panelShadowColor,
    required this.panelShadowBlur,
    required this.panelShadowOffsetY,
    required this.headerTextStyle,
    required this.navButtonSize,
    required this.weekdayTextStyle,
    required this.dayCellHeight,
    required this.dayTextStyle,
    required this.pickerCellHeight,
    required this.pickerTextStyle,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.disabledTextColor,
    required this.todayColor,
    required this.daySelectedBackground,
    required this.daySelectedForeground,
    required this.rangeBandBackground,
    required this.rangeBandForeground,
    required this.cellHoverBackground,
    required this.focusRingColor,
    required this.focusRingSpread,
    required this.iconColor,
  });

  final Color triggerBackground;
  final Color triggerBorderColor;
  final double triggerBorderWidth;
  final Color triggerHoverBorderColor;
  final Color triggerOpenBorderColor;
  final Color triggerFocusRingColor;
  final double triggerFocusRingSpread;
  final EdgeInsets triggerPadding;
  final TextStyle triggerTextStyle;
  final Color placeholderColor;

  final double panelWidth;
  final EdgeInsets panelPadding;
  final BorderRadius panelBorderRadius;
  final Color panelBackground;
  final Color panelBorderColor;
  final Color panelShadowColor;
  final double panelShadowBlur;
  final double panelShadowOffsetY;

  final TextStyle headerTextStyle;
  final double navButtonSize;
  final TextStyle weekdayTextStyle;
  final double dayCellHeight;
  final TextStyle dayTextStyle;
  final double pickerCellHeight;
  final TextStyle pickerTextStyle;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color disabledTextColor;
  final Color todayColor;

  final Color daySelectedBackground;
  final Color daySelectedForeground;
  final Color rangeBandBackground;
  final Color rangeBandForeground;
  final Color cellHoverBackground;

  /// Focus ring on grid cells (maps CSS `box-shadow: 0 0 0 3px var(--color-primary-ring)`).
  final Color focusRingColor;
  final double focusRingSpread;

  final Color iconColor;

  /// Light defaults aligned with `tokens.css` light semantic calendar + input colors.
  static const light = DsCalendarTheme(
    triggerBackground: DsPrimitives.greyWhite,
    triggerBorderColor: DsPrimitives.grey150,
    triggerBorderWidth: 1,
    triggerHoverBorderColor: DsPrimitives.grey200,
    triggerOpenBorderColor: DsPrimitives.purple200,
    triggerFocusRingColor: DsPrimitives.purple200,
    triggerFocusRingSpread: 2,
    triggerPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    triggerTextStyle: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
      color: DsPrimitives.grey800,
    ),
    placeholderColor: DsPrimitives.grey450,
    panelWidth: 340,
    panelPadding: EdgeInsets.all(16),
    panelBorderRadius: BorderRadius.all(Radius.circular(DsTokens.radius4xl)),
    panelBackground: DsPrimitives.grey50,
    panelBorderColor: DsPrimitives.greyWhite,
    panelShadowColor: DsPrimitives.blackA3,
    panelShadowBlur: 8,
    panelShadowOffsetY: 2,
    headerTextStyle: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w600,
      color: DsPrimitives.grey800,
    ),
    navButtonSize: 36,
    weekdayTextStyle: TextStyle(
      fontSize: 11,
      height: 14 / 11,
      letterSpacing: 0.3,
      fontWeight: FontWeight.w500,
      color: DsPrimitives.grey450,
    ),
    dayCellHeight: 40,
    dayTextStyle: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
      color: DsPrimitives.grey800,
    ),
    pickerCellHeight: 48,
    pickerTextStyle: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: DsPrimitives.grey800,
    ),
    primaryTextColor: DsPrimitives.grey800,
    secondaryTextColor: DsPrimitives.grey450,
    disabledTextColor: DsPrimitives.grey300,
    todayColor: DsTokens.colorPrimary,
    daySelectedBackground: DsTokens.colorPrimary,
    daySelectedForeground: DsTokens.colorOnPrimary,
    rangeBandBackground: DsPrimitives.purple50,
    rangeBandForeground: DsPrimitives.purple700,
    cellHoverBackground: DsPrimitives.grey100,
    focusRingColor: DsTokens.colorPrimaryRing,
    focusRingSpread: 3,
    iconColor: DsPrimitives.grey450,
  );

  static const defaults = light;

  @override
  DsCalendarTheme copyWith({
    Color? triggerBackground,
    Color? triggerBorderColor,
    double? triggerBorderWidth,
    Color? triggerHoverBorderColor,
    Color? triggerOpenBorderColor,
    Color? triggerFocusRingColor,
    double? triggerFocusRingSpread,
    EdgeInsets? triggerPadding,
    TextStyle? triggerTextStyle,
    Color? placeholderColor,
    double? panelWidth,
    EdgeInsets? panelPadding,
    BorderRadius? panelBorderRadius,
    Color? panelBackground,
    Color? panelBorderColor,
    Color? panelShadowColor,
    double? panelShadowBlur,
    double? panelShadowOffsetY,
    TextStyle? headerTextStyle,
    double? navButtonSize,
    TextStyle? weekdayTextStyle,
    double? dayCellHeight,
    TextStyle? dayTextStyle,
    double? pickerCellHeight,
    TextStyle? pickerTextStyle,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? disabledTextColor,
    Color? todayColor,
    Color? daySelectedBackground,
    Color? daySelectedForeground,
    Color? rangeBandBackground,
    Color? rangeBandForeground,
    Color? cellHoverBackground,
    Color? focusRingColor,
    double? focusRingSpread,
    Color? iconColor,
  }) {
    return DsCalendarTheme(
      triggerBackground: triggerBackground ?? this.triggerBackground,
      triggerBorderColor: triggerBorderColor ?? this.triggerBorderColor,
      triggerBorderWidth: triggerBorderWidth ?? this.triggerBorderWidth,
      triggerHoverBorderColor: triggerHoverBorderColor ?? this.triggerHoverBorderColor,
      triggerOpenBorderColor: triggerOpenBorderColor ?? this.triggerOpenBorderColor,
      triggerFocusRingColor: triggerFocusRingColor ?? this.triggerFocusRingColor,
      triggerFocusRingSpread: triggerFocusRingSpread ?? this.triggerFocusRingSpread,
      triggerPadding: triggerPadding ?? this.triggerPadding,
      triggerTextStyle: triggerTextStyle ?? this.triggerTextStyle,
      placeholderColor: placeholderColor ?? this.placeholderColor,
      panelWidth: panelWidth ?? this.panelWidth,
      panelPadding: panelPadding ?? this.panelPadding,
      panelBorderRadius: panelBorderRadius ?? this.panelBorderRadius,
      panelBackground: panelBackground ?? this.panelBackground,
      panelBorderColor: panelBorderColor ?? this.panelBorderColor,
      panelShadowColor: panelShadowColor ?? this.panelShadowColor,
      panelShadowBlur: panelShadowBlur ?? this.panelShadowBlur,
      panelShadowOffsetY: panelShadowOffsetY ?? this.panelShadowOffsetY,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      navButtonSize: navButtonSize ?? this.navButtonSize,
      weekdayTextStyle: weekdayTextStyle ?? this.weekdayTextStyle,
      dayCellHeight: dayCellHeight ?? this.dayCellHeight,
      dayTextStyle: dayTextStyle ?? this.dayTextStyle,
      pickerCellHeight: pickerCellHeight ?? this.pickerCellHeight,
      pickerTextStyle: pickerTextStyle ?? this.pickerTextStyle,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      todayColor: todayColor ?? this.todayColor,
      daySelectedBackground: daySelectedBackground ?? this.daySelectedBackground,
      daySelectedForeground: daySelectedForeground ?? this.daySelectedForeground,
      rangeBandBackground: rangeBandBackground ?? this.rangeBandBackground,
      rangeBandForeground: rangeBandForeground ?? this.rangeBandForeground,
      cellHoverBackground: cellHoverBackground ?? this.cellHoverBackground,
      focusRingColor: focusRingColor ?? this.focusRingColor,
      focusRingSpread: focusRingSpread ?? this.focusRingSpread,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  DsCalendarTheme lerp(DsCalendarTheme? other, double t) {
    if (other == null) return this;
    return DsCalendarTheme(
      triggerBackground: Color.lerp(triggerBackground, other.triggerBackground, t)!,
      triggerBorderColor: Color.lerp(triggerBorderColor, other.triggerBorderColor, t)!,
      triggerBorderWidth: lerpDouble(triggerBorderWidth, other.triggerBorderWidth, t)!,
      triggerHoverBorderColor:
          Color.lerp(triggerHoverBorderColor, other.triggerHoverBorderColor, t)!,
      triggerOpenBorderColor:
          Color.lerp(triggerOpenBorderColor, other.triggerOpenBorderColor, t)!,
      triggerFocusRingColor:
          Color.lerp(triggerFocusRingColor, other.triggerFocusRingColor, t)!,
      triggerFocusRingSpread:
          lerpDouble(triggerFocusRingSpread, other.triggerFocusRingSpread, t)!,
      triggerPadding: EdgeInsets.lerp(triggerPadding, other.triggerPadding, t)!,
      triggerTextStyle: TextStyle.lerp(triggerTextStyle, other.triggerTextStyle, t)!,
      placeholderColor: Color.lerp(placeholderColor, other.placeholderColor, t)!,
      panelWidth: lerpDouble(panelWidth, other.panelWidth, t)!,
      panelPadding: EdgeInsets.lerp(panelPadding, other.panelPadding, t)!,
      panelBorderRadius:
          BorderRadius.lerp(panelBorderRadius, other.panelBorderRadius, t)!,
      panelBackground: Color.lerp(panelBackground, other.panelBackground, t)!,
      panelBorderColor: Color.lerp(panelBorderColor, other.panelBorderColor, t)!,
      panelShadowColor: Color.lerp(panelShadowColor, other.panelShadowColor, t)!,
      panelShadowBlur: lerpDouble(panelShadowBlur, other.panelShadowBlur, t)!,
      panelShadowOffsetY:
          lerpDouble(panelShadowOffsetY, other.panelShadowOffsetY, t)!,
      headerTextStyle: TextStyle.lerp(headerTextStyle, other.headerTextStyle, t)!,
      navButtonSize: lerpDouble(navButtonSize, other.navButtonSize, t)!,
      weekdayTextStyle: TextStyle.lerp(weekdayTextStyle, other.weekdayTextStyle, t)!,
      dayCellHeight: lerpDouble(dayCellHeight, other.dayCellHeight, t)!,
      dayTextStyle: TextStyle.lerp(dayTextStyle, other.dayTextStyle, t)!,
      pickerCellHeight: lerpDouble(pickerCellHeight, other.pickerCellHeight, t)!,
      pickerTextStyle: TextStyle.lerp(pickerTextStyle, other.pickerTextStyle, t)!,
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      disabledTextColor: Color.lerp(disabledTextColor, other.disabledTextColor, t)!,
      todayColor: Color.lerp(todayColor, other.todayColor, t)!,
      daySelectedBackground:
          Color.lerp(daySelectedBackground, other.daySelectedBackground, t)!,
      daySelectedForeground:
          Color.lerp(daySelectedForeground, other.daySelectedForeground, t)!,
      rangeBandBackground:
          Color.lerp(rangeBandBackground, other.rangeBandBackground, t)!,
      rangeBandForeground:
          Color.lerp(rangeBandForeground, other.rangeBandForeground, t)!,
      cellHoverBackground:
          Color.lerp(cellHoverBackground, other.cellHoverBackground, t)!,
      focusRingColor: Color.lerp(focusRingColor, other.focusRingColor, t)!,
      focusRingSpread: lerpDouble(focusRingSpread, other.focusRingSpread, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }
}
