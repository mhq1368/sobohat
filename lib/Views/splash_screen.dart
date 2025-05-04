import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sobohat/Services/dio_services.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/const/helper_size.dart';
import 'package:sobohat/const/strings_const.dart';
import 'package:sobohat/const/url_const.dart';
import 'package:sobohat/gen/assets.gen.dart';
import 'package:sobohat/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    testApiConnection();
  }

  Future<void> testApiConnection() async {
    try {
      final response =
          await dio.get(UrlConst.namazList).timeout(Duration(minutes: 60));

      if (response.statusCode == 200) {
        //صبر اجباری
        await Future.delayed(Duration(seconds: 10));
        // اگر API در دسترس بود، به صفحه اصلی برو
        Get.offNamed(AppRoutes.home);
      }
    } catch (e) {
      if (!mounted) {
        return;
      }
      // اگر اتصال برقرار نشد، به صفحه خطا برو
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: StringsConst.titleerrorapitest,
        confirmBtnText: StringsConst.errorapitest,
        confirmBtnColor: Colors.green,
        title: StringsConst.dialogerrorapitest,
        onConfirmBtnTap: () {
          QuickAlert().isBlank;
          testApiConnection();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    var sizeapp = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.bg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.logo.path,
                  height: responsive.scaleHeight + 250,
                  width: double.infinity,
                ),
                SizedBox(
                  height: responsive.screenHeight / 150,
                ),
                mainLoading(responsive.screenHeight),
                SizedBox(
                  height: responsive.scaleHeight + 65,
                ),
                Text(
                  "به اپلیکیشن سُبُحات خوش آمدید",
                  style: TextStyle(
                      fontFamily: GoogleFonts.vazirmatn().fontFamily,
                      fontSize: responsive.scaledFontSize(19),
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
