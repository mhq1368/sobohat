import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/Controllers/matn_doa_controller.dart';
import 'package:sobohat/Models/matn_doa_model.dart';
import 'package:sobohat/Widgets/my_bottom_menu.dart';
import 'package:sobohat/Widgets/myappbar_widgets.dart';
import 'package:sobohat/Widgets/myloading.dart';
import 'package:sobohat/const/device_function.dart';
import 'package:sobohat/gen/assets.gen.dart';

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

    controller.getmatndoa(zekrid); // داده‌ها رو لود کن
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    var appsize = MediaQuery.of(context);
    final toolbarheight = toolBarHeight(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -appsize.size.width / 3,
        automaticallyImplyLeading: false,
        title: MyAppBar(appsize: appsize),
        toolbarHeight: toolbarheight,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bg.path),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Stack(children: [
          Center(
            child: Image.asset(
              Assets.bGMatnDoa.path,
              height: appsize.size.height,
              width: appsize.size.width,
              fit: BoxFit.fill,
              color: Colors.white54,
            ),
          ),
          SizedBox(
            height: appsize.size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: appsize.size.height / 15,
                      bottom: appsize.size.height / 65,
                      left: appsize.size.height / 35,
                      right: appsize.size.height / 35,
                    ),
                    child: deviceWidth <= 391
                        ? Text(zekrname,
                            style: GoogleFonts.vazirmatn(
                              fontSize: deviceBasedFontSize(context) + 5,
                              color: Colors.white,
                            ))
                        : (deviceWidth > 391 && deviceWidth <= 450)
                            ? Text(zekrname,
                                style: GoogleFonts.vazirmatn(
                                  fontSize: deviceBasedFontSize(context) + 5,
                                  color: Colors.white,
                                ))
                            : Text(zekrname,
                                style: GoogleFonts.vazirmatn(
                                  fontSize: deviceBasedFontSize(context) + 5,
                                  color: Colors.white,
                                )),
                  ),
                ),
                deviceWidth <= 391
                    ? Image.asset(
                        "assets/tazhib.png",
                        height: deviceBasedWidgetSizeFixed(context).height - 50,
                        width: deviceBasedWidgetSizeFixed(context).width,
                        fit: BoxFit.cover,
                      )
                    : (deviceWidth > 391 && deviceWidth <= 450)
                        ? Image.asset(
                            "assets/tazhib.png",
                            height:
                                deviceBasedWidgetSizeFixed(context).height - 80,
                            width: deviceBasedWidgetSizeFixed(context).width,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/tazhib.png",
                            height: deviceBasedWidgetSizeFixed(context).height -
                                120,
                            width: deviceBasedWidgetSizeFixed(context).width,
                            fit: BoxFit.cover,
                          ),
                Expanded(
                  child: FutureBuilder<MatnDoaModel>(
                    future: controller.getmatndoa(zekrid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: mainLoading(appsize.size.height),
                        );
                      } else if (snapshot.hasError) {
                        return Text('خطا: ${snapshot.error}');
                      } else {
                        String fileUrl = snapshot.data!.matntext ?? '';
                        return FutureBuilder<String>(
                          future: controller.fetchHtmlFromUrl(fileUrl),
                          builder: (context, htmlSnapshot) {
                            if (htmlSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return mainLoading(appsize.size.height);
                            } else if (htmlSnapshot.hasError) {
                              return Text(
                                  'خطا در دانلود: ${htmlSnapshot.error}');
                            } else {
                              // فقط بخش <body> رو جدا می‌کنیم
                              // String rawHtml = htmlSnapshot.data!;
                              // String bodyContent = rawHtml.contains("<body>")
                              //     ? rawHtml
                              //         .split("<body>")
                              //         .last
                              //         .split("</body>")
                              //         .first
                              //     : rawHtml;

                              return Padding(
                                padding: EdgeInsets.only(
                                  top: appsize.size.height / 100,
                                  bottom: appsize.size.height / 12,
                                  left: appsize.size.width / 25,
                                  right: appsize.size.width / 25,
                                ),
                                child: SingleChildScrollView(
                                  child: Html(
                                    data: htmlSnapshot.data!,
                                    style: {
                                      "*": Style(
                                        color: Colors.white,
                                        fontSize:
                                            FontSize(appsize.size.width / 20),
                                        fontFamily:
                                            GoogleFonts.vazirmatn().fontFamily,
                                      ),
                                      "h2": Style(
                                        fontSize:
                                            FontSize(appsize.size.width / 15),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                        fontFamily:
                                            GoogleFonts.elMessiri().fontFamily,
                                      ),
                                      "p": Style(
                                          textAlign: TextAlign.justify,
                                          lineHeight: LineHeight(
                                              appsize.size.height / 350)),
                                      "strong": Style(
                                        fontFamily:
                                            GoogleFonts.vazirmatn().fontFamily,
                                        lineHeight: LineHeight(
                                            appsize.size.height / 350),
                                        color: Colors.white70,
                                      ),
                                      "blockquote": Style(
                                        backgroundColor: Colors.black26,
                                        padding: HtmlPaddings.all(10),
                                        border: Border.symmetric(
                                          vertical: BorderSide(
                                              color: Colors.amber, width: 3),
                                        ),
                                        textAlign: TextAlign.center,
                                        color: Colors.white70,
                                        fontSize:
                                            FontSize(appsize.size.width / 23),
                                        fontFamily:
                                            GoogleFonts.vazirmatn().fontFamily,
                                      ),
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(appsize: appsize),
    );
  }
}
