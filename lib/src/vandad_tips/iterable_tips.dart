extension RemoveAll<E> on Iterable<E> {
  Iterable<E> operator -(Iterable<E> other) =>
      where((element) => !other.contains(element));
}
