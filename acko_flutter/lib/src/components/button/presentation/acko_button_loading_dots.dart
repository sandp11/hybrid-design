import 'package:flutter/material.dart';

class AckoButtonLoadingDots extends StatefulWidget {
  const AckoButtonLoadingDots({
    super.key,
    required this.color,
    required this.dotSize,
    required this.gap,
  });

  final Color color;
  final double dotSize;
  final double gap;

  @override
  State<AckoButtonLoadingDots> createState() => _AckoButtonLoadingDotsState();
}

class _AckoButtonLoadingDotsState extends State<AckoButtonLoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

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
                width: widget.dotSize,
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
