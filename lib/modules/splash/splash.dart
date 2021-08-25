import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tako_app/util/common/screen_util.dart';

import '../../app_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkLogin();
    });
  }

  Future<void> checkLogin() async {
    // var token = AppPreference().getToken();
    // if (token.isEmpty) {
    //   Get.offAllNamed(Routes.LOGIN);
    // } else {
      Get.offAllNamed(Routes.HOME);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'Banker App',
                style: TextStyle(
                  fontSize: size(50),
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      fontSize: size(140),
                      color: Color(0xffF9CB2A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
