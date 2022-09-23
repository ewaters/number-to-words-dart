import 'package:number_to_words/src/utility.dart';
import 'integer_to_words.dart';

import 'dart:math';

const _ordinalUnits = [
  '',
  'primero',
  'segundo',
  'tercero',
  'cuarto',
  'quinto',
  'sexto',
  'séptimo', // but also 'sètimo'
  'octavo',
  'noveno',
  'décimo',
  'undécimo',
  'duodécimo',
  'decimotercero',
  'decimocuarto',
  'decimoquinto',
  'decimosexto',
  'decimoséptimo',
  'decimoctavo',
  'decimonoveno',
];

const _tensPrefix = [
  '',
  '',
  'vi',
  'tri',
  'cuadra',
  'quincua',
  'sexa',
  'septua',
  'octo',
  'nona',
];

const _hundredsPrefix = [
  '',
  'cent',
  'ducent',
  'tricent',
  'cuadringent',
  'quingent',
  'sexcent',
  'septingent',
  'octing',
  'noningent',
];

String integerToOrdinalImpl(int number) {
  List<String> words = [];
  final triplets = integerToTriplets(number);
  for (var idx = triplets.length - 1; idx >= 0; idx--) {
    final triplet = triplets[idx];
    // nothing todo for empty triplet
    if (triplet == 0) {
      continue;
    }

    if (idx == 0) {
      if (triplet < _ordinalUnits.length) {
        words.add(_ordinalUnits[triplet]);
        continue;
      }

      // three-digits
      final hundreds = triplet ~/ 100 % 10;
      final tens = triplet ~/ 10 % 10;
      final units = triplet % 10;
      if (hundreds > 0) {
        words.add(_hundredsPrefix[hundreds] + 'ésimo');
      }
      if (tens > 0) {
        words.add(_tensPrefix[tens] + 'gésimo');
      }
      if (units > 0) {
        words.add(_ordinalUnits[units]);
      }
    } else {
      int adjusted = triplet * pow(1000, idx).toInt();
      String base = integerToWordsImpl(adjusted);
      base = base.replaceAll(' ', '');
      words.add(base + 'ésimo');
    }
  }
  return words.join(' ');
}
