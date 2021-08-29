import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
import 'package:tako_app/models/brand_model.dart';
import 'package:tako_app/util/common/logger.dart';

class HomeController extends GetxController {
  final database = FirebaseDatabase.instance.reference();
  RxString pathBanner1 = "https://".obs;
  RxString pathBanner2 = ''.obs;
  RxString pathBanner3 = ''.obs;
  RxBool isLoading = false.obs;
  var listBrands = <Brand>[].obs;
  var listBranchs = <Branch>[].obs;
  var listMenu = <MenuItem>[].obs;
  var branch = Branch().obs;

  RxString labelBrand = ''.obs;
  RxString thumbnailBrand = ''.obs;

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

  void getInfoBrand({required String brand}) async {
    isLoading.value = true;
    await database.child('brands/$brand/brandName').once().then((brandName) {
      labelBrand.value = brandName.value;
    });
    await database.child('brands/$brand/thumbnail').once().then((thumbnail) {
      thumbnailBrand.value = thumbnail.value;
    });
    isLoading.value = false;
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
              key: brand,
              branchName: value['branchName'],
              address: value['address'],
              district: value['district'],
            ));
            Logger.info(value['branchName']);
          },
        );
        listBranchs.value = list;
      },
    );
  }

  Future<void> getMenuOfBranch({
    required String brand,
    required String idBranch,
    required String branchName,
    required String branchAddress,
    required String branchDistrict,
  }) async {
    isLoading.value = true;
    print('brands/$brand/branchs/$idBranch/menu');
    await database.child('brands/$brand/branchs/$idBranch/menu').get().then(
      (event) {
        final data = Map<String, dynamic>.from(event.value);
        var list = <MenuItem>[];
        data.forEach(
          (key, value) {
            list.add(MenuItem(
              keyBranch: idBranch,
              keyRoot: brand,
              id: key,
              item: value['item'],
              price: value['price'],
              image: value['image'],
              branchName: branchName,
              address: branchAddress,
              district: branchDistrict,
            ));
            Logger.info("${value['item']}: ID: ${key}");
          },
        );
        listMenu.value = list;
      },
    );
    isLoading.value = false;
  }

  Future<void> getAllBrand() async {
    database.child('brands').get().then(
      (event) {
        final data = Map<String, dynamic>.from(event.value);
        var list = <Brand>[];
        data.forEach(
          (key, value) {
            Logger.info(key);
            list.add(Brand(
                key: key,
                brandName: value['brandName'],
                thumbnail: value['thumbnail'],
                closeTime: value['closeTime'],
                openTime: value['openTime']));
          },
        );
        listBrands.value = list;
      },
    );
  }

  Future<void> setNewBranchOfBrand(
      {required String brand,
      required String name,
      required String address,
      required String district}) async {
    final newBranch = <String, dynamic>{
      'branchName': name,
      'address': address,
      'district': district,
    };
    await database.child('brands/$brand/branchs').push().set(newBranch);
  }

  Future<void> setNewMenuOfBranch(
      {required String key, required String brand}) async {
    final newMenu = <String, dynamic>{
      'item': 'Hồng Long Xoài Trân Châu Baby',
      'image': 'https://tocotocotea.com/wp-content/uploads/2021/01/ezgif.com-gif-maker-1.jpg',
      'price': '22.0000',
    };
    await database.child('brands/$brand/branchs/$key/menu').push().set(newMenu);
  }

  Future<void> updateInfoBrand(
      {required String brand, required String name}) async {
    final newMenu = <String, dynamic>{
      'brandName': name,
      'openTime': '8:00',
      'closeTime': '22:00',
    };
    await database.child('brands/$brand/').update(newMenu);
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
