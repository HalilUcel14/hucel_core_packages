import 'dart:convert';

import 'package:hucel_core/hucel_core.dart';

mixin CanMakeGetCall {
  String get url;

  Future<String> getString() =>
      getUrl(url).then((response) => response.transform(utf8.decoder).join());
}
