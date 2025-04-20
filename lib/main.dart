// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Views/about_page_views.dart';
import 'package:sobohat/Views/home_page_views.dart';
import 'package:sobohat/Views/matn_doaa_views.dart';
import 'package:sobohat/Views/prayer_detail_page_views.dart';

void main() {
  runApp(
    PrayerApp(),
  );
}

class PrayerApp extends StatelessWidget {
  const PrayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var appsize = MediaQuery.of(context);
    return GetMaterialApp(
      locale: Locale('fa'),
      debugShowCheckedModeBanner: false,
      title: 'سُبُحات',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.vazirmatnTextTheme(),
        scaffoldBackgroundColor: Color(0xFFF7F6F3),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade700,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      // initialBinding: BindingsBuilder(() {
      //   Get.put(PrayerController());
      // }),
      // initialRoute: '/',
      getPages: [
        GetPage(name: AppRoutes.home, page: () => HomePage()),
        GetPage(name: AppRoutes.detail, page: () => PrayerDetailPage()),
        GetPage(name: AppRoutes.about, page: () => AboutPage()),
        GetPage(name: AppRoutes.matn, page: () => MatnDoaaViews()),
      ],
    );
  }
}

class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String detail = '/detail';
  static const String matn = '/matn';
  static const String about = '/about';
}
