import 'dart:ui';
import 'package:flutter/material.dart';
import 'ds_badge_theme.dart';

// ─── Badge ─────────────────────────────────────────────────────────────────────

class DsBadge extends StatelessWidget {
  const DsBadge({
    super.key,
    required this.label,
    this.variant  = DsBadgeVariant.solid,
    this.color    = DsBadgeColor.purple,
    this.textCase = DsBadgeTextCase.uppercase,
    this.removable = false,
    this.onRemove,
  });

  final String          label;
  final DsBadgeVariant  variant;
  final DsBadgeColor    color;
  final DsBadgeTextCase textCase;
  final bool            removable;
  final VoidCallback?   onRemove;

  @override
  Widget build(BuildContext context) {
    final theme    = Theme.of(context).extension<DsBadgeTheme>() ?? DsBadgeTheme.defaults;
    final colorSet = theme.colorSetFor(color);

    // Responsive sizing — matches CSS @media (min-width: 768px)
    // UX REVIEW: high parity-risk — CSS uses viewport width; Flutter uses logical pixels via MediaQuery. Verify against React render.
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize    = screenWidth >= theme.desktopBreakpoint
        ? theme.desktopTextSize
        : theme.mobileTextSize;

    // ─── Resolve fill + foreground per variant ──────────────────────────────
    final Color     fg;
    final Gradient? gradient;
    final BoxBorder border;

    switch (variant) {
      case DsBadgeVariant.solid:
      case DsBadgeVariant.dot:
        fg       = colorSet.text;
        gradient = LinearGradient(
          begin:  Alignment.bottomCenter,
          end:    Alignment.topCenter,
          colors: [colorSet.gradientFrom, colorSet.gradientTo],
        );
        border = Border.all(color: colorSet.border, width: 1.0);
      case DsBadgeVariant.outline:
        fg       = colorSet.outlineColor;
        gradient = null;
        border   = Border.all(color: colorSet.outlineColor, width: 1.0);
    }

    // ─── Text case ──────────────────────────────────────────────────────────
    // UX REVIEW: high parity-risk — CSS letter-spacing is in em units; Flutter letterSpacing is logical px.
    // Formula: fontSize * 0.04 approximates 0.04em (e.g. 12px × 0.04 = 0.48px). Verify against React render.
    final displayText   = textCase == DsBadgeTextCase.uppercase ? label.toUpperCase() : label;
    final letterSpacing = textCase == DsBadgeTextCase.uppercase ? fontSize * 0.04 : 0.0;

    final textWidget = Text(
      displayText,
      style: TextStyle(
        fontSize:      fontSize,
        fontWeight:    FontWeight.w500,
        fontFamily:    'Euclid Circular B',
        color:         fg,
        letterSpacing: letterSpacing,
        height:        1.0,
      ),
    );

    // ─── Children row ───────────────────────────────────────────────────────
    final gap = SizedBox(width: theme.gap);

    final rowChildren = <Widget>[
      if (variant == DsBadgeVariant.dot) ...[
        Container(
          width:  theme.dotSize,
          height: theme.dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fg,
          ),
        ),
        gap,
      ],
      textWidget,
      if (removable) ...[
        gap,
        Semantics(
          label:  'Remove',
          button: true,
          child: GestureDetector(
            onTap: onRemove,
            child: SizedBox(
              width:  fontSize * 0.65,
              height: fontSize * 0.65,
              child: CustomPaint(
                painter: _XIconPainter(color: fg),
              ),
            ),
          ),
        ),
      ],
    ];

    return Semantics(
      label: label,
      child: Container(
        padding: theme.padding,
        decoration: BoxDecoration(
          gradient:     gradient,
          color:        gradient == null ? Colors.transparent : null,
          borderRadius: theme.borderRadius,
          border:       border,
        ),
        child: Row(
          mainAxisSize:       MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:           rowChildren,
        ),
      ),
    );
  }
}

// ─── Counter badge ─────────────────────────────────────────────────────────────

class DsCounterBadge extends StatelessWidget {
  const DsCounterBadge({
    super.key,
    required this.count,
    this.max,
    this.color = DsCounterBadgeColor.purple,
  });

  final int                count;
  final int?               max;
  final DsCounterBadgeColor color;

  @override
  Widget build(BuildContext context) {
    final theme    = Theme.of(context).extension<DsBadgeTheme>() ?? DsBadgeTheme.defaults;
    final colorSet = theme.counterColorSetFor(color);

    final display = max != null && count > max! ? '$max+' : '$count';

    return Container(
      constraints: BoxConstraints(minWidth: theme.counterMinWidth),
      padding: theme.counterPadding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin:  Alignment.bottomCenter,
          end:    Alignment.topCenter,
          colors: [colorSet.gradientFrom, colorSet.gradientTo],
        ),
        borderRadius: theme.borderRadius,
        border: Border.all(color: colorSet.border, width: 1.0),
      ),
      child: Text(
        display,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize:    theme.mobileTextSize, // counter always 12px
          fontWeight:  FontWeight.w500,
          fontFamily:  'Euclid Circular B',
          color:       theme.counterText,
          height:      1.0,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

// ─── X icon painter ────────────────────────────────────────────────────────────

class _XIconPainter extends CustomPainter {
  const _XIconPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color      = color
      ..strokeWidth = 1.5
      ..strokeCap  = StrokeCap.round
      ..style      = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, 0),         Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height),         paint);
  }

  @override
  bool shouldRepaint(_XIconPainter old) => old.color != color;
}
