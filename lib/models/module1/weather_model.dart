import '../../util/constants/locale_keys.dart';

enum WeatherCondition { snow, sleet, hail, unknown }

class WeatherModel {
  WeatherCondition weatherCondition = WeatherCondition.unknown;
  String formattedCondition = "";
  double minTemp = 0;
  double temp = 0;
  double maxTemp = 0;
  int locationId = 0;
  String created = "";
  late DateTime? lastUpdate;
  String location = LocaleKeys.not_found;

  WeatherModel({
    this.weatherCondition = WeatherCondition.unknown,
    this.formattedCondition = "",
    this.minTemp = 0,
    this.temp = 0,
    this.maxTemp = 0,
    this.locationId = 0,
    this.created = "",
    this.lastUpdate,
    this.location = LocaleKeys.not_found,
  });

  factory WeatherModel.fromJson(dynamic jsonObject) {
    final consolidateWeather =
        jsonObject[LocaleKeys.weather_key_consolidated_weather][0];
    var weatherCondition = _mapStringToWeatherCondition(
        consolidateWeather[LocaleKeys.weather_key_weather_state_abbr]);
    var formattedCondition =
        consolidateWeather[LocaleKeys.weather_key_weather_state_name];
    var weather = WeatherModel(
      weatherCondition: weatherCondition,
      formattedCondition: formattedCondition,
      minTemp: consolidateWeather[LocaleKeys.weather_key_min_temp] as double,
      temp: consolidateWeather[LocaleKeys.weather_key_min_temp] as double,
      maxTemp: consolidateWeather[LocaleKeys.weather_key_max_temp] as double,
      locationId: jsonObject[LocaleKeys.weather_key_woeid] as int,
      created: consolidateWeather[LocaleKeys.weather_key_created],
      lastUpdate: DateTime.now(),
      location: jsonObject[LocaleKeys.weather_key_title],
    );
    return weather;
  }

  factory WeatherModel.dataLocalFromJson(dynamic jsonObject) {
    var weather = WeatherModel(
      minTemp: jsonObject[LocaleKeys.weather_key_min_temp] as double,
      maxTemp: jsonObject[LocaleKeys.weather_key_max_temp] as double,
      locationId: jsonObject[LocaleKeys.weather_key_woeid] as int,
      location: jsonObject[LocaleKeys.weather_key_title],
    );
    return weather;
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    Map<String, WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet,
      'h': WeatherCondition.hail
    };
    return map[input] ?? WeatherCondition.unknown;
  }
}
