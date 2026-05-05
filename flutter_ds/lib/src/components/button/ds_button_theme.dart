import 'dart:ui';
import 'package:flutter/material.dart';
import '../../foundation/tokens.dart';

enum DsButtonVariant { primary, secondary, inverted, ghost, link, danger }
enum DsButtonSize { xs, sm, md, lg, xl }

class DsButtonTheme extends ThemeExtension<DsButtonTheme> {
  const DsButtonTheme({
    // backgrounds
    required this.primaryBg,
    required this.primaryHoverBg,
    required this.secondaryBg,
    required this.secondaryBorderColor,
    required this.invertedBg,
    required this.ghostHoverBg,
    required this.dangerBg,
    required this.disabledBg,
    // foregrounds
    required this.primaryFg,
    required this.secondaryFg,
    required this.invertedFg,
    required this.ghostFg,
    required this.linkFg,
    required this.dangerFg,
    required this.disabledFg,
    // shadows
    required this.primaryShadowInner,
    required this.primaryHoverShadow,
    required this.focusRingColor,
    required this.dangerFocusRingColor,
    // dimensions — heights
    required this.xsHeight,
    required this.smHeight,
    required this.mdHeight,
    required this.lgHeight,
    required this.xlHeight,
    // dimensions — horizontal padding
    required this.xsPaddingH,
    required this.smPaddingH,
    required this.mdPaddingH,
    required this.lgPaddingH,
    required this.xlPaddingH,
    required this.linkPaddingH,
    // radius
    required this.borderRadius,
    // icon sizes
    required this.xsIconSize,
    required this.smIconSize,
    required this.mdIconSize,
    required this.lgIconSize,
    required this.xlIconSize,
    required this.iconGap,
    required this.dotsGap,
    // loading dots
    required this.dotSize,
    // animation
    required this.animationDuration,
    required this.animationCurve,
    required this.pressScale,
    required this.pressAnimationDuration,
  });

  // backgrounds
  final Color primaryBg;
  final Color primaryHoverBg;
  final Color secondaryBg;
  final Color secondaryBorderColor;
  final Color invertedBg;
  final Color ghostHoverBg;
  final Color dangerBg;
  final Color disabledBg;

  // foregrounds
  final Color primaryFg;
  final Color secondaryFg;
  final Color invertedFg;
  final Color ghostFg;
  final Color linkFg;
  final Color dangerFg;
  final Color disabledFg;

  // shadows
  final BoxShadow primaryShadowInner;
  final BoxShadow primaryHoverShadow;
  final Color focusRingColor;
  final Color dangerFocusRingColor;

  // dimensions — heights
  final double xsHeight;
  final double smHeight;
  final double mdHeight;
  final double lgHeight;
  final double xlHeight;

  // dimensions — horizontal padding
  final double xsPaddingH;
  final double smPaddingH;
  final double mdPaddingH;
  final double lgPaddingH;
  final double xlPaddingH;
  final double linkPaddingH;

  // radius
  final BorderRadius borderRadius;

  // icon sizes
  final double xsIconSize;
  final double smIconSize;
  final double mdIconSize;
  final double lgIconSize;
  final double xlIconSize;
  final double iconGap;
  final double dotsGap;

  // loading dots
  final double dotSize;

  // animation
  final Duration animationDuration;
  final Curve animationCurve;
  final double pressScale;
  final Duration pressAnimationDuration;

  // ─── Defaults (light theme) ────────────────────────────────────────────
  static final defaults = DsButtonTheme(
    primaryBg:            DsTokens.colorPrimary,
    primaryHoverBg:       DsTokens.colorPrimaryHover,
    secondaryBg:          DsTokens.colorBtnSecondaryBg,
    secondaryBorderColor: DsTokens.colorBtnSecondaryBorder,
    invertedBg:           DsTokens.colorBtnInvertedBg,
    ghostHoverBg:         DsTokens.colorBtnGhostHoverBg,
    dangerBg:             DsTokens.colorBtnDangerBg,
    disabledBg:           DsTokens.colorBtnDisabledBg,

    primaryFg:            DsTokens.colorOnPrimary,
    secondaryFg:          DsTokens.colorBtnSecondaryText,
    invertedFg:           DsTokens.colorBtnInvertedText,
    ghostFg:              DsTokens.colorBtnGhostColor,
    linkFg:               DsTokens.colorBtnLinkColor,
    dangerFg:             DsTokens.colorBtnDangerText,
    disabledFg:           DsTokens.colorBtnDisabledText,

    primaryShadowInner: const BoxShadow(
      color: Color(0x47FFFFFF),
      blurRadius: 2,
      spreadRadius: 1,
      offset: Offset(0, 1),
      blurStyle: BlurStyle.inner,
    ),
    primaryHoverShadow: const BoxShadow(
      color: Color(0x14000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
    focusRingColor:       DsTokens.colorPrimaryRing,
    dangerFocusRingColor: DsTokens.colorError,

    xsHeight: 32.0,
    smHeight: 40.0,
    mdHeight: 48.0,
    lgHeight: 56.0,
    xlHeight: 64.0,

    xsPaddingH:   16.0,
    smPaddingH:   16.0,
    mdPaddingH:   16.0,
    lgPaddingH:   24.0,
    xlPaddingH:   32.0,
    linkPaddingH: 0.0,

    borderRadius: BorderRadius.circular(DsTokens.radiusFull),

    xsIconSize: 12.0,
    smIconSize: 16.0,
    mdIconSize: 16.0,
    lgIconSize: 24.0,
    xlIconSize: 32.0,
    iconGap:    8.0,
    dotsGap:    4.0,

    dotSize: 6.0,

    animationDuration:     const Duration(milliseconds: 150),
    animationCurve:        DsTokens.easeOutCubic,
    pressScale:            0.97,
    pressAnimationDuration: const Duration(milliseconds: 100),
  );

  // ─── Helpers ───────────────────────────────────────────────────────────

  double heightFor(DsButtonSize size) => switch (size) {
    DsButtonSize.xs => xsHeight,
    DsButtonSize.sm => smHeight,
    DsButtonSize.md => mdHeight,
    DsButtonSize.lg => lgHeight,
    DsButtonSize.xl => xlHeight,
  };

  double paddingHFor(DsButtonVariant variant, DsButtonSize size) {
    if (variant == DsButtonVariant.link) return linkPaddingH;
    return switch (size) {
      DsButtonSize.xs => xsPaddingH,
      DsButtonSize.sm => smPaddingH,
      DsButtonSize.md => mdPaddingH,
      DsButtonSize.lg => lgPaddingH,
      DsButtonSize.xl => xlPaddingH,
    };
  }

  double iconSizeFor(DsButtonSize size) => switch (size) {
    DsButtonSize.xs => xsIconSize,
    DsButtonSize.sm => smIconSize,
    DsButtonSize.md => mdIconSize,
    DsButtonSize.lg => lgIconSize,
    DsButtonSize.xl => xlIconSize,
  };

  TextStyle textStyleFor(DsButtonSize size) => switch (size) {
    DsButtonSize.xs => const TextStyle(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w500),
    DsButtonSize.sm => const TextStyle(fontSize: 14, height: 18 / 14, fontWeight: FontWeight.w500),
    DsButtonSize.md => const TextStyle(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w500),
    DsButtonSize.lg => const TextStyle(fontSize: 18, height: 28 / 18, fontWeight: FontWeight.w500),
    DsButtonSize.xl => const TextStyle(fontSize: 20, height: 32 / 20, fontWeight: FontWeight.w500),
  };

  // ─── ThemeExtension ────────────────────────────────────────────────────

  @override
  DsButtonTheme copyWith({
    Color? primaryBg,
    Color? primaryHoverBg,
    Color? secondaryBg,
    Color? secondaryBorderColor,
    Color? invertedBg,
    Color? ghostHoverBg,
    Color? dangerBg,
    Color? disabledBg,
    Color? primaryFg,
    Color? secondaryFg,
    Color? invertedFg,
    Color? ghostFg,
    Color? linkFg,
    Color? dangerFg,
    Color? disabledFg,
    BoxShadow? primaryShadowInner,
    BoxShadow? primaryHoverShadow,
    Color? focusRingColor,
    Color? dangerFocusRingColor,
    double? xsHeight,
    double? smHeight,
    double? mdHeight,
    double? lgHeight,
    double? xlHeight,
    double? xsPaddingH,
    double? smPaddingH,
    double? mdPaddingH,
    double? lgPaddingH,
    double? xlPaddingH,
    double? linkPaddingH,
    BorderRadius? borderRadius,
    double? xsIconSize,
    double? smIconSize,
    double? mdIconSize,
    double? lgIconSize,
    double? xlIconSize,
    double? iconGap,
    double? dotsGap,
    double? dotSize,
    Duration? animationDuration,
    Curve? animationCurve,
    double? pressScale,
    Duration? pressAnimationDuration,
  }) {
    return DsButtonTheme(
      primaryBg:             primaryBg            ?? this.primaryBg,
      primaryHoverBg:        primaryHoverBg       ?? this.primaryHoverBg,
      secondaryBg:           secondaryBg          ?? this.secondaryBg,
      secondaryBorderColor:  secondaryBorderColor ?? this.secondaryBorderColor,
      invertedBg:            invertedBg           ?? this.invertedBg,
      ghostHoverBg:          ghostHoverBg         ?? this.ghostHoverBg,
      dangerBg:              dangerBg             ?? this.dangerBg,
      disabledBg:            disabledBg           ?? this.disabledBg,
      primaryFg:             primaryFg            ?? this.primaryFg,
      secondaryFg:           secondaryFg          ?? this.secondaryFg,
      invertedFg:            invertedFg           ?? this.invertedFg,
      ghostFg:               ghostFg              ?? this.ghostFg,
      linkFg:                linkFg               ?? this.linkFg,
      dangerFg:              dangerFg             ?? this.dangerFg,
      disabledFg:            disabledFg           ?? this.disabledFg,
      primaryShadowInner:    primaryShadowInner   ?? this.primaryShadowInner,
      primaryHoverShadow:    primaryHoverShadow   ?? this.primaryHoverShadow,
      focusRingColor:        focusRingColor       ?? this.focusRingColor,
      dangerFocusRingColor:  dangerFocusRingColor ?? this.dangerFocusRingColor,
      xsHeight:              xsHeight             ?? this.xsHeight,
      smHeight:              smHeight             ?? this.smHeight,
      mdHeight:              mdHeight             ?? this.mdHeight,
      lgHeight:              lgHeight             ?? this.lgHeight,
      xlHeight:              xlHeight             ?? this.xlHeight,
      xsPaddingH:            xsPaddingH           ?? this.xsPaddingH,
      smPaddingH:            smPaddingH           ?? this.smPaddingH,
      mdPaddingH:            mdPaddingH           ?? this.mdPaddingH,
      lgPaddingH:            lgPaddingH           ?? this.lgPaddingH,
      xlPaddingH:            xlPaddingH           ?? this.xlPaddingH,
      linkPaddingH:          linkPaddingH         ?? this.linkPaddingH,
      borderRadius:          borderRadius         ?? this.borderRadius,
      xsIconSize:            xsIconSize           ?? this.xsIconSize,
      smIconSize:            smIconSize           ?? this.smIconSize,
      mdIconSize:            mdIconSize           ?? this.mdIconSize,
      lgIconSize:            lgIconSize           ?? this.lgIconSize,
      xlIconSize:            xlIconSize           ?? this.xlIconSize,
      iconGap:               iconGap              ?? this.iconGap,
      dotsGap:               dotsGap              ?? this.dotsGap,
      dotSize:               dotSize              ?? this.dotSize,
      animationDuration:     animationDuration    ?? this.animationDuration,
      animationCurve:        animationCurve       ?? this.animationCurve,
      pressScale:            pressScale           ?? this.pressScale,
      pressAnimationDuration: pressAnimationDuration ?? this.pressAnimationDuration,
    );
  }

  @override
  DsButtonTheme lerp(DsButtonTheme? other, double t) {
    if (other == null) return this;
    return DsButtonTheme(
      primaryBg:            Color.lerp(primaryBg, other.primaryBg, t)!,
      primaryHoverBg:       Color.lerp(primaryHoverBg, other.primaryHoverBg, t)!,
      secondaryBg:          Color.lerp(secondaryBg, other.secondaryBg, t)!,
      secondaryBorderColor: Color.lerp(secondaryBorderColor, other.secondaryBorderColor, t)!,
      invertedBg:           Color.lerp(invertedBg, other.invertedBg, t)!,
      ghostHoverBg:         Color.lerp(ghostHoverBg, other.ghostHoverBg, t)!,
      dangerBg:             Color.lerp(dangerBg, other.dangerBg, t)!,
      disabledBg:           Color.lerp(disabledBg, other.disabledBg, t)!,
      primaryFg:            Color.lerp(primaryFg, other.primaryFg, t)!,
      secondaryFg:          Color.lerp(secondaryFg, other.secondaryFg, t)!,
      invertedFg:           Color.lerp(invertedFg, other.invertedFg, t)!,
      ghostFg:              Color.lerp(ghostFg, other.ghostFg, t)!,
      linkFg:               Color.lerp(linkFg, other.linkFg, t)!,
      dangerFg:             Color.lerp(dangerFg, other.dangerFg, t)!,
      disabledFg:           Color.lerp(disabledFg, other.disabledFg, t)!,
      primaryShadowInner:   other.primaryShadowInner,
      primaryHoverShadow:   other.primaryHoverShadow,
      focusRingColor:       Color.lerp(focusRingColor, other.focusRingColor, t)!,
      dangerFocusRingColor: Color.lerp(dangerFocusRingColor, other.dangerFocusRingColor, t)!,
      xsHeight:             lerpDouble(xsHeight, other.xsHeight, t)!,
      smHeight:             lerpDouble(smHeight, other.smHeight, t)!,
      mdHeight:             lerpDouble(mdHeight, other.mdHeight, t)!,
      lgHeight:             lerpDouble(lgHeight, other.lgHeight, t)!,
      xlHeight:             lerpDouble(xlHeight, other.xlHeight, t)!,
      xsPaddingH:           lerpDouble(xsPaddingH, other.xsPaddingH, t)!,
      smPaddingH:           lerpDouble(smPaddingH, other.smPaddingH, t)!,
      mdPaddingH:           lerpDouble(mdPaddingH, other.mdPaddingH, t)!,
      lgPaddingH:           lerpDouble(lgPaddingH, other.lgPaddingH, t)!,
      xlPaddingH:           lerpDouble(xlPaddingH, other.xlPaddingH, t)!,
      linkPaddingH:         lerpDouble(linkPaddingH, other.linkPaddingH, t)!,
      borderRadius:         BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      xsIconSize:           lerpDouble(xsIconSize, other.xsIconSize, t)!,
      smIconSize:           lerpDouble(smIconSize, other.smIconSize, t)!,
      mdIconSize:           lerpDouble(mdIconSize, other.mdIconSize, t)!,
      lgIconSize:           lerpDouble(lgIconSize, other.lgIconSize, t)!,
      xlIconSize:           lerpDouble(xlIconSize, other.xlIconSize, t)!,
      iconGap:              lerpDouble(iconGap, other.iconGap, t)!,
      dotsGap:              lerpDouble(dotsGap, other.dotsGap, t)!,
      dotSize:              lerpDouble(dotSize, other.dotSize, t)!,
      animationDuration:    other.animationDuration,
      animationCurve:       other.animationCurve,
      pressScale:           lerpDouble(pressScale, other.pressScale, t)!,
      pressAnimationDuration: other.pressAnimationDuration,
    );
  }
}
