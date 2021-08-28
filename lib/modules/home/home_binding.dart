import 'package:get/get.dart';
import 'package:tako_app/data/repository/home_repository.dart';

import 'home_controller.dart';
import 'home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<IHomeRepository>(() => HomeRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}