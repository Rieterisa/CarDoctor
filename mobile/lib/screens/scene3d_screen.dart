import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../brand_kits.dart';
import '../l10n/app_localizations.dart';
import '../models.dart';
import '../part_camera.dart';
import '../part_inspector_catalog.dart';
import '../theme.dart';
import '../widgets/part_inspector_views.dart';
import '../widgets/ui_kit.dart';

enum _Phase { vehicle, bay, extracting, isolated }

class Scene3DScreen extends StatefulWidget {
  const Scene3DScreen({
    super.key,
    required this.partName,
    required this.entityName,
    required this.vehicle,
  });

  final String partName;
  final String entityName;
  final VehicleInfo vehicle;

  @override
  State<Scene3DScreen> createState() => _Scene3DScreenState();
}

class _Scene3DScreenState extends State<Scene3DScreen> {
  _Phase _phase = _Phase.vehicle;
  late InspectablePart _target;
  InspectablePart? _selected;
  late BrandKit _kit;

  @override
  void initState() {
    super.initState();
    _target = PartInspectorCatalog.byId(widget.entityName);
    _selected = _target;
    _kit = BrandKits.resolve(make: widget.vehicle.make, bodyClass: widget.vehicle.bodyClass);
  }

  void _openHood() {
    setState(() {
      _phase = _Phase.bay;
      _selected = _target;
    });
  }

  Future<void> _extract(InspectablePart part) async {
    setState(() {
      _selected = part;
      _phase = _Phase.extracting;
    });
    await Future<void>.delayed(const Duration(milliseconds: 750));
    if (!mounted) return;
    setState(() => _phase = _Phase.isolated);
  }

  void _back() {
    setState(() {
      if (_phase == _Phase.isolated || _phase == _Phase.extracting) {
        _phase = _Phase.bay;
      } else if (_phase == _Phase.bay) {
        _phase = _Phase.vehicle;
      } else {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tr = context.watch<AppState>().preferTurkish;
    final active = _selected ?? _target;
    final bodySrc = BrandKits.modelSrc(_kit.bodyAsset);
    final partSrc = BrandKits.modelSrc(_kit.partAssetFor(active.kind));

    return Scaffold(
      backgroundColor: const Color(0xFF071116),
      body: AtmosphereBackground(
        dark: true,
        child: SafeArea(
          child: Column(
            children: [
              _Header(
                title: switch (_phase) {
                  _Phase.vehicle => l10n.scene3dNav,
                  _Phase.bay => tr ? 'Motor bölmesi' : 'Engine bay',
                  _Phase.extracting => tr ? 'Parça sökülüyor…' : 'Removing part…',
                  _Phase.isolated => active.name(tr),
                },
                onBack: _back,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 10),
                child: _StatusBanner(
                  phase: _phase,
                  kit: _kit,
                  vehicle: widget.vehicle,
                  targetName: _target.name(tr),
                  activeName: active.name(tr),
                  hint: active.hint(tr),
                  isTurkish: tr,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: ColoredBox(
                      color: const Color(0xFF0A1820),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 420),
                        child: switch (_phase) {
                          _Phase.vehicle => _VehicleStage(
                              key: ValueKey('vehicle-${_kit.id}'),
                              src: bodySrc,
                              accent: _kit.accent,
                              ctaLabel: tr ? 'Kaputu aç' : 'Open hood',
                              onOpenHood: _openHood,
                            ),
                          _Phase.bay => EngineBayView(
                              key: const ValueKey('bay'),
                              targetPartId: _target.id,
                              selectedPartId: _selected?.id,
                              isTurkish: tr,
                              onPartTap: _extract,
                            ),
                          _Phase.extracting => _ExtractingStage(
                              key: const ValueKey('extract'),
                              part: active,
                              partSrc: partSrc,
                              isTurkish: tr,
                            ),
                          _Phase.isolated => _IsolatedGlbStage(
                              key: ValueKey('iso-${active.id}-${_kit.id}'),
                              part: active,
                              partSrc: partSrc,
                              accent: _kit.accent,
                              isTurkish: tr,
                            ),
                        },
                      ),
                    ),
                  ),
                ),
              ),
              if (_phase == _Phase.bay)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: Text(
                    tr
                        ? 'Turuncu nabızlı parça teşhis sonucun. Dokun → araçtan sökülür (ayrık 3D).'
                        : 'Pulsing orange is your diagnosis target. Tap → remove as discrete 3D part.',
                    style: AppTheme.body(size: 12, color: Colors.white60),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (_phase == _Phase.isolated)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white24),
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () => setState(() => _phase = _Phase.bay),
                          child: Text(tr ? 'Motora geri dön' : 'Back to bay'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: _kit.accent,
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () => _extract(_target),
                          child: Text(tr ? 'Teşhis parçası' : 'Diagnosis part'),
                        ),
                      ),
                    ],
                  ),
                ),
              if (_phase == _Phase.vehicle)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: PrimaryCta(
                    label: tr ? 'Kaputu aç ve parçayı bul' : 'Open hood & find part',
                    icon: Icons.car_repair,
                    onPressed: _openHood,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title, required this.onBack});
  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 16, 0),
      child: Row(
        children: [
          IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back, color: Colors.white)),
          Expanded(child: Text(title, style: AppTheme.display(size: 20, color: Colors.white))),
        ],
      ),
    );
  }
}

class _StatusBanner extends StatelessWidget {
  const _StatusBanner({
    required this.phase,
    required this.kit,
    required this.vehicle,
    required this.targetName,
    required this.activeName,
    required this.hint,
    required this.isTurkish,
  });

  final _Phase phase;
  final BrandKit kit;
  final VehicleInfo vehicle;
  final String targetName;
  final String activeName;
  final String hint;
  final bool isTurkish;

  @override
  Widget build(BuildContext context) {
    final title = switch (phase) {
      _Phase.vehicle => isTurkish ? 'Araç kiti' : 'Vehicle kit',
      _Phase.bay => isTurkish ? 'Motor bölmesinde seç' : 'Select in engine bay',
      _Phase.extracting => isTurkish ? 'Sökülüyor' : 'Detaching',
      _Phase.isolated => isTurkish ? 'Sökülen 3D parça' : 'Removed 3D part',
    };
    final name = phase == _Phase.isolated || phase == _Phase.extracting ? activeName : targetName;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kit.accent.withValues(alpha: 0.55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: kit.accent.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${vehicle.displayName} · ${kit.label}',
                  style: AppTheme.body(size: 11, color: Colors.white, weight: FontWeight.w800),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: AppTheme.body(size: 11, color: Colors.white60, weight: FontWeight.w700)),
          Text(name, style: AppTheme.display(size: 18, color: Colors.white)),
          if (phase == _Phase.bay || phase == _Phase.isolated) ...[
            const SizedBox(height: 4),
            Text(hint, style: AppTheme.body(size: 12, color: Colors.white70)),
          ],
        ],
      ),
    );
  }
}

class _VehicleStage extends StatelessWidget {
  const _VehicleStage({
    super.key,
    required this.src,
    required this.accent,
    required this.ctaLabel,
    required this.onOpenHood,
  });

  final String src;
  final Color accent;
  final String ctaLabel;
  final VoidCallback onOpenHood;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ModelViewer(
          backgroundColor: const Color(0xFF0A1820),
          src: src,
          alt: 'Brand vehicle body',
          ar: false,
          autoRotate: true,
          autoRotateDelay: 300,
          cameraControls: true,
          cameraOrbit: '25deg 70deg 3.8m',
          cameraTarget: '0m 0.35m 0m',
          fieldOfView: '35deg',
          shadowIntensity: 1,
          exposure: 1.05,
          loading: Loading.eager,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: accent,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
            ),
            onPressed: onOpenHood,
            icon: const Icon(Icons.keyboard_double_arrow_up),
            label: Text(ctaLabel),
          ),
        ),
      ],
    );
  }
}

class _ExtractingStage extends StatelessWidget {
  const _ExtractingStage({
    super.key,
    required this.part,
    required this.partSrc,
    required this.isTurkish,
  });

  final InspectablePart part;
  final String partSrc;
  final bool isTurkish;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        EngineBayView(
          targetPartId: part.id,
          selectedPartId: part.id,
          isTurkish: isTurkish,
          onPartTap: (_) {},
        ).animate().fadeOut(duration: 650.ms),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 220,
                height: 220,
                child: ModelViewer(
                  backgroundColor: const Color(0x000A1820),
                  src: partSrc,
                  alt: part.name(isTurkish),
                  ar: false,
                  autoRotate: true,
                  cameraControls: false,
                  cameraOrbit: '0deg 75deg 2.2m',
                  fieldOfView: '30deg',
                  shadowIntensity: 1,
                ),
              )
                  .animate()
                  .scale(begin: const Offset(0.4, 0.4), end: const Offset(1, 1), duration: 700.ms, curve: Curves.easeOutBack)
                  .moveY(begin: 90, end: 0, duration: 700.ms),
              const SizedBox(height: 8),
              Text(
                isTurkish ? '${part.name(true)} söküldü' : '${part.name(false)} removed',
                style: AppTheme.display(size: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IsolatedGlbStage extends StatelessWidget {
  const _IsolatedGlbStage({
    super.key,
    required this.part,
    required this.partSrc,
    required this.accent,
    required this.isTurkish,
  });

  final InspectablePart part;
  final String partSrc;
  final Color accent;
  final bool isTurkish;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ModelViewer(
          backgroundColor: const Color(0xFF0A1820),
          src: partSrc,
          alt: part.name(isTurkish),
          ar: false,
          autoRotate: true,
          autoRotateDelay: 200,
          cameraControls: true,
          cameraOrbit: PartCameraFocus.overview.orbit,
          cameraTarget: '0m 0.2m 0m',
          fieldOfView: '28deg',
          shadowIntensity: 1,
          exposure: 1.15,
          loading: Loading.eager,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: accent.withValues(alpha: 0.5)),
            ),
            child: Text(
              isTurkish
                  ? 'Bu ayrık 3D parça. Döndür, yakınlaştır — araç gövdesi gizlendi.'
                  : 'Discrete 3D part only. Orbit/zoom — vehicle body is hidden.',
              style: AppTheme.body(size: 12, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
