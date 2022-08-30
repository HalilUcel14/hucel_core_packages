import 'package:collection/collection.dart';

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

extension KeyPath on Map {
  Object? valueFor({required String keyPath}) {
    final keySplit = keyPath.split('.');
    final thisKey = keySplit.removeAt(0);
    final thisValue = this[thisKey];
    if (keySplit.isEmpty) {
      return thisValue;
    } else if (thisValue is Map) {
      return thisValue.valueFor(keyPath: keySplit.join('.'));
    }
    return null;
  }
}

extension ContainsDuplicateValues on Map {
  bool get containsDuplicateValues => {...values}.length != values.length;
}

extension Unique<K, V> on Map<K, V> {
  Map<K, V> unique() {
    Map<K, V> result = {};
    for (final value in {...values}) {
      final firstKey = keys.firstWhere((key) => this[key] == value);
      if (firstKey != null) {
        result[firstKey] = value;
      }
    }
    return result;
  }
}

extension UnorderedEquality<K, V> on Map<K, V> {
  bool isEqualTo(Map<K, V> other) =>
      const DeepCollectionEquality.unordered().equals(this, other);
}

extension DetailedWhere<K, V> on Map<K, V> {
  /// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/where-clause-on-map-in-dart/where-clause-on-map-in-dart.md
  Map<K, V> where(bool Function(K key, V value) f) => Map<K, V>.fromEntries(
      entries.where((element) => f(element.key, element.value)));
  Map<K, V> whereKey(bool Function(K key) f) =>
      {...where((key, value) => f(key))};
  Map<K, V> whereValue(bool Function(V value) f) =>
      {...where((key, value) => f(value))};
}
