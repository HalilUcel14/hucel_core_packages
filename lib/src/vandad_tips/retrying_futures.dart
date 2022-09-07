import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

import 'package:hucel_core/src/function/exception_mode.dart';

typedef JSON = Map<String, dynamic>;

Future<JSON> downloadAndParseJson(Uri uri) async {
  try {
    exceptionMode('downloading and parsing json...');
    final response = await http.get(uri);
    return jsonDecode(response.body);
  } catch (e) {
    exceptionMode('error in json parsing');
    rethrow;
  }
}

final uri = Uri.https('authority', 'unencodedPath');

Future<F> retry<F>(
  Future<F> Function() future, {
  int maxCount = 5,
  Duration delay = Duration.zero,
}) async {
  try {
    return await future();
  } catch (e) {
    if (maxCount > 1) {
      return Future.delayed(delay).then(
        (value) => retry(
          future,
          maxCount: maxCount - 1,
          delay: delay,
        ),
      );
    } else {
      rethrow;
    }
  }
}
