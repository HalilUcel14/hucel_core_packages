import 'dart:convert';

import 'package:http/http.dart' show get;

extension DownloadBody on Uri {
  Future<String> downloadBody() async {
    final response = await get(this);
    return response.body;
  }
}

class JsonFromUrl {
  const JsonFromUrl();

  Future<List<Map<String, dynamic>>> call(Uri uri) async {
    final body = await uri.downloadBody();
    final List<Map<String, dynamic>> json =
        jsonDecode(body).cast<Map<String, dynamic>>().toList();
    return json;
  }
}

const jsonFromUrl = JsonFromUrl();
