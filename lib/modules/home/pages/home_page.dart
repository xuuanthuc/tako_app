import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/modules/authentication/auth_controller.dart';
import 'package:tako_app/modules/common/widgets/appbar_design.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:tako_app/modules/home/pages/widgets/carousel_slider.dart';
import 'package:tako_app/modules/home/pages/widgets/category_selection_widget.dart';
import 'package:tako_app/modules/home/pages/widgets/discount_widget.dart';
import 'package:tako_app/modules/home/pages/widgets/form_test_import_data.dart';
import 'package:tako_app/modules/home/pages/widgets/search_widget.dart';
import 'package:tako_app/modules/home/pages/widgets/sugget_for_you.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/common/show_toast.dart';
import 'package:tako_app/util/constants/locale_keys.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:tako_app/util/theme/app_theme.dart';

import 'category/widgets/category_item.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.find();

  DateTime? currentBackPressTime;
  Future<bool> _onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "Nhấn BACK lần nữa để thoát!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: orange,
          textColor: white,
          fontSize: 13.0
      );
      return Future.value(false);
    }
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBarDesign(ontap: () {
          Get.toNamed(Routes.SETTING);
        }),
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height(65)),
                    CarouselSliderDesign(),
                    CategorySelectionDesgin(),
                    discountEverydayWidget(),
                    SuggetForYouWidget()
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: DesignSearchTextFieldWidget(),
              ),
            ],
          ),
        ));
  }

}
