import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/italian/integer_to_words.dart';
import 'package:number_to_words/src/italian/integer_to_ordinal.dart';

class Italian extends NumberToWordInterface {
  @override
  Set<String> get locales => {'it', 'it-it', 'it_IT', 'italian'};

  @override
  String integerToWords(int number) => integerToWordsImpl(number);

  @override
  String integerToOrdinal(int number) {
    assertValidOrdinal(number);
    return integerToOrdinalImpl(number);
  }

  @override
  String fractionToWords(int numerator, int denominator) {
    assertValidFraction(numerator, denominator);
    throw 'unimplemented';
  }
}
