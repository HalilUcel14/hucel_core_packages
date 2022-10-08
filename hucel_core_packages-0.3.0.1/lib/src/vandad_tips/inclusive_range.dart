import 'dart:collection' show IterableMixin;
import 'package:hucel_core/hucel_core.dart';

class InclusiveRange with IterableMixin<int> {
  late Iterable<int> _values;

  InclusiveRange(int first, [int? second, int? third]) {
    if ((second ?? third) == null) {
      _values = 0.toIncluding(first);
    } else if (second != null) {
      _values = first.toIncluding(second, step: third ?? 1);
    }
  }

  @override
  Iterator<int> get iterator => _values.iterator;
}

/// final range = InclusiveRange(10,20,2);
/// print(range) // (10,12,14,16,18,20)
/// 10 dan 20 ye 2 2 2 gider....
