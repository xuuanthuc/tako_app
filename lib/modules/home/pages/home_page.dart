import 'package:flutter/material.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:tako_app/util/constants/locale_keys.dart';
import 'package:tako_app/util/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  final HomeController _demoController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Text(
              LocaleKeys.home_string_1.tr,
              style: cardTextStyle,
            ),
            Text(
              _demoController.demo.value.value2,
              style: cardTextStyle,
            )
          ],
        ));
  }
}
