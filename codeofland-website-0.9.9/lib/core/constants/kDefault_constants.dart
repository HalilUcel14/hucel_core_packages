// ignore_for_file: file_names

class KDefaultConst {
  static KDefaultConst? _instance;
  static KDefaultConst get instance {
    _instance ??= KDefaultConst._init();
    return _instance!;
  }

  KDefaultConst._init();

  static double appBarSize = 80;
}
