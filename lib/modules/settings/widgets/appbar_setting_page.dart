import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:get/get.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      'Tài khoản của tôi',
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: size(20),
          color: lowBlack,
        ),
      ),
    ),
    centerTitle: true,
    backgroundColor: white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: lowBlack,
      ),
    ),
  );
}
