import 'package:flutter/material.dart';
import 'package:sobohat/const/device_function.dart';

import '../gen/assets.gen.dart';

class TestPAge extends StatelessWidget {
  const TestPAge({super.key});

  @override
  Widget build(BuildContext context) {
    // var appsize = MediaQuery.of(context);
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.bg.path),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Center(
        child: deviceBasedWidgetSizeFixed(context).width <= 391
            ? SizedBox(
                height: deviceBasedWidgetSizeFixed(context).height,
                width: deviceBasedWidgetSizeFixed(context).width,
                child: Image.asset(
                  Assets.bGMatnDoa.path,
                  fit: BoxFit.contain,
                  color: Colors.white54,
                ),
              )
            : SizedBox(
                height: deviceBasedWidgetSizeFixed(context).height * 12,
                width: deviceBasedWidgetSizeFixed(context).width * 8,
                child: Image.asset(
                  Assets.bGMatnDoa.path,
                  fit: BoxFit.contain,
                  color: Colors.white54,
                ),
              ),
      ),
    ));
  }
}
