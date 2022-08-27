import 'package:hucel_core/hucel_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

typedef JSON = Map<String, dynamic>;

Future<JSON> downloadAndParseJson(Uri uri) async {
  try {
    'downloading and parsing json...'.printDebugMode;
    final response = await http.get(uri);
    return jsonDecode(response.body);
  } catch (e) {
    'error in json parsing'.exceptionMode(e);
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
