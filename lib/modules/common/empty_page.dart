import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/settings/widgets/appbar_setting_page.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:get/get.dart';

class EmptyPage extends StatelessWidget {
  EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appbarDesign(''),
      body: Center(
        child: Column(
          children: [
            Container(
              height: height(100),
            ),
            Container(
              height: height(200),
              width: width(200),
              child: Image.asset(
                AppFileName.empty,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: height(30),
            ),
            Text(
              "Danh sách hiện đang trống!\nBạn hãy quay lại sau nhé!",
              textAlign: TextAlign.center,
              style: GoogleFonts.bungee(
                textStyle: TextStyle(
                  height: 1.8,
                  fontWeight: FontWeight.w700,
                  fontSize: size(20),
                  color: orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar appbarDesign(String? title) {
  return AppBar(
    backgroundColor: white,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: lowBlack,
        )),
    title: Text('${title}',style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: size(20),
          color: lowBlack,
        ))),
  );
}
