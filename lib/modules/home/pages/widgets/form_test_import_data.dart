import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tako_app/util/constants/locale_keys.dart';

import '../../home_controller.dart';

class FormImport extends StatelessWidget {
  FormImport({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 80,),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'name',
            ),
          ),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(
              hintText: 'adress',
            ),
          ),
          TextField(
            controller: _districtController,
            decoration: InputDecoration(
              hintText: 'drictric',
            ),
          ),
          ElevatedButton(
              onPressed: () => _homeController.setNewBranchOfBrand(
                    brand: LocaleKeys.key_toco,
                    name: _nameController.text,
                    address: _addressController.text,
                    district: _districtController.text,
                  ),
              child: Text('import')
          ),
          ElevatedButton(
              onPressed: () => _homeController.setNewMenuOfBranch(
                key: '-MiBgxrKWes9uznq30tq',
                brand: LocaleKeys.key_toco,
              ),
              child: Text('import menu ')
          ),
          ElevatedButton(
              onPressed: () => _homeController.updateInfoBrand(brand: LocaleKeys.key_highland_coffee, name: _nameController.text),
              child: Text('Update Info ')
          ),
        ],
      ),
    );
  }
}
