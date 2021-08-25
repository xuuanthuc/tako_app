import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

Widget CustumButtonDesign({Color? color,double? width, double? radius, required VoidCallback ontap, String? label, double? fontSize, double? verticalPaddingText }) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
        color: orange,
        borderRadius: BorderRadius.circular(size(radius ?? 5)),
      ),
      // height: height(50),
      width: width ??  double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height(verticalPaddingText ?? 15)),
        child: Text(
          label ?? "khám phá thêm",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            color: white,
            fontSize: size(fontSize ?? 20),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}