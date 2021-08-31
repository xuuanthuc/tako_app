import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/modules/common/lazy_load_widget.dart';
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
        () => _homeController.isLoading == true
            ? LazyLoad()
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ItemBranchOfList(
                    ontap: ()async {
                      var isSuccess = await _homeController.getMenuOfBranch(
                      brand: _homeController.listBranchs.value[index].brandId ?? "",
                      idBranch: _homeController.listBranchs.value[index].branchId?? "",
                      branchName:_homeController.listBranchs.value[index].branchName?? "",
                      branchAddress: _homeController.listBranchs.value[index].address?? "",
                      branchDistrict: _homeController.listBranchs.value[index].district?? "",
                    );
                      if(isSuccess){
                        Get.toNamed(Routes.MENU_ITEM);
                      } else {
                        Get.toNamed(Routes.EMPTY);
                      }
                    },
                    label: _homeController.listBranchs.value[index].branchName,
                    address: _homeController.listBranchs.value[index].address,
                    district: _homeController.listBranchs.value[index].district,
                    image: _homeController.thumbnailBrand.value,
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
