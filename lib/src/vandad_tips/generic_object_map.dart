extension MapIfOfType<T> on T {
  R? mapIfOnType<E, R>(R Function(E) f) {
    final self = this;
    if (self is E) {
      return f(self);
    } else {
      return null;
    }
  }
}
