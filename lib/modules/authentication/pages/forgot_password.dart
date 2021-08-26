import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tako_app/modules/authentication/widgets/forgot_search_user.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class ForgotpasswordScreen extends StatelessWidget {
  ForgotpasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: lowBlack,
          ),
        ),
        backgroundColor: white,
      ),
      body: ForgotSearchUserWidget(),
    );
  }
}
