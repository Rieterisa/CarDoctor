import 'package:flutter/material.dart';

import '../theme.dart';

/// Soft workshop atmosphere — gradient wash + grid, no flat fill.
class AtmosphereBackground extends StatelessWidget {
  const AtmosphereBackground({super.key, required this.child, this.dark = false});

  final Widget child;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: dark
                  ? const [Color(0xFF071116), Color(0xFF0C2A30), Color(0xFF12343A)]
                  : const [Color(0xFFD7E6E8), Color(0xFFE8EEF0), Color(0xFFCFDDDF)],
            ),
          ),
        ),
        CustomPaint(painter: _GridPainter(dark: dark)),
        child,
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({required this.dark});
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (dark ? Colors.white : AppTheme.ink).withValues(alpha: dark ? 0.04 : 0.035)
      ..strokeWidth = 1;
    const step = 28.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) => oldDelegate.dark != dark;
}

class BrandMark extends StatelessWidget {
  const BrandMark({
    super.key,
    this.size = 36,
    this.color = AppTheme.ink,
    this.compact = false,
  });

  final double size;
  final Color color;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size * 0.72,
          height: size * 0.72,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.accentDeep, AppTheme.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(size * 0.18),
          ),
          child: Icon(Icons.memory, color: Colors.white, size: size * 0.42),
        ),
        if (!compact) ...[
          SizedBox(width: size * 0.28),
          Text('CarDoctor', style: AppTheme.display(size: size, color: color)),
        ],
      ],
    );
  }
}

class PrimaryCta extends StatelessWidget {
  const PrimaryCta({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.icon,
    this.dark = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final IconData? icon;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: dark ? AppTheme.ink : AppTheme.accentDeep,
        foregroundColor: Colors.white,
      ),
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(label),
              ],
            ),
    );
  }
}
