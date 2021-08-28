import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tako_app/data/app_preferences.dart';
import 'package:tako_app/modules/authentication/auth_controller.dart';
import 'package:tako_app/util/common/logger.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';

import '../../app_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthController _authController = Get.put(AuthController());

  double logoHeight = 91.5;
  double logoWidth = 318;

  double roundSize = 122;

  double positionLogoLeft = 165;
  double positionLogoBottom = 405;

  double positionRounedLeft = 146;
  double positionRounedBottom = 387;

  @override
  void initState() {
    super.initState();
    runIntro();
  }

  Future<void> checkLogin() async {
    var uid = AppPreference().getUID();
    var userName =  AppPreference().getUsername();
    var passWord = AppPreference().getPassword();
    if(uid.isEmpty){
      Get.offAllNamed(Routes.AUTH);
    } else {
      await _authController.login(
        tag: 2,
        userN: userName,
        passW: passWord,
      );
    }
  }

  Future<void> checkFirstSeen() async {
    var _seen = await AppPreference().getSeen();
    if(_seen == true){
      checkLogin();
    } else {
      AppPreference().setSeen();
      Get.offAllNamed(Routes.INTRO_FIRST_SCREEN);
    }
    Logger.info("Check intro seen: $_seen");
  }

  Future<void> runIntro() async {
    await Future.delayed(Duration(milliseconds: 1000));
    for (double i = roundSize; i <= 242; i = i + 1) {
      await Future.delayed(Duration(milliseconds: 2));
      setState(() {
        roundSize = i;
        if (positionRounedBottom >= 388) {
          positionRounedBottom = positionRounedBottom - 1;
        }
        if (positionRounedLeft >= 86) {
          positionRounedLeft = positionRounedLeft - 0.5;
        }
        if (logoHeight >= 52) {
          logoHeight = logoHeight - 1.5;
        }
        if (logoWidth >= 182) {
          logoWidth = logoWidth - 1.5;
        }
        if (positionLogoLeft >= 116) {
          positionLogoLeft = positionLogoLeft - 1;
        }
        if (positionLogoBottom <= 482) {
          positionLogoBottom = positionLogoBottom + 0.8;
        }
      });
    }
    await Future.delayed(Duration(milliseconds: 400));
    for (double i = positionRounedLeft; i <= 270; i = i + 1.1) {
      await Future.delayed(Duration(microseconds: 1000));
      setState(() {
        positionRounedLeft = i;
        if(roundSize >= 20){
          roundSize =  roundSize - 1.4;
        }
        if(positionRounedBottom <= 488){
          positionRounedBottom = positionRounedBottom + 1;
        }
      });
      }
    await Future.delayed(Duration(milliseconds: 600));
    for(double i = roundSize; i <= 1500 ; i = i + 1){
      await Future.delayed(Duration(microseconds: 700));
      setState(() {
        roundSize = i;
        if(positionRounedLeft >= -250){
          positionRounedLeft =  positionRounedLeft - 0.5;
        }
        if(positionRounedBottom >= -200){
          positionRounedBottom = positionRounedBottom - 0.5;
        }
      });
    }
    await Future.delayed(Duration(milliseconds: 400));
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: width(positionRounedLeft),
              bottom: height(positionRounedBottom),
              child: Container(
                height: height(roundSize),
                width: height(roundSize),
                decoration: BoxDecoration(
                    color: orange, borderRadius: BorderRadius.circular(100000)),
              ),
            ),
            Positioned(
              left: width(positionLogoLeft),
              bottom: height(positionLogoBottom),
              child: Container(
                height: height(logoHeight),
                width: height(logoWidth),
                child: Image.asset(
                  AppFileName.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
