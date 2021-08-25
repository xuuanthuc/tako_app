import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/logger.dart';
import 'vi_VN.dart';
import 'en_US.dart';

class TranslationService extends Translations {
  static Locale? get locale {
    Logger.info(Get.deviceLocale.toString());
    return Get.deviceLocale;
  }

  static final languageCode = 'vi';
  static final countryCode = 'VN';
  static final fallbackLocale = Locale(languageCode, countryCode);
  static final langCodes = [
    'en',
    'vi',
  ];

  // các Locale được support
  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  // cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'vi_VN': vi_VN,
      };

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  static Locale _getLocaleFromLanguage({required String langCode}) {
    var lang = langCode; //?? Get.deviceLocale.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return locales[0];
  }
}
