import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';
SliverAppBar buildSliverAppBar({required String background, required String branchName, required String branchAddress}) {
  return SliverAppBar(
    pinned: false,
    snap: false,
    floating: false,
    leading: GestureDetector(
        onTap: () => Get.back(), child: Icon(Icons.close)),
    backgroundColor: orange,
    expandedHeight: 250.0,
    flexibleSpace: Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          FlexibleSpaceBar(
            background: Image.network(
              background,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  branchName,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: size(23),
                      color: white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: height(6)),
                Text(
                  branchAddress,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: size(14),
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: height(20)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
