import 'convert_interface.dart';
import 'utility.dart';

bool _endsInVowel(String text) => RegExp(r'[aeiou]$').hasMatch(text);

bool _startsWithVowel(String text) => RegExp('^[aeiou]').hasMatch(text);

// Apocope: the loss of a word-final vowel.
String _joinWithApocope(String left, String right) {
  // 'tre' is written with an accent when joined with other words.
  if (right == 'tre') {
    right = 'tré';
  }
  if (_endsInVowel(left) && _startsWithVowel(right)) {
    return left.substring(0, left.length - 1) + right;
  }
  if (left.endsWith('é')) {
    left = left.substring(0, left.length - 1) + 'e';
  }
  return left + right;
}

// This code adapted from
// https://github.com/moul/number-to-words/blob/master/it-it.go.

class Italian extends NumberToWordInterface {
  static final List<String> _megas = [
    "",
    "mille", // thousand
    "milione", // million
    "miliardo", // billion
    "bilione", // trillion
    "biliardo", // quadrillion
  ];
  static final List<String> _megasPlural = [
    "",
    "mila",
    "milioni",
    "miliardi",
    "bilioni",
    "biliardi",
  ];

  static final List<String> _units = [
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
  static final List<String> _tens = [
    "",
    "dieci",
    "venti",
    "trenta",
    "quaranta",
    "cinquanta",
    "sessanta",
    "settanta",
    "ottanta",
    "novanta"
  ];
  static final List<String> _teens = [
    "dieci",
    "undici",
    "dodici",
    "tredici",
    "quattordici",
    "quindici",
    "sedici",
    "diciasette",
    "diciotto",
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

      if (triplet == 1 && idx == 1) {
        // Special case: "mille" is written without 'uno' in front of it.
        words.add(_megas[idx]);
        continue;
      }

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
          words.add('${_units[hundreds]}cento');
          break;
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
            if (units > 0) {
              words.add(_joinWithApocope(_tens[tens], _units[units]));
            } else {
              words.add(_tens[tens]);
            }
            break;
        }
      }

      final mega = triplet > 1 ? _megasPlural[idx] : _megas[idx];
      if (mega.isNotEmpty) {
        words.add(mega);
      }
    }

    // From https://www.languagesandnumbers.com/how-to-count-in-italian/en/ita/:
    // Numbers are grouped in words of three digits, with a space added after
    // the word for thousand if its multiplier is greater than one hundred and
    // does not end with a double zero.
    // e.g. duemilatrecentoquarantacinque [2,345]
    //      seicentomiladue [600,002]
    //      settecentosessantacinquemila duecento [765,200]
    return words.join('');
  }

  static final List<String> _ordinalUnits = [
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

  @override
  String integerToOrdinal(int number) {
    assertValidOrdinal(number);
    if (number <= 10) {
      return _ordinalUnits[number];
    }
    final base = integerToWords(number);
    return _joinWithApocope(base, 'esimo');
  }

  @override
  String fractionToWords(int numerator, int denominator) {
    assertValidFraction(numerator, denominator);
    throw 'unimplemented';
  }
}
