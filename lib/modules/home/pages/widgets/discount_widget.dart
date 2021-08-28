import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/common/lazy_load_widget.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';
import 'package:get/get.dart';
import '../../home_controller.dart';

class discountEverydayWidget extends StatelessWidget {
  discountEverydayWidget({Key? key}) : super(key: key);

  final HomeController _homeController = Get.find();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width(16), vertical: height(35)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Giảm giá mỗi ngày",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: size(20),
                  color: lowBlack,
                )),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: orange,
                  size: size(18),
                ),
                label: Text(
                  "Xem tất cả",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: size(14),
                          fontWeight: FontWeight.w700,
                          color: orange)),
                ),
              )
            ],
          ),
          SizedBox(
            height: height(20),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showBrandCustom(
                  h: 226,
                  w: 186,
                  image: _homeController.listBrands[0].thumbnail ?? "",
                  brandName: _homeController.listBrands[0].brandName ?? "",
                  ontap: () {
                    _homeController.getBranchOfBrand(brand: _homeController.listBrands[1].key ?? "");
                  },
                ),
                Column(
                  children: [
                    showBrandCustom(
                      h: 108,
                      w: 186,
                      image: _homeController.listBrands[1].thumbnail ?? "",
                      brandName:
                          _homeController.listBrands[1].brandName ?? "",
                      ontap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    showBrandCustom(
                      h: 108,
                      w: 186,
                      image: _homeController.listBrands[2].thumbnail ?? "",
                      brandName:
                          _homeController.listBrands[2].brandName ?? "",
                      ontap: () {},
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
        child: Stack(
          children: [
            Container(
              width: width(w),
              height: height(h),
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
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // 10% of the width, so there are ten blinds.
                  colors: <Color>[
                    Colors.white.withOpacity(0.0),
                    Colors.black87,
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
