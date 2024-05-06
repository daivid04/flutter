import 'dart:math';

List<int> listRandom(int max) {
  Set<int> list = {};
  Random random = Random();
  while (list.length < max) {
    list.add(random.nextInt(max));
  }
  return list.toList();
}
