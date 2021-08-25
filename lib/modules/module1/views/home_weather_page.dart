import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylan_app/modules/module1/controllers/weather_controller.dart';
import 'package:mylan_app/modules/module1/views/setting_page.dart';
import 'package:mylan_app/util/constants/locale_keys.dart';
import 'package:mylan_app/util/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'city_search_page.dart';

// ignore: must_be_immutable
class HomeWeatherPage extends StatelessWidget{

  final WeatherController _controller = Get.find();
  late SharedPreferences _preferences ;

  HomeWeatherPage({city = null}){
    // _controller.apiGetWeatherInfo(city ?? "");
    installPreferences(city);
  }

  Future<void> installPreferences(city) async{
    _preferences = await SharedPreferences.getInstance();
    if(city != null){
      _preferences.setString("cityName", city);
      _controller.apiGetWeatherInfo(city);
    }
    else {
      var c = _preferences.getString("cityName") ?? "";
      _controller.apiGetWeatherInfo(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (
      Container(
        child: Scaffold(
          appBar: buildAppBar(),
          body: homeBody(),
        )
      )
    );
  }

  Widget homeBody(){
    return Obx(() => Stack(
      children: [
        weatherInfo(),
        Visibility(
          visible: _controller.isLoading.value,
          child: lazyLoad(),
        )
      ],
    ));
  }

  Column weatherInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('${LocaleKeys.location} ${_controller.weather.value.location}',
            style: cardTextStyle
        ),
        Text('${LocaleKeys.min_temp} ${_controller.weather.value.minTemp} ${LocaleKeys.celsius}',
          style: cardTextStyle
        ),
        Text('${LocaleKeys.max_temp} ${_controller.weather.value.maxTemp}${LocaleKeys.celsius}',
            style: cardTextStyle
        ),
      ],
    );
  }

  Center lazyLoad(){
    return Center(child: CircularProgressIndicator());
  }

  AppBar buildAppBar(){
    return AppBar(
      title: Text(LocaleKeys.weather_app.tr),
      actions: <Widget>[
        settingButton(),
        searchButton()
      ]
    );
  }

  IconButton settingButton(){
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: (){
        // Get.to(SettingLangPage());
        Get.to(() => SettingLangPage());
      }
    );
  }

  IconButton searchButton(){
    return IconButton(
        icon: Icon(Icons.search),
        onPressed: (){
          Get.to(() => CitySearchPage());
        }
    );
  }
}

//ScreenUtil.init(
//       BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width,
//           maxHeight: MediaQuery.of(context).size.height),
//       designSize: Size(375, 812),
//     );


