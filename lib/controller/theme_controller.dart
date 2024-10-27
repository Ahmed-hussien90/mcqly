import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  bool isDark = true;
  SharedPreferences? sharedPreferences;

  @override
  void onInit() {
    initTheme();
    super.onInit();
  }

  Future<void> initTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isDark = sharedPreferences?.getBool("isDark") ?? true;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  Future<void> changeTheme() async {
    await sharedPreferences?.setBool("isDark", !isDark);
    isDark = !isDark;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
