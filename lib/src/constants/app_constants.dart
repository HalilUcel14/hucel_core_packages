class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  static const String ipadType = "ipad";
  static const String whatsAppPrefix = 'whatsapp://send?text=';
}
