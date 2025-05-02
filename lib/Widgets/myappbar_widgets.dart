import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/const/device_function.dart';
import 'package:sobohat/gen/assets.gen.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.appsize,
  });

  final MediaQueryData appsize;

  @override
  Widget build(BuildContext context) {
    final iconsize = deviceBasedSizeIcons(context);
    final widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: appsize.size.width / 15, right: appsize.size.width / 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widthDevice <= 391
              ? Container(
                  child: Assets.logo2.image(
                      width: iconsize.width + 45, height: iconsize.height + 45),
                )
              : (widthDevice > 391 && widthDevice <= 450)
                  ? Container(
                      child: Assets.logo2.image(
                          width: iconsize.width + 45,
                          height: iconsize.height + 45),
                    )
                  : (widthDevice > 450 && widthDevice <= 800)
                      ? Container(
                          child: Assets.logo2.image(
                              width: iconsize.width + 45,
                              height: iconsize.height + 45),
                        )
                      : Container(
                          child: Assets.logo2.image(
                              width: iconsize.width - 65,
                              height: iconsize.height - 65),
                        ),
          Text('سُبُحات',
              style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w900,
                  fontSize: deviceBasedTitrFontSize(context))),
        ],
      ),
    );
  }
}
