import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobohat/Models/matn_doa_model.dart';
import 'package:sobohat/Services/dio_services.dart';
import 'package:sobohat/const/url_const.dart';

class MatnDoaController extends GetxController {
  RxBool loading = false.obs;
  RxList<MatnDoaModel> matnlist = <MatnDoaModel>[].obs;

  Future<MatnDoaModel> getmatndoa(int tid) async {
    loading.value = true;
    matnlist.clear();
    var response =
        await ApiService().getMethod(UrlConst.matnList + tid.toString());

    if (response.statusCode == 200) {
      var data = response.data;
      if (data is List && data.isNotEmpty) {
        var firstItem = data.first;
        loading.value = false;
        return MatnDoaModel.fromJson(firstItem);
      } else {
        loading.value = false;
        throw Exception('هیچ متنی یافت نشد');
      }
    } else {
      loading.value = false;
      throw Exception('Failed to load data');
    }
  }

  Future<String> fetchHtmlFromUrl(String url) async {
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      debugPrint('HTML Content: ${response.data}');
      return response.data.toString();
    } else {
      throw Exception('Failed to load HTML file');
    }
  }
}
