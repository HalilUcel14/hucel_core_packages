class RegExpConstants {
  static RegExpConstants? _instance;

  static RegExpConstants get instance {
    _instance ??= RegExpConstants._init();
    return _instance!;
  }

  RegExpConstants._init();

  final String emailRegexp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$½'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final String passwordLowRegexp = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';

  /// One lowercase
  /// One digit (num)
  final String passwordMediumRegexp =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';

  /// One Upper case
  /// One Lower case
  /// One Digit (num)
  final String passwordHardRegexp =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  /// One Upper case
  /// One Lower case
  /// One Digit (num)
  /// One Special Character ($#½!!?)
}
