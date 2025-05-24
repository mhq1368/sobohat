import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/fetch_description_file.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/const/helper_size.dart';

import '../gen/assets.gen.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    var appsize = MediaQuery.of(context);
    final responsive = ResponsiveHelper(context);
    final controller = Get.put(FetchDescriptionFile());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: -responsive.screenWidth / 3,
        title: MyAppBar(
          appsize: appsize,
        ),
        toolbarHeight: responsive.screenHeight / 13,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg.path),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () {
            return controller.fetchHtml();
          },
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: mainLoading(responsive.screenWidth * 2));
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0 * responsive.scale),
              child: Html(data: controller.htmlContent.value, style: {
                "*": Style(
                  color: Colors.white,
                  fontSize: FontSize(responsive.screenWidth / 26),
                  fontFamily: GoogleFonts.vazirmatn().fontFamily,
                ),
                "h2": Style(
                  fontSize: FontSize(responsive.screenWidth / 20),
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontFamily: GoogleFonts.elMessiri().fontFamily,
                ),
                "p": Style(
                  textAlign: TextAlign.justify,
                  lineHeight: LineHeight(responsive.screenHeight / 300),
                ),
                "strong": Style(
                  textAlign: TextAlign.right,
                  fontFamily: GoogleFonts.vazirmatn().fontFamily,
                  lineHeight: LineHeight(responsive.screenHeight / 200),
                  color: Colors.white70,
                ),
                "blockquote": Style(
                  backgroundColor: Colors.black26,
                  padding: HtmlPaddings.all(10),
                  border: Border.symmetric(
                    vertical: BorderSide(color: Colors.amber, width: 4),
                  ),
                  textAlign: TextAlign.center,
                  color: Colors.white70,
                  fontSize: FontSize(responsive.screenWidth / 35),
                  fontFamily: GoogleFonts.vazirmatn().fontFamily,
                ),
              }),
            );
          }),
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
