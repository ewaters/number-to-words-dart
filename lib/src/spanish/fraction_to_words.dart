import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/spanish/integer_to_ordinal.dart';
import 'package:number_to_words/src/spanish/integer_to_words.dart';

String fractionToWordsImpl(Fraction fraction) {
  if (fraction.numerator == 1 && fraction.denominator == 2) {
    return 'una mitad';
  }
  String numer = integerToWordsImpl(fraction.numerator);
  if (fraction.numerator == 1) {
    numer = 'un';
  }
  String demon = integerToOrdinalImpl(fraction.denominator);
  if (fraction.denominator == 3) {
    demon = 'tercio';
  }
  if (fraction.numerator > 1) {
    demon += 's';
  }
  return '$numer $demon';
}
