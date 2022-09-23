import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:test/test.dart';

const locale = 'es';

void main() {
  test('Integer to words', () {
    Map<int, String> examples = {
      0: 'cero',
      20: 'veinte',
      26: 'veintiséis',
      73: 'setenta y tres',
      101: 'ciento uno',
      195: 'ciento noventa y cinco',
      1686: 'mil seiscientos ochenta y seis',
      6492000: 'seis millones cuatrocientos noventa y dos mil',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToWords(pair.key, locale), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Integer to ordinal', () {
    Map<int, String> examples = {
      6: 'sexto',
      11: 'undécimo',
      21: 'vigésimo primero',
      32: 'trigésimo segundo',
      177: 'centésimo septuagésimo séptimo',
      482: 'cuadringentésimo octogésimo segundo',
      4637: 'cuatromilésimo sexcentésimo trigésimo séptimo',
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
      Fraction(1, 2): 'una mitad',
      Fraction(1, 3): 'un tercio',
      Fraction(1, 4): 'un cuarto',
      Fraction(3, 4): 'tres cuartos',
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
