import 'package:get/get.dart';
import 'package:tako_app/modules/authentication/pages/auth_page.dart';
import 'package:tako_app/modules/authentication/pages/forgot_password.dart';
import 'package:tako_app/modules/home/home_binding.dart';
import 'package:tako_app/modules/home/pages/home_page.dart';
import 'package:tako_app/modules/splash/effects_screen.dart';
import 'package:tako_app/modules/splash/first_intro_screen.dart';
import 'modules/splash/splash.dart';

abstract class Routes {
  static const HOME = '/home_page';
  static const SPLASH = '/splash_page';
  static const INTRO_FIRST_SCREEN = '/intro_first';
  static const AUTH = '/auth_screen';
  static const FORGOT_PASS = '/forgot-password-screen';
  static const EFFECT  = '/effects-screen';
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
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
    ),
    GetPage(
      name: Routes.FORGOT_PASS,
      page: () => ForgotpasswordScreen(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.INTRO_FIRST_SCREEN,
      page: () => FirstIntroScreen(),
    ),
    GetPage(
      name: Routes.EFFECT,
      page: () => EffectScreen(),
    ),
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
