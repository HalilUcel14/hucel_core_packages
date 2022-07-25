// Esas Class İşlemler burdan alıcak

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../hucel_core.dart';

class NetworkConnectivityManager extends INetworkConnectivity {
  //
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  NetworkConnectivityManager() {
    _connectivity = Connectivity();
  }
  //
  @override
  Future<ConnectedResult> checkFirstConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return ConnectedResult.checkedConnectivityResult(connectivityResult);
  }

  @override
  void handleConnectivityChange(ConnectivityCallBack onChange) {
    _subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      print(result);
      onChange.call(ConnectedResult.checkedConnectivityResult(result));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
