import 'dart:math';

extension NumberExtension on int {
  int get randomValue => Random().nextInt(this);
}
