import 'package:flutter/material.dart';

import '../../foundation/tokens.dart';
import 'ds_card_theme.dart';

/// Maps React `variant="default"`.
enum DsCardVariant { standard, secondary, elevated, outline, demoted }

enum DsCardPadding { none, sm, md, lg }

double _gutter(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  return w >= DsTokens.cardBreakpointWidth
      ? DsTokens.cardContentGutterWide
      : DsTokens.cardContentGutterNarrow;
}

double _outerRadius(BuildContext context) {
  return MediaQuery.sizeOf(context).width >= DsTokens.cardBreakpointWidth
      ? DsTokens.radius6xl
      : DsTokens.radius5xl;
}

double _nestedRadius(BuildContext context) {
  return MediaQuery.sizeOf(context).width >= DsTokens.cardBreakpointWidth
      ? DsTokens.radius3xl
      : DsTokens.radius2xl;
}

EdgeInsets _shellPadding(DsCardPadding padding, double gutter) {
  switch (padding) {
    case DsCardPadding.none:
      return EdgeInsets.zero;
    case DsCardPadding.sm:
      return EdgeInsets.all(gutter - 4);
    case DsCardPadding.md:
      return EdgeInsets.all(gutter);
    case DsCardPadding.lg:
      return EdgeInsets.all(gutter + 8);
  }
}

BoxDecoration _shellDecoration(DsCardVariant variant, DsCardTheme theme, double radius) {
  switch (variant) {
    case DsCardVariant.standard:
      return BoxDecoration(
        color: DsTokens.colorCardBg,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: DsTokens.colorCardBorder),
      );
    case DsCardVariant.secondary:
      return BoxDecoration(
        color: DsTokens.colorCardSecondaryBg,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: DsTokens.colorCardSecondaryBorder),
      );
    case DsCardVariant.elevated:
      return BoxDecoration(
        color: DsTokens.colorCardElevatedBg,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: theme.elevatedShadows,
      );
    case DsCardVariant.outline:
      return BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: DsTokens.colorCardOutlineBorder),
      );
    case DsCardVariant.demoted:
      return BoxDecoration(
        color: DsTokens.colorCardDemotedBg,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: DsTokens.colorCardDemotedBorder),
      );
  }
}

/// Design-system card shell — pairs with [DsCardTheme] on [ThemeData.extensions].
class DsCard extends StatelessWidget {
  const DsCard({
    super.key,
    this.variant = DsCardVariant.standard,
    this.padding = DsCardPadding.lg,
    required this.child,
  });

  final DsCardVariant variant;
  final DsCardPadding padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DsCardTheme>() ?? DsCardTheme.defaults;
    final gutter = _gutter(context);
    final outerR = _outerRadius(context);
    final inset = _shellPadding(padding, gutter);
    final deco = _shellDecoration(variant, theme, outerR);

    return DecoratedBox(
      decoration: deco,
      child: Padding(
        padding: inset,
        child: child,
      ),
    );
  }
}

/// Header region — bottom divider per style.md.
class DsCardHeader extends StatelessWidget {
  const DsCardHeader({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DsCardTheme>() ?? DsCardTheme.defaults;

    return Container(
      padding: EdgeInsets.only(bottom: theme.headerPaddingBottom),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.dividerColor),
        ),
      ),
      child: child,
    );
  }
}

/// Main content region — vertical rhythm only (horizontal inset from [DsCard]).
class DsCardContent extends StatelessWidget {
  const DsCardContent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DsCardTheme>() ?? DsCardTheme.defaults;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: theme.contentPaddingVertical),
      child: child,
    );
  }
}

/// Footer region — top divider; align actions end per style.md.
class DsCardFooter extends StatelessWidget {
  const DsCardFooter({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DsCardTheme>() ?? DsCardTheme.defaults;

    return Container(
      padding: EdgeInsets.only(top: theme.footerPaddingTop),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.dividerColor),
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: child,
      ),
    );
  }
}

/// Nested inset surface — demoted fill + nested responsive radius.
class DsCardInset extends StatelessWidget {
  const DsCardInset({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final gutter = _gutter(context);
    final r = _nestedRadius(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: DsTokens.colorCardDemotedBg,
        borderRadius: BorderRadius.circular(r),
        border: Border.all(color: DsTokens.colorCardDemotedBorder),
      ),
      child: Padding(
        padding: EdgeInsets.all(gutter),
        child: child,
      ),
    );
  }
}
