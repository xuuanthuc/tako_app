import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  late SharedPreferences prefs;
  final keyToken = "token";
  final keyDeviceId = "deviceId";

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }


  void setSeen() async {
    await prefs.setBool('seen', true);
  }
  Future<bool?> getSeen() async {
    return prefs.getBool('seen');
  }

  void saveToken(String value) async {
    await prefs.setString(keyToken, value);
  }

  String getToken() {
    return prefs.getString(keyToken) ?? "";
  }

  void saveDeviceId(String value) async {
    await prefs.setString(keyDeviceId, value);
  }

  String getDeviceId() {
    return prefs.getString(keyDeviceId) ?? "";
  }

  void clear() async {
    await prefs.clear();
  }

  // Singleton
  static final AppPreference _appPreference = AppPreference._internal();

  factory AppPreference() {
    return _appPreference;
  }

  AppPreference._internal();
}
