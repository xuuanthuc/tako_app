
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/common/widgets/custom_button_design.dart';
import 'package:tako_app/modules/common/widgets/input_decoration_design.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';

import '../auth_controller.dart';
import 'package:get/get.dart';
class ForgotSearchUserWidget extends StatelessWidget {
  ForgotSearchUserWidget({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();
  TextEditingController newPassController = TextEditingController();

  void submitAuth(){
    _authController.resetPassword(newPass: newPassController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: width(54),
                      width: width(187),
                      child: Image.asset(AppFileName.logoOrange),
                    ),
                  ],
                ),
                SizedBox(height: height(60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quên mật khẩu?',
                      style: GoogleFonts.bungee(
                        textStyle: TextStyle(
                          height: 1.4,
                          fontSize: size(20),
                          color: lowBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height(20)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(30)),
                  child: Text(
                    'Nhập thông tin số điện thoại hoặc email xác thực TAKO của bạn và nhập mật khẩu mới'
                    ,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        height: 1.4,
                        fontSize: size(16),
                        color: lowBlack,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height(50)),
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
                    decoration: decorTextField('Nhập số điện thoại hoặc email đã đăng ký'),
                  ),
                ),
                SizedBox(height: height(20)),
                labelTextField('Mật khẩu'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(30)),
                  child: TextField(
                    controller: newPassController,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: size(16),
                            color: lowBlack)),
                    decoration: decorTextField('Nhập mật khẩu mới'),
                  ),
                ),
                SizedBox(height: height(20)),
                labelTextField('Nhập lại mật khẩu'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(30)),
                  child: TextField(
                    // controller: newPassController,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: size(16),
                            color: lowBlack)),
                    decoration: decorTextField('Nhập lại mật khẩu mới'),
                  ),
                ),
                SizedBox(height: height(120)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width(65), vertical: height(30)),
              child: CustumButtonDesign(
                  ontap: () => submitAuth(),
                  label: 'Xác nhận'),
            ),
          ),
        ],
      ),
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