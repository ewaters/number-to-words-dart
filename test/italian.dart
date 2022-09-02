import 'package:number_to_words/number_to_words.dart';
import 'package:test/test.dart';

void main() {
  test('Italian integer to words', () {
    Map<int, String> examples = {
      0: 'zero',
      10: 'dieci',
      123: 'cento ventitre',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToWords(pair.key, 'it'), equals(pair.value),
          reason: '${pair.key}');
    }
  });
}
