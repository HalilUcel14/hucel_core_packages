import 'dart:io';

Future<bool> doesRedirect(String url) => HttpClient()
    .headUrl(Uri.parse(url))
    .then((value) => value..followRedirects = false)
    .then((value) => value.close())
    .then((value) => value.statusCode)
    .then((value) => [301, 302, 303, 307, 308].contains(value));
