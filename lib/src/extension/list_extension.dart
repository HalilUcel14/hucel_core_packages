// ignore_for_file: avoid_shadowing_type_parameters, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

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

extension CompactListMap<T> on List<T> {
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

extension IsEqualToIgnoringOrdering<T> on List<T> {
  bool isEqualToIgnoringOrdering(List<T> other) =>
      length == other.length &&
      {...this}.intersection({...other}).length == length;
}

//https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/infinite-arrays-in-dart/infinite-arrays-in-dart.md
extension GoingAround<T> on List<T> {
  T elementByGoingAround(int index) {
    final finalIndex = index >= length ? index.remainder(length) : index;
    return this[finalIndex];
  }
}

extension Duplicates<T> on List<T> {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/managing-duplicates-in-list-t-in-dart/managing-duplicates-in-list-t-in-dart.md
  void addAllByAvoidingDuplicates(Iterable<T> values) => replaceRange(
        0,
        length,
        {
          ...([...this] + [...values])
        },
      );
  int get numberOfDuplicates => length - {...this}.length;

  bool get containsDuplicates => numberOfDuplicates > 0;

  List<T> get uniques => [
        ...{...this}
      ];
  void removeDuplicates() => replaceRange(0, length, uniques);

  List<T> get duplicates => [
        for (var i = 0; i < length; i++)
          {
            [...this].skip(i + 1).contains(this[i]) ? this[i] : null
          }
      ].whereType<T>().toList();
}

extension MinMax<T extends num> on List<T> {
  T get min => _sorted.first;
  T get max => _sorted.last;

  List<T> get _sorted => [...this]..sort();
}

extension OddEvenSort on List<int> {
  void oddEvenSort() {
    var isSorted = false;
    bool _sort({int fromIndex = 0}) {
      var isSorted = true;
      for (var i = fromIndex; i < length - 1; i += 2) {
        if (this[i] > this[i + 1]) {
          //this.swap(i, i + 1);
          isSorted = false;
        }
      }
      return isSorted;
    }

    while (!isSorted) {
      isSorted = true;
      isSorted = _sort(fromIndex: 1);
      isSorted = _sort();
    }
  }
}

///https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/removing-duplicate-strings-in-lists-in-dart/removing-duplicate-strings-in-lists-in-dart.md
extension RemoveDuplicates on List<String> {
  List<String> removeDuplicates() {
    final lowered = [...map((e) => e.toLowerCase())];
    return [
      for (var keyValue in lowered.asMap().entries)
        if (lowered.lastIndexOf(keyValue.value) == keyValue.key)
          this[keyValue.key]
    ];
  }
}

extension DuplicateRemoval<T> on List<T> {
  List<T> get byRemovingDuplicates => [
        ...{...this}
      ];
}

extension RotatingList<T> on List<T> {
  int _rotationTimes(int places) {
    if (isEmpty) {
      return 0;
    }
    if (places == 0) {
      throw ArgumentError('places should be more than 0');
    }
    return places % length;
  }

  List<T> rotatedRight(int places) {
    final times = _rotationTimes(places);
    if (times == 0) {
      return this;
    } else {
      final cutOff = length - times;
      return sublist(cutOff)..addAll(sublist(0, cutOff));
    }
  }

  List<T> rotatedLeft(int places) {
    final times = _rotationTimes(places);
    if (times == 0) {
      return this;
    } else {
      final cutOff = length - times;
      return sublist(times)..addAll(sublist(0, times));
    }
  }
}

extension Splice<T> on List<T> {
  Iterable<T> splice(int start, int count, [List<T>? insert]) {
    final result = [...getRange(start, start + count)];
    replaceRange(start, start + count, insert ?? []);
    return result;
  }
}

extension SplitByLengthList on String {
  Iterable<String> splitByLengthList(int len, {String filler = '0'}) sync* {
    final missingFromLength =
        length % len == 0 ? 0 : len - (characters.length % len);
    final expectedLength = length + missingFromLength;
    final src = padLeft(expectedLength, filler);
    final chars = src.characters;
    for (var i = 0; i < chars.length; i += len) {
      yield chars.getRange(i, i + len).toString();
    }
  }
}

extension SwapValues on List<int> {
  void swap(int a, int b) {
    if (a == b) {
      'a and b should not be the same value'.exceptionMode('');
    }
    RangeError.checkValidIndex(a, this);
    RangeError.checkValidIndex(b, this);
    this[a] ^= this[b];
    this[b] ^= this[a];
    this[a] ^= this[b];
  }
}
