import 'package:flutter/material.dart';

import '../../hucel_core.dart';

extension InLineAdd<T> on Iterable<T> {
  /// const Iterable<int> value = [10,20,30];
  ///
  /// (values + 40).log = 10,20,30,40;
  /// (values + [40,50]).log = 10,20,30,40,50
  Iterable<T> operator +(T other) => followedBy([other]);
  Iterable<T> operator &(Iterable<T> other) => followedBy(other);
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandedEqually() => map(
        (e) => Expanded(
          child: e,
          flex: 1,
        ),
      );
}

extension Flatten on Iterable<bool> {
  bool flatten() => fold(
        true,
        (lhs, rhs) => lhs && rhs,
      );
}

extension OptionalFlattend<T> on Iterable<List<T>?> {
  Iterable<T> flattened() => expand((e) => e ?? []);
}

extension Flattend<T> on Iterable<List<T>> {
  Iterable<T> flattened() => expand((e) => e);
}

extension CompactMap<T> on Iterable<T?> {
  //https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/iterable-compactmap-in-dart/iterable-compactmap-in-dart.md
  Iterable<T> compactMap<E>([E? Function(T?)? transform]) =>
      map(transform ?? (e) => e).where((element) => element != null).cast();
}

extension AddRemoveItems<T> on Iterable<T> {
  Iterable<T> operator +(T other) => followedBy([other]);
  Iterable<T> operator -(T other) => where((element) => element != other);
}

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

extension ToListView<T> on Iterable<T> {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/iterable-to-listview-in-flutter/iterable-to-listview-in-flutter.md
  Widget toListView() => IterableListView(
        iterable: this,
      );
}

extension IterableWithIndex<T> on Iterable<T> {
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) =>
      Iterable.generate(length).map((e) => f(e, elementAt(e)));
}

extension MapToList<T> on Iterable<T> {
  List<E> mapList<E>(E Function(T) toElement) => map(toElement).toList();
}
