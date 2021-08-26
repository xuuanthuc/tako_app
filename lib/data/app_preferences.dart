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

  void saveUID(String value) async {
    await prefs.setString('uid', value);
  }

  String getUID() {
    return prefs.getString('uid') ?? "";
  }

  void saveUsername(String value) async {
    await prefs.setString('username', value);
  }

  String getUsername() {
    return prefs.getString('username') ?? "";
  }


  void savePassword(String value) async {
    await prefs.setString('password', value);
  }

  String getPassword() {
    return prefs.getString('password') ?? "";
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
