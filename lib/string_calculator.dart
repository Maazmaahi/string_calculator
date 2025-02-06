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
    List<int> negatives = [];
    for (String num in parts) {
      int value = int.parse(num);
      if (value < 0) {
        negatives.add(value);
      }
      if (value <= 1000) {
        sum += value;
      }
    }

    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(',')}");
    }

    return sum;
  }
}
