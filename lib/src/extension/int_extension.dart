import 'dart:math';
import 'package:hucel_core/hucel_core.dart';

extension NumberExtension on int {
  int get randomValue => Random().nextInt(this);
}

extension Range on int {
  List<int> toIncluding(int max, {int step = 1}) =>
      [for (int i = this; i <= max; i += step) i];
}

extension To on int {
  //https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/integer-range-extension-in-dart/integer-range-extension-in-dart.md
  Iterable<int> to(int other, [bool inclusive = true]) => other > this
      ? [for (int i = this; i < other; i++) i, if (inclusive) other]
      : [for (int i = this; i > other; i--) i, if (inclusive) other];
}

extension ToBinary on int {
  //https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/integer-to-binary-in-dart/integer-to-binary-in-dart.md
  String toBinary(
    int len, {
    int separateAtLength = 4,
    String separator = ',',
  }) =>
      toRadixString(2)
          .padLeft(len, '0')
          .splitByLength(separateAtLength)
          .join(separator);
}
