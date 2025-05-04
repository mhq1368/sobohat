// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sobohat/Controllers/theme_controller.dart';
import 'package:sobohat/Views/about_page_views.dart';
import 'package:sobohat/Views/home_page_views.dart';
import 'package:sobohat/Views/matn_doaa_views.dart';
import 'package:sobohat/Views/prayer_detail_page_views.dart';
import 'package:sobohat/Views/splash_screen.dart';

void main() {
  runApp(
    PrayerApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.teal.withAlpha(100),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: const Color(0xff1A2B47),
    systemNavigationBarContrastEnforced: true,
    statusBarBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: true,
  ));
  Get.put(ThemeController());
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
      theme: ThemeData(),
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
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
  static const String home = '/home';
  static const String splash = '/';
  static const String detail = '/detail';
  static const String matn = '/matn';
  static const String about = '/about';
}
