import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/common/lazy_load_widget.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:tako_app/modules/order/pages/widgets/appbar_sliver_design.dart';
import 'package:tako_app/modules/order/pages/widgets/bottom_sheet_order.dart';
import 'package:tako_app/modules/order/pages/widgets/info_branch.dart';
import 'package:tako_app/modules/order/pages/widgets/menu_item.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

class MenuItemOfBranchPage extends StatelessWidget {
  MenuItemOfBranchPage({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Obx(
        () => _homeController.isLoading.value
            ? LazyLoad()
            : CustomScrollView(
                slivers: <Widget>[
                  buildSliverAppBar(
                    background: _homeController.thumbnailBrand.value,
                    branchName:
                        _homeController.listMenu.value[0].branchName ?? "",
                    branchAddress:
                        _homeController.listMenu.value[0].address ?? '',
                  ),
                  InfoBranchAction(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width(16), vertical: height(20)),
                      child: Text(
                        'Menu',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: size(20),
                            color: lowBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => _homeController.isLoading.value
                        ? LazyLoad()
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ItemMenu(
                                  ontap: () {
                                    Get.bottomSheet(
                                      bottomSheetOrder(
                                        itemName: _homeController
                                            .listMenu.value[index].item ??
                                            "",
                                        itemImage: _homeController
                                            .listMenu.value[index].image ??
                                            "",
                                        itemPrice: _homeController
                                            .listMenu.value[index].price ??
                                            "",
                                        type:  _homeController
                                            .listMenu.value[index].type ??
                                            "",
                                        ontap: (){}
                                      ),
                                      isScrollControlled: true,
                                    );
                                  },
                                  itemName: _homeController
                                          .listMenu.value[index].item ??
                                      "",
                                  itemImage: _homeController
                                          .listMenu.value[index].image ??
                                      "",
                                  itemPrice: _homeController
                                          .listMenu.value[index].price ??
                                      "",
                                );
                              },
                              childCount: _homeController.listMenu.length,
                            ),
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
