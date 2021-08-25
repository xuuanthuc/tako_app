import 'package:get/get.dart';
import 'package:mylan_app/models/module1/demo_model.dart';
import 'package:mylan_app/modules/module1/module1_repository_adapter.dart';

class DemoController extends GetxController {
  var demo = DemoModel().obs;
  final IModule1Repository repository = Get.find();

  @override
  void onInit() {
    apiGetDemoInfo();
    super.onInit();
  }

  void apiGetDemoInfo() async {
    this.demo.value = await repository.getDemo();
  }
}
