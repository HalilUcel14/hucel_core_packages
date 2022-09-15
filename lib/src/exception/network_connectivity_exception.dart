class NetworkConnectivityException implements Exception {
  String? message;
  //
  NetworkConnectivityException(this.message);
  //
  @override
  String toString() {
    return 'Network Connectivity is Error : $message';
  }
}
