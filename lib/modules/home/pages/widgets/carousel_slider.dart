import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tako_app/util/common/screen_util.dart';
import 'package:tako_app/util/theme/app_colors.dart';

import '../../home_controller.dart';

class CarouselSliderDesign extends StatelessWidget {
  CarouselSliderDesign({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => CarouselSlider(
          items: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius(5)),
                child: _homeController.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(orange),
                        ),
                      )
                    : Image.network(
                        _homeController.pathBanner1.value,
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius(5)),
                child: _homeController.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(orange),
                      ))
                    : Image.network(
                        _homeController.pathBanner2.value,
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius(5)),
                child: _homeController.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(orange),
                      ))
                    : Image.network(
                        _homeController.pathBanner3.value,
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: height(160),
            autoPlay: true,
          ),
        ));
  }
}
