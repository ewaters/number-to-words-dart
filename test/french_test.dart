import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:test/test.dart';

const locale = 'fr';

void main() {
  test('Integer to words', () {
    Map<int, String> examples = {
      0: 'zéro',
      10: 'dix',
      11: 'onze',
      21: 'vingt-et-un',
      98: 'quatre-vingt-dix-huit',
      598: 'cinq cent quatre-vingt-dix-huit',
      8841932:
          'huit millions huit cent quarante-et-un mille neuf cent trente-deux',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToWords(pair.key, locale), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Integer to ordinal', () {
    Map<int, String> examples = {
      6: 'sixième',
      11: 'onzième',
      21: 'vingt-et-unième',
      82: 'quatre-vingt-deuxième',
    };
    for (final pair in examples.entries) {
      expect(
          NumberToWords.integerToOrdinal(pair.key, locale), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Integer to short ordinal', () {
    Map<int, String> examples = {
      6: '6e',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToOrdinalShort(pair.key, locale),
          equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Fractions to words', () {
    Map<Fraction, String> examples = {
      Fraction(1, 2): 'un demi',
      Fraction(1, 3): 'un tiers',
      Fraction(1, 4): 'un quart',
      Fraction(3, 4): 'trois quarts',
    };
    for (final pair in examples.entries) {
      expect(
          NumberToWords.fractionToWords(
              pair.key.numerator, pair.key.denominator, locale),
          equals(pair.value),
          reason: '${pair.key}');
    }
  });
}
