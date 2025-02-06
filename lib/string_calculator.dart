class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    if (numbers.startsWith("//")) {
      int delimiterEnd = numbers.indexOf('\n');
      String delimiterStr = numbers.substring(2, delimiterEnd);

      //Extract delimiters from string like "[***][%]"
      List<String> delimiters = delimiterStr.replaceAll('[', '').split(']');
      delimiters.removeWhere((element) => element.isEmpty);

      numbers = numbers.substring(delimiterEnd + 1);

      for (String delimiter in delimiters) {
        numbers = numbers.replaceAll(delimiter, ',');
      }
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
