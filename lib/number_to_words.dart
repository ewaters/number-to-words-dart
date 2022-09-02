import 'src/convert_interface.dart';
import 'src/locale_it.dart';

/// An unknown locale was seen.
class UnknownLocale {
  /// The locale.
  final String locale;

  /// Constructor.
  UnknownLocale(this.locale);

  @override
  String toString() => 'Locale "$locale" is not currently handled';
}

/// A class with a single static method, [integerToWords].
class NumberToWords {
  static final List<NumberToWordInterface> _converters = [
    Italian(),
  ];

  static NumberToWordInterface _converterForLocale(String locale) {
    for (final converter in _converters) {
      if (converter.matchesLocale(locale)) {
        return converter;
      }
    }
    throw UnknownLocale(locale);
  }

  /// Convert the given integer [number] to words in the [locale].
  ///
  /// If the locale is not handled, throws [UnknownLocale].
  static String integerToWords(int number, String locale) =>
      _converterForLocale(locale).integerToWords(number);
}
