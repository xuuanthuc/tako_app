import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:tako_app/models/userModel.dart';
import 'package:tako_app/modules/splash/effects_screen.dart';
import 'package:tako_app/util/common/show_toast.dart';

import '../../app_pages.dart';

class AuthController extends GetxController {
  RxBool isLogin = true.obs;
  RxString username = ''.obs;
  RxString name = ''.obs;
  RxString password = ''.obs;

  var user = User().obs;
  List listUser = <User>[].obs;
  final database = FirebaseDatabase.instance.reference();

  void sumbit() {
    if (isLogin.value == true) {
      login();
    } else {
      register();
    }
  }

  Future<void> register() async {
    await getAPiUserRegister();
    if (username.value == user.value.username) {
      showToast("Số điện thoại hoặc email đã tồn tại");
    } else {
      setUserToDB();
    }
  }

  Future<void> resetPassword({required String newPass}) async {
    await getAPiUserRegister();
    if (username.value == user.value.username) {
      await database.child('users/${user.value.id}').update(
        {
          'password': newPass,
        },
      );
      showToast("Đã cập nhật thành công");
      Get.back();
    } else {
      showToast("Số điện thoại hoặc email không tồn tại");
    }
  }

  Future<void> setUserToDB() async {
    final nextuser = <String, dynamic>{
      'username': username.value,
      'password': password.value,
      'name': name.value,
    };
    await database.child('users').push().set(nextuser);
    showToast("Đăng ký thành công");
    isLogin.value = true;
  }

  Future<void> login() async {
    await getAPiUserLogin();
    await Future.delayed(Duration(milliseconds: 450));
    if (username.value == user.value.username &&
        password.value == user.value.password) {
      Get.toNamed(Routes.EFFECT);
    } else {
      showToast("Tài khoản hoặc mật khẩu không chính xác");
    }
  }

  Future<void> getAPiUserLogin() async {
    await database.child('users').get().then(
      (event) {
        final data = Map<String, dynamic>.from(event.value);
        data.forEach(
          (key, value) {
            var userN = value['username'];
            var passW = value['password'];
            if (username.value == userN && password.value == passW) {
              user.value = User(
                id: key,
                username: userN,
                password: passW,
                name: value['name'],
              );
            } else {}
          },
        );
      },
    );
  }

  Future<void> getAPiUserRegister() async {
    await database.child('users').get().then(
      (event) {
        final data = Map<String, dynamic>.from(event.value);
        data.forEach(
          (key, value) {
            var userN = value['username'];
            if (username.value == userN) {
              user.value = User(
                id: key,
                username: userN,
                password: value['password'],
                name: value['name'],
              );
            } else {}
          },
        );
      },
    );
  }
}
