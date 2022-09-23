import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/french/integer_to_words.dart';
import 'package:number_to_words/src/french/integer_to_ordinal.dart';

const _denoms = <String>["", "", "demi", "tiers", "quart"];

String fractionToWordsImpl(Fraction fraction) {
  final numer = integerToWordsImpl(fraction.numerator);
  String demon = _denoms[fraction.denominator];
  if (demon.isEmpty) {
    demon = integerToOrdinalImpl(fraction.denominator);
  }
  if (fraction.numerator > 1 && !demon.endsWith('s')) {
    demon += 's';
  }
  return '$numer $demon';
}
