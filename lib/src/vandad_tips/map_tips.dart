extension AddOperator<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) => {...this}..addAll(other);
}
