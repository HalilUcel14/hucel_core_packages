import 'dart:math';

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
