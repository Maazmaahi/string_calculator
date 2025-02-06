import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator', () {
    test('empty string returns 0', () {
      expect(StringCalculator().add(''), 0);
    });

    test('single number returns the number', () {
      expect(StringCalculator().add('1'), 1);
    });

    test('two numbers returns the sum', () {
      expect(StringCalculator().add('1,2'), 3);
    });

    test('unKnown amount of numbers returns the sum', () {
      expect(StringCalculator().add('1,2,3,4'), 10);
    });

    test('new lines between numbers', () {
      expect(StringCalculator().add('1\n2'), 3);
    });

    test('custom delimiter', () {
      expect(StringCalculator().add('//;\n1;2'), 3);
    });

    test('should throw exception for single negative numbers', () {
      expect(
          () => StringCalculator().add("-1,2"),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == "Exception: negative numbers not allowed -1")));
    });

    test('should throw exception for multiple negative numbers', () {
      expect(
          () => StringCalculator().add("-1,-2,3"),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == "Exception: negative numbers not allowed -1,-2")));
    });

    test('should ignore numbers greater than 1000', () {
      expect(StringCalculator().add("2,1001"), equals(2));
    });

    test('should handle custom delimiter any length', () {
      expect(StringCalculator().add("//[***]\n1***2***3"), equals(6));
    });

    test('should handle multiple delimiters', () {
      expect(StringCalculator().add("//[*][%]\n1*2%3"), equals(6));
    });

    test('should handle multiple long delimiters', () {
      expect(StringCalculator().add("//[***][%%%]\n1***2%%%3"), equals(6));
    });
  });
}
