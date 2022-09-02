bool endsInVowel(String text) => RegExp(r'[aeiou]$').hasMatch(text);

bool startsWithVowel(String text) => RegExp('^[aeiou]').hasMatch(text);

// Apocope: the loss of a word-final vowel.
String joinWithApocope(String left, String right) {
  // 'tre' is written with an accent when joined with other words.
  if (right == 'tre') {
    right = 'tré';
  }
  if (endsInVowel(left) && startsWithVowel(right)) {
    return left.substring(0, left.length - 1) + right;
  }
  if (left.endsWith('é')) {
    left = left.substring(0, left.length - 1) + 'e';
  }
  return left + right;
}
