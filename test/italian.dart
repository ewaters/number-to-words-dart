import 'package:number_to_words/number_to_words.dart';
import 'package:test/test.dart';

void main() {
  test('Italian integer to words', () {
    Map<int, String> examples = {
      0: 'zero',
      10: 'dieci',
      11: 'undici',
      21: 'ventuno',
      22: 'ventidue',
      28: 'ventotto',
      33: 'trentatré',
      123: 'centoventitré',
      1000: 'mille',
      2004: 'duemilaquattro',
      2345: 'duemilatrecentoquarantacinque',
      600002: 'seicentomiladue',
      765200: 'settecentosessantacinquemila duecento',
      1000000: 'un milione',
      2000000: 'due milioni',
      19002039: 'diciannove milioni duemilatrentanove',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToWords(pair.key, 'it'), equals(pair.value),
          reason: '${pair.key}');
    }
  });

  test('Italian integer to ordinal', () {
    Map<int, String> examples = {
      6: 'sesto',
      10: 'decimo',
      20: 'ventesimo',
      21: 'ventunesimo',
      43: 'quarantatreesimo',
      235: 'duecentotrentacinquesimo',
    };
    for (final pair in examples.entries) {
      expect(NumberToWords.integerToOrdinal(pair.key, 'it'), equals(pair.value),
          reason: '${pair.key}');
    }
  });
}
