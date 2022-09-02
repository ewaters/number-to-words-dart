import 'package:number_to_words/number_to_words.dart';
import 'package:test/test.dart';

void main() {
  test('English integer to short ordinal', () {
    Map<int, String> examples = {
      1: '1st',
      2: '2nd',
      3: '3rd',
      6: '6th',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToOrdinalShort(pair.key, 'en'),
          equals(pair.value),
          reason: '${pair.key}');
    }
  });
}
