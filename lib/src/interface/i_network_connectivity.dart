import 'package:connectivity_plus/connectivity_plus.dart';

// Implement Alanı Yol Gösterici
abstract class INetworkConnectivity {
  //
  Future<ConnectedResult> checkFirstConnectivity();
  void handleConnectivityChange(ConnectivityCallBack onChange);
  void dispose();
}

// Function typeDef Fonksiyon Yazım Kısaltır
typedef ConnectivityCallBack = void Function(ConnectedResult result);


// Type Enum tipi ile durumları özetleme örn
// Bluetooth mu wifi mi değil de on mu off mu
enum ConnectedResult {
  on,
  off;

  static ConnectedResult checkedConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return ConnectedResult.on;
      // Diğer üsttekiler oto geçiş olarak gelicek ve tek sonuç döner.
      case ConnectivityResult.none:
        return ConnectedResult.off;
      // Alternatif Sonuç Döner.
    }
  }
}