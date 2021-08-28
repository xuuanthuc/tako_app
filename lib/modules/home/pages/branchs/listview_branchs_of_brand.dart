import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/common/widgets/appbar_design.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:tako_app/modules/home/pages/branchs/widgets/item_branchs_of_list_brand.dart';
import 'package:tako_app/modules/home/pages/brands/widgets/listview_brands_item.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class ListBranchsOfBrandPage extends StatelessWidget {
  ListBranchsOfBrandPage({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appbarDesign(),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return ItemBranchOfList(
              // ontap: () => _homeController.getBranchOfBrand(brand: _homeController.listBrands.value[index].key),
              label: _homeController.listBranchs.value[index].branchName,
              // image: _homeController.listBrands.value[index].thumbnail,
            );
          },
          itemCount: _homeController.listBranchs.length,
        ),
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
      title: Obx(
        () => Text(
          _homeController.labelBrand.value,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: size(20),
              color: lowBlack,
            ),
          ),
        ),
      ),
    );
  }
}
