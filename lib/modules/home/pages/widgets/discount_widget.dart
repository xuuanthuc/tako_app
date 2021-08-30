import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/modules/common/lazy_load_widget.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:get/get.dart';
import '../../home_controller.dart';

class discountEverydayWidget extends StatelessWidget {
  discountEverydayWidget({Key? key}) : super(key: key);

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _homeController.isLoading.value == true ? Container() :Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width(16), vertical: height(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Khám phá cùng bạn",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: size(20),
                  color: orange,
                )),
              ),
              TextButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.LISTBRANDS);
                },
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: lowBlack,
                  size: size(18),
                ),
                label: Text(
                  "Xem tất cả",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: size(14),
                          fontWeight: FontWeight.w700,
                          color: lowBlack)),
                ),
              )
            ],
          ),
          SizedBox(
            height: height(5),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showBrandCustom(
                  h: 226,
                  w: 186,
                  image: _homeController.listBrands.value[0].thumbnail ?? "",
                  brandName: _homeController.listBrands.value[0].brandName ?? "",
                  ontap: () {
                    _homeController.getBranchOfBrand(brand: _homeController.listBrands.value[0].brandId ?? "");
                    _homeController.getInfoBrand(brand: _homeController.listBrands.value[0].brandId ?? "");
                    Get.toNamed(Routes.BRANCHS_OF_BRAND);
                  },
                ),
                Column(
                  children: [
                    showBrandCustom(
                      h: 108,
                      w: 186,
                      image: _homeController.listBrands.value[1].thumbnail ?? "",
                      brandName:
                          _homeController.listBrands.value[1].brandName ?? "",
                      ontap: () {
                        _homeController.getBranchOfBrand(brand: _homeController.listBrands.value[1].brandId ?? "");
                        _homeController.getInfoBrand(brand: _homeController.listBrands.value[1].brandId ?? "");
                        Get.toNamed(Routes.BRANCHS_OF_BRAND);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    showBrandCustom(
                      h: 108,
                      w: 186,
                      image: _homeController.listBrands.value[2].thumbnail ?? "",
                      brandName:
                          _homeController.listBrands.value[2].brandName ?? "",
                      ontap: () {
                        _homeController.getBranchOfBrand(brand: _homeController.listBrands.value[2].brandId ?? "");
                        _homeController.getInfoBrand(brand: _homeController.listBrands.value[2].brandId ?? "");
                        Get.toNamed(Routes.BRANCHS_OF_BRAND);
                      },
                    ),
                  ],
                )
              ],
            ),
        ],
      ),
    ),);
  }

  Widget showBrandCustom(
      {required double h,
      required String brandName,
      required double w,
      required String image,
      required VoidCallback ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width(w),
        height: height(h),
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              width: width(w),
              height: height(h),
              color: Colors.transparent,

              child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius(5)),
                  child:  Image.network(
                    image,
                    fit: BoxFit.fitHeight,
                  )),
            ),
            Container(
              width: width(w),
              height: height(h),

              decoration: BoxDecoration(
                color: Colors.transparent,

                borderRadius: BorderRadius.circular(radius(5)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // 10% of the width, so there are ten blinds.
                  colors: <Color>[
                    Colors.white.withOpacity(0.0),
                    Colors.black54,
                  ],
                  // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: height(8)),
                child: Text(
                  brandName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                    fontSize: size(14),
                    color: white,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
