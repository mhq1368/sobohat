import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  Get.toNamed(AppRoutes.detail);
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.circle_grid_3x3,
                        color: Colors.white),
                    onPressed: () {
                      Get.offAndToNamed(AppRoutes.home);
                    },
                  ),
                  Text("خانه")
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                icon:
                    Icon(CupertinoIcons.info_circle_fill, color: Colors.white),
                onPressed: () {
                  Get.toNamed(AppRoutes.about);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
