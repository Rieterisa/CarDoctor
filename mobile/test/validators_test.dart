import 'package:flutter_test/flutter_test.dart';
import 'package:cardoctor/validators.dart';

void main() {
  group('VinValidator', () {
    test('normalizes and validates', () {
      expect(VinValidator.normalize(' 1hgcm82633a004352 '), '1HGCM82633A004352');
      expect(VinValidator.isValid('1HGCM82633A004352'), isTrue);
      expect(VinValidator.isValid('SHORT'), isFalse);
      expect(VinValidator.isValid('1HGCM82633A00435I'), isFalse);
    });
  });

  group('DtcParser', () {
    test('normalizes and validates', () {
      expect(DtcParser.normalize('p0300'), 'P0300');
      expect(DtcParser.normalize('P 0300'), 'P0300');
      expect(DtcParser.isValid('P0420'), isTrue);
      expect(DtcParser.isValid('C0035'), isTrue);
      expect(DtcParser.isValid('X0300'), isFalse);
      expect(DtcParser.isValid('P03'), isFalse);
    });
  });
}
