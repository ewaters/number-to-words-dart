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

String pluralize(String singular) {
  final base = singular.substring(0, singular.length - 1);
  if (singular.endsWith('o')) {
    return '${base}i';
  }
  if (singular.endsWith('a')) {
    return '${base}e';
  }
  throw 'No known way to pluralize "$singular"';
}
