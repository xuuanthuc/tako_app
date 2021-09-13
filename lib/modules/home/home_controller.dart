import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';
import 'package:tako_app/models/brand_model.dart';
import 'package:tako_app/models/category_model.dart';
import 'package:tako_app/util/common/logger.dart';

class HomeController extends GetxController {
  final database = FirebaseDatabase.instance.reference();
  RxString pathBanner1 = "https://".obs;
  RxString pathBanner2 = ''.obs;
  RxString pathBanner3 = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingCategory = false.obs;
  var listBrands = <Brand>[].obs;
  var listBranchs = <Branch>[].obs;
  var listCategory = <CategoryModel>[].obs;
  var listMenu = <MenuItem>[].obs;
  var branch = Branch().obs;

  RxString labelBrand = ''.obs;
  RxString titleCategory = ''.obs;
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

  Future<bool> getBranchOfBrand({required String brand}) async {
    try{
      await database.child('brands/$brand/branchs').get().then(
            (event) {
          final data = Map<String, dynamic>.from(event.value);
          var list = <Branch>[];
          data.forEach(
                (key, value) {
              list.add(Branch(
                branchId: key,
                brandId: brand,
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
      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool> getMenuOfBranch({
    required String brand,
    required String idBranch,
    required String branchName,
    required String branchAddress,
    required String branchDistrict,
  }) async {
    print('brands/$brand/branchs/$idBranch/menu');
    try{
      isLoading.value = true;
      await database.child('brands/$brand/branchs/$idBranch/menu').get().then(
            (event) {
          final data = Map<String, dynamic>.from(event.value);
          var list = <MenuItem>[];
          data.forEach(
                (key, value) {
              list.add(MenuItem(
                branchId: idBranch,
                brandId: brand,
                menuId: key,
                item: value['item'],
                price: value['price'],
                image: value['image'],
                type: value['type'],
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
      return true;
    }catch(e){
      print(e);
      isLoading.value = false;
      return false;
    }

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
                brandId: key,
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

  Future<bool> getCategory({required String category}) async {
    try{
      isLoadingCategory.value = true;
      titleCategory.value = category;
      database.child('category/$category/menu').get().then(
            (event) {
          final data = Map<String, dynamic>.from(event.value);
          var list = <CategoryModel>[];
          data.forEach(
                (key, value) {
              Logger.info(key);
              list.add(
                  CategoryModel(
                      id: key,
                      type: category,
                      address: value['address'],
                      description: value['description'],
                      item: value['item'],
                      imageUrl: value['imageUrl'],
                      price: value['price']
                  )
              );
            },
          );
          listCategory.value = list;
        },
      );
      isLoadingCategory.value = false;
      return true;
    }catch (e){
      isLoadingCategory.value = false;
      return false;
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllBrand();
    getBanner();
  }
}
