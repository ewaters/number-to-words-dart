/// Split up an integer into triplets (0-999, 1000-9999, etc).
List<int> integerToTriplets(int number) {
  final List<int> triplets = [];
  while (number > 0) {
    triplets.add(number % 1000);
    number = number ~/ 1000;
  }
  return triplets;
}

/// Makes first letter upper case.
String upperCaseFirstLetter(String input) {
  return input.substring(0, 1).toUpperCase() + input.substring(1);
}
