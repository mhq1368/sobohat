import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobohat/Models/namaz_model.dart';
import 'package:sobohat/Services/dio_services.dart';
import 'package:sobohat/const/url_const.dart';

class NamazController extends GetxController {
  RxBool isloading = false.obs;
  RxList<NamazModel> namazList = <NamazModel>[].obs;
  late StreamSubscription connectivitySubscription;
  @override
  void onInit() {
    super.onInit();
    getNamazList();
  }

  getNamazList() async {
    isloading.value = true; // 👈 این تضمین می‌کنه که لودینگ فعال بشه
    namazList.clear();
    try {
      // Simulate a network call
      // await Future.delayed(Duration(seconds: 2));
      // Fetch data from API or database here
      var response = await ApiService().getMethod(UrlConst.namazList);
      if (response.statusCode == 200) {
        var data = response.data;
        namazList.value =
            (data as List).map((item) => NamazModel.fromJson(item)).toList();
        debugPrint('Namaz List: $namazList');
      }
    } catch (e) {
      // Handle error
    } finally {
      isloading.value = false;
    }
  }
}
