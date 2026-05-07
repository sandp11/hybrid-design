import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../foundation/tokens.dart';
import 'ds_button_theme.dart';

class DsButton extends StatefulWidget {
  const DsButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = DsButtonVariant.primary,
    this.size = DsButtonSize.md,
    this.isLoading = false,
    this.iconLeft,
    this.iconRight,
    this.iconOnly = false,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final DsButtonVariant variant;
  final DsButtonSize size;
  final bool isLoading;
  final Widget? iconLeft;
  final Widget? iconRight;
  final bool iconOnly;
  final bool fullWidth;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  State<DsButton> createState() => _DsButtonState();
}

class _DsButtonState extends State<DsButton> {
  bool _isPressed  = false;
  bool _isFocused  = false;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        if (mounted) setState(() => _isFocused = _focusNode.hasFocus);
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handlePressed() {
    if (widget._isDisabled) return;
    HapticFeedback.lightImpact();
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsButtonTheme>() ?? DsButtonTheme.defaults;

    final height   = theme.heightFor(widget.size);
    final paddingH = theme.paddingHFor(widget.variant, widget.size);
    final iconSize = theme.iconSizeFor(widget.size);
    final br       = theme.borderRadius;

    // ─── Resolve colors ─────────────────────────────────────────────────
    Color bg;
    Color fg;
    List<BoxShadow> shadows = [];
    BoxBorder? variantBorder;

    if (widget._isDisabled) {
      bg = widget.variant == DsButtonVariant.link
          ? Colors.transparent
          : theme.disabledBg;
      fg = theme.disabledFg;
    } else {
      switch (widget.variant) {
        case DsButtonVariant.primary:
          bg = theme.primaryBg;
          fg = theme.primaryFg;
          shadows = [theme.primaryShadowInner];
        case DsButtonVariant.secondary:
          bg = theme.secondaryBg;
          fg = theme.secondaryFg;
          variantBorder =
              Border.all(color: theme.secondaryBorderColor, width: 1);
        case DsButtonVariant.inverted:
          bg = theme.invertedBg;
          fg = theme.invertedFg;
        case DsButtonVariant.ghost:
          bg = Colors.transparent;
          fg = theme.ghostFg;
        case DsButtonVariant.link:
          bg = Colors.transparent;
          fg = theme.linkFg;
        case DsButtonVariant.danger:
          bg = theme.dangerBg;
          fg = theme.dangerFg;
      }

      if (_isPressed) {
        bg = Color.alphaBlend(const Color(0x1A000000), bg);
      }
    }

    // ─── Focus ring ──────────────────────────────────────────────────────
    // Mirrors CSS `box-shadow: 0 0 0 3px <color>` — paints outside the
    // element without inflating layout. blurRadius:0 + spreadRadius:3 is
    // the exact Flutter equivalent.
    if (_isFocused && !widget._isDisabled) {
      final Color ringColor = widget.variant == DsButtonVariant.danger
          ? theme.dangerFocusRingColor.withOpacity(0.20)
          : theme.focusRingColor;
      shadows = [
        ...shadows,
        BoxShadow(
          color: ringColor,
          blurRadius: 0,
          spreadRadius: 3,
        ),
      ];
    }

    final activeBorder = variantBorder;

    // ─── Label ───────────────────────────────────────────────────────────
    final showUnderline = widget.variant == DsButtonVariant.link &&
        !widget._isDisabled;

    final labelWidget = widget.iconOnly
        ? const SizedBox.shrink()
        : Text(
            widget.label,
            style: theme.textStyleFor(widget.size).copyWith(
              color: fg,
              fontFamily: 'Euclid Circular B',
              decoration:
                  showUnderline ? TextDecoration.underline : TextDecoration.none,
            ),
          );

    // ─── Content row ─────────────────────────────────────────────────────
    final contentRow = widget.iconOnly
        ? SizedBox(
            width: iconSize,
            height: iconSize,
            child: widget.iconLeft ?? widget.iconRight,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.iconLeft != null) ...[
                SizedBox(width: iconSize, height: iconSize, child: widget.iconLeft),
                SizedBox(width: theme.iconGap),
              ],
              labelWidget,
              if (widget.iconRight != null) ...[
                SizedBox(width: theme.iconGap),
                SizedBox(width: iconSize, height: iconSize, child: widget.iconRight),
              ],
            ],
          );

    // ─── Loading / content switcher ──────────────────────────────────────
    final bodyContent = AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: widget.isLoading
          ? SizedBox(
              key: const ValueKey('dots'),
              width: widget.iconOnly ? height : null,
              height: height,
              child: Center(
                child: _DotWave(
                  color: fg,
                  dotSize: theme.dotSize,
                  gap: theme.dotsGap,
                ),
              ),
            )
          : SizedBox(
              key: const ValueKey('content'),
              width: widget.iconOnly ? height : null,
              height: height,
              child: Center(child: contentRow),
            ),
    );

    // ─── Animated container ───────────────────────────────────────────────
    Widget button = Focus(
      focusNode: _focusNode,
      child: AnimatedScale(
        scale: _isPressed && !widget._isDisabled ? theme.pressScale : 1.0,
        duration: theme.pressAnimationDuration,
        child: AnimatedContainer(
          duration: theme.animationDuration,
          curve: theme.animationCurve,
          height: height,
          width: widget.iconOnly
              ? height
              : (widget.fullWidth ? double.infinity : null),
          padding: widget.iconOnly
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(horizontal: paddingH),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: br,
            border: activeBorder,
            boxShadow: shadows.isEmpty ? null : shadows,
          ),
          child: GestureDetector(
            onTap: widget._isDisabled ? null : _handlePressed,
            onTapDown: (_) {
              if (!widget._isDisabled) setState(() => _isPressed = true);
            },
            onTapUp: (_) => setState(() => _isPressed = false),
            onTapCancel: () => setState(() => _isPressed = false),
            child: IconTheme(
              data: IconThemeData(color: fg, size: iconSize),
              child: widget.iconOnly
                  ? Center(
                      child: widget.isLoading
                          ? _DotWave(color: fg, dotSize: theme.dotSize, gap: theme.dotsGap)
                          : widget.iconLeft ?? widget.iconRight,
                    )
                  : Center(child: bodyContent),
            ),
          ),
        ),
      ),
    );

    // ─── Disabled: no Opacity widget — explicit colors already applied.
    // IgnorePointer blocks gesture detection while keeping focus accessible.
    if (widget._isDisabled) {
      button = IgnorePointer(child: button);
    }

    return Semantics(
      label: widget.isLoading ? '${widget.label}, loading' : widget.label,
      button: true,
      enabled: !widget._isDisabled,
      focusable: true,
      child: button,
    );
  }
}

// ─── 3-dot wave loading indicator ─────────────────────────────────────────────

class _DotWave extends StatefulWidget {
  const _DotWave({
    required this.color,
    required this.dotSize,
    required this.gap,
  });

  final Color  color;
  final double dotSize;
  final double gap;

  @override
  State<_DotWave> createState() => _DotWaveState();
}

class _DotWaveState extends State<_DotWave> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  // Offsets as fraction of 1200ms cycle: 0ms=0.0, 150ms≈0.125, 300ms=0.25
  static const _offsets = [0.0, 0.125, 0.25];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  /// Maps a single dot's phase (0–1) to a vertical offset.
  /// 0–30%: descend 0→−6px; 30–60%: ascend −6→0px; 60–100%: rest at 0.
  double _wave(double t) {
    if (t < 0.30) return -6.0 * (t / 0.30);
    if (t < 0.60) return -6.0 * (1.0 - (t - 0.30) / 0.30);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (i) {
          final dy = _wave((_ctrl.value + _offsets[i]) % 1.0);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.gap / 2),
            child: Transform.translate(
              offset: Offset(0, dy),
              child: Container(
                width:  widget.dotSize,
                height: widget.dotSize,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
