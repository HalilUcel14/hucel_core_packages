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
