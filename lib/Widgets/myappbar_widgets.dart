import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/const/device_function.dart';
import 'package:sobohat/const/helper_size.dart';
import 'package:sobohat/gen/assets.gen.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.appsize,
  });

  final MediaQueryData appsize;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    // final iconsize = deviceBasedSizeIcons(context);

    // final widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: appsize.size.width / 15, right: appsize.size.width / 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Assets.logo2.image(
                width: responsive.scaleWidth + 65,
                height: responsive.scaleHeight + 65),
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
