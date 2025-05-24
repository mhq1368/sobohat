import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/version_code_check.dart';
import 'package:sobohat/const/helper_size.dart';
import 'package:sobohat/main.dart';

class MyBottomNavigatorBar extends StatelessWidget {
  const MyBottomNavigatorBar({
    super.key,
    required this.appsize,
  });

  final MediaQueryData appsize;

  @override
  Widget build(BuildContext context) {
    final VersionController versionController = Get.put(VersionController());
    final ResponsiveHelper responsive = ResponsiveHelper(context);
    return SafeArea(
      child: Container(
        height: appsize.size.height / 10,
        decoration: BoxDecoration(
          color: Colors.teal.shade600,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (versionController.currentVersionCode !=
                      versionController.serverVersionCode) {
                    Get.dialog(
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        title: Text(
                          "بروزرسانی موجود است",
                          style: TextStyle(
                              fontSize: responsive.screenWidth / 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontFamily: GoogleFonts.vazirmatn().fontFamily),
                        ),
                        content: Text(
                          "نسخه جدید برنامه منتشر شده است. لطفاً اپلیکیشن خود را بروزرسانی نمایید.",
                          style: GoogleFonts.vazirmatn(
                              fontSize: responsive.screenWidth / 25,
                              color: Colors.black87),
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
                      ),
                    );
                  } else {
                    Get.snackbar("اطلاع", "شما آخرین نسخه را دارید",
                        snackPosition: SnackPosition.BOTTOM,
                        animationDuration: Duration(seconds: 3),
                        duration: Duration(seconds: 4),
                        colorText: Colors.white90);
                  }

                  debugPrint("${versionController.currentVersionCode}");
                  debugPrint("${versionController.serverVersionCode}");
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.teal.shade600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.system_update_alt_outlined,
                          color: Colors.white),
                      SizedBox(
                        height: appsize.size.height * 0.01,
                      ),
                      Text("بروزرسانی",
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoutes.home);
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.teal.shade600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.circle_grid_3x3_fill,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: appsize.size.height * 0.01,
                      ),
                      Text("خانه",
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.about);
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.teal.shade600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.info, color: Colors.white),
                      SizedBox(
                        height: appsize.size.height * 0.01,
                      ),
                      Text(
                        "توضیحات",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
