extension StreamFilter<T> on Stream<List<T>> {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/filter-on-streamlistt-in-dart/filter-on-streamlistt-in-dart.md
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}

bool isEven(num value) => value % 2 == 0;
bool isOdd(num value) => value % 2 != 0;

extension EvenOdd<E extends num> on Stream<List<E>> {
  Stream<List<E>> get evenNumber => filter(isEven);
  Stream<List<E>> get oddNumber => filter(isOdd);
}
