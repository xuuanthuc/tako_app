import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/authentication/auth_controller.dart';
import 'package:tako_app/modules/authentication/widgets/form_login_widget.dart';
import 'package:tako_app/modules/authentication/widgets/form_register_widget.dart';
import 'package:tako_app/modules/authentication/widgets/login_register_button_custom.dart';
import 'package:tako_app/modules/common/widgets/custom_button_design.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.put(AuthController());

  void tapLogin() {
    _authController.isLogin.value = true;
    print('login');
  }

  void tapRegister() {
    _authController.isLogin.value = false;
    print('register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
      ),
      backgroundColor: white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height(30)),
                Row(
                  //Logo app
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height(54),
                      width: width(187),
                      child: Image.asset(
                        AppFileName.logoOrange,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height(57)),
                Row(
                  //Hang chon loai dang nhap dang ky
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => loginRegisterBtn(
                          isLogin: _authController.isLogin.value,
                          label: 'Đăng nhập',
                          ontap: () => tapLogin()),
                    ),
                    Obx(
                      () => loginRegisterBtn(
                          isLogin: !_authController.isLogin.value,
                          label: 'Đăng ký',
                          ontap: () => tapRegister()),
                    )
                  ],
                ),
                SizedBox(height: height(15)),
                Obx(
                  () => Visibility(
                    child: FormLoginWidget(),
                    visible: _authController.isLogin.value,
                  ),
                ),
                Obx(
                      () => Visibility(
                    child: FormRegisterWidget(),
                    visible: !_authController.isLogin.value,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width(65), vertical: height(30)),
              child: Obx(
                () => CustumButtonDesign(
                    ontap: () {},
                    label: _authController.isLogin == true
                        ? 'Đăng nhập'
                        : 'Đăng ký'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
