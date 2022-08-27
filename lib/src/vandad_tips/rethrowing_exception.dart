import 'package:hucel_core/hucel_core.dart';

Iterable<int?> intsFrom(List<dynamic> list) sync* {
  for (var item in list) {
    try {
      final value = int.parse(item.toString());
      yield value;
    } on FormatException {
      yield null;
    } catch (e) {
      'unexpected error, underlying error'.exceptionMode(e);
    }
  }
}
