import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/modules/common/widgets/appbar_design.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:tako_app/modules/home/pages/brands/widgets/listview_brands_item.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class ListBrandsPage extends StatelessWidget {
  ListBrandsPage({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appbarDesign(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return BrandItem(
            ontap: () async {
              _homeController.getInfoBrand(brand: _homeController.listBrands.value[index].brandId ?? "");
              var isSuccess = await _homeController.getBranchOfBrand(
                brand: _homeController.listBrands.value[index].brandId ?? "",
              );
              if(isSuccess) {
                Get.toNamed(Routes.BRANCHS_OF_BRAND);
              } else {
                Get.toNamed(Routes.EMPTY);

              }
            },
            label: _homeController.listBrands.value[index].brandName,
            image: _homeController.listBrands.value[index].thumbnail,
          );
        },
        itemCount: _homeController.listBrands.length,
      ),
    );
  }

  AppBar appbarDesign() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: lowBlack,
          )),
      title: Text(
        "Giảm giá mỗi ngày",
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: size(20),
          color: lowBlack,
        )),
      ),
    );
  }
}
