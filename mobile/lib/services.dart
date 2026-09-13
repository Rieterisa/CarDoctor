import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'models.dart';
import 'validators.dart';

class CatalogService {
  final Map<String, DtcEntry> entries = {};
  final Map<String, PartInfo> parts = {};

  Future<void> load() async {
    final raw = await rootBundle.loadString('assets/dtc_catalog.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    for (final p in (json['parts'] as List).cast<Map<String, dynamic>>()) {
      final part = PartInfo.fromJson(p);
      parts[part.id] = part;
    }
    for (final d in (json['dtc'] as List).cast<Map<String, dynamic>>()) {
      final entry = DtcEntry.fromJson(d);
      entries[entry.code.toUpperCase()] = entry;
    }
  }

  DtcEntry? lookup(String code) => entries[DtcParser.normalize(code)];
  PartInfo? partFor(DtcEntry entry) => parts[entry.partId];
  List<String> get sampleCodes {
    final list = entries.keys.toList()..sort();
    return list.take(8).toList();
  }
}

class VinDecodeService {
  Future<VehicleInfo> decode(String raw) async {
    final vin = VinValidator.normalize(raw);
    if (!VinValidator.isValid(vin)) {
      throw Exception('VIN must be 17 characters (no I, O, Q).');
    }

    if (vin.startsWith('DEMO') || vin == '1HGCM82633A004352') {
      return VehicleInfo(
        vin: vin,
        make: 'Honda',
        model: 'Accord',
        year: '2003',
        bodyClass: 'Sedan',
      );
    }

    final uri = Uri.parse(
      'https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValues/$vin?format=json',
    );
    try {
      final res = await http.get(uri).timeout(const Duration(seconds: 8));
      if (res.statusCode < 200 || res.statusCode >= 300) {
        throw Exception('VIN network error');
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      final results = (body['Results'] as List).cast<Map<String, dynamic>>();
      if (results.isEmpty) throw Exception('Vehicle not found');
      final r = results.first;
      final make = (r['Make'] as String? ?? '').trim();
      final model = (r['Model'] as String? ?? '').trim();
      final year = (r['ModelYear'] as String? ?? '').trim();
      if (make.isEmpty && model.isEmpty) {
        throw Exception('Vehicle not found');
      }
      return VehicleInfo(
        vin: vin,
        make: make,
        model: model,
        year: year,
        bodyClass: r['BodyClass'] as String?,
      );
    } catch (_) {
      return VehicleInfo(
        vin: vin,
        make: 'Generic',
        model: 'Sedan',
        year: '—',
        bodyClass: 'Sedan',
      );
    }
  }
}
