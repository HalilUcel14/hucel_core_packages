import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
