import 'dart:io' show HttpClient, HttpClientRequest, HttpClientResponse;

class Client {
  final client = HttpClient();

  Future<HttpClientResponse> _responseFrom(
    Future<HttpClientRequest> Function(Uri) toCall, {
    required Uri url,
    required Duration timeout,
  }) =>
      toCall(url).then((value) => value.close()).timeout(timeout);

  Future<HttpClientResponse> get(Uri url, {required Duration timeout}) =>
      _responseFrom(client.getUrl, url: url, timeout: timeout);
  Future<HttpClientResponse> post(Uri url, {required Duration timeout}) =>
      _responseFrom(client.postUrl, url: url, timeout: timeout);
}
