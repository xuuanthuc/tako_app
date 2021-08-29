import 'package:get/get.dart';
import 'package:tako_app/modules/authentication/auth_binding.dart';
import 'package:tako_app/modules/authentication/pages/auth_page.dart';
import 'package:tako_app/modules/authentication/pages/forgot_password.dart';
import 'package:tako_app/modules/home/home_binding.dart';
import 'package:tako_app/modules/home/pages/home_page.dart';
import 'package:tako_app/modules/home/pages/brands/listview_brands_page.dart';
import 'package:tako_app/modules/order/order_page/order_page.dart';
import 'package:tako_app/modules/settings/setting_page.dart';
import 'package:tako_app/modules/splash/effects_screen.dart';
import 'package:tako_app/modules/splash/first_intro_screen.dart';
import 'modules/home/pages/branchs/listview_branchs_of_brand.dart';
import 'modules/order/pages/menu_page.dart';
import 'modules/order/pay_binding.dart';
import 'modules/splash/splash.dart';

abstract class Routes {
  static const HOME = '/home_page';
  static const SPLASH = '/splash_page';
  static const INTRO_FIRST_SCREEN = '/intro_first';
  static const AUTH = '/auth_screen';
  static const FORGOT_PASS = '/forgot-password-screen';
  static const EFFECT  = '/effects-screen';
  static const LISTBRANDS  = '/list-brands';
  static const BRANCHS_OF_BRAND  = '/list-branchs-of-brand';
  static const MENU_ITEM  = '/list_menu_item-of-branch';
  static const ORDER  = '/order_item_page';
  static const SETTING = '/setting';
}

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [HomeBinding(), AuthBinding()]
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),

    ),
    GetPage(
      name: Routes.FORGOT_PASS,
      page: () => ForgotpasswordScreen(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.INTRO_FIRST_SCREEN,
      page: () => FirstIntroScreen(),
    ),
    GetPage(
      name: Routes.EFFECT,
      page: () => EffectScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LISTBRANDS,
      page: () => ListBrandsPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BRANCHS_OF_BRAND,
      page: () => ListBranchsOfBrandPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.MENU_ITEM,
      page: () => MenuItemOfBranchPage(),
      bindings: [HomeBinding(),PayBinding()]
    ),
    GetPage(
        name: Routes.ORDER,
        page: () => OrderScreen(),
        bindings: [PayBinding(), AuthBinding()],
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingScreen(),
      bindings: [PayBinding(), AuthBinding(),HomeBinding()],
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
