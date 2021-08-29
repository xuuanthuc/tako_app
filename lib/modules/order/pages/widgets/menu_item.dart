import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';
Widget ItemMenu({
  required VoidCallback ontap,
  required String itemName,
  required String itemImage,
  required String itemPrice,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width(16), vertical: height(6)),
      child: Container(
        decoration: BoxDecoration(
          color: greySmall,
          borderRadius: BorderRadius.circular(radius(5)),
        ),
        height: height(88),
        child: Row(
          children: [
            Container(
              height: height(88),
              width: height(88),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius(5)),
                  bottomLeft: Radius.circular(
                    radius(5),
                  ),
                ),
                child: Image.network(
                  itemImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: width(10)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: size(14),
                        color: lowBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: height(10)),
                  Text(
                    itemPrice,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: size(16),
                        color: lowBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: width(10)),
            Icon(Icons.add_circle, color: lowBlack,),
            SizedBox(width: width(16)),
          ],
        ),
      ),
    ),
  );
}