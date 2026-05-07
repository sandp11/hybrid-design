import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../foundation/tokens.dart';
import 'ds_calendar_theme.dart';

const _kShortMonths = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

enum _PanelView { days, months, years }

enum _RangePhase { idle, needEnd }

DateTime _startOfDay(DateTime d) => DateTime(d.year, d.month, d.day);

bool _isSameDay(DateTime a, DateTime b) =>
    _startOfDay(a) == _startOfDay(b);

int _compareDay(DateTime a, DateTime b) =>
    _startOfDay(a).compareTo(_startOfDay(b));

(DateTime, DateTime) _normalizeRangeTuple(DateTime a, DateTime b) {
  final sa = _startOfDay(a);
  final sb = _startOfDay(b);
  return sa.compareTo(sb) <= 0 ? (sa, sb) : (sb, sa);
}

int _daysInMonth(int year, int month) => DateTime(year, month + 1, 0).day;

class _MonthCell {
  const _MonthCell({required this.date, required this.outside});

  final DateTime date;
  final bool outside;
}

List<_MonthCell> _buildMonthMatrix(DateTime cursorMonth) {
  final year = cursorMonth.year;
  final month = cursorMonth.month;
  final first = DateTime(year, month, 1);
  final startWeekday = first.weekday % 7;
  final dim = _daysInMonth(year, month);
  final cells = <_MonthCell>[];
  final prevMonthLast = DateTime(year, month, 0);
  final prevDim = prevMonthLast.day;
  for (var i = 0; i < startWeekday; i++) {
    final dayNum = prevDim - startWeekday + i + 1;
    cells.add(_MonthCell(date: DateTime(year, month - 1, dayNum), outside: true));
  }
  for (var d = 1; d <= dim; d++) {
    cells.add(_MonthCell(date: DateTime(year, month, d), outside: false));
  }
  var nextDay = 1;
  while (cells.length < 42) {
    cells.add(_MonthCell(date: DateTime(year, month + 1, nextDay++), outside: true));
  }
  return cells;
}

List<List<T>> _chunk<T>(List<T> arr, int size) {
  final out = <List<T>>[];
  for (var i = 0; i < arr.length; i += size) {
    final end = i + size < arr.length ? i + size : arr.length;
    out.add(arr.sublist(i, end));
  }
  return out;
}

bool _isDisabled(
  DateTime date,
  DateTime? minDate,
  DateTime? maxDate,
  List<DateTime>? disabledDates,
) {
  final d = _startOfDay(date);
  if (minDate != null && _compareDay(d, _startOfDay(minDate)) < 0) return true;
  if (maxDate != null && _compareDay(d, _startOfDay(maxDate)) > 0) return true;
  if (disabledDates?.any((x) => _isSameDay(x, date)) ?? false) return true;
  return false;
}

DateTime _initialCursor(Object value, DsCalendarVariant variant) {
  final today = _startOfDay(DateTime.now());
  switch (variant) {
    case DsCalendarVariant.single:
      final d = value as DateTime;
      return d.millisecondsSinceEpoch > 0 ? _startOfDay(d) : today;
    case DsCalendarVariant.range:
      final r = value as DsDateRange;
      return _startOfDay(r.start);
    case DsCalendarVariant.multi:
      final arr = value as List<DateTime>;
      if (arr.isEmpty) return today;
      final sorted = [...arr]..sort(_compareDay);
      return _startOfDay(sorted.last);
  }
}

/// Design-system calendar — pairs with [DsCalendarTheme] on [ThemeData.extensions].
class DsCalendar extends StatefulWidget {
  const DsCalendar({
    super.key,
    required this.variant,
    this.display = DsCalendarDisplay.dropdown,
    required this.value,
    required this.onChanged,
    this.minDate,
    this.maxDate,
    this.disabledDates,
    this.locale,
  });

  final DsCalendarVariant variant;
  final DsCalendarDisplay display;
  final Object value;
  final ValueChanged<Object> onChanged;
  final DateTime? minDate;
  final DateTime? maxDate;
  final List<DateTime>? disabledDates;
  final Locale? locale;

  @override
  State<DsCalendar> createState() => _DsCalendarState();
}

class _DsCalendarState extends State<DsCalendar> {
  late DateTime _cursorDate;
  late int _yearPageStart;
  _PanelView _panelView = _PanelView.days;
  _RangePhase _rangePhase = _RangePhase.idle;
  DateTime? _hoverDate;
  bool _open = false;
  bool _triggerHover = false;
  int? _pressedDayIndex;

  @override
  void initState() {
    super.initState();
    _cursorDate = _initialCursor(widget.value, widget.variant);
    _yearPageStart = (_cursorDate.year ~/ 12) * 12;
    _open = widget.display == DsCalendarDisplay.inline;
  }

  @override
  void didUpdateWidget(DsCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value || oldWidget.variant != widget.variant) {
      _cursorDate = _initialCursor(widget.value, widget.variant);
      if (widget.variant == DsCalendarVariant.range) {
        final r = widget.value as DsDateRange;
        if (!_isSameDay(r.start, r.end)) {
          _rangePhase = _RangePhase.idle;
        }
      }
    }
  }

  bool get _usesDesktopPointer {
    if (kIsWeb) return true;
    return defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android;
  }

  String _triggerLabel(MaterialLocalizations loc) {
    switch (widget.variant) {
      case DsCalendarVariant.single:
        final d = widget.value as DateTime;
        if (d.millisecondsSinceEpoch <= 0) return 'Select date';
        return loc.formatShortDate(d);
      case DsCalendarVariant.range:
        final r = widget.value as DsDateRange;
        if (r.start.millisecondsSinceEpoch <= 0) return 'Select date';
        if (_isSameDay(r.start, r.end)) {
          return loc.formatShortMonthDay(r.start);
        }
        return '${loc.formatShortMonthDay(r.start)} — ${loc.formatShortDate(r.end)}';
      case DsCalendarVariant.multi:
        final arr = widget.value as List<DateTime>;
        if (arr.isEmpty) return 'Select date';
        return '${arr.length} dates selected';
    }
  }

  bool get _triggerPlaceholder {
    switch (widget.variant) {
      case DsCalendarVariant.single:
        return (widget.value as DateTime).millisecondsSinceEpoch <= 0;
      case DsCalendarVariant.range:
        return (widget.value as DsDateRange).start.millisecondsSinceEpoch <= 0;
      case DsCalendarVariant.multi:
        return (widget.value as List<DateTime>).isEmpty;
    }
  }

  void _handleDayTap(DateTime date, bool outside) {
    if (outside) return;
    if (_isDisabled(date, widget.minDate, widget.maxDate, widget.disabledDates)) {
      return;
    }

    final v = _startOfDay(date);

    switch (widget.variant) {
      case DsCalendarVariant.single:
        HapticFeedback.lightImpact();
        widget.onChanged(v);
        if (widget.display == DsCalendarDisplay.dropdown) {
          setState(() => _open = false);
        }
        return;
      case DsCalendarVariant.multi:
        HapticFeedback.lightImpact();
        final arr = List<DateTime>.from(widget.value as List<DateTime>);
        final ix = arr.indexWhere((x) => _isSameDay(x, date));
        if (ix >= 0) {
          arr.removeAt(ix);
        } else {
          arr.add(v);
        }
        widget.onChanged(arr);
        return;
      case DsCalendarVariant.range:
        HapticFeedback.lightImpact();
        final r = widget.value as DsDateRange;
        if (_rangePhase == _RangePhase.idle) {
          widget.onChanged(DsDateRange(start: v, end: v));
          setState(() => _rangePhase = _RangePhase.needEnd);
          return;
        }
        final anchor = _startOfDay(r.start);
        final (lo, hi) = _normalizeRangeTuple(anchor, date);
        widget.onChanged(DsDateRange(start: lo, end: hi));
        setState(() {
          _rangePhase = _RangePhase.idle;
          _hoverDate = null;
          if (widget.display == DsCalendarDisplay.dropdown) _open = false;
        });
        return;
    }
  }

  void _onEscape() {
    if (_panelView == _PanelView.years) {
      setState(() => _panelView = _PanelView.months);
      return;
    }
    if (_panelView == _PanelView.months) {
      setState(() => _panelView = _PanelView.days);
      return;
    }
    if (widget.display == DsCalendarDisplay.dropdown && _open) {
      setState(() => _open = false);
    }
  }

  ({Color? bg, Color fg, FontWeight weight, BorderRadius radius}) _dayStyle({
    required DsCalendarTheme theme,
    required DateTime date,
    required bool outside,
  }) {
    final dis =
        _isDisabled(date, widget.minDate, widget.maxDate, widget.disabledDates);
    final today = _isSameDay(date, _startOfDay(DateTime.now()));

    Color? bg;
    var fg = theme.primaryTextColor;
    var weight = FontWeight.w400;
    var radius = BorderRadius.circular(DsTokens.radiusFull);

    if (widget.variant == DsCalendarVariant.single) {
      final sel = widget.value as DateTime;
      if (sel.millisecondsSinceEpoch > 0 && _isSameDay(date, sel)) {
        bg = theme.daySelectedBackground;
        fg = theme.daySelectedForeground;
        weight = FontWeight.w600;
      }
    } else if (widget.variant == DsCalendarVariant.multi) {
      final arr = widget.value as List<DateTime>;
      if (arr.any((x) => _isSameDay(x, date))) {
        bg = theme.daySelectedBackground;
        fg = theme.daySelectedForeground;
        weight = FontWeight.w600;
      }
    } else {
      final r = widget.value as DsDateRange;
      final start = _startOfDay(r.start);
      final endBase = _startOfDay(r.end);
      late DateTime lo;
      late DateTime hi;
      if (_rangePhase == _RangePhase.needEnd && _hoverDate != null) {
        (lo, hi) = _normalizeRangeTuple(start, _hoverDate!);
      } else {
        (lo, hi) = _normalizeRangeTuple(start, endBase);
      }
      if (_compareDay(date, lo) >= 0 && _compareDay(date, hi) <= 0) {
        if (_isSameDay(lo, hi)) {
          bg = theme.daySelectedBackground;
          fg = theme.daySelectedForeground;
          weight = FontWeight.w600;
        } else if (_isSameDay(date, lo)) {
          bg = theme.daySelectedBackground;
          fg = theme.daySelectedForeground;
          weight = FontWeight.w600;
          radius = const BorderRadius.horizontal(
            left: Radius.circular(DsTokens.radiusFull),
            right: Radius.zero,
          );
        } else if (_isSameDay(date, hi)) {
          bg = theme.daySelectedBackground;
          fg = theme.daySelectedForeground;
          weight = FontWeight.w600;
          radius = const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(DsTokens.radiusFull),
          );
        } else {
          bg = theme.rangeBandBackground;
          fg = theme.rangeBandForeground;
          weight = FontWeight.w500;
          radius = BorderRadius.zero;
        }
      }
    }

    if (outside) {
      fg = theme.disabledTextColor;
    }
    if (dis) {
      fg = theme.secondaryTextColor;
    }
    if (today && bg == null) {
      fg = theme.todayColor;
      weight = FontWeight.w700;
    }

    return (bg: bg, fg: fg, weight: weight, radius: radius);
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).extension<DsCalendarTheme>() ?? DsCalendarTheme.defaults;
    final loc = MaterialLocalizations.of(context);
    final weekdays = loc.narrowWeekdays;
    final matrix = _buildMonthMatrix(_cursorDate);

    Widget panel = Focus(
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.escape) {
          _onEscape();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: MouseRegion(
        onExit: (_) {
          if (widget.variant == DsCalendarVariant.range &&
              _rangePhase == _RangePhase.needEnd) {
            setState(() => _hoverDate = null);
          }
        },
        child: Container(
        width: theme.panelWidth,
        padding: theme.panelPadding,
        decoration: BoxDecoration(
          color: theme.panelBackground,
          borderRadius: theme.panelBorderRadius,
          border: Border.all(color: theme.panelBorderColor),
          boxShadow: [
            BoxShadow(
              color: theme.panelShadowColor,
              blurRadius: theme.panelShadowBlur,
              offset: Offset(0, theme.panelShadowOffsetY),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                _NavIconBtn(
                  theme: theme,
                  tooltip: 'Previous',
                  onTap: () {
                    setState(() {
                      if (_panelView == _PanelView.days) {
                        _cursorDate =
                            DateTime(_cursorDate.year, _cursorDate.month - 1);
                      } else if (_panelView == _PanelView.months) {
                        _cursorDate =
                            DateTime(_cursorDate.year - 1, _cursorDate.month);
                      } else {
                        _yearPageStart -= 12;
                      }
                    });
                  },
                  icon: Icons.chevron_left,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_panelView == _PanelView.days) {
                          _panelView = _PanelView.months;
                        } else if (_panelView == _PanelView.months) {
                          _yearPageStart = (_cursorDate.year ~/ 12) * 12;
                          _panelView = _PanelView.years;
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: theme.primaryTextColor,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DsTokens.radiusLg),
                      ),
                    ),
                    child: Text(
                      _panelView == _PanelView.days
                          ? loc.formatMonthYear(_cursorDate)
                          : _panelView == _PanelView.months
                              ? '${_cursorDate.year}'
                              : '$_yearPageStart — ${_yearPageStart + 11}',
                      style: theme.headerTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                _NavIconBtn(
                  theme: theme,
                  tooltip: 'Next',
                  onTap: () {
                    setState(() {
                      if (_panelView == _PanelView.days) {
                        _cursorDate =
                            DateTime(_cursorDate.year, _cursorDate.month + 1);
                      } else if (_panelView == _PanelView.months) {
                        _cursorDate =
                            DateTime(_cursorDate.year + 1, _cursorDate.month);
                      } else {
                        _yearPageStart += 12;
                      }
                    });
                  },
                  icon: Icons.chevron_right,
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_panelView == _PanelView.days) ...[
              Row(
                children: weekdays
                    .map(
                      (w) => Expanded(
                        child: Text(
                          w.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.weekdayTextStyle,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 8),
              ..._chunk(matrix, 7).map((row) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: row.asMap().entries.map((e) {
                      final cell = e.value;
                      final flatIndex = matrix.indexOf(cell);
                      final dis = _isDisabled(
                        cell.date,
                        widget.minDate,
                        widget.maxDate,
                        widget.disabledDates,
                      );
                      final pressed = _pressedDayIndex == flatIndex;
                      final sty = _dayStyle(
                        theme: theme,
                        date: cell.date,
                        outside: cell.outside,
                      );

                      final cellWidget = AnimatedScale(
                        scale: pressed ? 0.97 : 1,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.ease,
                        child: Focus(
                          onFocusChange: (_) => setState(() {}),
                          child: Builder(
                            builder: (ctx) {
                              final focused = Focus.of(ctx).hasFocus;
                              final deco = BoxDecoration(
                                color: sty.bg,
                                borderRadius: sty.radius,
                                boxShadow: focused && !dis
                                    ? <BoxShadow>[
                                        BoxShadow(
                                          color: theme.focusRingColor,
                                          blurRadius: 0,
                                          spreadRadius: theme.focusRingSpread,
                                        ),
                                      ]
                                    : null,
                              );

                              final content = Container(
                                height: theme.dayCellHeight,
                                alignment: Alignment.center,
                                decoration: deco,
                                child: Text(
                                  '${cell.date.day}',
                                  style: theme.dayTextStyle.copyWith(
                                    color: sty.fg,
                                    fontWeight: sty.weight,
                                  ),
                                ),
                              );

                              return MouseRegion(
                                onEnter: (_) {
                                  if (!_usesDesktopPointer) return;
                                  // UX REVIEW: high parity-risk — hover only on desktop Flutter, verify against React.
                                  if (widget.variant == DsCalendarVariant.range &&
                                      _rangePhase == _RangePhase.needEnd) {
                                    setState(
                                      () => _hoverDate = _startOfDay(cell.date),
                                    );
                                  }
                                },
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTapDown: (_) {
                                    if (!dis) {
                                      setState(() => _pressedDayIndex = flatIndex);
                                    }
                                  },
                                  onTapUp: (_) =>
                                      setState(() => _pressedDayIndex = null),
                                  onTapCancel: () =>
                                      setState(() => _pressedDayIndex = null),
                                  onTap: () =>
                                      _handleDayTap(cell.date, cell.outside),
                                  child: IgnorePointer(
                                    ignoring: dis,
                                    child: content,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );

                      return Expanded(child: cellWidget);
                    }).toList(),
                  ),
                );
              }),
            ],
            if (_panelView == _PanelView.months)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.2,
                children: List.generate(12, (mi) {
                  final selected = _cursorDate.month == mi + 1;
                  final now = DateTime.now();
                  final current =
                      now.year == _cursorDate.year && now.month == mi + 1;
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        _cursorDate = DateTime(_cursorDate.year, mi + 1);
                        _panelView = _PanelView.days;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: selected
                          ? theme.daySelectedForeground
                          : current
                              ? theme.todayColor
                              : theme.primaryTextColor,
                      backgroundColor:
                          selected ? theme.daySelectedBackground : Colors.transparent,
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, theme.pickerCellHeight),
                    ),
                    child: Text(
                      _kShortMonths[mi],
                      style: theme.pickerTextStyle,
                    ),
                  );
                }),
              ),
            if (_panelView == _PanelView.years)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2.2,
                children: List.generate(12, (i) {
                  final year = _yearPageStart + i;
                  final selected = _cursorDate.year == year;
                  final current = DateTime.now().year == year;
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        _cursorDate = DateTime(year, _cursorDate.month);
                        _panelView = _PanelView.months;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: selected
                          ? theme.daySelectedForeground
                          : current
                              ? theme.todayColor
                              : theme.primaryTextColor,
                      backgroundColor:
                          selected ? theme.daySelectedBackground : Colors.transparent,
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, theme.pickerCellHeight),
                    ),
                    child: Text('$year', style: theme.pickerTextStyle),
                  );
                }),
              ),
          ],
        ),
      ),
      ),
    );

    if (widget.display == DsCalendarDisplay.inline) {
      return panel;
    }

    final triggerLabel = _triggerLabel(loc);
    final placeholder = _triggerPlaceholder;

    final trigger = MouseRegion(
      onEnter: (_) {
        if (!_usesDesktopPointer) return;
        setState(() => _triggerHover = true);
      },
      onExit: (_) => setState(() => _triggerHover = false),
      child: GestureDetector(
        onTap: () => setState(() => _open = !_open),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.ease,
          padding: theme.triggerPadding,
          decoration: BoxDecoration(
            color: theme.triggerBackground,
            borderRadius: BorderRadius.circular(DsTokens.radiusLg),
            border: Border.all(
              color: _open
                  ? theme.triggerOpenBorderColor
                  : _triggerHover
                      ? theme.triggerHoverBorderColor
                      : theme.triggerBorderColor,
              width: theme.triggerBorderWidth,
            ),
            boxShadow: _open
                ? [
                    BoxShadow(
                      color: theme.triggerFocusRingColor,
                      blurRadius: 0,
                      spreadRadius: theme.triggerFocusRingSpread,
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 18, color: theme.iconColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  triggerLabel,
                  style: theme.triggerTextStyle.copyWith(
                    color: placeholder
                        ? theme.placeholderColor
                        : theme.primaryTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // UX REVIEW: high parity-risk — verify against React render.
    // Dropdown uses in-flow column (not overlay); web uses absolute + z-dropdown.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        trigger,
        if (_open) ...[
          const SizedBox(height: 4),
          panel,
        ],
      ],
    );
  }
}

class _NavIconBtn extends StatelessWidget {
  const _NavIconBtn({
    required this.theme,
    required this.onTap,
    required this.icon,
    required this.tooltip,
  });

  final DsCalendarTheme theme;
  final VoidCallback onTap;
  final IconData icon;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(DsTokens.radiusLg),
          onTap: onTap,
          child: SizedBox(
            width: theme.navButtonSize,
            height: theme.navButtonSize,
            child: Icon(icon, size: 18, color: theme.primaryTextColor),
          ),
        ),
      ),
    );
  }
}
