import 'dart:math';

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/paginated-lists-in-dart/paginated-lists-in-dart.md
class PaginatedList<T> extends Iterable {
  final List<List<T>> list;
  PaginatedList({required List<T> input, required int itemsPerPage})
      : list = [
          for (var i = 0; i < input.length; i += itemsPerPage)
            input.getRange(i, min(input.length, i + itemsPerPage)).toList()
        ];

  @override
  Iterator get iterator => list.iterator;
}
