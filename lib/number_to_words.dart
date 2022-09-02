import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/italian/convert.dart';
import 'package:number_to_words/src/english/convert.dart';

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
    English(),
  ];

  static NumberToWordInterface _converterForLocale(String locale) {
    for (final converter in _converters) {
      if (converter.matchesLocale(locale)) {
        return converter;
      }
    }
    throw UnknownLocale(locale);
  }

  /// Convert the given integer [number] to cardnial words in the [locale].
  ///
  /// If the locale is not handled, throws [UnknownLocale].
  static String integerToWords(int number, String locale) =>
      _converterForLocale(locale).integerToWords(number);

  /// Convert the given integer [number] to an ordinal string in the [locale].
  ///
  /// Example: "first", "secondo"
  ///
  /// If the locale is not handled, throws [UnknownLocale].
  static String integerToOrdinal(int number, String locale) =>
      _converterForLocale(locale).integerToOrdinal(number);

  /// Convert the given integer [number] to a short ordinal string in the
  /// [locale].
  ///
  /// Example: "1st", "5°"
  ///
  /// If the locale is not handled, throws [UnknownLocale].
  static String integerToOrdinalShort(int number, String locale) =>
      _converterForLocale(locale).integerToOrdinalShort(number);

  /// Convert the given fraction [numerator]/[denominator] to a string in the
  /// [locale].
  ///
  /// If the locale is not handled, throws [UnknownLocale].
  static String fractionToWords(
          int numerator, int denominator, String locale) =>
      _converterForLocale(locale)
          .fractionToWords(Fraction(numerator, denominator));
}
