import 'dart:io' show HttpClient;

Future<bool> doesWebsiteExist(Uri uri) => HttpClient()
    .headUrl(uri)
    .then((value) => value.close())
    .then((value) => true)
    .onError((error, stackTrace) => false);
