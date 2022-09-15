import 'dart:io' show HandshakeException, HttpClient;

Future<bool> isSecuredWithValidCert(String uriString) async {
  final uri = Uri.parse(uriString);
  final client = HttpClient();
  try {
    await client.headUrl(uri).then((value) => value.close());
    return true;
  } on HandshakeException {
    return false;
  }
}
