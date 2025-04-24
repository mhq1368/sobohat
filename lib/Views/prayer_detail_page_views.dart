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
    var appsize = MediaQuery.of(context);
    controllerDetail.getZekrList(nid);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -appsize.size.width / 50,
        title: MyAppBar(appsize: appsize),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg.path),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(
                    appsize.size.width / 25,
                    appsize.size.height / 25,
                    appsize.size.width / 15,
                    appsize.size.height / 100),
                child: Container(
                  padding: EdgeInsets.only(
                    left: appsize.size.width / 10,
                    right: appsize.size.width / 10,
                    top: appsize.size.height / 55,
                    bottom: appsize.size.height / 55,
                  ),
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
                      fontSize: appsize.size.height / 35,
                      color: const Color.fromARGB(
                          255, 255, 255, 255), // رنگ متن آبی برای تضاد بیشتر
                      fontWeight: FontWeight.bold, // فونت بولد
                    ),
                  ),
                )),
            Expanded(
              child: Obx(() {
                if (controllerDetail.loading.value) {
                  return Center(child: mainLoading(appsize.size.height));
                }
                return ListView.builder(
                  itemCount: controllerDetail.zekrList.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                      left: appsize.size.width / 10,
                      right: appsize.size.width / 10,
                      top: appsize.size.height / 55,
                      bottom: appsize.size.height / 55),
                  itemBuilder: (context, index) {
                    final zekr = controllerDetail.zekrList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.matn, arguments: {
                          'namazid': controllerDetail.zekrList[index].namazId,
                          'zekrid': controllerDetail.zekrList[index].taghebatId,
                          'zekrname':
                              controllerDetail.zekrList[index].taghebatTitle,
                          'index': 0
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: appsize.size.width / 55,
                            right: appsize.size.width / 55,
                            top: appsize.size.height / 55,
                            bottom: appsize.size.height / 55),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: appsize.size.height / 45,
                                bottom: appsize.size.height / 45),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        appsize.size.width / 65,
                                        appsize.size.height / 150,
                                        appsize.size.width / 65,
                                        appsize.size.height / 150),
                                    child: Center(
                                      child: Text(
                                        zekr.taghebatTitle!,
                                        style: GoogleFonts.cairo(
                                          color: Colors.black,
                                          fontSize: appsize.size.width / 27,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
