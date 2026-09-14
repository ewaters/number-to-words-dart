import 'package:number_to_words/src/convert_interface.dart';
import 'package:number_to_words/src/korean/native.dart';

/// Korean converter for Sino-Korean numbers, ordinals, and fractions.
class Korean extends NumberToWordInterface {
  @override
  Set<String> get locales => {'ko', 'ko-kr', 'ko_KR', 'kor', 'korean'};

  static const List<String> _digits = [
    '',
    '일',
    '이',
    '삼',
    '사',
    '오',
    '육',
    '칠',
    '팔',
    '구',
  ];

  static const List<String> _smallUnits = ['', '십', '백', '천'];

  static const List<String> _bigUnits = [
    '',
    '만',
    '억',
    '조',
    '경',
  ];

  static const List<String> _nativeOrdinals1To10 = [
    '',
    '첫째',
    '둘째',
    '셋째',
    '넷째',
    '다섯째',
    '여섯째',
    '일곱째',
    '여덟째',
    '아홉째',
    '열째',
  ];

  static const List<String> _nativeTens = [
    '',
    '열',
    '스물',
    '서른',
    '마흔',
    '쉰',
    '예순',
    '일흔',
    '여든',
    '아흔',
  ];

  @override
  String integerToWords(int number) {
    if (number == 0) return '영';
    if (number < 0) {
      return '마이너스 ${integerToWords(-number)}';
    }

    List<String> bigParts = [];
    int n = number;
    int unitIndex = 0;

    while (n > 0) {
      final chunk = n % 10000;
      n = n ~/ 10000;

      if (chunk > 0) {
        final chunkStr = _convertChunk(chunk, unitIndex);
        final unit = _bigUnits[unitIndex];
        if (unit.isEmpty) {
          bigParts.add(chunkStr);
        } else {
          bigParts.add('$chunkStr$unit');
        }
      }
      unitIndex++;
    }

    return bigParts.reversed.join(' ');
  }

  /// Convert a 4-digit chunk (1 to 9999).
  static String _convertChunk(int chunk, int bigUnitIndex) {
    // Special case for 1 at big unit:
    // For 10,000 (1 만), in general counting it is "만" rather than "일만",
    // but for 억, 조, etc. (e.g. 100,000,000) it is "일억", "일조".
    if (chunk == 1 && bigUnitIndex == 1) {
      return '';
    }
    if (chunk == 1 && bigUnitIndex > 1) {
      return '일';
    }

    final StringBuffer sb = StringBuffer();
    int temp = chunk;
    for (int i = 3; i >= 0; i--) {
      final divisor = _pow10(i);
      final digit = temp ~/ divisor;
      temp = temp % divisor;

      if (digit > 0) {
        if (i == 0) {
          sb.write(_digits[digit]);
        } else {
          // In Korean, 10 is 십 (not 일십), 100 is 백 (not 일백), 1000 is 천 (not 일천).
          if (digit > 1) {
            sb.write(_digits[digit]);
          }
          sb.write(_smallUnits[i]);
        }
      }
    }
    return sb.toString();
  }

  static int _pow10(int exp) {
    int res = 1;
    for (int i = 0; i < exp; i++) {
      res *= 10;
    }
    return res;
  }

  @override
  String integerToOrdinal(int number) {
    assertValidOrdinal(number);
    if (number <= 10) {
      return _nativeOrdinals1To10[number];
    }
    if (number < 100) {
      final tens = number ~/ 10;
      final ones = number % 10;
      if (ones == 0) {
        if (tens == 2) return '스무째';
        return '${_nativeTens[tens]}째';
      }
      final tensPrefix = tens == 2 ? '스물' : _nativeTens[tens];
      if (ones == 1) return '$tensPrefix한째';
      if (ones == 2) return '$tensPrefix두째';
      if (ones == 3) return '$tensPrefix셋째';
      if (ones == 4) return '$tensPrefix넷째';
      return '$tensPrefix${_nativeOrdinals1To10[ones]}';
    }
    // From 100, Sino hundreds with the native ordinal tail: 백 번째, 백한 번째.
    return KoreanNumbers.nativeOrdinal(number);
  }

  @override
  String integerToOrdinalShort(int number) {
    assertValidOrdinal(number);
    return '$number번째';
  }

  @override
  String fractionToWords(Fraction fraction) {
    assertValidFraction(fraction);
    final denomStr = integerToWords(fraction.denominator);
    final numStr = integerToWords(fraction.numerator);
    return '$denomStr분의 $numStr';
  }
}
