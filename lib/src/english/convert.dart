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
    final str = number.toString();
    if (str.endsWith('1')) {
      return '${str}st';
    } else if (str.endsWith('2')) {
      return '${str}nd';
    } else if (str.endsWith('3')) {
      return '${str}rd';
    }
    return '${str}th';
  }

  @override
  String fractionToWords(Fraction fraction) {
    assertValidFraction(fraction);
    throw 'not implemented';
  }
}
