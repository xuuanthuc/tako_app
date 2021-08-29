import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';
SliverToBoxAdapter InfoBranchAction() {
  return SliverToBoxAdapter(
      child: Container(
        color: greySmall,
        height: height(80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Thời gian mở cửa',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: size(16),
                      color: lowBlack,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                SizedBox(height: height(10)),
                Text('9:00 - 23:00',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: size(14),
                      color: lowBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: height(50),
              width: width(1),
              color: lowBlack,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ngày kinh doanh',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: size(16),
                      color: lowBlack,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                SizedBox(height: height(10)),
                Text('Các ngày trong tuần',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: size(14),
                      color: lowBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
  );
}
