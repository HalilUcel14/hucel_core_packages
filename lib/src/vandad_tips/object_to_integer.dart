enum ToIntStrategy { round, floor, ceil }

typedef ToIntOnErrorHandler = int Function(Object e);

// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/object-to-integer-in-dart/object-to-integer-in-dart.md
extension ToIntObject on Object {
  int toInteger({
    ToIntStrategy strategy = ToIntStrategy.round,
    ToIntOnErrorHandler? onError,
  }) {
    try {
      final doubleValue = double.parse(toString());
      switch (strategy) {
        case ToIntStrategy.round:
          return doubleValue.round();
        case ToIntStrategy.floor:
          return doubleValue.floor();
        case ToIntStrategy.ceil:
          return doubleValue.ceil();
      }
    } catch (e) {
      if (onError != null) {
        return onError(e);
      } else {
        return -1;
      }
    }
  }
}
