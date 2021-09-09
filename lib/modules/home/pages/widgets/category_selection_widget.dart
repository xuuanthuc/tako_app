import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/app_image.dart';
import 'package:tako_app/util/constants/locale_keys.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class CategorySelectionDesgin extends StatelessWidget {
  CategorySelectionDesgin({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  void getCategoryBy({required String category}) async {
    var isSuccess = await _homeController.getCategory(category: category);
    if(isSuccess){
    }
  }



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
                ontap: () => getCategoryBy(category: LocaleKeys.nearYou),
              ),
              selecOption(
                label: 'Cơm Xuất',
                image: AppFileName.effect_2,
                ontap: () => getCategoryBy(category: LocaleKeys.rice),

              ),
              selecOption(
                label: 'Bún/Phở',
                image: AppFileName.effect_3,
                ontap: () => getCategoryBy(category: LocaleKeys.noodle),

              ),
              selecOption(
                label: 'Gà Rán',
                image: AppFileName.effect_4,
                ontap: () => getCategoryBy(category: LocaleKeys.chicken),

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
                ontap: () => getCategoryBy(category: LocaleKeys.snack),

              ),
              selecOption(
                label: 'Đồ Uống',
                image: AppFileName.effect_6,
                ontap: () => getCategoryBy(category: LocaleKeys.drink),

              ),
              selecOption(
                label: 'Bánh Mì',
                image: AppFileName.effect_7,
                ontap: () => getCategoryBy(category: LocaleKeys.bread),

              ),
              selecOption(
                label: 'Healthy',
                image: AppFileName.effect_8,
                ontap: () => getCategoryBy(category: LocaleKeys.healthy),

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
