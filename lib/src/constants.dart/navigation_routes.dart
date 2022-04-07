class NavigationConstants {
  static NavigationConstants? _instance;
  static NavigationConstants get instance {
    _instance ??= NavigationConstants._init();
    return _instance!;
  }

  NavigationConstants._init();

  static const baseRoute = "/";
  static const homeView = "/Home";
  static const onBoard = "/OnBoard";
  static const signIn = "/SignIn";
  static const splash = "/Splash";
  static const signUp = "/SignUp";
  static const forgot = "/Forgot";
  static const testView = '/TestView';
  static const product = '/Product';
  static const details = '/Details';
  static const profile = '/Profile';
  static const settings = '/Settings';
}
