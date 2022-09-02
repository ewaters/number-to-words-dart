class Fraction {
  final int numerator;
  final int denominator;
  Fraction(this.numerator, this.denominator);
}

/// The common class for all number-to-word conversion classes.
abstract class NumberToWordInterface {
  /// A set of locales for this class.
  Set<String> get locales;

  /// Returns true if the given locale string should be handled by this class.
  bool matchesLocale(String locale) {
    if (locales.contains(locale) || locales.contains(locale.toLowerCase())) {
      return true;
    }
    return false;
  }

  /// Converts [number] to a cardinal number string.
  String integerToWords(int number);

  /// Converts [number] to an ordinal number string.
  String integerToOrdinal(int number);

  /// Checks if the parameters are valid for calling [integerToOrdinal]. Throws
  /// if otherwise.
  void assertValidOrdinal(int number) {
    if (number < 1) {
      throw 'Ordinals start at 1';
    }
  }

  /// Converts the fraction indicated by [fraction] to a
  /// string.
  String fractionToWords(Fraction fraction);

  /// Checks if the parameters are valid for calling [fractionToWords]. Throws
  /// if otherwise.
  void assertValidFraction(Fraction fraction) {
    if (fraction.denominator <= 0) {
      throw 'Denominator ${fraction.denominator} must be greater than 0';
    }
  }
}
