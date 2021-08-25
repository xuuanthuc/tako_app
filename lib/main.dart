import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_pages.dart';
import 'util/common/logger.dart';
import 'util/lang/translation_service.dart';
import 'util/theme/app_theme.dart';

void main() {
  runApp(
    LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        ScreenUtil.init(
          constraints,
          designSize: Size(375, 812),
        );
        return MyApp();
      }
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
