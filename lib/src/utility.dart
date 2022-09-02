/// Split up an integer into triplets (0-999, 1000-9999, etc).
List<int> integerToTriplets(int number) {
  final List<int> triplets = [];
  while (number > 0) {
    triplets.add(number % 1000);
    number = number ~/ 1000;
  }
  return triplets;
}
