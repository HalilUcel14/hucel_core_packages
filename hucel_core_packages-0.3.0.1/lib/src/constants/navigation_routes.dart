class NavigationConstants {
  static NavigationConstants? _instance;
  static NavigationConstants get instance {
    _instance ??= NavigationConstants._init();
    return _instance!;
  }

  NavigationConstants._init();
  //
  static const testView = '/TestView';
  //
  static const baseRoute = "/";
  static const splash = "/splash";
  static const onBoard = "/onBoard";
  //
  static const signIn = "/signIn";
  static const signUp = "/signUp";
  static const forgot = "/forgot";
  static const verify = "/verify";
  //
  static const home = "/home";
  //
  static const profile = '/profile';
  static const settings = '/settings';
  //
}
