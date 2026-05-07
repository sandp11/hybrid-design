import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ds_accordion_theme.dart';

enum DsAccordionType { single, multiple }

/// One row + collapsible body for [DsAccordion].
class DsAccordionItem {
  const DsAccordionItem({
    required this.value,
    required this.trigger,
    required this.content,
    this.disabled = false,
  });

  final String value;
  final Widget trigger;
  final Widget content;
  final bool disabled;
}

/// Design-system accordion — pairs with [DsAccordionTheme] on [ThemeData.extensions].
class DsAccordion extends StatefulWidget {
  const DsAccordion({
    super.key,
    required this.type,
    required this.items,
    this.defaultValue = const [],
    this.collapsible = true,
    this.expandDuration,
  });

  final DsAccordionType type;
  final List<DsAccordionItem> items;
  final List<String> defaultValue;
  final bool collapsible;
  final Duration? expandDuration;

  @override
  State<DsAccordion> createState() => _DsAccordionState();
}

class _DsAccordionState extends State<DsAccordion> {
  late Set<String> _open;

  @override
  void initState() {
    super.initState();
    _open = _initialOpen();
  }

  Set<String> _initialOpen() {
    if (widget.defaultValue.isEmpty) return <String>{};
    if (widget.type == DsAccordionType.single) {
      return {widget.defaultValue.first};
    }
    return widget.defaultValue.toSet();
  }

  void _toggle(DsAccordionItem item) {
    if (item.disabled) return;

    setState(() {
      if (widget.type == DsAccordionType.multiple) {
        if (_open.contains(item.value)) {
          _open = Set<String>.from(_open)..remove(item.value);
        } else {
          _open = Set<String>.from(_open)..add(item.value);
        }
        return;
      }

      if (_open.contains(item.value)) {
        if (widget.collapsible) {
          _open = <String>{};
        }
        return;
      }

      _open = {item.value};
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsAccordionTheme>() ?? DsAccordionTheme.defaults;
    final duration = widget.expandDuration ??
        (MediaQuery.disableAnimationsOf(context)
            ? Duration.zero
            : theme.expandDuration);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < widget.items.length; i++)
          _AccordionSection(
            item: widget.items[i],
            isLast: i == widget.items.length - 1,
            open: _open.contains(widget.items[i].value),
            duration: duration,
            onTap: () {
              HapticFeedback.lightImpact();
              _toggle(widget.items[i]);
            },
          ),
      ],
    );
  }
}

class _AccordionSection extends StatefulWidget {
  const _AccordionSection({
    required this.item,
    required this.isLast,
    required this.open,
    required this.duration,
    required this.onTap,
  });

  final DsAccordionItem item;
  final bool isLast;
  final bool open;
  final Duration duration;
  final VoidCallback onTap;

  @override
  State<_AccordionSection> createState() => _AccordionSectionState();
}

class _AccordionSectionState extends State<_AccordionSection> {
  bool _hover = false;

  bool get _finePointer {
    if (kIsWeb) return true;
    return defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android;
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsAccordionTheme>() ?? DsAccordionTheme.defaults;

    final disabled = widget.item.disabled;
    final triggerColor = disabled
        ? theme.triggerDisabledColor
        : (_hover && _finePointer ? theme.triggerHoverColor : theme.triggerColor);

    final triggerStyle = TextStyle(
      fontFamily: 'Euclid Circular B',
      fontSize: theme.triggerFontSize,
      height: theme.triggerLineHeight / theme.triggerFontSize,
      fontWeight: theme.triggerFontWeight,
      color: triggerColor,
    );

    final contentStyle = TextStyle(
      fontFamily: 'Euclid Circular B',
      fontSize: theme.contentFontSize,
      height: theme.contentLineHeight / theme.contentFontSize,
      fontWeight: FontWeight.w400,
      color: theme.contentColor,
    );

    // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React render.
    final triggerRow = MouseRegion(
      onEnter: (_) {
        if (_finePointer) setState(() => _hover = true);
      },
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: disabled ? null : widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DefaultTextStyle.merge(
                  style: triggerStyle,
                  child: widget.item.trigger,
                ),
              ),
              SizedBox(width: 16),
              AnimatedRotation(
                turns: widget.open ? 0.5 : 0,
                duration: widget.duration,
                curve: Curves.decelerate,
                child: Icon(
                  Icons.expand_more,
                  size: theme.chevronSize,
                  color: triggerColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final panel = ClipRect(
      child: AnimatedAlign(
        alignment: Alignment.topCenter,
        heightFactor: widget.open ? 1 : 0,
        duration: widget.duration,
        curve: Curves.decelerate,
        child: Padding(
          padding: EdgeInsets.only(bottom: theme.contentPaddingBottom),
          child: DefaultTextStyle(
            style: contentStyle,
            child: widget.item.content,
          ),
        ),
      ),
    );

    // UX REVIEW: medium parity-risk — AnimatedAlign heightFactor vs CSS max-height; verify against React render.
    return DecoratedBox(
      decoration: BoxDecoration(
        border: widget.isLast
            ? null
            : Border(
                bottom: BorderSide(color: theme.borderColor, width: 1),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            button: true,
            expanded: widget.open,
            enabled: !disabled,
            child: triggerRow,
          ),
          panel,
        ],
      ),
    );
  }
}
