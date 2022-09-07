import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_core/src/function/exception_mode.dart';

Iterable<int?> intsFrom(List<dynamic> list) sync* {
  for (var item in list) {
    try {
      final value = int.parse(item.toString());
      yield value;
    } on FormatException {
      yield null;
    } catch (e) {
      exceptionMode('unexpected error, underlying error');
    }
  }
}
