import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class FormLoginWidget extends StatelessWidget {
  FormLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextField('Số điện thoại hoặc email'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: TextField(
            onChanged: (text) {
              // do something with text
            },
            textInputAction: TextInputAction.next,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size(16),
                    color: lowBlack)),
            decoration: decorTextField('Nhập số điện thoại hoặc email của bạn')
          ),
        ),
        SizedBox(height: height(30)),
        labelTextField('Mật khẩu'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: TextField(
            onChanged: (text) {
              // do something with text
            },
            textInputAction: TextInputAction.next,
            obscureText: true,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size(16),
                    color: lowBlack)),
            decoration: decorTextField('Nhập mật khẩu của bạn'),
          ),
        ),
      ],
    );
  }

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

