import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/italian/integer_to_words.dart';
import 'package:number_to_words/src/italian/integer_to_ordinal.dart';
import 'package:number_to_words/src/italian/utility.dart';

// Italian fractions are formed in one of three ways:
//
//  * "due su tre" (two over three)
//  * "due fratto tre" (two divided by three)
//  * "due terzi" (two thirds)
//
// We return only the cardnial form of this. Perhaps we should be returning a
// full list of options of ways this can be said?
String fractionToWordsImpl(Fraction fraction) {
  String left = integerToWordsImpl(fraction.numerator);
  if (left == 'uno') {
    left = 'un';
  }
  String right = integerToOrdinalImpl(fraction.denominator);
  if (fraction.numerator.abs() > 1) {
    right = pluralize(right);
  }
  return '$left $right';
}
