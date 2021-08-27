import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
class HomeController extends GetxController {
  final database = FirebaseDatabase.instance.reference();
  RxString pathBanner1 = "https://".obs;
  RxString pathBanner2 = ''.obs;
  RxString pathBanner3 = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> getBanner() async {
    isLoading.value = true;
    await database.child('src/images/carousel/banner-1').once().then((banner) {pathBanner1.value = banner.value;});
    await database.child('src/images/carousel/banner-2').once().then((banner) {pathBanner2.value = banner.value;});
    await database.child('src/images/carousel/banner-3').once().then((banner) {pathBanner3.value = banner.value;});
    isLoading.value = false;
  }




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBanner();
  }
}
