import 'package:flutter/material.dart';
import 'package:tako_app/modules/common/empty_page.dart';
import 'package:get/get.dart';
import 'package:tako_app/modules/home/pages/category/widgets/category_item.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/constants/locale_keys.dart';
import 'package:tako_app/util/theme/app_colors.dart';

import '../../home_controller.dart';

class ListCategoryItem extends StatelessWidget {
  ListCategoryItem({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: white,
        appBar:
            appbarDesign(titleCategory(_homeController.titleCategory.value)),
        body: ListView.separated(
          itemBuilder: (context, index) {
            var item = _homeController.listCategory[index];
            return ItemCategory(
              title: item.item ?? "",
              imageUrl: item.imageUrl ?? "",
              description: item.description ?? "",
              address: item.address ?? "",
              price: item.price ?? "",
              ontap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return Container(height: height(10));
          },
          itemCount: _homeController.listCategory.length,
        ),
      ),
    );
  }
}

String titleCategory(String title) {
  switch (title) {
    case '${LocaleKeys.nearYou}':
      return 'Gần bạn';
    case '${LocaleKeys.rice}':
      return 'Cơm xuất';
    case '${LocaleKeys.noodle}':
      return 'Bún/ Phở';
    case '${LocaleKeys.chicken}':
      return 'Gà rán';
    case '${LocaleKeys.snack}':
      return 'Ăn vặt';
    case '${LocaleKeys.drink}':
      return 'Đồ uống';
    case '${LocaleKeys.bread}':
      return 'Bánh mì';
    case '${LocaleKeys.healthy}':
      return 'Healthy';
  }
  return title;
}
