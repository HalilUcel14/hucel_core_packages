// ignore_for_file: unused_element

const _host = 'freecurrencyapi.net';
const _path = '/api/v2/latest';
const _apiKey = 'YOUR_API_KEY';
const _baseCurrency = 'sek';
const _params = {
  'apiKey': _apiKey,
  'base_currency': 'sek',
};

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/query-parameters-in-dart/query-parameters-in-dart.dart
void doThisQueryParametres() {
  // ignore: unused_local_variable
  final Uri url = Uri.https(_host, _path, _params);
}
