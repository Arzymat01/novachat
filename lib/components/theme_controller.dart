import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;
  static const String _key = "isDarkMode";

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDark.value = prefs.getBool(_key) ?? false;

    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> changeTheme(bool value) async {
    isDark.value = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);

    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
}
