import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/german/integer_to_words.dart';
import 'package:number_to_words/src/german/integer_to_ordinal.dart';
import 'package:number_to_words/src/german/fraction_to_words.dart';

class German extends NumberToWordInterface {
  @override
  Set<String> get locales => {'de', 'de-de', 'de_DE', 'German'};

  @override
  String integerToWords(int number) => integerToWordsImpl(number);

  @override
  String integerToOrdinal(int number) {
    assertValidOrdinal(number);
    return integerToOrdinalImpl(number);
  }

  @override
  String integerToOrdinalShort(int number) {
    assertValidOrdinal(number);
    return '$number°';
  }

  @override
  String fractionToWords(Fraction fraction) {
    assertValidFraction(fraction);
    return fractionToWordsImpl(fraction);
  }
}
