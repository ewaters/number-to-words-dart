// ignore_for_file: public_member_api_docs
import 'convert_interface.dart';
import 'utility.dart';

// This code adapted from
// https://github.com/moul/number-to-words/blob/master/it-it.go.

class Italian extends NumberToWordInterface {
  static final List<String> italianMegas = [
    "",
    "mille",
    "milione",
    "miliardo",
    "triliardo",
    "quadrillion",
    "quintillion",
    "sextillion",
    "septillion",
    "octillion",
    "nonillion",
    "decillion"
  ];
  static final List<String> italianUnits = [
    "",
    "uno",
    "due",
    "tre",
    "quattro",
    "cinque",
    "sei",
    "sette",
    "otto",
    "nove"
  ];
  static final List<String> italianTens = [
    "",
    "dieci",
    "venti",
    "trenta",
    "quaranta",
    "cinquanta",
    "sessenta",
    "settanta",
    "ottanta",
    "novanta"
  ];
  static final List<String> italianTeens = [
    "dieci",
    "undici",
    "dodici",
    "tredici",
    "quattordici",
    "quindici",
    "sedici",
    "diciasette",
    "dicioto",
    "diciannove"
  ];

  @override
  Set<String> get locales => {'it', 'it-it', 'it_IT', 'italian'};

  @override
  String integerToWords(int number) {
    List<String> words = [];

    if (number < 0) {
      words.add("meno");
      number *= -1;
    }

    // split integer in triplets
    final triplets = integerToTriplets(number);

    // zero is a special case
    if (triplets.isEmpty) {
      return "zero";
    }

    // iterate over triplets
    for (var idx = triplets.length - 1; idx >= 0; idx--) {
      final triplet = triplets[idx];

      // nothing todo for empty triplet
      if (triplet == 0) {
        continue;
      }

      // three-digits
      final hundreds = triplet ~/ 100 % 10;
      final tens = triplet ~/ 10 % 10;
      final units = triplet % 10;
      // print('hundreds: $hundreds, tens: $tens, units: $units');
      switch (hundreds) {
        case 0:
          break;
        case 1:
          words.add('cento');
          break;
        default:
          words.add('${italianUnits[hundreds]}cento');
          break;
      }

      if (tens != 0 || units != 0) {
        switch (tens) {
          case 0:
            words.add(italianUnits[units]);
            break;
          case 1:
            words.add(italianTeens[units]);
            break;
          default:
            if (units > 0) {
              words.add(italianTens[tens] + italianUnits[units]);
            } else {
              words.add(italianTens[tens]);
            }
            break;
        }
      }

      final mega = italianMegas[idx];
      if (mega.isNotEmpty) {
        words.add(mega);
      }
    }

    return words.join(' ');
  }
}
