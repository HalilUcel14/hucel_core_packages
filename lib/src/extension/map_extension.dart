extension Filter<K, V> on Map<K, V> {
  //  https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/filter-on-map-in-dart/filter-on-map-in-dart.md
  Iterable<MapEntry<K, V>> filter(
    bool Function(MapEntry<K, V> entry) f,
  ) sync* {
    for (final entry in entries) {
      if (f(entry)) {
        yield entry;
      }
    }
  }
}

extension DetailedMap<K, V> on Map<K, V> {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/key-and-value-mapping-in-dart/key-and-value-mapping-in-dart.md
  Map<R, V> mappedKeys<R>(R Function(K) f) =>
      map((key, value) => MapEntry(f(key), value));

  Map<K, R> mappedValues<R>(R Function(V) f) =>
      map((key, value) => MapEntry(key, f(value)));
}

extension Merge<K, V> on Map<K, V> {
  //https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/merging-maps-in-dart/merging-maps-in-dart.md
  Map<K, V> operator |(Map<K, V> other) => {...this}..addEntries(other.entries);
}
