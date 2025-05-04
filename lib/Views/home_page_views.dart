// views/home_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/namaz_controller.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/const/device_function.dart';
import 'package:sobohat/const/helper_size.dart';
import 'package:sobohat/gen/assets.gen.dart';
import 'package:sobohat/main.dart';

late NamazController namazController;

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    namazController = Get.put(NamazController());
  }

  @override
  Widget build(BuildContext context) {
    final deviceSizeIcons = deviceBasedSizeIcons(context);
    var appsize = MediaQuery.of(context);
    final responsive = ResponsiveHelper(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: -appsize.size.width / 3,
        title: MyAppBar(appsize: appsize),
        toolbarHeight: responsive.screenHeight / 13,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                Assets.banner.path,
                height: responsive.screenHeight / 4,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: responsive.scaledPaddingLTRB(15, 10, 15, 0),
                child: Obx(() {
                  if (namazController.namazList.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: responsive.scaleWidth + 25,
                          mainAxisSpacing: responsive.scaleHeight + 25,
                          childAspectRatio: 1.1,
                          mainAxisExtent: responsive.scale * 110),
                      itemCount: namazController.namazList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () =>
                              Get.toNamed(AppRoutes.detail, arguments: {
                            'name': namazController.namazList[index].namazName,
                            'id': namazController.namazList[index].namazId,
                          }),
                          child: Center(
                            child: Container(
                              padding: responsive.scaledPadding(2),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(178),
                                borderRadius: BorderRadius.circular(
                                    responsive.scaledRadius(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal.withAlpha(26),
                                    blurRadius: 15,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        Assets.hand.path,
                                        height: deviceSizeIcons.height,
                                        width: deviceSizeIcons.width,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          namazController
                                              .namazList[index].namazName!,
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: responsive
                                                  .scaledFontSize(12))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (namazController.isloading.value) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          mainLoading(appsize.size.height),
                          SizedBox(
                            height: appsize.size.height / 17,
                          ),
                          Text("لطفاً شکیبا باشید...",
                              style: GoogleFonts.elMessiri(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: responsive.scaledFontSize(11)))
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wifi_off,
                              size: appsize.size.width / 7,
                              color: Colors.redAccent),
                          SizedBox(height: appsize.size.height / 55),
                          Text("اطلاعات از سرور دریافت نگردید...",
                              style: GoogleFonts.elMessiri(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: responsive.scaledFontSize(11))),
                          SizedBox(height: appsize.size.height / 15),
                          ElevatedButton.icon(
                            onPressed: () {
                              namazController.getNamazList();
                            },
                            icon: Icon(Icons.refresh,
                                color: Colors.white70,
                                size: appsize.size.width / 20),
                            label: Text("تلاش مجدد",
                                style: GoogleFonts.vazirmatn(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: appsize.size.width / 25,
                                )),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: EdgeInsets.symmetric(
                                horizontal: appsize.size.width / 10,
                                vertical: appsize.size.height / 80,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    deviceBasedRadius(context)),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
