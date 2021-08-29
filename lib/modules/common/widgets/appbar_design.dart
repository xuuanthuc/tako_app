import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';

AppBar AppBarDesign({required VoidCallback ontap}) {
  return AppBar(
    title: Container(height: height(40),child: Image.asset(AppFileName.logoOrange, fit: BoxFit.fill,)),
    // Text(
    //   'FOOD DELIVERY !',
    //   style: GoogleFonts.bungee(
    //     textStyle: TextStyle(fontSize: 23, color: orange),
    //   ),
    // ),
    automaticallyImplyLeading: false,
    centerTitle: false,
    backgroundColor: white,
    elevation: 0,
    actions: [
      IconButton(onPressed: ontap, icon: Icon(Icons.menu, color: lowBlack,))
    ],
  );
}
