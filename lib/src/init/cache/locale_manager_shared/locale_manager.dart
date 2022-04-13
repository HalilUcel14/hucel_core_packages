import 'package:shared_preferences/shared_preferences.dart';

// import '../../constants/enums/locale_keys_enum.dart';
//
enum PreferencesKeys {
  token,
  onboard,
}

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(PreferencesKeys.onboard.toString(), true);
    }
  }

  // Setter Functions
  Future<void> setStringValue(String key, String value) async {
    await _preferences!.setString(key, value);
  }

  Future<void> setBoolValue(String key, bool value) async {
    await _preferences!.setBool(key, value);
  }

  Future<void> setIntValue(String key, int value) async {
    await _preferences!.setInt(key, value);
  }

  Future<void> setDoubleValue(String key, double value) async {
    await _preferences!.setDouble(key, value);
  }

  Future<void> setListStringValue(String key, List<String> value) async {
    await _preferences!.setStringList(key, value);
  }

  // Getter Functions
  String getStringPreferences(String key) => _preferences?.getString(key) ?? "";

  bool getBoolPreferences(String key) => _preferences?.getBool(key) ?? false;

  int getIntPreferences(String key) => _preferences?.getInt(key) ?? 0;

  double getDoublePreferences(String key) =>
      _preferences?.getDouble(key) ?? 0.00;

  List<String> getListStringPreferences(String key) =>
      _preferences?.getStringList(key) ?? [];
}
