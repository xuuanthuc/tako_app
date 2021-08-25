import 'package:get/get.dart';
import 'package:tako_app/modules/home/pages/home_binding.dart';
import 'package:tako_app/modules/home/pages/home_page.dart';
import 'modules/splash/splash.dart';

abstract class Routes {
  static const HOME = '/home_page';
  static const SPLASH = '/splash_page';
  static const DEMO_PAGE = '/demo';
  static const CITY_SEARCH = '/citySearch';
  static const SETTING = '/setting';
}

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(name: Routes.SPLASH, page: () => SplashPage()),
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
