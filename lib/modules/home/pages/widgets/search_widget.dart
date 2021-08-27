import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

Widget DesignSearchTextFieldWidget() {
  return Container(
    color: white,
    height: height(65),
    child: Padding(
      padding: EdgeInsets.only(
        right: width(16),
        left: width(16),
        bottom: height(25),
        top: height(5),
      ),
      child: Container(
        height: height(35),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: greySmall,
                  borderRadius: BorderRadius.circular(radius(5)),
                ),
                child: TextField(
                  onChanged: (value) {},
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: size(12), height: 1, color: lowBlack)),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greySmall),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greySmall),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: height(1),
                      horizontal: width(16),
                    ),
                    hintText: 'Tìm kiếm món ăn, nhà hàng',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width(13),
            ),
            Container(
              height: height(35),
              width: height(35),
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(
                  radius(5),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  print("search");
                },
                icon: Icon(
                  Icons.search_outlined,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
