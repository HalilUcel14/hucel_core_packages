import 'dart:developer' as devtools show log;
import 'dart:io';

extension Log on Object {
  void log() => devtools.log(toString());
}

extension ToInt on Object {
  int toInt() {
    final list = [
      if (this is Iterable<Object>)
        ...(List.of(this as Iterable<Object>))
      else if (this is int)
        this as int
      else
        (double.tryParse(toString()) ?? 0.0).round()
    ];
    return list
        .map((e) => (double.tryParse(e.toString()) ?? 0.0).round())
        .reduce((value, element) => value + element);
  }
}

extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) =>
      HttpClient().getUrl(Uri.parse(url)).then((value) => value.close());
}

extension CapTitle on Object {
  /// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/title-on-object-in-dart/title-on-object-in-dart.md
  String get capitalizedTitle {
    String str;
    if (this is Enum) {
      str = (this as Enum).name;
    } else {
      str = toString();
    }
    return str[0].toUpperCase() + str.substring(1);
  }
}
