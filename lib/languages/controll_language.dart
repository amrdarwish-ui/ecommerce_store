import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageControll extends GetxController {
  @override
  void onInit() {
    getLang().then((value) {
      Get.updateLocale(Locale(value));
    });
    super.onInit();
  }

  Future<String> getLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString('lang') == null) {
      preferences.setString('lang', 'en');
      return preferences.getString('lang').toString();
    } else {
      return preferences.getString('lang').toString();
    }
  }
}
