import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'part_inspector_catalog.dart';
import 'theme.dart';

/// Brand / body kits. Real OEM CAD is licensed — these are CC0 Kenney bodies
/// + discrete part meshes selected by VIN make/body class.
class BrandKit {
  const BrandKit({
    required this.id,
    required this.label,
    required this.bodyAsset,
    required this.accent,
    required this.partAssets,
  });

  final String id;
  final String label;
  final String bodyAsset;
  final Color accent;
  final Map<PartKind, String> partAssets;

  String partAssetFor(PartKind kind) =>
      partAssets[kind] ?? partAssets[PartKind.module] ?? 'assets/models/parts/battery_box.glb';
}

class BrandKits {
  static const _defaultParts = <PartKind, String>{
    PartKind.battery: 'assets/models/parts/battery_box.glb',
    PartKind.sensor: 'assets/models/parts/sensor_cone.glb',
    PartKind.coil: 'assets/models/parts/bolt.glb',
    PartKind.alternator: 'assets/models/parts/drivetrain.glb',
    PartKind.pump: 'assets/models/parts/axle.glb',
    PartKind.converter: 'assets/models/parts/bumper.glb',
    PartKind.module: 'assets/models/parts/battery_box.glb',
    PartKind.throttle: 'assets/models/parts/sensor_cone.glb',
    PartKind.engine: 'assets/models/parts/drivetrain.glb',
  };

  /// Sport-leaning kit uses plate/axle variants for a slightly different look.
  static const _sportParts = <PartKind, String>{
    PartKind.battery: 'assets/models/parts/battery_box.glb',
    PartKind.sensor: 'assets/models/parts/bolt.glb',
    PartKind.coil: 'assets/models/parts/plate.glb',
    PartKind.alternator: 'assets/models/parts/drivetrain.glb',
    PartKind.pump: 'assets/models/parts/axle.glb',
    PartKind.converter: 'assets/models/parts/bumper.glb',
    PartKind.module: 'assets/models/parts/plate.glb',
    PartKind.throttle: 'assets/models/parts/sensor_cone.glb',
    PartKind.engine: 'assets/models/parts/drivetrain.glb',
  };

  static const _truckParts = <PartKind, String>{
    PartKind.battery: 'assets/models/parts/battery_box.glb',
    PartKind.sensor: 'assets/models/parts/sensor_cone.glb',
    PartKind.coil: 'assets/models/parts/bolt.glb',
    PartKind.alternator: 'assets/models/parts/axle.glb',
    PartKind.pump: 'assets/models/parts/axle.glb',
    PartKind.converter: 'assets/models/parts/bumper.glb',
    PartKind.module: 'assets/models/parts/battery_box.glb',
    PartKind.throttle: 'assets/models/parts/sensor_cone.glb',
    PartKind.engine: 'assets/models/parts/drivetrain.glb',
  };

  static const generic = BrandKit(
    id: 'generic',
    label: 'Generic Sedan',
    bodyAsset: 'assets/models/bodies/sedan_default.glb',
    accent: AppTheme.accent,
    partAssets: _defaultParts,
  );

  static const honda = BrandKit(
    id: 'honda',
    label: 'Honda / Acura kit',
    bodyAsset: 'assets/models/bodies/hatchback.glb',
    accent: Color(0xFFCC0000),
    partAssets: _sportParts,
  );

  static const toyota = BrandKit(
    id: 'toyota',
    label: 'Toyota / Lexus kit',
    bodyAsset: 'assets/models/bodies/sedan_default.glb',
    accent: Color(0xFFEB0A1E),
    partAssets: _defaultParts,
  );

  static const vw = BrandKit(
    id: 'vw',
    label: 'VW / Skoda / Seat kit',
    bodyAsset: 'assets/models/bodies/hatchback.glb',
    accent: Color(0xFF1A4C8B),
    partAssets: _sportParts,
  );

  static const bmw = BrandKit(
    id: 'bmw',
    label: 'BMW / Mini kit',
    bodyAsset: 'assets/models/bodies/sedan_sports.glb',
    accent: Color(0xFF1C69D4),
    partAssets: _sportParts,
  );

  static const mercedes = BrandKit(
    id: 'mercedes',
    label: 'Mercedes-Benz kit',
    bodyAsset: 'assets/models/bodies/suv_luxury.glb',
    accent: Color(0xFFC0C0C0),
    partAssets: _defaultParts,
  );

  static const ford = BrandKit(
    id: 'ford',
    label: 'Ford kit',
    bodyAsset: 'assets/models/bodies/suv.glb',
    accent: Color(0xFF003478),
    partAssets: _truckParts,
  );

  static const gm = BrandKit(
    id: 'gm',
    label: 'GM / Chevrolet kit',
    bodyAsset: 'assets/models/bodies/truck.glb',
    accent: Color(0xFFFFB81C),
    partAssets: _truckParts,
  );

  static const hyundai = BrandKit(
    id: 'hyundai',
    label: 'Hyundai / Kia kit',
    bodyAsset: 'assets/models/bodies/sedan_sports.glb',
    accent: Color(0xFF002C5F),
    partAssets: _defaultParts,
  );

  static BrandKit resolve({required String make, String? bodyClass}) {
    final m = make.toLowerCase();
    final body = (bodyClass ?? '').toLowerCase();

    if (m.contains('honda') || m.contains('acura')) return honda;
    if (m.contains('toyota') || m.contains('lexus')) return toyota;
    if (m.contains('volkswagen') || m.contains('vw') || m.contains('skoda') || m.contains('seat') || m.contains('audi')) {
      return m.contains('audi') ? bmw : vw;
    }
    if (m.contains('bmw') || m.contains('mini')) return bmw;
    if (m.contains('mercedes') || m.contains('benz')) return mercedes;
    if (m.contains('ford')) return ford;
    if (m.contains('chevrolet') || m.contains('gmc') || m.contains('cadillac') || m.contains('buick')) return gm;
    if (m.contains('hyundai') || m.contains('kia') || m.contains('genesis')) return hyundai;
    if (m.contains('nissan') || m.contains('mazda') || m.contains('subaru') || m.contains('mitsubishi')) {
      return honda; // compact Asian hatch kit
    }

    if (body.contains('truck') || body.contains('pickup')) return gm;
    if (body.contains('suv') || body.contains('mpv')) return ford;
    if (body.contains('hatch')) return vw;
    return generic;
  }

  /// Flutter web serves assets under `/assets/assets/...`.
  static String modelSrc(String pubspecAssetPath) {
    if (kIsWeb) return 'assets/$pubspecAssetPath';
    return pubspecAssetPath;
  }
}
