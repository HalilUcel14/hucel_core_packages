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
  static const splash = "/Splash";
  static const onBoard = "/OnBoard";
  //
  static const signIn = "/SignIn";
  static const signUp = "/SignUp";
  static const forgot = "/Forgot";
  //
  static const homeView = "/Home";
  static const product = '/Product';
  static const details = '/Details';
  //
  static const profile = '/Profile';
  static const settings = '/Settings';
  //
}
