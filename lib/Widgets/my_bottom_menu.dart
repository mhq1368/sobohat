import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobohat/const/device_function.dart';
import 'package:sobohat/main.dart';

class MyBottomNavigatorBar extends StatelessWidget {
  const MyBottomNavigatorBar({
    super.key,
    required this.appsize,
  });

  final MediaQueryData appsize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: appsize.size.height / 10,
        decoration: BoxDecoration(
          color: Colors.teal.shade600,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: appsize.size.height / 150),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.home);
                  },
                  child: Column(
                    children: [
                      Icon(Icons.system_update_alt_outlined,
                          color: Colors.white),
                      SizedBox(
                        height: deviceSpaceFromTop(context).top / 2,
                      ),
                      Text("بروزرسانی",
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.home);
                  },
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.circle_grid_3x3, color: Colors.white),
                      SizedBox(
                        height: deviceSpaceFromTop(context).top / 2,
                      ),
                      Text("خانه",
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.about);
                  },
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.info, color: Colors.white),
                      SizedBox(
                        height: deviceSpaceFromTop(context).top / 2,
                      ),
                      Text(
                        "توضیحات",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
