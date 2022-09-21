import 'package:async/async.dart' show StreamGroup;
import 'package:hucel_core/src/function/exception_mode.dart';

extension StreamFilter<T> on Stream<List<T>> {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/filter-on-streamlistt-in-dart/filter-on-streamlistt-in-dart.md
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}

bool isEven(num value) => value % 2 == 0;
bool isOdd(num value) => value % 2 != 0;

extension EvenOdd<E extends num> on Stream<List<E>> {
  Stream<List<E>> get evenNumber => filter(isEven);
  Stream<List<E>> get oddNumber => filter(isOdd);
}

extension StreamDrain on Stream {
  Stream<DateTime> dateTimeWithoutError() async* {
    yield DateTime.now();
  }

  Stream<DateTime> dateTimeWithError() async* {
    yield DateTime.now();
    exceptionMode('An exception occurred');
  }
}

extension StartWith<T> on Stream<T> {
  Stream<T> startWith(T value) => StreamGroup.merge([
        this,
        Stream<T>.value(value),
      ]);
}

extension UnWrapStream<T> on Stream<T?> {
  Stream<T> unWrap() => where((event) => event != null).cast();
}
