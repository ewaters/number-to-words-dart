import 'package:number_to_words/src/utility.dart';

// This package mostly copied from https://github.com/moul/number-to-words/blob/master/de-de.go

const _megasSingular = [
  "",
  "eintausend",
  "eine Million",
  "eine Milliarde",
  "eine Billion",
  "eine Billiarde",
  "eine Trillion",
  "eine Trilliarde",
  "eine Quadrillion",
  "eine Quadrilliarde",
  "eine Quintillion",
  "eine Quintilliarde",
  "eine Sextillion",
  "eine Sextilliarde",
  "eine Septillion",
  "eine Septilliarde"
];

const _megasPlural = [
  "",
  "tausend",
  "Millionen",
  "Milliarden",
  "Billionen",
  "Billiarden",
  "Trillionen",
  "Trilliarden",
  "Quadrillionen",
  "Quadrilliarden",
  "Quintillionen",
  "Quintilliarden",
  "Sextillionen",
  "Sextilliarden",
  "Septillionen",
  "Septilliarden"
];
const _units = [
  "",
  "eins",
  "zwei",
  "drei",
  "vier",
  "fünf",
  "sechs",
  "sieben",
  "acht",
  "neun"
];
const _tens = [
  "",
  "zehn",
  "zwanzig",
  "dreißig",
  "vierzig",
  "fünfzig",
  "sechzig",
  "siebzig",
  "achtzig",
  "neunzig"
];
const _teens = [
  "zehn",
  "elf",
  "zwölf",
  "dreizehn",
  "vierzehn",
  "fünfzehn",
  "sechzehn",
  "siebzehn",
  "achtzehn",
  "neunzehn"
];

String integerToWordsImpl(int number) {
  List<String> words = [];
  if (number < 0) {
    words.add("minus ");
    number *= -1;
  }

  // split integer in triplets
  final triplets = integerToTriplets(number);

  // zero is a special case
  if (triplets.isEmpty) {
    return "null";
  }

  // iterate over triplets
  for (var idx = triplets.length - 1; idx >= 0; idx--) {
    final triplet = triplets[idx];

    // nothing to do for empty triplet
    if (triplet == 0) {
      continue;
    }

    String mega = '';
    if (triplet == 1 && idx != 0) {
      // handle singular megas
      mega = _megasSingular[idx];

      if (idx > 1) {
        // Million and above, megas need separator
        mega = " $mega ";
      }

      words.add(mega);
      continue;
    }

    mega = _megasPlural[idx];

    if (idx > 1) {
      // Million and above, megas need separator
      mega = " $mega ";
    }

    // three-digits
    final hundreds = triplet ~/ 100 % 10;
    final tens = triplet ~/ 10 % 10;
    final units = triplet % 10;
    if (hundreds == 1) {
      words.add("einhundert");
    } else if (hundreds > 0) {
      words.addAll([_units[hundreds], "hundert"]);
    }

    if (tens != 0 || units != 0) {
      switch (tens) {
        case 0:
          words.add(_units[units]);
          break;
        case 1:
          words.add(_teens[units]);
          break;
        default:
          if (units == 1) {
            words.add("einund" + _tens[tens]);
          } else if (units > 0) {
            words.add(_units[units] + 'und' + _tens[tens]);
          } else {
            words.add(_tens[tens]);
          }
          break;
      }
    }

    // mega
    if (mega != "") {
      words.add(mega);
    }
  }

  return words.join('').trim();
}
