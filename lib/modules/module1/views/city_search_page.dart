import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylan_app/modules/module1/views/home_weather_page.dart';
import 'package:mylan_app/util/constants/locale_keys.dart';

class CitySearchPage extends StatelessWidget{

  final TextEditingController _cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.enter_city_name.tr)),
      body: Form(
        child: Row(
          children: <Widget>[
            searchTextField(),
            searchButton(context)
          ],
        ),
      ),
    );
  }

  IconButton searchButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        // Get.to(() => HomeWeatherPage(city: _cityTextController.text));
        Get.to(HomeWeatherPage(city: _cityTextController.text));
      },
    );
  }

  Expanded searchTextField() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: TextFormField(
            controller: _cityTextController,
            decoration: InputDecoration(
                labelText: LocaleKeys.enter_city_name.tr,
                hintText: LocaleKeys.example_city.tr
            )
        ),
      ),
    );
  }

}