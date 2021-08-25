
const demoApiUrl = "/api/location/search/?query=Chicago";
const getLocalUrl = "/api/location/search/?query";
const fetchWeatherUrl = "/api/location/";

//Môi trường dev
class DevEnvironment{
  final baseUrl = "https://www.metaweather.com";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;
}

final environment = DevEnvironment();
