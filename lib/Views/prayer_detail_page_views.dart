import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/detail_namaz_taghebat.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/gen/assets.gen.dart';
import 'package:sobohat/main.dart';

late DetailNamazTaghebatController controller;
late int nid;
late String nname;

class PrayerDetailPage extends StatelessWidget {
  final args = Get.arguments as Map<String, dynamic>;
  PrayerDetailPage({super.key}) {
    controller = Get.put(DetailNamazTaghebatController());
    // Get.arguments is used to pass data to this page
    nid = args['id'];
    nname = args['name'];
  }
  @override
  Widget build(BuildContext context) {
    var appsize = MediaQuery.of(context);
    controller.getZekrList(nid);

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
                        .withOpacity(0.12), // پس‌زمینه کم‌رنگ
                    borderRadius: BorderRadius.circular(15), // گوشه‌های گرد‌تر
                    border: Border.all(
                      color:
                          const Color.fromARGB(255, 255, 255, 255), // رنگ حاشیه
                      width: 0.85, // ضخامت حاشیه بیشتر
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // سایه بیشتر
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
                if (controller.loading.value) {
                  return Center(child: mainLoading(appsize.size.height));
                }
                return ListView.builder(
                  itemCount: controller.zekrList.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                      left: appsize.size.width / 10,
                      right: appsize.size.width / 10,
                      top: appsize.size.height / 55,
                      bottom: appsize.size.height / 55),
                  itemBuilder: (context, index) {
                    final zekr = controller.zekrList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.matn, arguments: {
                          'namazid': controller.zekrList[index].namazId,
                          'zekrid': controller.zekrList[index].taghebatId,
                          'zekrname': controller.zekrList[index].taghebatTitle,
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
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
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
