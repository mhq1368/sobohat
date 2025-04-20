import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobohat/Models/zekr_model.dart';
import 'package:sobohat/Services/dio_services.dart';
import 'package:sobohat/const/url_const.dart';

class DetailNamazTaghebatController extends GetxController {
  RxBool loading = false.obs;
  RxList<ZekrModel> zekrList = <ZekrModel>[].obs;

  getZekrList(int namazid) async {
    try {
      loading.value = true;
      zekrList.clear();
      Future.delayed(const Duration(seconds: 3));
      var response =
          await ApiService().getMethod(UrlConst.zekrList + namazid.toString());

      if (response.statusCode == 200) {
        var data = response.data;
        zekrList.value =
            (data as List).map((item) => ZekrModel.fromJson(item)).toList();

        debugPrint('Zekr List: $data');
        debugPrint('Zekr Link: ${UrlConst.zekrList}${namazid.toString()}');
      }
    } finally {
      loading.value = false;
    }
  }
}
