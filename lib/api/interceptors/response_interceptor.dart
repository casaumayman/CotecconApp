import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart' as GetInstance;
import 'package:shared_preferences/shared_preferences.dart';

void responseInterceptor(
    Response<dynamic> response, ResponseInterceptorHandler handler) async {
  EasyLoading.dismiss();
  responseLogger(response);
  return handler.next(response);
}

void handleErrorStatus(DioException err, ErrorInterceptorHandler handler) {
  // final message = ErrorResponse.fromJson(response.body);
  EasyLoading.dismiss();
  debugPrint('Error ${err.requestOptions.path}: ${err.message}');
  if (err.response?.statusCode == 401) {
    CommonWidget.toastError("Phiên đang nhập đã hết hạn!");
    logout();
    return null;
  }
  CommonWidget.toastError(err.message ?? 'Unknow error');
  return handler.next(err);
}

void logout() {
  final storage = GetInstance.Get.find<SharedPreferences>();
  storage.remove("token").then((value) {
    if (value) {
      GetInstance.Get.offNamed(Routes.LOGIN);
    }
  });
}

void responseLogger(Response response) {
  debugPrint('Status Code: ${response.statusCode}');
  debugPrint('Data of ${response.requestOptions.path}: ${response.data}');
  debugPrint('-----------------------------------------------');
}
