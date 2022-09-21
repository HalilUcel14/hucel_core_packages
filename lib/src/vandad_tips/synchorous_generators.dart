import 'dart:math' show Random;

Iterable<int> randomNumbers({
  int count = 2,
  int max = 1 << 32,
}) sync* {
  int i = 0;
  Random rnd;
  try {
    rnd = Random.secure();
  } on UnsupportedError {
    rnd = Random();
  }
  while (i++ < count) {
    yield rnd.nextInt(max);
  }
}
