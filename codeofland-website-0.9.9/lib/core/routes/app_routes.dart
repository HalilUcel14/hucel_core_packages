import 'package:flutter/material.dart';

import '../../screen/home/home_screen.dart';
import '../../screen/splash/view/splash_screen.dart';

abstract class IAppRoutes {
  late Map<String, Widget Function(BuildContext context)> routes;
}

class AppRoutes implements IAppRoutes {
  static AppRoutes? _instance;
  static AppRoutes get instance {
    _instance ??= AppRoutes._init();
    return _instance!;
  }

  AppRoutes._init();

  static String initialRoute = '/';
  static String splash = '/splash';
  static String home = '/home';
  static String onboard = '/onboard';

  @override
  Map<String, Widget Function(BuildContext context)> routes = {
    initialRoute: (context) => const Scaffold(),
    home: (context) => const HomeScreen(),
    splash: (context) => const SplashScreen(),
  };
}
