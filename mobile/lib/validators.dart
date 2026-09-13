class VinValidator {
  static String normalize(String raw) =>
      raw.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');

  static bool isValid(String raw) {
    final vin = normalize(raw);
    if (vin.length != 17) return false;
    return !RegExp(r'[IOQ]').hasMatch(vin);
  }
}

class DtcParser {
  static String normalize(String raw) {
    final cleaned = raw.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
    if (cleaned.length < 5) return cleaned;
    return cleaned.substring(0, 5);
  }

  static bool isValid(String raw) {
    final code = normalize(raw);
    if (code.length != 5) return false;
    if (!RegExp(r'^[PBCU]').hasMatch(code)) return false;
    return RegExp(r'^[PBCU]\d{4}$').hasMatch(code);
  }
}
