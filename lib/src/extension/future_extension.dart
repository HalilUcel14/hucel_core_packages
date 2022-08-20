import 'package:flutter/material.dart';

extension FutureExtension on Future {
  Widget toBuild<T>({
    required Widget Function(T? data) onSuccess,
    required Widget loadingWidget,
    required Widget notFoundWidget,
    required Widget onError,
    dynamic data,
  }) {
    return FutureBuilder<T>(
      future: this as Future<T>?,
      initialData: data,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return loadingWidget;
          case ConnectionState.done:
            if (snapshot.hasData) return onSuccess(snapshot.data);
            return onError;
          default:
            return notFoundWidget;
        }
      },
    );
  }
}

extension EmptyOnError<E> on Future<List<Iterable<E>>> {
  Future<List<Iterable<E>>> emptyOnError() => catchError(
        (_, __) => List<Iterable<E>>.empty(),
      );
}

extension OnError<T> on Future<T> {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/future-error-handling-in-dart/future-error-handling-in-dart.dart
  Future<T> onErrorJustReturn(T value) => catchError((_) => value);
}

extension Unwrap<T> on Future<T?> {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/future-unwrap-in-flutter/future-unwrap-in-flutter.dart
  Future<T> unwrap() => then(
        (value) => value != null ? Future<T>.value(value) : Future.any([]),
      );
}
