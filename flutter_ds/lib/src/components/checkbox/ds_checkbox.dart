import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ds_checkbox_theme.dart';

/// Design-system checkbox atom — pairs with [DsCheckboxTheme] on [ThemeData.extensions].
class DsCheckbox extends StatefulWidget {
  const DsCheckbox({
    super.key,
    required this.checked,
    required this.onChange,
    this.label,
    this.description,
    this.size = DsCheckboxSize.md,
    this.indeterminate = false,
    this.disabled = false,
    this.error = false,
  });

  final bool checked;
  final ValueChanged<bool> onChange;
  final String? label;
  final String? description;
  final DsCheckboxSize size;
  final bool indeterminate;
  final bool disabled;
  final bool error;

  @override
  State<DsCheckbox> createState() => _DsCheckboxState();
}

class _DsCheckboxState extends State<DsCheckbox> {
  late final FocusNode _focusNode;
  bool _hover = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        if (mounted) setState(() {});
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool get _usesDesktopPointer {
    if (kIsWeb) return true;
    return defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android;
  }

  void _toggle() {
    if (widget.disabled) return;
    HapticFeedback.lightImpact();
    widget.onChange(!widget.checked);
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsCheckboxTheme>() ?? DsCheckboxTheme.defaults;

    final boxSize = theme.boxSizeFor(widget.size);
    final iconSize = theme.iconSizeFor(widget.size);
    final radius = theme.borderRadiusFor(widget.size);
    final labelSize = theme.labelFontSizeFor(widget.size);

    final colors = _BoxColors.resolveAtom(
      theme: theme,
      checked: widget.checked,
      indeterminate: widget.indeterminate,
      disabled: widget.disabled,
      error: widget.error,
      hover: _hover && _usesDesktopPointer,
    );

    final boxChild = _CheckboxIcon(
      show: widget.checked || widget.indeterminate,
      indeterminate: widget.indeterminate,
      color: colors.icon,
      size: iconSize,
    );

    final boxDecoration = BoxDecoration(
      color: colors.bg,
      borderRadius: radius,
      border: Border.all(color: colors.border, width: 1.5),
      boxShadow: _focusNode.hasFocus && !widget.disabled
          ? [
              BoxShadow(
                color: theme.focusRingColor,
                blurRadius: 0,
                spreadRadius: 3,
              ),
            ]
          : null,
    );

    final box = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.ease,
      width: boxSize,
      height: boxSize,
      decoration: boxDecoration,
      child: Center(child: boxChild),
    );

    final inner = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          focusNode: _focusNode,
          onKeyEvent: (node, event) {
            if (widget.disabled) return KeyEventResult.ignored;
            if (event is! KeyDownEvent) return KeyEventResult.ignored;
            if (event.logicalKey == LogicalKeyboardKey.space ||
                event.logicalKey == LogicalKeyboardKey.enter) {
              _toggle();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: MouseRegion(
            onEnter: (_) {
              if (_usesDesktopPointer) setState(() => _hover = true);
            },
            onExit: (_) => setState(() => _hover = false),
            child: GestureDetector(
              onTap: widget.disabled ? null : _toggle,
              child: box,
            ),
          ),
        ),
        if (widget.label != null || widget.description != null) ...[
          SizedBox(width: theme.atomGap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.label != null)
                  Text(
                    widget.label!,
                    style: TextStyle(
                      fontSize: labelSize,
                      height: labelSize <= 14 ? 20 / 14 : 24 / 16,
                      fontWeight: FontWeight.w400,
                      color: theme.labelColor,
                    ),
                  ),
                if (widget.description != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      widget.description!,
                      style: TextStyle(
                        fontSize: theme.rowDescriptionFontSize,
                        height: 16 / 12,
                        fontWeight: FontWeight.w400,
                        color: theme.descriptionColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );

    Widget body = inner;
    if (widget.disabled) {
      body = IgnorePointer(child: body);
    }

    return Semantics(
      checked: widget.indeterminate ? null : widget.checked,
      mixed: widget.indeterminate,
      enabled: !widget.disabled,
      label: widget.label,
      child: body,
    );
  }
}

/// Full-width selection row — checkbox alignment follows [DsCheckboxTheme.desktopBreakpoint].
class DsCheckboxRow extends StatefulWidget {
  const DsCheckboxRow({
    super.key,
    required this.label,
    required this.checked,
    required this.onChange,
    this.description,
    this.indeterminate = false,
    this.error = false,
    this.isLast = false,
  });

  final String label;
  final bool checked;
  final ValueChanged<bool> onChange;
  final String? description;
  final bool indeterminate;
  final bool error;
  final bool isLast;

  @override
  State<DsCheckboxRow> createState() => _DsCheckboxRowState();
}

class _DsCheckboxRowState extends State<DsCheckboxRow> {
  bool _hover = false;
  bool _pressed = false;

  bool _desktopWide(BuildContext context, DsCheckboxTheme theme) =>
      MediaQuery.sizeOf(context).width >= theme.desktopBreakpoint;

  bool get _finePointerHover {
    // Mirrors CSS (hover: hover) and (pointer: fine) — approximate via desktop web / desktop targets.
    if (kIsWeb) return true;
    return defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android;
  }

  void _toggle() {
    HapticFeedback.lightImpact();
    widget.onChange(!widget.checked);
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsCheckboxTheme>() ?? DsCheckboxTheme.defaults;

    final desktop = _desktopWide(context, theme);
    final boxSize = desktop ? theme.boxSizeMd : theme.boxSizeLg;
    final iconSize = desktop ? theme.iconSizeMd : theme.iconSizeLg;
    final radius = desktop ? theme.borderRadiusMd : theme.borderRadiusLg;

    final colors = _BoxColors.resolveAtom(
      theme: theme,
      checked: widget.checked,
      indeterminate: widget.indeterminate,
      disabled: false,
      error: widget.error,
      hover: _hover && _finePointerHover,
    );

    final highlight = _hover || _pressed;

    final box = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: colors.bg,
        borderRadius: radius,
        border: Border.all(color: colors.border, width: 1.5),
      ),
      child: Center(
        child: _CheckboxIcon(
          show: widget.checked || widget.indeterminate,
          indeterminate: widget.indeterminate,
          color: colors.icon,
          size: iconSize,
        ),
      ),
    );

    final labelStyle = TextStyle(
      fontSize:
          desktop ? theme.rowLabelFontSizeDesktop : theme.rowLabelFontSizeMobile,
      height: desktop ? 24 / 16 : 24 / 18,
      fontWeight: FontWeight.w400,
      color: theme.labelColor,
    );

    final content = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.label, style: labelStyle),
          if (widget.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                widget.description!,
                style: TextStyle(
                  fontSize: theme.rowDescriptionFontSize,
                  height: 16 / 12,
                  fontWeight: FontWeight.w400,
                  color: theme.descriptionColor,
                ),
              ),
            ),
        ],
      ),
    );

    final rowChildren = desktop
        ? <Widget>[box, SizedBox(width: theme.rowGap), content]
        : <Widget>[content, SizedBox(width: theme.rowGap), box];

    // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React render.
    return Semantics(
      checked: widget.indeterminate ? null : widget.checked,
      mixed: widget.indeterminate,
      label: widget.label,
      button: true,
      child: MouseRegion(
      onEnter: (_) {
        if (_finePointerHover) setState(() => _hover = true);
      },
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: _toggle,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          constraints: BoxConstraints(
            minHeight:
                desktop ? theme.rowMinHeightDesktop : theme.rowMinHeightMobile,
          ),
          padding: EdgeInsets.symmetric(
            vertical: desktop
                ? theme.rowPaddingVerticalDesktop
                : theme.rowPaddingVerticalMobile,
          ),
          decoration: BoxDecoration(
            color: highlight ? theme.rowHoverBg : Colors.transparent,
            border: widget.isLast
                ? null
                : Border(
                    bottom: BorderSide(
                      color: theme.separatorColor,
                      width: 1,
                    ),
                  ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: rowChildren,
          ),
        ),
      ),
    ),
    );
  }
}

/// Group heading + list of [DsCheckboxRow] items sharing selection state.
class DsCheckboxGroup extends StatelessWidget {
  const DsCheckboxGroup({
    super.key,
    required this.label,
    required this.options,
    required this.value,
    required this.onChange,
    this.error = false,
  });

  final String label;
  final List<DsCheckboxOption> options;
  final List<String> value;
  final ValueChanged<List<String>> onChange;
  final bool error;

  void _toggle(String optValue) {
    final next = List<String>.from(value);
    if (next.contains(optValue)) {
      next.remove(optValue);
    } else {
      next.add(optValue);
    }
    onChange(next);
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsCheckboxTheme>() ?? DsCheckboxTheme.defaults;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: theme.groupLabelMarginBottom),
          child: Text(
            label,
            style: TextStyle(
              fontSize: theme.groupLabelFontSize,
              fontWeight: FontWeight.w500,
              color: theme.groupLabelColor,
            ),
          ),
        ),
        for (var i = 0; i < options.length; i++)
          DsCheckboxRow(
            label: options[i].label,
            description: options[i].description,
            checked: value.contains(options[i].value),
            indeterminate: false,
            error: error,
            isLast: i == options.length - 1,
            onChange: (_) => _toggle(options[i].value),
          ),
      ],
    );
  }
}

// ─── Shared visuals ────────────────────────────────────────────────────────────

class _BoxColors {
  _BoxColors({
    required this.border,
    required this.bg,
    required this.icon,
  });

  final Color border;
  final Color bg;
  final Color icon;

  static _BoxColors resolveAtom({
    required DsCheckboxTheme theme,
    required bool checked,
    required bool indeterminate,
    required bool disabled,
    required bool error,
    required bool hover,
  }) {
    if (disabled) {
      if (checked || indeterminate) {
        return _BoxColors(
          border: theme.borderDisabledChecked,
          bg: theme.bgDisabledChecked,
          icon: theme.iconColorDisabled,
        );
      }
      return _BoxColors(
        border: theme.borderDisabledUnchecked,
        bg: theme.bgDisabledUnchecked,
        icon: theme.iconColor,
      );
    }
    if (error && !checked && !indeterminate) {
      return _BoxColors(
        border: theme.borderError,
        bg: theme.bgError,
        icon: theme.iconColor,
      );
    }
    if (indeterminate || checked) {
      if (hover) {
        return _BoxColors(
          border: theme.borderHoverChecked,
          bg: theme.bgHoverChecked,
          icon: theme.iconColor,
        );
      }
      return _BoxColors(
        border: theme.borderChecked,
        bg: theme.bgChecked,
        icon: theme.iconColor,
      );
    }
    if (hover) {
      return _BoxColors(
        border: theme.borderHoverUnchecked,
        bg: theme.bgHoverUnchecked,
        icon: theme.iconColor,
      );
    }
    return _BoxColors(
      border: theme.borderUnchecked,
      bg: theme.bgUnchecked,
      icon: theme.iconColor,
    );
  }
}

class _CheckboxIcon extends StatelessWidget {
  const _CheckboxIcon({
    required this.show,
    required this.indeterminate,
    required this.color,
    required this.size,
  });

  final bool show;
  final bool indeterminate;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (!show) return SizedBox(width: size, height: size);
    return CustomPaint(
      size: Size(size, size),
      painter: _GlyphPainter(
        indeterminate: indeterminate,
        color: color,
      ),
    );
  }
}

class _GlyphPainter extends CustomPainter {
  _GlyphPainter({
    required this.indeterminate,
    required this.color,
  });

  final bool indeterminate;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final s = size.shortestSide / 12;
    if (indeterminate) {
      canvas.drawLine(Offset(2 * s, 6 * s), Offset(10 * s, 6 * s), paint);
      return;
    }
    final path = Path()
      ..moveTo(2 * s, 6 * s)
      ..lineTo(5 * s, 9 * s)
      ..lineTo(10 * s, 3 * s);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _GlyphPainter oldDelegate) =>
      oldDelegate.indeterminate != indeterminate || oldDelegate.color != color;
}
