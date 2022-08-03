class ResponsivityConstants {
  static ResponsivityConstants? _instance;

  static ResponsivityConstants get instance {
    _instance ??= ResponsivityConstants._init();
    return _instance!;
  }

  ResponsivityConstants._init();

  final smallScreenSize = 300;
  final mediumScreenSize = 600;
  final largeScreenSize = 900;
}
