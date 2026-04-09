class CommonString {
  static const String rupeeSymbol = '₹';

  static String rupee(num amount, {int decimalDigits = 2}) {
    return '$rupeeSymbol${amount.toStringAsFixed(decimalDigits)}';
  }
}
