import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  textTheme: TextTheme(
    titleSmall: TextStyle(
        color: const Color(0xFFf5f5f5),
        fontFamily: GoogleFonts.vazirmatn().fontFamily,
        fontWeight: FontWeight.w300),
  ),
  scaffoldBackgroundColor: Color(0xFFF7F6F3),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal.shade700,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

// کنترلر مدیریت تم
class ThemeController extends GetxController {
  // تنظیم اولیه روی تم لایت
  final String prefskey = "isDarkMode";
  var themeMode = ThemeMode.light.obs;
  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void loadTheme() async {
    themeMode.value = ThemeMode.light;
    Get.changeTheme(lightTheme);
    Get.changeThemeMode(ThemeMode.light);
  }
}
