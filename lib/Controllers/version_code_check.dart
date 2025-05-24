import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sobohat/const/helper_size.dart';

class VersionController extends GetxController {
  RxInt currentVersionCode = 0.obs;
  RxString currentVersionName = "".obs;

  RxInt serverVersionCode = 0.obs;
  RxString serverVersionName = "".obs;

  RxBool updateAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkVersion();
  }

  Future<void> checkVersion() async {
    await getAppVersion();
    await getServerVersion();

    if (serverVersionCode.value > currentVersionCode.value) {
      updateAvailable.value = true;
      Get.dialog(Builder(builder: (context) {
        final ResponsiveHelper responsive = ResponsiveHelper(context);
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            "بروزرسانی موجود است",
            style: TextStyle(
                fontSize: responsive.screenWidth / 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                fontFamily: GoogleFonts.vazirmatn().fontFamily),
          ),
          content: Text(
            "نسخه جدید برنامه منتشر شده است. لطفاً اپلیکیشن خود را بروزرسانی نمایید."
            " نسخه در حال استفاده شما : $currentVersionName"
            " نسخه جدید : $serverVersionCode",
            style: GoogleFonts.vazirmatn(
                fontSize: responsive.screenWidth / 25, color: Colors.black87),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text("باشه",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: responsive.screenWidth / 27)),
            ),
          ],
        );
      }));
    }
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersionCode.value = int.parse(packageInfo.buildNumber);
    currentVersionName.value = packageInfo.version;
  }

  Future<void> getServerVersion() async {
    try {
      var response =
          await Dio().get("https://sobohat.mahfannavar.ir/api/Version");
      var versionData = response.data[0];
      serverVersionCode.value = versionData["versionCode"];
      serverVersionName.value = versionData["versionName"];
    } catch (e) {
      print("خطا در دریافت نسخه از سرور: $e");
    }
  }
}
