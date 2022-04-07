class RegExpConstants {
  static RegExpConstants? _instance;

  static RegExpConstants get instance {
    _instance ??= RegExpConstants._init();
    return _instance!;
  }

  RegExpConstants._init();

  final String emailRegexp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$½'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final String passwordRegexp =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#$\*~]).{8,}$";
}
