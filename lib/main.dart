import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_pages.dart';
import 'data/app_preferences.dart';
import 'util/common/logger.dart';
import 'util/lang/translation_service.dart';
import 'util/theme/app_theme.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        ScreenUtil.init(
          constraints,
          designSize: Size(414, 896),
        );
        return MyApp();
      }
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppPreference().init();
  }
  @override
  Widget build(BuildContext context) {
    Logger.info('start');
    return GetMaterialApp(
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.fallbackLocale, //TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      // logWriterCallback: Logger.write,
    );
  }
}
