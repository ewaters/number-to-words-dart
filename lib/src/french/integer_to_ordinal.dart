import 'integer_to_words.dart';

const _ordinalUnits = [
  "",
  'premier',
  'deuxième',
  'troisième',
  'quatrième',
  'cinquième',
  'sixième',
  'septième',
  'huitième',
  'neuvième',
  'dixième',
  'onzième',
  'douzième',
  'treizième',
  'quatorzième',
  'quinzième',
  'seizième',
  'dix-septième',
  'dix-huitième',
  'dix-neuvième',
  'vingtième',
];

String integerToOrdinalImpl(int number) {
  if (number < _ordinalUnits.length) {
    return _ordinalUnits[number];
  }
  final base = integerToWordsImpl(number);
  return '${base}ième';
}
