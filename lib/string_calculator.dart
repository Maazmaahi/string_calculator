class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final parts = numbers.split(',');
    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
