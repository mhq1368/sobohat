// views/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/namaz_controller.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/gen/assets.gen.dart';
import 'package:sobohat/main.dart';

class HomePage extends StatelessWidget {
  late NamazController namazController;

  HomePage({super.key}) {
    namazController = Get.put(NamazController());
  }

  @override
  Widget build(BuildContext context) {
    var appsize = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: -appsize.size.width / 50,
        title: MyAppBar(appsize: appsize),
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
                height: appsize.size.height / 3.5,
                width: appsize.size.width,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Obx(
                () => namazController.namazList.isNotEmpty
                    ? ListView.builder(
                        itemCount: namazController.namazList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                Get.toNamed(AppRoutes.detail, arguments: {
                              'name':
                                  namazController.namazList[index].namazName,
                              'id': namazController.namazList[index].namazId,
                            }),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: appsize.size.height / 65,
                                  bottom: appsize.size.height / 65,
                                  right: appsize.size.width / 25,
                                  left: appsize.size.width / 25),
                              padding: EdgeInsets.only(
                                top: appsize.size.width / 30,
                                bottom: appsize.size.width / 30,
                                right: appsize.size.width / 30,
                                left: appsize.size.width / 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal.withOpacity(0.1),
                                    blurRadius: 15,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.wb_twilight,
                                      size: appsize.size.width / 13,
                                      color: Colors.teal),
                                  SizedBox(width: appsize.size.width / 25),
                                  Text(
                                      namazController
                                          .namazList[index].namazName!,
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: appsize.size.width / 20)),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
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
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
