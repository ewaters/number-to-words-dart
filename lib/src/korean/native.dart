import 'package:number_to_words/src/korean/convert.dart';

/// Every Korean number reading the language needs beyond Sino cardinals:
/// native cardinals and their attributive (before-a-counter) forms, month
/// names, digit strings, native day counts, ordinals and the archaic 3 and 4
/// used with a few measure words.
///
/// Out-of-range values throw [RangeError], so a bad table row in a caller
/// fails loudly instead of producing a wrong word.
class KoreanNumbers {
  KoreanNumbers._();

  static final Korean _sino = Korean();

  static const List<String> _sinoDigits = [
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

  static const List<String> _nativeUnits = [
    '',
    '하나',
    '둘',
    '셋',
    '넷',
    '다섯',
    '여섯',
    '일곱',
    '여덟',
    '아홉',
  ];

  /// The units that shorten before a counter: 하나 → 한, 둘 → 두, 셋 → 세,
  /// 넷 → 네. From 다섯 up the forms are the same.
  static const List<String> _nativeAttributiveUnits = [
    '',
    '한',
    '두',
    '세',
    '네',
    '다섯',
    '여섯',
    '일곱',
    '여덟',
    '아홉',
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

  static const List<String> _dayCounts = [
    '',
    '하루',
    '이틀',
    '사흘',
    '나흘',
    '닷새',
    '엿새',
    '이레',
    '여드레',
    '아흐레',
    '열흘',
  ];

  /// Measure words that take 서 (3) and 너 (4).
  static const Set<String> seoNeoCounters = {'돈', '말', '발', '푼'};

  /// Measure words that take 석 (3) and 넉 (4).
  static const Set<String> seokNeokCounters = {'냥', '되', '섬', '자', '달'};

  /// The Sino-Korean cardinal: 삼, 십이만, 일억. Delegates to the
  /// `integerToWords` converter, so 0 is 영.
  static String sino(int n) => _sino.integerToWords(n);

  /// The native cardinal, as said alone: 하나, 스물, 서른넷.
  static String nativeCardinal(int n) {
    _checkRange(n, 1, 99, 'nativeCardinal');
    return '${_nativeTens[n ~/ 10]}${_nativeUnits[n % 10]}';
  }

  /// The native form before a counter: 한, 스무, 스물한, 서른네.
  ///
  /// 스물 shortens to 스무 only for exactly 20; 21 is 스물한.
  static String nativeAttributive(int n) {
    _checkRange(n, 1, 99, 'nativeAttributive');
    if (n == 20) return '스무';
    return '${_nativeTens[n ~/ 10]}${_nativeAttributiveUnits[n % 10]}';
  }

  /// The month name: 일월 … 유월 … 시월 … 십이월.
  static String sinoMonth(int m) {
    _checkRange(m, 1, 12, 'sinoMonth');
    if (m == 6) return '유월';
    if (m == 10) return '시월';
    return '${sino(m)}월';
  }

  /// [digits] read one digit at a time, as for phone, room or bus numbers:
  /// 공일공. [zero] is 공 by default; pass 영 for the other reading.
  static String digitString(String digits, {String zero = '공'}) {
    if (digits.isEmpty) {
      throw ArgumentError.value(digits, 'digits', 'must not be empty');
    }
    final sb = StringBuffer();
    for (final unit in digits.codeUnits) {
      final d = unit - 0x30;
      if (d < 0 || d > 9) {
        throw ArgumentError.value(digits, 'digits', 'must be ASCII digits');
      }
      sb.write(d == 0 ? zero : _sinoDigits[d]);
    }
    return sb.toString();
  }

  /// The native count of days: 하루, 이틀, 사흘 … 열흘.
  static String nativeDayCount(int n) {
    _checkRange(n, 1, 10, 'nativeDayCount');
    return _dayCounts[n];
  }

  /// The ordinal with 번째: 첫 번째, 두 번째, 스물한 번째, 백 번째.
  ///
  /// 1st is 첫, but 11th and 21st keep 한 (열한 번째). From 100 the hundreds
  /// and above are Sino and the last two digits keep the native form
  /// (백한 번째).
  static String nativeOrdinal(int n) {
    if (n < 1) throw RangeError.range(n, 1, null, 'n', 'nativeOrdinal');
    return '${_ordinalStem(n)} 번째';
  }

  /// The number part of [nativeOrdinal], without 번째: 첫, 스물한, 백한.
  static String _ordinalStem(int n) {
    if (n == 1) return '첫';
    if (n < 100) return nativeAttributive(n);
    final tail = n % 100;
    final head = sino(n - tail);
    return tail == 0 ? head : '$head${nativeAttributive(tail)}';
  }

  /// The archaic 3 or 4 used with some measure words: 석 달, 넉 섬, 서 돈,
  /// 너 말. Throws [ArgumentError] for a [counter] that takes neither.
  static String archaicAttributive(int n, String counter) {
    _checkRange(n, 3, 4, 'archaicAttributive');
    if (seokNeokCounters.contains(counter)) return n == 3 ? '석' : '넉';
    if (seoNeoCounters.contains(counter)) return n == 3 ? '서' : '너';
    throw ArgumentError.value(
        counter, 'counter', 'takes no archaic form of $n');
  }

  static void _checkRange(int n, int min, int max, String name) {
    if (n < min || n > max) throw RangeError.range(n, min, max, 'n', name);
  }
}
