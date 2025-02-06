A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# String Calculator TDD Kata - Incubyte Assessment

This repository contains my solution to the String Calculator TDD Kata, as part of the Incubyte recruitment process for a Flutter/React developer position.  The project demonstrates my understanding and application of Test-Driven Development (TDD) principles and my commitment to writing clean, maintainable, and well-tested code.

## Project Overview

The String Calculator is a simple program that takes a string of comma-separated numbers as input and returns the sum of those numbers.  This kata involves progressively adding features to the calculator, following a strict TDD approach.  Each step is accompanied by unit tests that drive the development process.

## TDD Approach

I adhered to the following TDD principles throughout the development:

1.  **Write a test first:** Before writing any code, I wrote a failing test that described the desired behavior.
2.  **Write the minimal code to pass the test:** I implemented just enough code to make the test pass.
3.  **Refactor:** After each passing test, I refactored the code to improve its structure, readability, and maintainability, while ensuring that all tests still passed.

This cycle of red-green-refactor was repeated for each feature added to the calculator.

## Features Implemented

The following features have been implemented, in accordance with the kata requirements:

*   **Empty String:**  An empty string input returns 0.

    ```dart
    // Test
    test('empty string returns 0', () {
      expect(StringCalculator().add(""), equals(0));
    });

    // Implementation
    int add(String numbers) {
      return 0;
    }
    ```

*   **Single Number:** A single number input returns the number itself.

    ```dart
    // Test
    test('single number returns the number', () {
      expect(StringCalculator().add("1"), equals(1));
    });

    // Implementation
    int add(String numbers) {
      if (numbers.isEmpty) return 0;
      return int.parse(numbers);
    }
    ```

*   **Two Numbers:** Two comma-separated numbers return their sum.

    ```dart
    // Test
    test('two numbers returns the sum', () {
      expect(StringCalculator().add("1,2"), equals(3));
    });

    // Implementation
    int add(String numbers) {
      if (numbers.isEmpty) return 0;
      final parts = numbers.split(',');
      int sum = 0;
      if (parts.length == 2) {
        sum += int.parse(parts.last);
      }
      return sum += int.parse(parts.first);
    }
    ```

*   **Any Amount of Numbers:** The calculator can handle any number of comma-separated inputs.

    ```dart
    // Test
    test('unKnown amount of numbers returns the sum', () {
      expect(StringCalculator().add('1,2,3,4'), 10);
    });

    // Implementation (Refactored)
    int add(String numbers) {
      if (numbers.isEmpty) return 0;
      final parts = numbers.split(',');
      return parts.map(int.parse).reduce((a, b) => a + b);
    }
    ```

*   **Newlines as Delimiters:** Newlines can be used as delimiters in addition to commas.

    ```dart
    // Test
    test('new lines between numbers', () {
      expect(StringCalculator().add('1\n2'), 3);
    });

    // Implementation (Refactored)
    int add(String numbers) {
      if (numbers.isEmpty) return 0;
      final parts = numbers.replaceAll('\n', ',').split(',');
      return parts.map(int.parse).reduce((a, b) => a + b);
    }
    ```

*   **Custom Delimiters:** The input string can specify a custom delimiter using the format `//[delimiter]\n[numbers…]`.

    ```dart
    // Test
    test('custom delimiter', () {
      expect(StringCalculator().add('//;\n1;2'), 3);
    });

    // Implementation (Refactored)
    int add(String numbers) {
      if (numbers.isEmpty) return 0;
      String delimiter = ',';
      if (numbers.startsWith("//")) {
        int delimiterEnd = numbers.indexOf('\n');
        delimiter = numbers.substring(2, delimiterEnd);
        numbers = numbers.substring(delimiterEnd + 1);
      }
      List<String> parts = numbers.replaceAll('\n', delimiter).split(delimiter);
      return parts.map(int.parse).reduce((a, b) => a + b);
    }
    ```

*   **Negative Numbers:** Calling `add` with a negative number throws an exception with a clear message indicating the negative number(s).
*   **Numbers > 1000:** Numbers greater than 1000 are ignored in the calculation.
*   **Long Delimiters:** Delimiters can be of any length (e.g., `//[***]\n1***2***3`).
*   **Multiple Delimiters:** The input can specify multiple delimiters using the format `//[delim1][delim2]\n[numbers…]`.  This includes handling combinations of long and short delimiters.

## Code Structure

The project consists of the following files:

*   `string_calculator.dart`: Contains the implementation of the `add` method.
*   `string_calculator_test.dart`: Contains the unit tests for the `add` method, using the `test` package.

## How to Run the Tests

1.  Ensure you have the Dart SDK installed.
2.  Clone this repository.
3.  Navigate to the project directory in your terminal.
4.  Run the command `dart test`.

All tests should pass, indicating that the String Calculator is functioning correctly.

## Screenshots

I have included screenshots in the `screenshots` folder demonstrating both passing and failing test cases for each feature.  These screenshots provide visual evidence of the TDD process and the correctness of the implementation.  The filenames are descriptive, indicating the feature being tested.

## Challenges and Learnings

*   Handling multiple delimiters of varying lengths required careful consideration and refactoring.
*   Ensuring comprehensive test coverage for all edge cases was a key focus.

## Conclusion

This project demonstrates my ability to apply TDD principles effectively and produce well-tested, maintainable code. I am confident in my skills as a software craftsperson and eager to contribute to a team that values quality and best practices.

Thank you for considering my application.  I look forward to discussing this assessment further in the next stages of the interview process.
