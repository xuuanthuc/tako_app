import 'package:shared_preferences/shared_preferences.dart';
import '../../models/common/error_model.dart';
import '../../models/module1/demo_model.dart';
import '../../models/module1/weather_model.dart';
import '../../modules/module1/module1_repository_adapter.dart';
import '../../util/constants/locale_keys.dart';
import '../db.dart';
import '../request.dart';
import '../url_api.dart';

final locationUrl = (getLocalUrl, city) => '${getLocalUrl}=${city}';
final weatherUrl =
    (fetchWeatherUrl, locationId) => '${fetchWeatherUrl}${locationId}';

class Module1Repository implements IModule1Repository {
  Request _request = Request();
  late SharedPreferences preferences;

  LocalDatabaseHelper dbLocal = LocalDatabaseHelper.dbHelper;

  Module1Repository() {
    installPreferences();
  }

  Future<void> installPreferences() async {
    this.preferences = await SharedPreferences.getInstance();
  }

  Future<int> getLocationFromCity(String city) async {
    var url = locationUrl(getLocalUrl, city);
    var res = await _request.requestApi(method: 'GET', url: url);
    var cities = (res as List<dynamic>);
    if (cities.length > 0 && cities[0][LocaleKeys.weather_key_woeid] != null) {
      return cities[0][LocaleKeys.weather_key_woeid];
    } else
      return 0;
  }

  Future<Object> fetchWeather(int locationId) async {
    var url = weatherUrl(fetchWeatherUrl, locationId);
    var res = await _request.requestApi(method: 'GET', url: url);
    return res;
  }

  @override
  Future<Object> getWeatherFromCity(String city) async {
    Object? dataLocal = await dbLocal.getWeatherByLocation(city);
    if (dataLocal != null) {
      return WeatherModel.dataLocalFromJson(dataLocal);
    }
    final int locationId = await getLocationFromCity(city);
    if (locationId == 0) {
      return {LocaleKeys.detail: LocaleKeys.not_found};
    }
    dynamic res = await fetchWeather(locationId);
    if (res is ErrorModel) {
      return res;
    } else if (res[LocaleKeys.detail] == LocaleKeys.not_found) {
      return WeatherModel();
    } else {
      WeatherModel weather = WeatherModel.fromJson(res);
      dbLocal.addWeather(weather);
      return weather;
    }
  }

  @override
  Future<DemoModel> getDemo() async {
    var res = await _request.requestApi(method: 'GET', url: demoApiUrl);
    var data = (res as List<dynamic>)[0];
    return DemoModel.fromJson(data);
  }
}
