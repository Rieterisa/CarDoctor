import 'package:flutter/material.dart';

import 'theme.dart';

enum PartKind {
  coil,
  sensor,
  battery,
  alternator,
  pump,
  converter,
  module,
  throttle,
  engine,
}

class InspectablePart {
  const InspectablePart({
    required this.id,
    required this.nameTR,
    required this.nameEN,
    required this.kind,
    required this.bayOffset,
    required this.baySize,
    required this.hintTR,
    required this.hintEN,
    this.color = AppTheme.fault,
  });

  final String id;
  final String nameTR;
  final String nameEN;
  final PartKind kind;
  /// Normalized position inside engine bay (0..1).
  final Offset bayOffset;
  final Size baySize;
  final String hintTR;
  final String hintEN;
  final Color color;

  String name(bool tr) => tr ? nameTR : nameEN;
  String hint(bool tr) => tr ? hintTR : hintEN;
}

/// Engine-bay layout — positions match a typical transverse FWD bay (front of car = top).
class PartInspectorCatalog {
  static const parts = <InspectablePart>[
    InspectablePart(
      id: 'battery',
      nameTR: 'Akü',
      nameEN: 'Battery',
      kind: PartKind.battery,
      bayOffset: Offset(0.78, 0.18),
      baySize: Size(0.16, 0.14),
      hintTR: 'Genelde motor bölmesinin sağ/ön köşesinde.',
      hintEN: 'Usually at the front-right corner of the bay.',
      color: Color(0xFF2F9E6F),
    ),
    InspectablePart(
      id: 'maf_sensor',
      nameTR: 'MAF Sensörü',
      nameEN: 'MAF Sensor',
      kind: PartKind.sensor,
      bayOffset: Offset(0.42, 0.16),
      baySize: Size(0.14, 0.10),
      hintTR: 'Hava filtre kutusu ile gaz kelebeği arasında.',
      hintEN: 'Between air filter box and throttle body.',
    ),
    InspectablePart(
      id: 'throttle_body',
      nameTR: 'Gaz Kelebeği',
      nameEN: 'Throttle Body',
      kind: PartKind.throttle,
      bayOffset: Offset(0.38, 0.30),
      baySize: Size(0.18, 0.12),
      hintTR: 'Emme manifoldunun girişinde.',
      hintEN: 'At the intake manifold entrance.',
      color: Color(0xFF1AA6A6),
    ),
    InspectablePart(
      id: 'ignition_coil',
      nameTR: 'Ateşleme Bobini',
      nameEN: 'Ignition Coil',
      kind: PartKind.coil,
      bayOffset: Offset(0.28, 0.46),
      baySize: Size(0.12, 0.16),
      hintTR: 'Motor üst kapağında bujilerin üzerinde.',
      hintEN: 'On top of the valve cover, above the plugs.',
      color: Color(0xFFE0A106),
    ),
    InspectablePart(
      id: 'cam_sensor',
      nameTR: 'Eksantrik Sensörü',
      nameEN: 'Camshaft Sensor',
      kind: PartKind.sensor,
      bayOffset: Offset(0.18, 0.38),
      baySize: Size(0.11, 0.10),
      hintTR: 'Silindir kapağı yanında / eksantrik mil ucunda.',
      hintEN: 'On the cylinder head / camshaft end.',
    ),
    InspectablePart(
      id: 'crank_sensor',
      nameTR: 'Krank Sensörü',
      nameEN: 'Crankshaft Sensor',
      kind: PartKind.sensor,
      bayOffset: Offset(0.22, 0.68),
      baySize: Size(0.12, 0.10),
      hintTR: 'Motor bloğunun alt-ön tarafında, volan/dişli yakınında.',
      hintEN: 'Lower front of the block, near the crank pulley/flywheel.',
    ),
    InspectablePart(
      id: 'knock_sensor',
      nameTR: 'Vuruntu Sensörü',
      nameEN: 'Knock Sensor',
      kind: PartKind.sensor,
      bayOffset: Offset(0.48, 0.58),
      baySize: Size(0.11, 0.10),
      hintTR: 'Motor bloğunun yan yüzeyine vidalı.',
      hintEN: 'Bolted to the side of the engine block.',
    ),
    InspectablePart(
      id: 'ect_sensor',
      nameTR: 'Soğutma Sıcaklık Sensörü',
      nameEN: 'ECT Sensor',
      kind: PartKind.sensor,
      bayOffset: Offset(0.58, 0.36),
      baySize: Size(0.11, 0.10),
      hintTR: 'Termostat muhafazası / soğutma hortumu yakınında.',
      hintEN: 'Near thermostat housing / coolant hose.',
    ),
    InspectablePart(
      id: 'alternator',
      nameTR: 'Alternatör',
      nameEN: 'Alternator',
      kind: PartKind.alternator,
      bayOffset: Offset(0.68, 0.52),
      baySize: Size(0.16, 0.16),
      hintTR: 'Motorun önünde kayışla dönen ünite.',
      hintEN: 'Belt-driven unit at the front of the engine.',
      color: Color(0xFF8A95A1),
    ),
    InspectablePart(
      id: 'o2_sensor',
      nameTR: 'Oksijen Sensörü',
      nameEN: 'Oxygen Sensor',
      kind: PartKind.sensor,
      bayOffset: Offset(0.46, 0.82),
      baySize: Size(0.12, 0.10),
      hintTR: 'Egzoz manifoldu / katalitik öncesi boruda.',
      hintEN: 'In the exhaust manifold / pre-cat pipe.',
    ),
    InspectablePart(
      id: 'catalytic_converter',
      nameTR: 'Katalitik Konvertör',
      nameEN: 'Catalytic Converter',
      kind: PartKind.converter,
      bayOffset: Offset(0.62, 0.84),
      baySize: Size(0.18, 0.12),
      hintTR: 'Egzoz hattında, motorun altında/arkasında.',
      hintEN: 'On the exhaust line under/behind the engine.',
      color: Color(0xFFC47A3A),
    ),
    InspectablePart(
      id: 'fuel_pump',
      nameTR: 'Yakıt Pompası',
      nameEN: 'Fuel Pump',
      kind: PartKind.pump,
      bayOffset: Offset(0.10, 0.78),
      baySize: Size(0.12, 0.12),
      hintTR: 'Çoğu araçta depo içinde; burada sistem konumu gösterilir.',
      hintEN: 'Often in-tank; shown here as system location.',
      color: Color(0xFF4C6FFF),
    ),
    InspectablePart(
      id: 'abs_module',
      nameTR: 'ABS Modülü',
      nameEN: 'ABS Module',
      kind: PartKind.module,
      bayOffset: Offset(0.82, 0.70),
      baySize: Size(0.14, 0.14),
      hintTR: 'Motor bölmesinde, genellikle sağ çamurluk tarafında.',
      hintEN: 'In the bay, often near the right fender wall.',
      color: Color(0xFF9B59B6),
    ),
    InspectablePart(
      id: 'engine',
      nameTR: 'Motor / Genel',
      nameEN: 'Engine / General',
      kind: PartKind.engine,
      bayOffset: Offset(0.34, 0.42),
      baySize: Size(0.30, 0.28),
      hintTR: 'Komple motor bloğu ve üst kapak bölgesi.',
      hintEN: 'Full engine block and valve cover area.',
      color: Color(0xFF5C6B73),
    ),
    InspectablePart(
      id: 'evap',
      nameTR: 'EVAP Sistemi',
      nameEN: 'EVAP System',
      kind: PartKind.module,
      bayOffset: Offset(0.08, 0.22),
      baySize: Size(0.12, 0.12),
      hintTR: 'Kanister / purge valfi genellikle çamurluk veya depo yanında.',
      hintEN: 'Canister/purge valve near fender or tank area.',
    ),
    InspectablePart(
      id: 'map_sensor',
      nameTR: 'MAP Sensörü',
      nameEN: 'MAP Sensor',
      kind: PartKind.sensor,
      bayOffset: Offset(0.52, 0.28),
      baySize: Size(0.11, 0.10),
      hintTR: 'Emme manifoldu üzerinde.',
      hintEN: 'On the intake manifold.',
    ),
  ];

  static InspectablePart byId(String id) {
    return parts.firstWhere(
      (p) => p.id == id,
      orElse: () => parts.firstWhere((p) => p.id == 'engine'),
    );
  }
}
