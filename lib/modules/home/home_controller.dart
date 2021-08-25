import 'package:tako_app/models/module1/demo_model.dart';

import 'home_repository.dart';
import 'package:get/get.dart';
class HomeController extends GetxController {
  var demo = DemoModel().obs;
  final IHomeRepository repository = Get.find();

  @override
  void onInit() {
    apiGetDemoInfo();
    super.onInit();
  }

  void apiGetDemoInfo() async {
    this.demo.value = await repository.getDemo();
  }
}
