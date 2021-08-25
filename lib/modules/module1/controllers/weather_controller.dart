import 'package:get/get.dart';

import '../../../models/common/error_model.dart';
import '../../../models/module1/weather_model.dart';
import '../../common/error_page.dart';
import '../module1_repository_adapter.dart';


class WeatherController extends GetxController {
  var weather = WeatherModel().obs;
  var isLoading = false.obs;
  final IModule1Repository repository = Get.find();

  WeatherController();

  @override
  void onInit() {
    super.onInit();
  }

  void changeLazyLoad() {
    this.isLoading.value = !this.isLoading.value;
  }

  void apiGetWeatherInfo(String city) async {
    if (city == "") {
      this.weather.value = WeatherModel();
      return;
    }
    isLoading.value = true;
    try {
      repository.getWeatherFromCity(city).then((dynamic res) {
        isLoading.value = false;
        if (res is ErrorModel) {
          Get.to(ErrorPage(error: res));
        }
        else if (res is WeatherModel) {
          this.weather.value = res;
        }
        else {
          this.weather.value = WeatherModel();
        }
      });
    } catch (e) {
      isLoading.value = false;
      Get.to(ErrorPage(error: ErrorModel(message: e.toString())));
    }
  }
}
