import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/detail_namaz_taghebat.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/const/device_function.dart';
import 'package:sobohat/gen/assets.gen.dart';
import 'package:sobohat/main.dart';

late DetailNamazTaghebatController controllerDetail;
late int nid;
late String nname;

class PrayerDetailPage extends StatelessWidget {
  final args = Get.arguments as Map<String, dynamic>;
  PrayerDetailPage({super.key}) {
    controllerDetail = Get.put(DetailNamazTaghebatController());
    // Get.arguments برای گرفتن آرگومان هایی که از صفحه قبل به این صفحه پاس داده شده اند
    nid = args['id'];
    nname = args['name'];
  }
  @override
  Widget build(BuildContext context) {
    final deviceSpaceFromtop = deviceSpaceFromTop(context);
    final deviceSpaceFromright = deviceSpaceFromRight(context);
    final deviceSpaceFromleft = deviceSpaceFromLeft(context);
    final deviceSpaceFrombottom = deviceSpaceFromBottom(context);
    final toolbarHeight = toolBarHeight(context);
    var appsize = MediaQuery.of(context);
    controllerDetail.getZekrList(nid);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: MyAppBar(appsize: appsize),
        automaticallyImplyLeading: false,
        toolbarHeight: toolbarHeight,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg.path),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: deviceSpaceFromtop.top + 25,
              left: deviceSpaceFromleft.left,
              right: deviceSpaceFromright.right,
              bottom: deviceSpaceFrombottom.bottom + 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: deviceSpaceFromtop.top,
                    left: deviceSpaceFromleft.left,
                    right: deviceSpaceFromright.right,
                    bottom: deviceSpaceFrombottom.bottom),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 4, 75, 61)
                      .withAlpha(31), // پس‌زمینه کم‌رنگ
                  borderRadius: BorderRadius.circular(
                      deviceBasedRadius(context)), // گوشه‌های گرد‌تر
                  border: Border.all(
                    color:
                        const Color.fromARGB(255, 255, 255, 255), // رنگ حاشیه
                    width: 0.85, // ضخامت حاشیه بیشتر
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(51), // سایه بیشتر
                      offset: Offset(0, 8), // موقعیت سایه
                      blurRadius: 15, // شعاع بلور بیشتر
                    ),
                  ],
                ),
                child: Text(
                  'تعقیبات $nname',
                  style: GoogleFonts.lalezar(
                    fontSize: deviceBasedTitrFontSize(context),
                    color: const Color.fromARGB(
                        255, 255, 255, 255), // رنگ متن آبی برای تضاد بیشتر
                    fontWeight: FontWeight.bold, // فونت بولد
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: deviceSpaceFromleft.left + 30,
                      right: deviceSpaceFromright.right + 30),
                  child: Obx(() {
                    if (controllerDetail.loading.value) {
                      return Center(child: mainLoading(appsize.size.height));
                    }
                    return ListView.builder(
                      itemCount: controllerDetail.zekrList.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final zekr = controllerDetail.zekrList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.matn, arguments: {
                              'namazid':
                                  controllerDetail.zekrList[index].namazId,
                              'zekrid':
                                  controllerDetail.zekrList[index].taghebatId,
                              'zekrname': controllerDetail
                                  .zekrList[index].taghebatTitle,
                              'index': 0
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: deviceSpaceFromtop.top,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: deviceSpaceFromtop.top,
                                bottom: deviceSpaceFrombottom.bottom,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(
                                    deviceBasedRadius(context)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal.withAlpha(26),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  zekr.taghebatTitle!,
                                  style: GoogleFonts.cairo(
                                    color: Colors.black,
                                    fontSize: deviceBasedFontSize(context),
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
