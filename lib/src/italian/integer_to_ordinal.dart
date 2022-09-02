import 'package:number_to_words/src/italian/utility.dart';
import 'package:number_to_words/src/italian/integer_to_words.dart';

final List<String> _ordinalUnits = [
  "",
  "primo",
  "secondo",
  "terzo",
  "quarto",
  "quinto",
  "sesto",
  "settimo",
  "ottavo",
  "nono",
  "decimo",
];

String integerToOrdinalImpl(int number) {
  if (number <= 10) {
    return _ordinalUnits[number];
  }
  final base = integerToWordsImpl(number);
  return joinWithApocope(base, 'esimo');
}
