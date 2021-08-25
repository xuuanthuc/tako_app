import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mylan_app/data/repository/module1_repository.dart';
import 'package:mylan_app/modules/module1/module1_repository_adapter.dart';
import 'package:mylan_app/modules/module1/controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IModule1Repository>(() => Module1Repository());
    Get.lazyPut<WeatherController>(() => WeatherController());
  }
}
