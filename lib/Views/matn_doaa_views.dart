import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobohat/Controllers/matn_doa_controller.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/gen/assets.gen.dart';

late MatnDoaController controller;
late int namazid, zekrid;
late String zekrname;

class MatnDoaaViews extends StatelessWidget {
  final args = Get.arguments as Map<String, dynamic>;
  MatnDoaaViews({super.key}) {
    controller = Get.put(MatnDoaController());
    namazid = args['namazid'];
    zekrid = args['zekrid'];
    zekrname = args['zekrname'];
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("zekrid : $zekrid");
    debugPrint("namazid : $namazid");
    debugPrint("zekrname : $zekrname");

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
              // SelectableText(controller.matnlist[zekrid].matntext!)
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
