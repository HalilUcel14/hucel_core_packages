import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

mixin CanDownloadAndParseJson {
  Uri get uri;
  Future<dynamic> downloadJson() async {
    final call = await http.get(uri);
    return jsonDecode(call.body);
  }

  //
  Future<List<Map<String, dynamic>>> jsonArray() async {
    final json = await downloadJson();
    return json.cast<Map<String, dynamic>>();
  }

  //
  Future<Map<String, dynamic>> jsonObject() async {
    return await downloadJson();
  }
}

// Test it

class Todos with CanDownloadAndParseJson {
  const Todos();
  @override
  Uri get uri => Uri.https('authority', 'unencodedPath');
}

class Todo with CanDownloadAndParseJson {
  final int id;
  Todo(this.id);
  @override
  Uri get uri => Uri.https('authority', 'unencodedPath $id');
}
