class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    if (numbers.startsWith("//")) {
      int delimiterEnd = numbers.indexOf('\n');
      delimiter = numbers.substring(2, delimiterEnd);
      numbers = numbers.substring(delimiterEnd + 1);
    }

    List<String> parts = numbers.replaceAll('\n', delimiter).split(delimiter);

    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
