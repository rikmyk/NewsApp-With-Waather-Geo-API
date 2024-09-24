import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isDarkMode = false.obs;

  get weatherData => null;

  @override
  void onInit() {
    super.onInit();
    // Mengatur nilai isDarkMode berdasarkan tema sistem saat ini
    var brightness = PlatformDispatcher.instance.platformBrightness;
    isDarkMode.value = brightness == Brightness.dark;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
