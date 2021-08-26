import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

InputDecoration decorTextField(String hintText) {
  return InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: orange),
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: size(14),
              fontWeight: FontWeight.w500,
              color: lowGrey)));
}