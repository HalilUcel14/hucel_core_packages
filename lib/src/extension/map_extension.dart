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
