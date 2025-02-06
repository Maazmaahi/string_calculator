class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final parts = numbers.split(',');
    int sum = 0;
    if (parts.length == 2) {
      sum += int.parse(parts.last);
    }
    return sum += int.parse(parts.first);
  }
}
