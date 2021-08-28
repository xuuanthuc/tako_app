import 'package:get/get.dart';
import 'package:tako_app/data/repository/home_repository.dart';
import 'package:tako_app/modules/menu/pay_binding.dart';


class PayBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<IHomeRepository>(() => HomeRepository());
    Get.lazyPut<PayController>(() => PayController());
  }
}