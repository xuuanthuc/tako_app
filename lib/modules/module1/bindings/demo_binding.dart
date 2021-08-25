import 'package:get/get.dart';

import '../../../data/repository/module1_repository.dart';
import '../controllers/demo_controller.dart';
import '../module1_repository_adapter.dart';


class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IModule1Repository>(() => Module1Repository());
    Get.lazyPut<DemoController>(() => DemoController());
  }
}
