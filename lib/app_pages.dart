import 'package:get/get.dart';


import 'modules/module1/bindings/weather_binding.dart';
import 'modules/module1/views/demo_page.dart';
import 'modules/module1/views/home_weather_page.dart';

abstract class Routes {
  static const HOME = '/homeWeather';
  static const DEMO_PAGE = '/demo';
  static const CITY_SEARCH = '/citySearch';
  static const SETTING = '/setting';
}

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeWeatherPage(),
      binding: WeatherBinding(),
    ),
    GetPage(name: Routes.DEMO_PAGE, page: () => DemoPage()),
  ];
}

// can add route children by that
// GetPage(
//   name: Routes.HOME,
//   page: () => HomeWeatherPage(),
//   binding: WeatherBinding(),
//   children: [
//     GetPage(
//     name: Routes.CITY_SEARCH,
//     page: () => CitySearchPage(),
//     ),
//     GetPage(
//     name: Routes.SETTING,
//     page: () => SettingLangPage(),
//     ),
//   ]
// ),
