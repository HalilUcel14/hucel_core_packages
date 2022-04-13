enum RequestType {
  GET,
  POST,
  DELETE,
  PUT,
}

extension NetworkTypeExtension on RequestType {
  /// [RequestType] convert to string value.
  String get stringValue {
    switch (this) {
      case RequestType.GET:
        return 'GET';
      case RequestType.POST:
        return 'POST';
      case RequestType.DELETE:
        return 'DELETE';
      case RequestType.PUT:
        return 'PUT';
      default:
        throw 'Method Not Found';
    }
  }
}
