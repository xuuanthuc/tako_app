import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/common/widgets/input_decoration_design.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

import '../auth_controller.dart';
import 'package:get/get.dart';
class FormRegisterWidget extends StatelessWidget {
  FormRegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextField('Họ Tên'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: TextField(
              onChanged: (text) {
                // do something with text
                _authController.name.value = text;

              },
              textInputAction: TextInputAction.next,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: size(16),
                      color: lowBlack)),
              decoration: decorTextField('Nhập họ và tên của bạn')),
        ),
        SizedBox(height: height(30)),
        labelTextField('Số điện thoại hoặc email'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: TextField(
              onChanged: (text) {
                // do something with text
                _authController.username.value = text;
              },
              textInputAction: TextInputAction.next,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: size(16),
                      color: lowBlack)),
              decoration:
                  decorTextField('Nhập số điện thoại hoặc email của bạn')),
        ),
        SizedBox(height: height(30)),
        labelTextField('Mật khẩu'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: TextField(
              onChanged: (text) {
                // do something with text
                _authController.password.value = text;
              },
              textInputAction: TextInputAction.next,
              obscureText: true,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: size(16),
                      color: lowBlack)),
              decoration: decorTextField('Nhập mật khẩu của bạn')),
        ),
        SizedBox(height: height(30)),
        labelTextField('Nhập lại mật khẩu'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: TextField(
            onChanged: (text) {
              // do something with text
            },
            obscureText: true,
            textInputAction: TextInputAction.done,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size(16),
                    color: lowBlack)),
            decoration: decorTextField('Nhập lại mật khẩu của bạn'),
          ),
        ),
        SizedBox(height: height(130)),
      ],
    );
  }

  Widget labelTextField(String label) => Padding(
        padding: EdgeInsets.symmetric(horizontal: width(30)),
        child: Text(
          label,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: size(16),
                  color: lowBlack)),
        ),
      );
}
