/// The common class for all number-to-word conversion classes.
abstract class NumberToWordInterface {
  /// A set of locales for this class.
  Set<String> get locales;

  /// Converts the given integer to a string.
  String integerToWords(int number);

  /// Returns true if the given locale string should be handled by this class.
  bool matchesLocale(String locale) {
    if (locales.contains(locale) || locales.contains(locale.toLowerCase())) {
      return true;
    }
    return false;
  }
}
