import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/korean.dart';
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
      99: '아흔아홉째',
      100: '백 번째',
      101: '백한 번째',
      120: '백스무 번째',
      1234: '천이백서른네 번째',
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

  group('KoreanNumbers', () {
    // One row per decade, 1-9 then 10-19 ... 90-99.
    const cardinals = [
      '하나 둘 셋 넷 다섯 여섯 일곱 여덟 아홉',
      '열 열하나 열둘 열셋 열넷 열다섯 열여섯 열일곱 열여덟 열아홉',
      '스물 스물하나 스물둘 스물셋 스물넷 스물다섯 스물여섯 스물일곱 스물여덟 스물아홉',
      '서른 서른하나 서른둘 서른셋 서른넷 서른다섯 서른여섯 서른일곱 서른여덟 서른아홉',
      '마흔 마흔하나 마흔둘 마흔셋 마흔넷 마흔다섯 마흔여섯 마흔일곱 마흔여덟 마흔아홉',
      '쉰 쉰하나 쉰둘 쉰셋 쉰넷 쉰다섯 쉰여섯 쉰일곱 쉰여덟 쉰아홉',
      '예순 예순하나 예순둘 예순셋 예순넷 예순다섯 예순여섯 예순일곱 예순여덟 예순아홉',
      '일흔 일흔하나 일흔둘 일흔셋 일흔넷 일흔다섯 일흔여섯 일흔일곱 일흔여덟 일흔아홉',
      '여든 여든하나 여든둘 여든셋 여든넷 여든다섯 여든여섯 여든일곱 여든여덟 여든아홉',
      '아흔 아흔하나 아흔둘 아흔셋 아흔넷 아흔다섯 아흔여섯 아흔일곱 아흔여덟 아흔아홉',
    ];
    const attributives = [
      '한 두 세 네 다섯 여섯 일곱 여덟 아홉',
      '열 열한 열두 열세 열네 열다섯 열여섯 열일곱 열여덟 열아홉',
      '스무 스물한 스물두 스물세 스물네 스물다섯 스물여섯 스물일곱 스물여덟 스물아홉',
      '서른 서른한 서른두 서른세 서른네 서른다섯 서른여섯 서른일곱 서른여덟 서른아홉',
      '마흔 마흔한 마흔두 마흔세 마흔네 마흔다섯 마흔여섯 마흔일곱 마흔여덟 마흔아홉',
      '쉰 쉰한 쉰두 쉰세 쉰네 쉰다섯 쉰여섯 쉰일곱 쉰여덟 쉰아홉',
      '예순 예순한 예순두 예순세 예순네 예순다섯 예순여섯 예순일곱 예순여덟 예순아홉',
      '일흔 일흔한 일흔두 일흔세 일흔네 일흔다섯 일흔여섯 일흔일곱 일흔여덟 일흔아홉',
      '여든 여든한 여든두 여든세 여든네 여든다섯 여든여섯 여든일곱 여든여덟 여든아홉',
      '아흔 아흔한 아흔두 아흔세 아흔네 아흔다섯 아흔여섯 아흔일곱 아흔여덟 아흔아홉',
    ];

    Map<int, String> table(List<String> decades) => {
          for (var d = 0; d < decades.length; d++)
            for (final (i, word) in decades[d].split(' ').indexed)
              d * 10 + i + (d == 0 ? 1 : 0): word,
        };

    test('native cardinals 1-99', () {
      final expected = table(cardinals);
      expect(expected.length, 99);
      for (final MapEntry(key: n, value: word) in expected.entries) {
        expect(KoreanNumbers.nativeCardinal(n), word, reason: '$n');
      }
    });

    test('native attributives 1-99: 스무 only for 20, 스물한 for 21', () {
      final expected = table(attributives);
      expect(expected.length, 99);
      for (final MapEntry(key: n, value: word) in expected.entries) {
        expect(KoreanNumbers.nativeAttributive(n), word, reason: '$n');
      }
      expect(KoreanNumbers.nativeAttributive(8), '여덟');
    });

    test('native forms are 1-99 only', () {
      for (final f in [
        KoreanNumbers.nativeCardinal,
        KoreanNumbers.nativeAttributive,
      ]) {
        expect(() => f(0), throwsRangeError);
        expect(() => f(100), throwsRangeError);
      }
    });

    test('sino delegates to integerToWords', () {
      expect(KoreanNumbers.sino(3), '삼');
      expect(KoreanNumbers.sino(120000), '십이만');
      expect(KoreanNumbers.sino(100000000), '일억');
    });

    test('every month', () {
      const months = [
        '일월', '이월', '삼월', '사월', '오월', '유월', //
        '칠월', '팔월', '구월', '시월', '십일월', '십이월',
      ];
      for (var m = 1; m <= 12; m++) {
        expect(KoreanNumbers.sinoMonth(m), months[m - 1], reason: '$m');
      }
      expect(() => KoreanNumbers.sinoMonth(0), throwsRangeError);
      expect(() => KoreanNumbers.sinoMonth(13), throwsRangeError);
    });

    test('digit strings', () {
      expect(KoreanNumbers.digitString('010'), '공일공');
      expect(KoreanNumbers.digitString('1234'), '일이삼사');
      expect(KoreanNumbers.digitString('203', zero: '영'), '이영삼');
      expect(() => KoreanNumbers.digitString(''), throwsArgumentError);
      expect(() => KoreanNumbers.digitString('01-2'), throwsArgumentError);
    });

    test('native day counts', () {
      const days = [
        '하루', '이틀', '사흘', '나흘', '닷새', //
        '엿새', '이레', '여드레', '아흐레', '열흘',
      ];
      for (var n = 1; n <= 10; n++) {
        expect(KoreanNumbers.nativeDayCount(n), days[n - 1], reason: '$n');
      }
      expect(() => KoreanNumbers.nativeDayCount(11), throwsRangeError);
    });

    test('ordinals with 번째', () {
      const expected = {
        1: '첫 번째',
        2: '두 번째',
        3: '세 번째',
        11: '열한 번째',
        20: '스무 번째',
        21: '스물한 번째',
        99: '아흔아홉 번째',
        100: '백 번째',
        101: '백한 번째',
        200: '이백 번째',
      };
      for (final MapEntry(key: n, value: word) in expected.entries) {
        expect(KoreanNumbers.nativeOrdinal(n), word, reason: '$n');
      }
      expect(() => KoreanNumbers.nativeOrdinal(0), throwsRangeError);
    });

    test('archaic attributives', () {
      expect(KoreanNumbers.archaicAttributive(3, '달'), '석');
      expect(KoreanNumbers.archaicAttributive(4, '섬'), '넉');
      expect(KoreanNumbers.archaicAttributive(3, '돈'), '서');
      expect(KoreanNumbers.archaicAttributive(4, '말'), '너');
      expect(() => KoreanNumbers.archaicAttributive(5, '달'), throwsRangeError);
      expect(() => KoreanNumbers.archaicAttributive(3, '개'),
          throwsArgumentError);
    });
  });
}
