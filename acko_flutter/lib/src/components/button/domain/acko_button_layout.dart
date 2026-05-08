import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ds_button_theme.dart';
import '../presentation/acko_button_content.dart';
import '../presentation/acko_button_loading_dots.dart';
import 'acko_button_contract.dart';
import 'acko_button_shadow.dart';
import 'acko_button_style_resolver.dart';

class DsButtonState extends State<DsButton> {
  bool _isPressed = false;
  bool _isFocused = false;
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
    if (widget.isDisabled) return;
    HapticFeedback.lightImpact();
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsButtonTheme>() ?? DsButtonTheme.defaults;

    final height = theme.heightFor(widget.size);
    final paddingH = theme.paddingHFor(widget.variant, widget.size);
    final iconSize = theme.iconSizeFor(widget.size);
    final br = theme.borderRadius;

    final resolved = resolveButtonStyle(
      variant: widget.variant,
      theme: theme,
      isDisabled: widget.isDisabled,
      isPressed: _isPressed,
    );

    final shadows = resolveButtonShadows(
      variant: widget.variant,
      theme: theme,
      isFocused: _isFocused,
      isDisabled: widget.isDisabled,
      baseShadows: resolved.shadows,
    );

    final bodyContent = AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: widget.isLoading
          ? SizedBox(
              key: const ValueKey('dots'),
              width: widget.iconOnly ? height : null,
              height: height,
              child: Center(
                child: AckoButtonLoadingDots(
                  color: resolved.fg,
                  dotSize: theme.dotSize,
                  gap: theme.dotsGap,
                ),
              ),
            )
          : SizedBox(
              key: const ValueKey('content'),
              width: widget.iconOnly ? height : null,
              height: height,
              child: Center(
                child: AckoButtonContent(
                  label: widget.label,
                  variant: widget.variant,
                  size: widget.size,
                  fg: resolved.fg,
                  iconLeft: widget.iconLeft,
                  iconRight: widget.iconRight,
                  iconOnly: widget.iconOnly,
                  isDisabled: widget.isDisabled,
                  theme: theme,
                ),
              ),
            ),
    );

    Widget button = Focus(
      focusNode: _focusNode,
      child: AnimatedScale(
        scale: _isPressed && !widget.isDisabled ? theme.pressScale : 1.0,
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
            color: resolved.bg,
            borderRadius: br,
            border: resolved.border,
            boxShadow: shadows.isEmpty ? null : shadows,
          ),
          child: GestureDetector(
            onTap: widget.isDisabled ? null : _handlePressed,
            onTapDown: (_) {
              if (!widget.isDisabled) setState(() => _isPressed = true);
            },
            onTapUp: (_) => setState(() => _isPressed = false),
            onTapCancel: () => setState(() => _isPressed = false),
            child: IconTheme(
              data: IconThemeData(color: resolved.fg, size: iconSize),
              child: widget.iconOnly
                  ? Center(
                      child: widget.isLoading
                          ? AckoButtonLoadingDots(
                              color: resolved.fg,
                              dotSize: theme.dotSize,
                              gap: theme.dotsGap,
                            )
                          : widget.iconLeft ?? widget.iconRight,
                    )
                  : Center(child: bodyContent),
            ),
          ),
        ),
      ),
    );

    if (widget.isDisabled) {
      button = IgnorePointer(child: button);
    }

    return Semantics(
      label: widget.isLoading ? '${widget.label}, loading' : widget.label,
      button: true,
      enabled: !widget.isDisabled,
      focusable: true,
      child: button,
    );
  }
}
