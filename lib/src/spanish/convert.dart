import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/spanish/integer_to_words.dart';
import 'package:number_to_words/src/spanish/integer_to_ordinal.dart';
import 'package:number_to_words/src/spanish/fraction_to_words.dart';

class Spanish extends NumberToWordInterface {
  @override
  Set<String> get locales => {'es', 'Spanish'};

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
