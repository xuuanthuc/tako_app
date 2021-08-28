import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:tako_app/modules/menu/pages/widgets/appbar_sliver_design.dart';
import 'package:tako_app/modules/menu/pages/widgets/info_branch.dart';
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
        () => CustomScrollView(
          slivers: <Widget>[
            buildSliverAppBar(
              background: _homeController.thumbnailBrand.value,
              branchName: _homeController.listMenu.value[0].branchName ?? "",
              branchAddress: _homeController.listMenu.value[0].address ?? '',
            ),
            InfoBranchAction(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
