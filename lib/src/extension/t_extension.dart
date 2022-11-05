extension OrDefault<T> on T? {
  T get orDefault {
    final value = this;
    if (value == null) {
      return {
        int: 0,
        String: '',
        double: 0.0,
        Map: {},
        List: [],
        bool: false,
      }[T] as T;
    } else {
      return value;
    }
  }
}

extension WithDelay<T> on T {
  Future<T> toFuture([Duration? delay]) =>
      delay != null ? Future.delayed(delay, () => this) : Future.value(this);
}

extension FlatMap<T> on T? {
  E? flatMap<E>(E? Function(T value) f) {
    if (this != null) {
      return f(this!);
    } else {
      return null;
    }
  }
}

extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}
