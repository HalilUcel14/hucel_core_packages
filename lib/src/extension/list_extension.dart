import 'dart:math';

import 'package:flutter/material.dart';

extension ListExtension on List? {
  bool get isNotNullorEmpty {
    if (this is List) {
      return this!.isNotEmpty;
    } else {
      return false;
    }
  }

  bool get isNullOrEmpty => !isNotNullorEmpty;
}

extension RandomListed<T> on List<T> {
  // Herhangi bir listeden random eleman dönderir
  T get randomListData => this[Random().nextInt(length)];
}

extension ToNetworkImage<T extends String> on List<T> {
  List<Widget> toNetworkImages() => map((s) => Image.network(s)).toList();
}

extension Median<T extends num> on List<T> {
  double get median {
    switch (length) {
      case 0:
        return 0.0;
      case 1:
        return this[0].toDouble();

      default:
        final sorted = [...this]..sort();
        final middleIndex = length ~/ 2;
        if (length % 2 == 0) {
          return (sorted[middleIndex] + sorted[middleIndex - 1]) / 2.0;
        } else {
          return sorted[middleIndex].toDouble();
        }
    }
  }
}

extension Sum<E extends num> on List<E> {
  E get sum => reduce((value, element) => value + element as E);
}

// ------------------------------------------
extension Contains on List<String> {
  bool containsAny(Set<String> values) =>
      {...this}.lowered.intersection(values.lowered).isNotEmpty;
}

extension Lower on Set<String> {
  Set<String> get lowered => {...map((e) => e.toLowerCase())};
}
// ------------------------------------------

extension ToMap<T> on List<T> {
  Map<T, E> toMap<E>(E Function(T) f) => {for (var key in this) key: f(key)};

  /// final names = ['this','is','a'];
  /// final map = names.toMap( (s) => s.length );
  /// print = {this:4,is:2,a:1};
}

extension Equality<T extends Comparable> on List<T> {
  bool isEqualTo(List<T> other) {
    if (other.length != length) {
      return false;
    }
    for (var i = 0; i < length; i++) {
      if (other[i] != this[i]) {
        return false;
      }
    }
    return true;
  }
}

extension Sorted<T extends Comparable> on List<T> {
  int ascendingComparator<T extends Comparable>(T lhs, T rhs) =>
      lhs.compareTo(rhs);
  int descendingComparator<T extends Comparable>(T lhs, T rhs) =>
      rhs.compareTo(lhs);
  List<T> sorted({bool descending = false}) => descending
      ? ([...this]..sort(descendingComparator))
      : ([...this]..sort(ascendingComparator));
}

extension GoAround<T> on List<T> {
  T elementByGoingAround(int index) {
    final finalIndex = index >= length ? index.remainder(length) : index;
    return this[finalIndex];
  }
}

extension CompactMap<T> on List<T> {
  List<E> compactMap<E>(E? Function(T element) f) {
    Iterable<E> imp(E? Function(T element) f) sync* {
      for (final value in this) {
        final mapped = f(value);
        if (mapped != null) {
          yield mapped;
        }
      }
    }

    return imp(f).toList();
  }
}
