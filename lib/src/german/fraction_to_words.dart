import 'package:number_to_words/src/utility.dart';
import 'package:number_to_words/src/convert_interface.dart';

import 'integer_to_ordinal.dart';
import 'integer_to_words.dart';

String fractionToWordsImpl(Fraction fraction) {
  if (fraction.numerator == 1 && fraction.denominator == 2) {
    return 'halb';
  }
  String numer = integerToWordsImpl(fraction.numerator);
  if (numer == 'eins') {
    numer = 'ein';
  }
  String denom = integerToOrdinalImpl(fraction.denominator);
  denom = upperCaseFirstLetter(denom);
  return numer + ' ' + denom + 'l';
}
