import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylan_app/util/constants/locale_keys.dart';
import 'package:mylan_app/util/lang/translation_service.dart';
import 'package:mylan_app/util/theme/app_theme.dart';

// chuyen ngon ngu
class SettingLangPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingLangPageState();
}

class _SettingLangPageState extends State<SettingLangPage> {

  String _selectedLang = TranslationService.languageCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.enter_city_name.tr),
        ),
        body: Column(
          children: [
            Text(
              LocaleKeys.home_string_1.tr,
              style: cardTextStyle,
            ),
            Container(
              child: Center(
                child: DropdownButton<String>(
                    icon: Icon(Icons.arrow_drop_down),
                    value: _selectedLang,
                    items: _buildDropdownMenuItems(),
                    onChanged: (String? newValue) {
                      setState(() => _selectedLang = newValue.toString());
                      TranslationService.changeLocale(newValue.toString());
                    }),
              ),
            ),
          ],
        )
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    var list = <DropdownMenuItem<String>>[];
    TranslationService.langs.forEach((key, value) {
      list.add(DropdownMenuItem<String>(
        value: key,
        child: Text(key),
      ));
    });
    return list;
  }
}
