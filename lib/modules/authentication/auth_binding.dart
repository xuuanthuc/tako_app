import 'package:get/get.dart';
import 'package:tako_app/modules/authentication/auth_controller.dart';
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}