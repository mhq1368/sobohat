import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobohat/Models/matn_doa_model.dart';
import 'package:sobohat/Services/dio_services.dart';
import 'package:sobohat/const/url_const.dart';

class MatnDoaController extends GetxController {
  RxBool loading = false.obs;
  RxList<MatnDoaModel> matnlist = <MatnDoaModel>[].obs;

  getmatndoa(int tid) async {
    loading.value = true;
    matnlist.clear();
    var response =
        await ApiService().getMethod(UrlConst.matnList + tid.toString());

    if (response.statusCode == 200) {
      var data = response.data;
      matnlist.value =
          (data as List).map((item) => MatnDoaModel.fromJson(item)).toList();
      debugPrint('Namaz List: $matnlist');
      debugPrint('Namaz List: ${UrlConst.matnList + tid.toString()}');
      loading.value = false;
    }
  }
}
