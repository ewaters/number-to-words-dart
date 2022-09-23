import 'package:number_to_words/src/utility.dart';

// This code adopted from https://github.com/moul/number-to-words/blob/master/fr-fr.go

final List<String> _megas = [
  "",
  "mille",
  "million",
  "milliard",
  "billion",
  "billiard",
  "trillion",
  "trilliard",
  "quadrillion",
  "quadrilliard",
  "quintillion",
  "quintilliard"
];
final List<String> _units = [
  "",
  "un",
  "deux",
  "trois",
  "quatre",
  "cinq",
  "six",
  "sept",
  "huit",
  "neuf"
];
final List<String> _tens = [
  "",
  "dix",
  "vingt",
  "trente",
  "quarante",
  "cinquante",
  "soixante",
  "soixante",
  "quatre-vingt",
  "quatre-vingt"
];
final List<String> _teens = [
  "dix",
  "onze",
  "douze",
  "treize",
  "quatorze",
  "quinze",
  "seize",
  "dix-sept",
  "dix-huit",
  "dix-neuf"
];

String integerToWordsImpl(int number) {
  List<String> words = [];

  if (number < 0) {
    words.add("moins");
    number *= -1;
  }

  // split integer in triplets
  final triplets = integerToTriplets(number);

  // zero is a special case
  if (triplets.isEmpty) {
    return "zéro";
  }

  // iterate over triplets
  for (var idx = triplets.length - 1; idx >= 0; idx--) {
    final triplet = triplets[idx];

    // nothing todo for empty triplet
    if (triplet == 0) {
      continue;
    }

    // special cases
    if (triplet == 1 && idx == 1) {
      words.add("mille");
      continue;
    }

    // three-digits
    final hundreds = triplet ~/ 100 % 10;
    final tens = triplet ~/ 10 % 10;
    final units = triplet % 10;
    if (hundreds > 0) {
      if (hundreds == 1) {
        words.add("cent");
      } else {
        if (tens == 0 && units == 0) {
          words.addAll([_units[hundreds], "cents"]);
        } else {
          words.addAll([_units[hundreds], "cent"]);
        }
      }
    }

    if (tens != 0 || units != 0) {
      switch (tens) {
        case 0:
          words.add(_units[units]);
          break;
        case 1:
          words.add(_teens[units]);
          break;
        case 7:
          switch (units) {
            case 1:
              words.add(_tens[tens] + '-et-' + _teens[units]);
              break;
            default:
              words.add(_tens[tens] + '-' + _teens[units]);
              break;
          }
          break;
        case 8:
          switch (units) {
            case 0:
              words.add(_tens[tens] + "s");
              break;
            default:
              words.add(_tens[tens] + '-' + _units[units]);
              break;
          }
          break;
        case 9:
          words.add(_tens[tens] + '-' + _teens[units]);
          break;
        default:
          switch (units) {
            case 0:
              words.add(_tens[tens]);
              break;
            case 1:
              words.add(_tens[tens] + '-et-' + _units[units]);
              break;
            default:
              words.add(_tens[tens] + '-' + _units[units]);
              break;
          }
          break;
      }
    }

    // mega
    String mega = _megas[idx];
    if (mega.isNotEmpty) {
      if (mega != "mille" && triplet > 1) {
        mega += "s";
      }
      words.add(mega);
    }
  }

  return words.join(' ');
}
