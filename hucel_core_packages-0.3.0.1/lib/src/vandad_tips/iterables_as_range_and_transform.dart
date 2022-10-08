import 'dart:math' show Random;

class RandomNumberGenerator {
  late Random _random;
  RandomNumberGenerator() {
    try {
      _random = Random.secure();
    } catch (e) {
      _random = Random();
    }
  }
  int next({int max = 1 << 32}) => _random.nextInt(max);
}

Iterable<T> perform<T>(T Function() f, {int times = 10}) =>
    Iterable.generate(times, (_) => f());
