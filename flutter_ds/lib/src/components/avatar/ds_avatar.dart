import 'package:flutter/material.dart';
import 'ds_avatar_theme.dart';

// ─── Avatar ────────────────────────────────────────────────────────────────────

class DsAvatar extends StatefulWidget {
  const DsAvatar({
    super.key,
    this.src,
    this.alt,
    this.initials,
    this.size  = DsAvatarSize.md,
    this.shape = DsAvatarShape.circle,
  });

  final String?       src;
  final String?       alt;
  final String?       initials;
  final DsAvatarSize  size;
  final DsAvatarShape shape;

  @override
  State<DsAvatar> createState() => _DsAvatarState();
}

class _DsAvatarState extends State<DsAvatar> {
  bool _imgFailed = false;

  @override
  void didUpdateWidget(DsAvatar old) {
    super.didUpdateWidget(old);
    if (old.src != widget.src) {
      setState(() => _imgFailed = false);
    }
  }

  Widget _buildFallback(DsAvatarTheme theme, double dim) {
    if (widget.initials != null) {
      return Container(
        width:     dim,
        height:    dim,
        color:     theme.initialsBackground,
        alignment: Alignment.center,
        child: Text(
          widget.initials!,
          style: TextStyle(
            fontSize:   theme.initialsFontSizeFor(widget.size),
            fontWeight: FontWeight.w500,
            fontFamily: 'Euclid Circular B',
            color:      theme.initialsColor,
            height:     1.0,
          ),
        ),
      );
    }
    return Container(
      width:     dim,
      height:    dim,
      color:     theme.initialsBackground,
      alignment: Alignment.center,
      child: _UserIcon(
        size:  theme.iconSizeFor(widget.size),
        color: theme.initialsColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DsAvatarTheme>() ?? DsAvatarTheme.defaults;
    final dim   = theme.dimensionFor(widget.size);

    Widget content;

    if (widget.src != null && !_imgFailed) {
      content = Image.network(
        widget.src!,
        width:  dim,
        height: dim,
        fit:    BoxFit.cover,
        // UX REVIEW: medium parity-risk — frameBuilder fade-in vs CSS opacity transition, verify timing matches React
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;
          return AnimatedOpacity(
            opacity:  frame == null ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve:    Curves.ease,
            child:    child,
          );
        },
        errorBuilder: (context, error, stackTrace) {
          if (!_imgFailed) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() => _imgFailed = true);
            });
          }
          return _buildFallback(theme, dim);
        },
      );
    } else {
      content = _buildFallback(theme, dim);
    }

    Widget clipped;
    if (widget.shape == DsAvatarShape.circle) {
      clipped = ClipOval(child: content);
    } else {
      clipped = ClipRRect(
        borderRadius: theme.squareBorderRadius,
        child:        content,
      );
    }

    return Semantics(
      label: widget.alt ?? widget.initials ?? 'Avatar',
      image: true,
      child: SizedBox(width: dim, height: dim, child: clipped),
    );
  }
}

// ─── User icon painter ─────────────────────────────────────────────────────────

class _UserIcon extends StatelessWidget {
  const _UserIcon({required this.size, required this.color});
  final double size;
  final Color  color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size:    Size(size, size),
      painter: _UserIconPainter(color: color),
    );
  }
}

class _UserIconPainter extends CustomPainter {
  const _UserIconPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final cx    = size.width / 2;
    final headR = size.width * 0.25;

    canvas.drawCircle(Offset(cx, size.height * 0.3), headR, paint);

    final bodyRect = Rect.fromCenter(
      center: Offset(cx, size.height * 0.85),
      width:  size.width * 0.9,
      height: size.height * 0.6,
    );
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, size.height * 0.55, size.width, size.height * 0.45));
    canvas.drawOval(bodyRect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_UserIconPainter old) => old.color != color;
}
