import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator', () {
    test('empty string returns 0', () {
      expect(StringCalculator().add(''), 0);
    });
  });
}
