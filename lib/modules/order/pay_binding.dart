
import 'package:get/get.dart';
import 'package:tako_app/modules/order/pay_controller.dart';

class PayBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<IHomeRepository>(() => HomeRepository());
    Get.lazyPut<PayController>(() => PayController());
  }
}