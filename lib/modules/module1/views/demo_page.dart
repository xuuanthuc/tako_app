import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylan_app/modules/module1/controllers/demo_controller.dart';
import 'package:mylan_app/util/constants/locale_keys.dart';
import 'package:mylan_app/util/theme/app_theme.dart';

class DemoPage extends StatelessWidget{
  final DemoController _demoController = Get.put(DemoController());

  @override
  Widget build(BuildContext context) {
    return Obx(()
      => Column(
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
      )
    );
  }

}