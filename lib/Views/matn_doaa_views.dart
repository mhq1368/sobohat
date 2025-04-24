import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobohat/Controllers/matn_doa_controller.dart';
import 'package:sobohat/Widgets/divider.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/gen/assets.gen.dart';

// late MatnDoaController controller1;
late int namazid, zekrid, index;
late String zekrname;

class MatnDoaaViews extends StatelessWidget {
  final args = Get.arguments as Map<String, dynamic>;
  final MatnDoaController controller = Get.put(MatnDoaController());

  late final int namazid, zekrid, index;
  late final String zekrname;

  MatnDoaaViews({super.key}) {
    namazid = args['namazid'];
    zekrid = args['zekrid'];
    zekrname = args['zekrname'];
    index = args['index'];

    controller.getmatndoa(zekrid); // ← مهم: اینجا داده رو لود کن
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("zekrid : $zekrid");
    debugPrint("namazid : $namazid");
    debugPrint("zekrname : $zekrname");
    debugPrint("index : $index");
    var appsize = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: -appsize.size.width / 50,
        automaticallyImplyLeading: false,
        title: MyAppBar(appsize: appsize),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg.path),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: SizedBox(
          height: appsize.size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(appsize.size.height / 35),
                  child: Text(zekrname,
                      style: TextStyle(
                          fontSize: appsize.size.width / 15,
                          color: Colors.white)),
                ),
              ),
              MyDivider(appWidth: appsize.size.width),
              Expanded(
                child: Obx(() {
                  if (controller.loading.value) {
                    return mainLoading(appsize.size.height);
                  }
                  if (controller.matnlist.isEmpty ||
                      index >= controller.matnlist.length) {
                    return Text('متن دعا موجود نیست!');
                  }
                  return Container(
                    padding: EdgeInsets.all(appsize.size.height / 85),
                    decoration: BoxDecoration(),
                    child: SelectableText(
                      controller.matnlist[index].matntext!,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: appsize.size.width / 17,
                          color: Colors.white),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
