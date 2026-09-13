import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../part_inspector_catalog.dart';
import '../theme.dart';

/// Top-down interactive engine bay. Parts are tappable and target part pulses.
class EngineBayView extends StatelessWidget {
  const EngineBayView({
    super.key,
    required this.targetPartId,
    required this.selectedPartId,
    required this.onPartTap,
    required this.isTurkish,
  });

  final String targetPartId;
  final String? selectedPartId;
  final ValueChanged<InspectablePart> onPartTap;
  final bool isTurkish;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        return Stack(
          children: [
            CustomPaint(size: size, painter: _BayPainter()),
            ...PartInspectorCatalog.parts.map((part) {
              final left = part.bayOffset.dx * size.width;
              final top = part.bayOffset.dy * size.height;
              final w = part.baySize.width * size.width;
              final h = part.baySize.height * size.height;
              final isTarget = part.id == targetPartId;
              final isSelected = part.id == selectedPartId;
              return Positioned(
                left: left,
                top: top,
                width: w,
                height: h,
                child: GestureDetector(
                  onTap: () => onPartTap(part),
                  child: _PartHotspot(
                    part: part,
                    isTarget: isTarget,
                    isSelected: isSelected,
                    isTurkish: isTurkish,
                  ),
                ),
              );
            }),
            Positioned(
              left: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isTurkish ? 'ÖN (tampon)' : 'FRONT (bumper)',
                  style: AppTheme.body(size: 11, color: Colors.white70, weight: FontWeight.w700),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PartHotspot extends StatefulWidget {
  const _PartHotspot({
    required this.part,
    required this.isTarget,
    required this.isSelected,
    required this.isTurkish,
  });

  final InspectablePart part;
  final bool isTarget;
  final bool isSelected;
  final bool isTurkish;

  @override
  State<_PartHotspot> createState() => _PartHotspotState();
}

class _PartHotspotState extends State<_PartHotspot> with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = widget.isSelected
        ? widget.part.color
        : widget.isTarget
            ? AppTheme.fault
            : Colors.white.withValues(alpha: 0.14);

    return AnimatedBuilder(
      animation: _pulse,
      builder: (context, _) {
        final glow = widget.isTarget ? 0.35 + (_pulse.value * 0.45) : 0.0;
        return Container(
          decoration: BoxDecoration(
            color: base.withValues(alpha: widget.isSelected ? 0.92 : widget.isTarget ? 0.55 + glow * 0.25 : 0.18),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.isTarget || widget.isSelected
                  ? Colors.white.withValues(alpha: 0.7 + glow * 0.3)
                  : Colors.white24,
              width: widget.isSelected || widget.isTarget ? 2 : 1,
            ),
          ),
          padding: const EdgeInsets.all(6),
          child: Center(
            child: Text(
              widget.part.name(widget.isTurkish),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.body(
                size: 10,
                weight: FontWeight.w800,
                color: widget.isSelected || widget.isTarget ? Colors.white : Colors.white70,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bay = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.04, size.height * 0.06, size.width * 0.92, size.height * 0.88),
      const Radius.circular(22),
    );
    canvas.drawRRect(bay, Paint()..color = const Color(0xFF1A242C));

    // Firewall / rear of bay
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.08, size.height * 0.72, size.width * 0.84, size.height * 0.16),
        const Radius.circular(12),
      ),
      Paint()..color = const Color(0xFF12181E),
    );

    // Engine block silhouette
    final block = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.26, size.height * 0.34, size.width * 0.40, size.height * 0.34),
      const Radius.circular(14),
    );
    canvas.drawRRect(block, Paint()..color = const Color(0xFF2A333B));
    canvas.drawRRect(
      block,
      Paint()
        ..color = const Color(0xFF3D4A54)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    // Airbox
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.34, size.height * 0.12, size.width * 0.28, size.height * 0.14),
        const Radius.circular(10),
      ),
      Paint()..color = const Color(0xFF243038),
    );

    // Strut towers
    for (final x in [0.12, 0.78]) {
      canvas.drawCircle(Offset(size.width * x, size.height * 0.22), size.width * 0.05, Paint()..color = const Color(0xFF151C22));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Isolated rotating part — looks like the component was removed from the car.
class IsolatedPartStage extends StatefulWidget {
  const IsolatedPartStage({super.key, required this.part});

  final InspectablePart part;

  @override
  State<IsolatedPartStage> createState() => _IsolatedPartStageState();
}

class _IsolatedPartStageState extends State<IsolatedPartStage> with SingleTickerProviderStateMixin {
  late final AnimationController _spin;

  @override
  void initState() {
    super.initState();
    _spin = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
  }

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _spin,
      builder: (context, _) {
        return CustomPaint(
          painter: _IsolatedPartPainter(part: widget.part, turn: _spin.value * math.pi * 2),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _IsolatedPartPainter extends CustomPainter {
  _IsolatedPartPainter({required this.part, required this.turn});

  final InspectablePart part;
  final double turn;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2 + 10);
    // Floor shadow
    canvas.drawOval(
      Rect.fromCenter(center: c.translate(0, 90), width: 160, height: 28),
      Paint()..color = Colors.black.withValues(alpha: 0.35),
    );

    canvas.save();
    canvas.translate(c.dx, c.dy);
    // Fake perspective rotation
    final scaleX = 0.55 + 0.45 * math.cos(turn).abs();
    canvas.scale(scaleX, 1.0);
    canvas.rotate(turn * 0.15);

    final glow = Paint()
      ..color = part.color.withValues(alpha: 0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 24);
    canvas.drawCircle(Offset.zero, 70, glow);

    switch (part.kind) {
      case PartKind.battery:
        _battery(canvas);
      case PartKind.coil:
        _coil(canvas);
      case PartKind.sensor:
        _sensor(canvas);
      case PartKind.alternator:
        _alternator(canvas);
      case PartKind.pump:
        _pump(canvas);
      case PartKind.converter:
        _converter(canvas);
      case PartKind.module:
        _module(canvas);
      case PartKind.throttle:
        _throttle(canvas);
      case PartKind.engine:
        _engine(canvas);
    }
    canvas.restore();
  }

  void _battery(Canvas canvas) {
    final body = RRect.fromRectAndRadius(const Rect.fromLTWH(-55, -35, 110, 70), const Radius.circular(8));
    canvas.drawRRect(body, Paint()..color = const Color(0xFF2F9E6F));
    canvas.drawRect(const Rect.fromLTWH(-40, -48, 28, 14), Paint()..color = const Color(0xFFE8EEF0));
    canvas.drawRect(const Rect.fromLTWH(12, -48, 28, 14), Paint()..color = const Color(0xFFD64545));
  }

  void _coil(Canvas canvas) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(-28, -50, 56, 70), const Radius.circular(8)),
      Paint()..color = const Color(0xFFE0A106),
    );
    canvas.drawRect(const Rect.fromLTWH(-12, 20, 24, 36), Paint()..color = const Color(0xFF2A333B));
  }

  void _sensor(Canvas canvas) {
    canvas.drawCircle(const Offset(0, -10), 26, Paint()..color = part.color);
    canvas.drawRect(const Rect.fromLTWH(-8, 10, 16, 48), Paint()..color = const Color(0xFF8A95A1));
    canvas.drawCircle(const Offset(0, -10), 10, Paint()..color = Colors.white24);
  }

  void _alternator(Canvas canvas) {
    canvas.drawCircle(Offset.zero, 48, Paint()..color = const Color(0xFF8A95A1));
    canvas.drawCircle(Offset.zero, 18, Paint()..color = const Color(0xFF2A333B));
    canvas.drawRect(const Rect.fromLTWH(-14, 40, 28, 20), Paint()..color = const Color(0xFF4A5560));
  }

  void _pump(Canvas canvas) {
    canvas.drawCircle(const Offset(0, -8), 34, Paint()..color = const Color(0xFF4C6FFF));
    canvas.drawRect(const Rect.fromLTWH(-10, 20, 20, 40), Paint()..color = const Color(0xFF2A333B));
  }

  void _converter(Canvas canvas) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(-70, -22, 140, 44), const Radius.circular(18)),
      Paint()..color = const Color(0xFFC47A3A),
    );
  }

  void _module(Canvas canvas) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(-48, -36, 96, 72), const Radius.circular(10)),
      Paint()..color = part.color,
    );
    canvas.drawRect(const Rect.fromLTWH(-30, -18, 60, 10), Paint()..color = Colors.white24);
  }

  void _throttle(Canvas canvas) {
    canvas.drawCircle(Offset.zero, 42, Paint()..color = const Color(0xFF1AA6A6));
    canvas.drawCircle(Offset.zero, 18, Paint()..color = const Color(0xFF0E1418));
  }

  void _engine(Canvas canvas) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(-70, -45, 140, 90), const Radius.circular(12)),
      Paint()..color = const Color(0xFF5C6B73),
    );
  }

  @override
  bool shouldRepaint(covariant _IsolatedPartPainter oldDelegate) =>
      oldDelegate.turn != turn || oldDelegate.part.id != part.id;
}
