import 'package:flutter/foundation.dart';

void exceptionMode(Object? e) {
  if (kDebugMode) {
    print('$e');
    throw Exception('$e');
  }
}
