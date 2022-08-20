import 'package:flutter/cupertino.dart';

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
