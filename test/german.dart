import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:test/test.dart';

const locale = 'de';

void main() {
  test('Integer to words', () {
    Map<int, String> examples = {
      0: 'null',
      10: 'zehn',
      11: 'elf',
      21: 'einundzwanzig',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToWords(pair.key, locale), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  /*
  test('Integer to ordinal', () {
    Map<int, String> examples = {
      6: 'sesto',
    };
    for (final pair in examples.entries) {
      expect(
          NumberToWords.integerToOrdinal(pair.key, locale), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Integer to short ordinal', () {
    Map<int, String> examples = {
      6: '6°',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToOrdinalShort(pair.key, locale),
          equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Fractions to words', () {
    Map<Fraction, String> examples = {
      Fraction(1, 4): 'un quarto',
      Fraction(2, 5): 'due quinti',
    };
    for (final pair in examples.entries) {
      expect(
          NumberToWords.fractionToWords(
              pair.key.numerator, pair.key.denominator, locale),
          equals(pair.value),
          reason: '${pair.key}');
    }
  });
  */
}
