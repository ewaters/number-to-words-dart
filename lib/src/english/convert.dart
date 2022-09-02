import 'package:number_to_words/src/convert_interface.dart';

class English extends NumberToWordInterface {
  @override
  Set<String> get locales => {'en', 'en-us', 'en_US', 'english'};

  @override
  String integerToWords(int number) => throw 'not implemented';

  @override
  String integerToOrdinal(int number) {
    assertValidOrdinal(number);
    throw 'not implemented';
  }

  @override
  String integerToOrdinalShort(int number) {
    assertValidOrdinal(number);
    if (number == 1) {
      return '1st';
    } else if (number == 2) {
      return '2nd';
    } else if (number == 3) {
      return '3rd';
    }
    return '${number}th';
  }

  @override
  String fractionToWords(Fraction fraction) {
    assertValidFraction(fraction);
    throw 'not implemented';
  }
}
