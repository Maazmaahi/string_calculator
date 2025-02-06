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
    int sum = 0;
    for (String num in parts) {
      int value = int.parse(num);
      if (value < 0) {
        throw Exception("negative numbers not allowed $value");
      }
      sum += value;
    }
    return sum;
  }
}
