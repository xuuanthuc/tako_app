import 'package:get/get.dart';
import 'package:tako_app/app_pages.dart';
import 'package:tako_app/util/constants/locale_keys.dart';
class PayController extends GetxController{
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

    void addQuality(){
        quality.value = quality.value + 1;
        total.value = price.value*quality.value;
    }
    void subtractQuality(){
        quality.value = quality.value - 1;
        total.value = price.value*quality.value;
    }

    Future<void> orderNow() async {
        isLoading.value = true;
        if(toppingNote == LocaleKeys.pearl || toppingNote == LocaleKeys.coconutJelly || toppingNote == LocaleKeys.grassJelly){
            total.value = total.value + quality.value*5000;
        } else if (toppingNote == LocaleKeys.mousses || toppingNote == LocaleKeys.whitePearl){
            total.value = total.value + quality.value*8000;
        } else{
            total.value = total.value + 0;
        }
        if (sizeNote == LocaleKeys.size_L){
            total.value = total.value + quality.value*6000;
        } else {
            total.value = total.value + 0;
        }
        await Future.delayed(Duration(seconds: 2));
        print('Tong tien: $total');
        print('Chon duong: $sugarNote');
        print('Chon da: $iceNote');
        print('Chon size: $sizeNote');
        print('Chon topping: $toppingNote');
        print('Not: $note');
        isLoading.value = false;
    }

    

}