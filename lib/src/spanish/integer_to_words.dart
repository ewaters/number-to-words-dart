import 'package:number_to_words/src/utility.dart';

const _megasSingular = ["", "mil", "millón", "mil millones", "billón"];
const _megasPlural = ["", "mil", "millones", "mil millones", "billones"];
const _unitsAdjectives = [
  "",
  "un",
  "dos",
  "tres",
  "cuatro",
  "cinco",
  "seis",
  "siete",
  "ocho",
  "nove"
];
const _units = [
  "",
  "uno",
  "dos",
  "tres",
  "cuatro",
  "cinco",
  "seis",
  "siete",
  "ocho",
  "nueve"
];
const _hundreds = [
  "",
  "ciento",
  "doscientos",
  "trescientos",
  "cuatrocientos",
  "quinientos",
  "seiscientos",
  "setecientos",
  "ochocientos",
  "novecientos"
];
const _tens = [
  "",
  "diez",
  "veinte",
  "treinta",
  "cuarenta",
  "cincuenta",
  "sesenta",
  "setenta",
  "ochenta",
  "noventa"
];
const _teens = [
  "diez",
  "once",
  "doce",
  "trece",
  "catorce",
  "quince",
  "dieciséis",
  "diecisiete",
  "dieciocho",
  "diecinueve"
];
const _twenties = [
  "veinte",
  "veintiuno",
  "veintidós",
  "veintitrés",
  "veinticuatro",
  "veinticinco",
  "veintiséis",
  "veintisiete",
  "veintiocho",
  "veintinueve"
];

String integerToWordsImpl(int number) {
  List<String> words = [];

  if (number < 0) {
    words.add("menos");
    number *= -1;
  }

  // split integer in triplets
  final triplets = integerToTriplets(number);

  // special cases
  if (triplets.isEmpty) {
    return "cero";
  }
  if (number == 1000) {
    return 'mil';
  }
  if (number == 1) {
    return 'uno';
  }

  // iterate over triplets
  for (var idx = triplets.length - 1; idx >= 0; idx--) {
    final triplet = triplets[idx];
    // nothing todo for empty triplet
    if (triplet == 0) {
      continue;
    }

    if (triplet == 1 && idx == 1) {
      // Special case: 'mil' is written without 'un'
      words.add(_megasSingular[idx]);
      continue;
    }

    // three-digits
    final hundreds = triplet ~/ 100 % 10;
    final tens = triplet ~/ 10 % 10;
    final units = triplet % 10;
    if (hundreds > 0) {
      words.add(_hundreds[hundreds]);
    }

    if (tens != 0 || units != 0) {
      switch (tens) {
        case 0:
          if (idx > 0) {
            words.add(_unitsAdjectives[units]);
          } else {
            words.add(_units[units]);
          }
          break;
        case 1:
          words.add(_teens[units]);
          break;
        case 2:
          if (idx > 0 && units == 1) {
            words.add("veintiún");
          } else {
            words.add(_twenties[units]);
          }
          break;
        default:
          if (units > 0) {
            words.add(_tens[tens] + ' y ' + _units[units]);
          } else {
            words.add(_tens[tens]);
          }
          break;
      }
    }

    switch (triplet) {
      case 0:
        break;
      case 1:
        final mega = _megasSingular[idx];
        if (mega.isNotEmpty) {
          words.add(mega);
        }
        break;
      default:
        final mega = _megasPlural[idx];
        if (mega.isNotEmpty) {
          words.add(mega);
        }
        break;
    }
  }

  return words.join(' ');
}
