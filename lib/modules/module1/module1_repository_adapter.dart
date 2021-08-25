import 'package:mylan_app/models/module1/demo_model.dart';

abstract class IModule1Repository {
  Future<Object> getWeatherFromCity(String city);
  Future<DemoModel> getDemo();
}
