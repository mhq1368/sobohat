import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sobohat/const/url_const.dart';

class FetchDescriptionFile extends GetxController {
  var isLoading = true.obs;
  var htmlContent = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHtml();
  }

  fetchHtml() async {
    try {
      isLoading(true);
      var response = await Dio().get(UrlConst.fileUrl);
      if (response.statusCode == 200) {
        htmlContent(response.data);
      } else {
        throw Exception('Failed to load HTML content');
      }
    } finally {
      isLoading(false);
    }
  }
}
