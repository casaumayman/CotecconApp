import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

void responseInterceptor(
    Response<dynamic> response, ResponseInterceptorHandler handler) async {
  EasyLoading.dismiss();
  responseLogger(response);
  return handler.next(response);
}

void handleErrorStatus(DioException err, ErrorInterceptorHandler handler) {
  // final message = ErrorResponse.fromJson(response.body);
  EasyLoading.dismiss();
  CommonWidget.toast(err.message ?? 'Unknow error');
  debugPrint('Error ${err.requestOptions.path}: ${err.message}');
  return handler.next(err);
}

void responseLogger(Response response) {
  debugPrint('Status Code: ${response.statusCode}');
  debugPrint('Data: ${response.data['data']}');
  debugPrint('-----------------------------------------------');
}
