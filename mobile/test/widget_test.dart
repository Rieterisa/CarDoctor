import 'package:flutter_test/flutter_test.dart';
import 'package:cardoctor/validators.dart';

void main() {
  // Full widget boot covered by `flutter run` / web build.
  // Keep unit tests fast and deterministic on Windows CI.
  test('smoke validators', () {
    expect(DtcParser.isValid('P0300'), isTrue);
    expect(VinValidator.isValid('1HGCM82633A004352'), isTrue);
  });
}
