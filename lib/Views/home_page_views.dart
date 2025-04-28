// views/home_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/namaz_controller.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/const/device_function.dart';
import 'package:sobohat/gen/assets.gen.dart';
import 'package:sobohat/main.dart';

late NamazController namazController;

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    namazController = Get.put(NamazController());
  }

  @override
  Widget build(BuildContext context) {
    final deviceSizeBanner = deviceBasedSizeBanner(context);
    final deviceSizeIcons = deviceBasedSizeIcons(context);
    final deviceSpaceFromtop = deviceSpaceFromTop(context);
    final deviceSpaceFromright = deviceSpaceFromRight(context);
    final deviceSpaceFromleft = deviceSpaceFromLeft(context);
    final deviceSize = deviceBasedWidgetSizeFixed(context);
    final toolbarHeight = toolBarHeight(context);
    final deviceSpaceG = deviceSpaceGrid(context);
    var appsize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // titleSpacing: -appsize.size.width / 50,
        title: MyAppBar(appsize: appsize),
        toolbarHeight: toolbarHeight,
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
                height: deviceSizeBanner.height,
                width: deviceSizeBanner.width,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: deviceSpaceFromtop.top,
                    right: deviceSpaceFromright.right,
                    left: deviceSpaceFromleft.left),
                child: Obx(() {
                  if (namazController.namazList.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: deviceSpaceG.width,
                          mainAxisSpacing: deviceSpaceG.height,
                          childAspectRatio: 1.1,
                          mainAxisExtent: deviceSize.height),
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
                              padding: EdgeInsets.only(
                                  top: deviceSpaceFromtop.top,
                                  right: deviceSpaceFromright.right,
                                  left: deviceSpaceFromleft.left),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(178),
                                borderRadius: BorderRadius.circular(
                                    deviceBasedRadius(context)),
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
                                              fontSize: deviceBasedFontSize(
                                                  context))),
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
                                  fontSize: appsize.size.width / 25))
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
                                  fontSize: appsize.size.width / 28)),
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
