import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sobohat/gen/assets.gen.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.appsize,
  });

  final MediaQueryData appsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Assets.logo2.image(
              width: appsize.size.width / 5, height: appsize.size.height / 10),
        ),
        Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.only(
              left: appsize.padding.left + appsize.size.width / 20),
          child: Text('سُبُحات',
              style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w900,
                  fontSize: appsize.size.width / 16)),
        ),
      ],
    );
  }
}
