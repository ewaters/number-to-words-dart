/// The common class for all number-to-word conversion classes.
abstract class NumberToWordInterface {
  /// A set of locales for this class.
  Set<String> get locales;

  /// Converts [number] to a string.
  String integerToWords(int number);

  /// Converts [number] to an ordinal string.
  String integerToOrdinal(int number);

  /// Checks if the parameters are valid for calling [integerToOrdinal]. Throws
  /// if otherwise.
  void assertValidOrdinal(int number) {
    if (number < 1) {
      throw 'Ordinals start at 1';
    }
  }

  /// Converts the fraction indicated by [numerator] and [denominator] to a
  /// string.
  String fractionToWords(int numerator, int denominator);

  /// Checks if the parameters are valid for calling [fractionToWords]. Throws
  /// if otherwise.
  void assertValidFraction(int numerator, int denominator) {
    if (denominator <= 0) {
      throw 'Denominator $denominator must be greater than 0';
    }
  }

  /// Returns true if the given locale string should be handled by this class.
  bool matchesLocale(String locale) {
    if (locales.contains(locale) || locales.contains(locale.toLowerCase())) {
      return true;
    }
    return false;
  }
}
