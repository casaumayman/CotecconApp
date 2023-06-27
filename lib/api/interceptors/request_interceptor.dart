import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void requestInterceptor(
    RequestOptions options, RequestInterceptorHandler handler) {
  options.headers.addAll({"Content-Type": "application/json"});
  final storage = Get.find<SharedPreferences>();
  final token = storage.getString("token");
  if (token != null && token.isNotEmpty) {
    options.headers.addAll({'Authorization': 'Bearer $token'});
  }

  EasyLoading.show(status: 'loading...');
  requestlLogger(options);
  return handler.next(options);
}

void requestlLogger(RequestOptions request) {
  debugPrint('Url: ${request.method} ${request.path}');
}
