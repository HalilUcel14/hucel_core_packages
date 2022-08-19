extension InLineAdd<T> on Iterable<T> {
  /// const Iterable<int> value = [10,20,30];
  ///
  /// (values + 40).log = 10,20,30,40;
  /// (values + [40,50]).log = 10,20,30,40,50
  Iterable<T> operator +(T other) => followedBy([other]);
  Iterable<T> operator &(Iterable<T> other) => followedBy(other);
}
