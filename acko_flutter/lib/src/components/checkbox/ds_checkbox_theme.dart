import 'dart:ui';
import 'package:flutter/material.dart';
import '../../foundation/primitives.dart';
import '../../foundation/tokens.dart';

enum DsCheckboxSize { sm, md, lg }

class DsCheckboxOption {
  const DsCheckboxOption({
    required this.value,
    required this.label,
    this.description,
  });
  final String  value;
  final String  label;
  final String? description;
}

// ─── Theme extension ───────────────────────────────────────────────────────────

class DsCheckboxTheme extends ThemeExtension<DsCheckboxTheme> {
  const DsCheckboxTheme({
    // Box dimensions
    required this.boxSizeSm,
    required this.boxSizeMd,
    required this.boxSizeLg,
    required this.borderRadiusSm,
    required this.borderRadiusMd,
    required this.borderRadiusLg,
    // Icon dimensions
    required this.iconSizeSm,
    required this.iconSizeMd,
    required this.iconSizeLg,
    // Label font sizes
    required this.labelFontSizeSm,
    required this.labelFontSizeMd,
    required this.labelFontSizeLg,
    // Box colors
    required this.borderUnchecked,
    required this.bgUnchecked,
    required this.borderChecked,
    required this.bgChecked,
    required this.borderHoverUnchecked,
    required this.bgHoverUnchecked,
    required this.borderHoverChecked,
    required this.bgHoverChecked,
    required this.borderDisabledUnchecked,
    required this.bgDisabledUnchecked,
    required this.borderDisabledChecked,
    required this.bgDisabledChecked,
    required this.borderError,
    required this.bgError,
    // Icon colors
    required this.iconColor,
    required this.iconColorDisabled,
    // Focus
    required this.focusRingColor,
    // Text
    required this.labelColor,
    required this.descriptionColor,
    // Row
    required this.rowMinHeightDesktop,
    required this.rowMinHeightMobile,
    required this.rowPaddingVerticalDesktop,
    required this.rowPaddingVerticalMobile,
    required this.rowGap,
    required this.rowHoverBg,
    required this.rowLabelFontSizeDesktop,
    required this.rowLabelFontSizeMobile,
    required this.rowDescriptionFontSize,
    // Separator
    required this.separatorColor,
    // Group label
    required this.groupLabelFontSize,
    required this.groupLabelColor,
    required this.groupLabelMarginBottom,
    // Atom gap
    required this.atomGap,
    // Breakpoint
    required this.desktopBreakpoint,
  });

  final double       boxSizeSm;
  final double       boxSizeMd;
  final double       boxSizeLg;
  final BorderRadius borderRadiusSm;
  final BorderRadius borderRadiusMd;
  final BorderRadius borderRadiusLg;

  final double iconSizeSm;
  final double iconSizeMd;
  final double iconSizeLg;

  final double labelFontSizeSm;
  final double labelFontSizeMd;
  final double labelFontSizeLg;

  final Color borderUnchecked;
  final Color bgUnchecked;
  final Color borderChecked;
  final Color bgChecked;
  final Color borderHoverUnchecked;
  final Color bgHoverUnchecked;
  final Color borderHoverChecked;
  final Color bgHoverChecked;
  final Color borderDisabledUnchecked;
  final Color bgDisabledUnchecked;
  final Color borderDisabledChecked;
  final Color bgDisabledChecked;
  final Color borderError;
  final Color bgError;

  final Color iconColor;
  final Color iconColorDisabled;
  final Color focusRingColor;

  final Color  labelColor;
  final Color  descriptionColor;

  final double rowMinHeightDesktop;
  final double rowMinHeightMobile;
  final double rowPaddingVerticalDesktop;
  final double rowPaddingVerticalMobile;
  final double rowGap;
  final Color  rowHoverBg;
  final double rowLabelFontSizeDesktop;
  final double rowLabelFontSizeMobile;
  final double rowDescriptionFontSize;

  final Color  separatorColor;

  final double groupLabelFontSize;
  final Color  groupLabelColor;
  final double groupLabelMarginBottom;

  final double atomGap;
  final double desktopBreakpoint;

  // ─── Light defaults ───────────────────────────────────────────────────────────

  static const light = DsCheckboxTheme(
    boxSizeSm: 16.0,
    boxSizeMd: 20.0,
    boxSizeLg: 24.0,
    borderRadiusSm: BorderRadius.all(Radius.circular(DsTokens.radiusSm)),
    borderRadiusMd: BorderRadius.all(Radius.circular(DsTokens.radiusMd)),
    borderRadiusLg: BorderRadius.all(Radius.circular(DsTokens.radiusMd)),

    iconSizeSm: 10.0,
    iconSizeMd: 12.0,
    iconSizeLg: 14.0,

    labelFontSizeSm: 14.0,
    labelFontSizeMd: 16.0,
    labelFontSizeLg: 18.0,

    borderUnchecked:          DsTokens.colorBorder,         // grey300
    bgUnchecked:              Colors.transparent,
    borderChecked:            DsTokens.colorPrimary,
    bgChecked:                DsTokens.colorPrimary,
    borderHoverUnchecked:     DsTokens.colorBorderStrong,   // grey450
    bgHoverUnchecked:         DsTokens.colorCardBg,         // grey50
    borderHoverChecked:       DsTokens.colorPrimaryHover,
    bgHoverChecked:           DsTokens.colorPrimaryHover,
    borderDisabledUnchecked:  DsTokens.colorReadonlyBorder, // grey250
    bgDisabledUnchecked:      DsTokens.colorDisabledBg,     // grey150
    borderDisabledChecked:    DsTokens.colorDisabledText,   // grey350
    bgDisabledChecked:        DsTokens.colorDisabledText,   // grey350
    borderError:              DsTokens.colorError,
    bgError:                  DsTokens.colorCardBg,

    iconColor:         DsTokens.colorOnPrimary,
    iconColorDisabled: DsTokens.colorDisabledText,
    focusRingColor:    DsTokens.colorPrimaryRing,

    labelColor:       DsTokens.colorTextDefault,
    descriptionColor: DsTokens.colorTextSecondary,

    rowMinHeightDesktop:          44.0,
    rowMinHeightMobile:           52.0,
    rowPaddingVerticalDesktop:    12.0,
    rowPaddingVerticalMobile:     16.0,
    rowGap:                       12.0,
    rowHoverBg:                   DsTokens.colorSurfaceGhostHover,
    rowLabelFontSizeDesktop:      16.0,
    rowLabelFontSizeMobile:       18.0,
    rowDescriptionFontSize:       12.0,

    separatorColor:          DsTokens.colorBorder,
    groupLabelFontSize:      14.0,
    groupLabelColor:         DsTokens.colorTextDefault,
    groupLabelMarginBottom:  8.0,
    atomGap:                 12.0,
    desktopBreakpoint:       768.0,
  );

  // ─── Dark defaults ────────────────────────────────────────────────────────────

  static const dark = DsCheckboxTheme(
    boxSizeSm: 16.0,
    boxSizeMd: 20.0,
    boxSizeLg: 24.0,
    borderRadiusSm: BorderRadius.all(Radius.circular(DsTokens.radiusSm)),
    borderRadiusMd: BorderRadius.all(Radius.circular(DsTokens.radiusMd)),
    borderRadiusLg: BorderRadius.all(Radius.circular(DsTokens.radiusMd)),

    iconSizeSm: 10.0,
    iconSizeMd: 12.0,
    iconSizeLg: 14.0,

    labelFontSizeSm: 14.0,
    labelFontSizeMd: 16.0,
    labelFontSizeLg: 18.0,

    borderUnchecked:          DsPrimitives.grey550,
    bgUnchecked:              Colors.transparent,
    borderChecked:            DsPrimitives.purple500,
    bgChecked:                DsPrimitives.purple500,
    borderHoverUnchecked:     DsPrimitives.grey500,
    bgHoverUnchecked:         DsPrimitives.grey700,
    borderHoverChecked:       DsPrimitives.purple400,
    bgHoverChecked:           DsPrimitives.purple400,
    borderDisabledUnchecked:  DsPrimitives.grey600,
    bgDisabledUnchecked:      DsTokens.colorSurfaceRaisedDark,
    borderDisabledChecked:    DsPrimitives.grey550,
    bgDisabledChecked:        DsPrimitives.grey550,
    borderError:              DsTokens.colorError,
    bgError:                  Colors.transparent,

    iconColor:         DsTokens.colorOnPrimary,
    iconColorDisabled: DsPrimitives.grey450,
    focusRingColor:    DsPrimitives.purple800,

    labelColor:       DsTokens.colorTextDefaultDark,
    descriptionColor: DsTokens.colorTextSecondaryDark,

    rowMinHeightDesktop:          44.0,
    rowMinHeightMobile:           52.0,
    rowPaddingVerticalDesktop:    12.0,
    rowPaddingVerticalMobile:     16.0,
    rowGap:                       12.0,
    rowHoverBg:                   DsTokens.colorSurfaceGhostHoverDark,
    rowLabelFontSizeDesktop:      16.0,
    rowLabelFontSizeMobile:       18.0,
    rowDescriptionFontSize:       12.0,

    separatorColor:          DsPrimitives.grey600,
    groupLabelFontSize:      14.0,
    groupLabelColor:         DsTokens.colorTextDefaultDark,
    groupLabelMarginBottom:  8.0,
    atomGap:                 12.0,
    desktopBreakpoint:       768.0,
  );

  static const defaults = light;

  // ─── Helpers ─────────────────────────────────────────────────────────────────

  double boxSizeFor(DsCheckboxSize size) => switch (size) {
    DsCheckboxSize.sm => boxSizeSm,
    DsCheckboxSize.md => boxSizeMd,
    DsCheckboxSize.lg => boxSizeLg,
  };

  double iconSizeFor(DsCheckboxSize size) => switch (size) {
    DsCheckboxSize.sm => iconSizeSm,
    DsCheckboxSize.md => iconSizeMd,
    DsCheckboxSize.lg => iconSizeLg,
  };

  BorderRadius borderRadiusFor(DsCheckboxSize size) => switch (size) {
    DsCheckboxSize.sm => borderRadiusSm,
    DsCheckboxSize.md => borderRadiusMd,
    DsCheckboxSize.lg => borderRadiusLg,
  };

  double labelFontSizeFor(DsCheckboxSize size) => switch (size) {
    DsCheckboxSize.sm => labelFontSizeSm,
    DsCheckboxSize.md => labelFontSizeMd,
    DsCheckboxSize.lg => labelFontSizeLg,
  };

  // ─── ThemeExtension ───────────────────────────────────────────────────────────

  @override
  DsCheckboxTheme copyWith({
    double? boxSizeSm, double? boxSizeMd, double? boxSizeLg,
    BorderRadius? borderRadiusSm, BorderRadius? borderRadiusMd, BorderRadius? borderRadiusLg,
    double? iconSizeSm, double? iconSizeMd, double? iconSizeLg,
    double? labelFontSizeSm, double? labelFontSizeMd, double? labelFontSizeLg,
    Color? borderUnchecked, Color? bgUnchecked,
    Color? borderChecked, Color? bgChecked,
    Color? borderHoverUnchecked, Color? bgHoverUnchecked,
    Color? borderHoverChecked, Color? bgHoverChecked,
    Color? borderDisabledUnchecked, Color? bgDisabledUnchecked,
    Color? borderDisabledChecked, Color? bgDisabledChecked,
    Color? borderError, Color? bgError,
    Color? iconColor, Color? iconColorDisabled, Color? focusRingColor,
    Color? labelColor, Color? descriptionColor,
    double? rowMinHeightDesktop, double? rowMinHeightMobile,
    double? rowPaddingVerticalDesktop, double? rowPaddingVerticalMobile,
    double? rowGap, Color? rowHoverBg,
    double? rowLabelFontSizeDesktop, double? rowLabelFontSizeMobile,
    double? rowDescriptionFontSize,
    Color? separatorColor,
    double? groupLabelFontSize, Color? groupLabelColor, double? groupLabelMarginBottom,
    double? atomGap, double? desktopBreakpoint,
  }) {
    return DsCheckboxTheme(
      boxSizeSm: boxSizeSm ?? this.boxSizeSm,
      boxSizeMd: boxSizeMd ?? this.boxSizeMd,
      boxSizeLg: boxSizeLg ?? this.boxSizeLg,
      borderRadiusSm: borderRadiusSm ?? this.borderRadiusSm,
      borderRadiusMd: borderRadiusMd ?? this.borderRadiusMd,
      borderRadiusLg: borderRadiusLg ?? this.borderRadiusLg,
      iconSizeSm: iconSizeSm ?? this.iconSizeSm,
      iconSizeMd: iconSizeMd ?? this.iconSizeMd,
      iconSizeLg: iconSizeLg ?? this.iconSizeLg,
      labelFontSizeSm: labelFontSizeSm ?? this.labelFontSizeSm,
      labelFontSizeMd: labelFontSizeMd ?? this.labelFontSizeMd,
      labelFontSizeLg: labelFontSizeLg ?? this.labelFontSizeLg,
      borderUnchecked: borderUnchecked ?? this.borderUnchecked,
      bgUnchecked: bgUnchecked ?? this.bgUnchecked,
      borderChecked: borderChecked ?? this.borderChecked,
      bgChecked: bgChecked ?? this.bgChecked,
      borderHoverUnchecked: borderHoverUnchecked ?? this.borderHoverUnchecked,
      bgHoverUnchecked: bgHoverUnchecked ?? this.bgHoverUnchecked,
      borderHoverChecked: borderHoverChecked ?? this.borderHoverChecked,
      bgHoverChecked: bgHoverChecked ?? this.bgHoverChecked,
      borderDisabledUnchecked: borderDisabledUnchecked ?? this.borderDisabledUnchecked,
      bgDisabledUnchecked: bgDisabledUnchecked ?? this.bgDisabledUnchecked,
      borderDisabledChecked: borderDisabledChecked ?? this.borderDisabledChecked,
      bgDisabledChecked: bgDisabledChecked ?? this.bgDisabledChecked,
      borderError: borderError ?? this.borderError,
      bgError: bgError ?? this.bgError,
      iconColor: iconColor ?? this.iconColor,
      iconColorDisabled: iconColorDisabled ?? this.iconColorDisabled,
      focusRingColor: focusRingColor ?? this.focusRingColor,
      labelColor: labelColor ?? this.labelColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      rowMinHeightDesktop: rowMinHeightDesktop ?? this.rowMinHeightDesktop,
      rowMinHeightMobile: rowMinHeightMobile ?? this.rowMinHeightMobile,
      rowPaddingVerticalDesktop: rowPaddingVerticalDesktop ?? this.rowPaddingVerticalDesktop,
      rowPaddingVerticalMobile: rowPaddingVerticalMobile ?? this.rowPaddingVerticalMobile,
      rowGap: rowGap ?? this.rowGap,
      rowHoverBg: rowHoverBg ?? this.rowHoverBg,
      rowLabelFontSizeDesktop: rowLabelFontSizeDesktop ?? this.rowLabelFontSizeDesktop,
      rowLabelFontSizeMobile: rowLabelFontSizeMobile ?? this.rowLabelFontSizeMobile,
      rowDescriptionFontSize: rowDescriptionFontSize ?? this.rowDescriptionFontSize,
      separatorColor: separatorColor ?? this.separatorColor,
      groupLabelFontSize: groupLabelFontSize ?? this.groupLabelFontSize,
      groupLabelColor: groupLabelColor ?? this.groupLabelColor,
      groupLabelMarginBottom: groupLabelMarginBottom ?? this.groupLabelMarginBottom,
      atomGap: atomGap ?? this.atomGap,
      desktopBreakpoint: desktopBreakpoint ?? this.desktopBreakpoint,
    );
  }

  @override
  DsCheckboxTheme lerp(DsCheckboxTheme? other, double t) {
    if (other == null) return this;
    return DsCheckboxTheme(
      boxSizeSm: lerpDouble(boxSizeSm, other.boxSizeSm, t)!,
      boxSizeMd: lerpDouble(boxSizeMd, other.boxSizeMd, t)!,
      boxSizeLg: lerpDouble(boxSizeLg, other.boxSizeLg, t)!,
      borderRadiusSm: BorderRadius.lerp(borderRadiusSm, other.borderRadiusSm, t)!,
      borderRadiusMd: BorderRadius.lerp(borderRadiusMd, other.borderRadiusMd, t)!,
      borderRadiusLg: BorderRadius.lerp(borderRadiusLg, other.borderRadiusLg, t)!,
      iconSizeSm: lerpDouble(iconSizeSm, other.iconSizeSm, t)!,
      iconSizeMd: lerpDouble(iconSizeMd, other.iconSizeMd, t)!,
      iconSizeLg: lerpDouble(iconSizeLg, other.iconSizeLg, t)!,
      labelFontSizeSm: lerpDouble(labelFontSizeSm, other.labelFontSizeSm, t)!,
      labelFontSizeMd: lerpDouble(labelFontSizeMd, other.labelFontSizeMd, t)!,
      labelFontSizeLg: lerpDouble(labelFontSizeLg, other.labelFontSizeLg, t)!,
      borderUnchecked: Color.lerp(borderUnchecked, other.borderUnchecked, t)!,
      bgUnchecked: Color.lerp(bgUnchecked, other.bgUnchecked, t)!,
      borderChecked: Color.lerp(borderChecked, other.borderChecked, t)!,
      bgChecked: Color.lerp(bgChecked, other.bgChecked, t)!,
      borderHoverUnchecked: Color.lerp(borderHoverUnchecked, other.borderHoverUnchecked, t)!,
      bgHoverUnchecked: Color.lerp(bgHoverUnchecked, other.bgHoverUnchecked, t)!,
      borderHoverChecked: Color.lerp(borderHoverChecked, other.borderHoverChecked, t)!,
      bgHoverChecked: Color.lerp(bgHoverChecked, other.bgHoverChecked, t)!,
      borderDisabledUnchecked: Color.lerp(borderDisabledUnchecked, other.borderDisabledUnchecked, t)!,
      bgDisabledUnchecked: Color.lerp(bgDisabledUnchecked, other.bgDisabledUnchecked, t)!,
      borderDisabledChecked: Color.lerp(borderDisabledChecked, other.borderDisabledChecked, t)!,
      bgDisabledChecked: Color.lerp(bgDisabledChecked, other.bgDisabledChecked, t)!,
      borderError: Color.lerp(borderError, other.borderError, t)!,
      bgError: Color.lerp(bgError, other.bgError, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconColorDisabled: Color.lerp(iconColorDisabled, other.iconColorDisabled, t)!,
      focusRingColor: Color.lerp(focusRingColor, other.focusRingColor, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      descriptionColor: Color.lerp(descriptionColor, other.descriptionColor, t)!,
      rowMinHeightDesktop: lerpDouble(rowMinHeightDesktop, other.rowMinHeightDesktop, t)!,
      rowMinHeightMobile: lerpDouble(rowMinHeightMobile, other.rowMinHeightMobile, t)!,
      rowPaddingVerticalDesktop: lerpDouble(rowPaddingVerticalDesktop, other.rowPaddingVerticalDesktop, t)!,
      rowPaddingVerticalMobile: lerpDouble(rowPaddingVerticalMobile, other.rowPaddingVerticalMobile, t)!,
      rowGap: lerpDouble(rowGap, other.rowGap, t)!,
      rowHoverBg: Color.lerp(rowHoverBg, other.rowHoverBg, t)!,
      rowLabelFontSizeDesktop: lerpDouble(rowLabelFontSizeDesktop, other.rowLabelFontSizeDesktop, t)!,
      rowLabelFontSizeMobile: lerpDouble(rowLabelFontSizeMobile, other.rowLabelFontSizeMobile, t)!,
      rowDescriptionFontSize: lerpDouble(rowDescriptionFontSize, other.rowDescriptionFontSize, t)!,
      separatorColor: Color.lerp(separatorColor, other.separatorColor, t)!,
      groupLabelFontSize: lerpDouble(groupLabelFontSize, other.groupLabelFontSize, t)!,
      groupLabelColor: Color.lerp(groupLabelColor, other.groupLabelColor, t)!,
      groupLabelMarginBottom: lerpDouble(groupLabelMarginBottom, other.groupLabelMarginBottom, t)!,
      atomGap: lerpDouble(atomGap, other.atomGap, t)!,
      desktopBreakpoint: lerpDouble(desktopBreakpoint, other.desktopBreakpoint, t)!,
    );
  }
}
