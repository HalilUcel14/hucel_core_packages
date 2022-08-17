import 'package:rxdart/rxdart.dart';

extension Unwrap<T> on Subject<T?> {
  Stream<T> unwrap() => switchMap(
        (value) {
          if (value == null) {
            return Rx.never();
          } else {
            return Stream<T>.value(value);
          }
        },
      );
}
