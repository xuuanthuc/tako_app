import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/home/pages/category/widgets/category_item.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

import '../../../../app_pages.dart';
import '../../home_controller.dart';
class SuggetForYouWidget extends StatelessWidget {
   SuggetForYouWidget({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Column(
      children: [
        SizedBox(
          height: height(25),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gợi ý hàng đầu cho bạn",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: size(20),
                      color: orange,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height(16),
        ),
        Container(
          height: _homeController.listSugget.length.toDouble() * 100,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = _homeController.listSugget[index];
              return ItemCategory(
                title: item.item ?? "",
                imageUrl: item.imageUrl ?? "",
                description: item.description ?? "",
                address: item.address ?? "",
                price: item.price ?? "",
                ontap: () {
                  _homeController.categoryItem.value = item;
                  Get.toNamed(Routes.CATEGORY_ITEM_DETAIL);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Container(height: height(10));
            },
            itemCount: _homeController.listSugget.length,
          ),
        ),
      ],
    ),);

  }
}
