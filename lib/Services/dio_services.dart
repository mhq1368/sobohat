// lib/data/services/api_service.dart
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sobohat/const/url_const.dart';

final Dio dio = Dio(BaseOptions(
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 15),
  sendTimeout: const Duration(seconds: 15),
));

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: UrlConst.baseUrl, // آدرس بک‌اند
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
  ApiService() {
    try {
      // غیرفعال کردن بررسی SSL
      (dio.httpClientAdapter as dynamic).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    } catch (e) {
      debugPrint("Dio Error: $e");
    }
  }
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json'; //تعیین نوع هدر
    try {
      return await dio.get(url,
          options: Options(responseType: ResponseType.json, method: 'GET'));
    } catch (e) {
      debugPrint("Dio Error: $e");
      rethrow; // یا مدیریت خطای بهتر
    }
  }

  // در آینده: متد برای اضافه کردن توکن
  static void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
