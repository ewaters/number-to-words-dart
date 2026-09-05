import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:test/test.dart';

void main() {
  test('Korean integer to words', () {
    Map<int, String> examples = {
      0: '영',
      1: '일',
      2: '이',
      10: '십',
      11: '십일',
      25: '이십오',
      100: '백',
      105: '백오',
      342: '삼백사십이',
      1000: '천',
      1234: '천이백삼십사',
      10000: '만',
      12345: '만 이천삼백사십오',
      50000: '오만',
      100000: '십만',
      123456: '십이만 삼천사백오십육',
      1000000: '백만',
      10000000: '천만',
      100000000: '일억',
      123456789: '일억 이천삼백사십오만 육천칠백팔십구',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToWords(pair.key, 'ko'), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Korean integer to ordinal', () {
    Map<int, String> examples = {
      1: '첫째',
      2: '둘째',
      3: '셋째',
      4: '넷째',
      5: '다섯째',
      6: '여섯째',
      7: '일곱째',
      8: '여덟째',
      9: '아홉째',
      10: '열째',
      11: '열한째',
      12: '열두째',
      20: '스무째',
      21: '스물한째',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToOrdinal(pair.key, 'ko'), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Korean integer to short ordinal', () {
    Map<int, String> examples = {
      1: '1번째',
      5: '5번째',
      12: '12번째',
      100: '100번째',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToOrdinalShort(pair.key, 'ko'),
          equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Korean fractions to words', () {
    Map<Fraction, String> examples = {
      Fraction(1, 3): '삼분의 일',
      Fraction(2, 5): '오분의 이',
      Fraction(3, 4): '사분의 삼',
      Fraction(1, 100): '백분의 일',
    };
    for (final pair in examples.entries) {
      expect(
          NumberToWords.fractionToWords(
              pair.key.numerator, pair.key.denominator, 'ko'),
          equals(pair.value),
          reason: '${pair.key.numerator}/${pair.key.denominator}');
    }
  });
}
