Future<Iterable<T>> waitOn<T>(
  Iterable<Future<T>> futures,
  Function onError,
) async {
  List<T> result = [];
  for (final future in futures) {
    final value = await future.catchError(onError);
    result.add(value);
  }
  return result;
}

// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/handle-multiple-future-errors-in-dart/handle-multiple-future-errors-in-dart.md