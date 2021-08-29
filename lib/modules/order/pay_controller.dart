import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/data/app_preferences.dart';
import 'package:tako_app/modules/authentication/auth_controller.dart';
import 'package:tako_app/modules/home/home_controller.dart';
import 'package:tako_app/util/constants/locale_keys.dart';

class PayController extends GetxController {
  final database = FirebaseDatabase.instance.reference();
  RxInt quality = 1.obs;
  RxInt price = 10000.obs;
  RxInt total = 1000.obs;
  RxString note = ''.obs;
  RxString sugarNote = '100% đường'.obs;
  RxString iceNote = '100% Đá'.obs;
  RxString toppingNote = 'Không chọn'.obs;
  RxString sizeNote = 'Size M'.obs;
  RxString itemImage = ''.obs;
  RxString itemName = ''.obs;
  RxBool isLoading = false.obs;

  void addQuality() {
    quality.value = quality.value + 1;
    total.value = price.value * quality.value;
  }

  void subtractQuality() {
    quality.value = quality.value - 1;
    total.value = price.value * quality.value;
  }

  Future<void> orderNow() async {
    isLoading.value = true;
    if (toppingNote == LocaleKeys.pearl ||
        toppingNote == LocaleKeys.coconutJelly ||
        toppingNote == LocaleKeys.grassJelly) {
      total.value = total.value + quality.value * 5000;
    } else if (toppingNote == LocaleKeys.mousses ||
        toppingNote == LocaleKeys.whitePearl) {
      total.value = total.value + quality.value * 8000;
    } else {
      total.value = total.value + 0;
    }
    if (sizeNote == LocaleKeys.size_L) {
      total.value = total.value + quality.value * 6000;
    } else {
      total.value = total.value + 0;
    }
    await Future.delayed(Duration(milliseconds: 600));
    print('Tong tien: $total');
    print('Chon duong: $sugarNote');
    print('Chon da: $iceNote');
    print('Chon size: $sizeNote');
    print('Chon topping: $toppingNote');
    print('Not: $note');
    isLoading.value = false;
  }

  Future<bool> order(
      {required String phoneNumber,
      required String address,
      required nameUser}) async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(microseconds: 300));
      var userId = AppPreference().getUID();
      final newOrder = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'address': address,
        'itemName': itemName.value,
        'totalPrice': total.value.toString(),
        'note': note.value,
        'detailOrder': '$sizeNote, $sugarNote, $iceNote, $toppingNote',
        'username': nameUser,
      };
      await database.child('orders').push().set(newOrder);
      await database.child('users/$userId/historyOrder').push().set(newOrder);
      isLoading.value = false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
