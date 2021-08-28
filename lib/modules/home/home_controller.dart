import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
import 'package:tako_app/models/brand_model.dart';

class HomeController extends GetxController {
  final database = FirebaseDatabase.instance.reference();
  RxString pathBanner1 = "https://".obs;
  RxString pathBanner2 = ''.obs;
  RxString pathBanner3 = ''.obs;
  RxBool isLoading = false.obs;
  RxList listBrands = <Brand>[].obs;
  RxList listBranchs = <Branch>[].obs;
  var branch = Branch().obs;

  //TODO: Banner
  Future<void> getBanner() async {
    isLoading.value = true;
    await database.child('src/images/carousel/banner-1').once().then((banner) {
      pathBanner1.value = banner.value;
    });
    await database.child('src/images/carousel/banner-2').once().then((banner) {
      pathBanner2.value = banner.value;
    });
    await database.child('src/images/carousel/banner-3').once().then((banner) {
      pathBanner3.value = banner.value;
    });
    isLoading.value = false;
  }

  //TODO: Brand: tocotoco, hightland, lotte, royalte, dingtea.....

  Future<void> getBrandOf({required String brand}) async {
    await database.child('brands/$brand/brandName').once().then((value) {
      print(value.value);
    });
  }

  Future<void> getBranchOfBrand({required String brand}) async {
    await database.child('brands/$brand/branchs').get().then(
      (event) {
        final data = Map<String, dynamic>.from(event.value);
        var list = <Branch>[];
        data.forEach(
          (key, value) {
            list.add(Branch(
              id: key,
              branchName: value['branchName'],
            ));
            print(value['branchName']);
          },
        );
        listBranchs.value = list;
      },
    );
  }

  Future<void> getAllBrand() async {
    database.child('brands').get().then(
      (event) {
        final data = Map<String, dynamic>.from(event.value);
        var list = <Brand>[];
        data.forEach((key, value) {
            print(key);
            list.add(Brand(
              key: key,
              brandName: value['brandName'],
              thumbnail: value['thumbnail'],
            ));
          },
        );
        listBrands.value = list;
      },
    );
  }

  Future<void> setNewBranchOfBrand({required String brand}) async {
    final newBranch = <String, dynamic>{
      'branchName': 'Hello 1',
      'latitude': 21.212323423,
      'longtitude': 123.123124325,
    };
    await database.child('brands/$brand/branchs').push().set(newBranch);
  }

  Future<void> setNewBrand() async {
    final newBrand = {
      'brands/royalTea/brandName': 'newBrand',
      'brands/royalTea/thumbnail': 'hello',
    };
    await database.update(newBrand);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllBrand();
    getBanner();
  }
}
