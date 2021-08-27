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
          child: Form(
            key: _authController.formUser,
            child: TextFormField(
                onChanged: (text) {
                  // do something with text
                  _authController.username.value = text;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Hãy điền số điện thoại email';
                  } else if(!value.contains('@')){
                    if(value.trim()[0] != "0"){
                      return 'Hãy điền đúng số điện thoại hoặc email';
                    } else if(value.trim().length < 9){
                      return 'Hãy điền đúng số điện thoại hoặc email';
                    }
                  }
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
        ),
        SizedBox(height: height(30)),
        labelTextField('Mật khẩu'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: Form(
            key: _authController.formPass,
            child: TextFormField(
                onChanged: (text) {
                  // do something with text
                  _authController.password.value = text;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Hãy điền mật khẩu';
                  } else if(value.length < 6 || !value.contains(RegExp(r'[A-Z]'))){
                    return 'Mật khẩu phải có chữ in hoa và trên 6 ký tự';
                  }
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
        ),

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
