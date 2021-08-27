import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class CategorySelectionDesgin extends StatelessWidget {
  CategorySelectionDesgin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(16), vertical: height(24)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selecOption(
                label: 'Gần Bạn',
                image: AppFileName.effect_1,
                ontap: () {},
              ),
              selecOption(
                label: 'Cơm Xuất',
                image: AppFileName.effect_2,
                ontap: () {},
              ),
              selecOption(
                label: 'Bún/Phở',
                image: AppFileName.effect_3,
                ontap: () {},
              ),
              selecOption(
                label: 'Gà Rán',
                image: AppFileName.effect_4,
                ontap: () {},
              ),
            ],
          ),
          SizedBox(height: height(10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selecOption(
                label: 'Ăn Vặt',
                image: AppFileName.effect_5,
                ontap: () {},
              ),
              selecOption(
                label: 'Đồ Uống',
                image: AppFileName.effect_6,
                ontap: () {},
              ),
              selecOption(
                label: 'Bánh Mì',
                image: AppFileName.effect_7,
                ontap: () {},
              ),
              selecOption(
                label: 'Healthy',
                image: AppFileName.effect_8,
                ontap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget selecOption(
      {required String label,
      required String image,
      required VoidCallback ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: width(88),
        width: width(88),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              // spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(radius(5)),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: width(30),
              width: width(30),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: height(10),),
            Text(
              label,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: size(14),
                  color: lowBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
