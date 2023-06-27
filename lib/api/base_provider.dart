import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api.dart';

class BaseProvider {
  Dio dio = Dio();

  BaseProvider() {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.receiveTimeout = Duration(seconds: 10);
    dio.options.responseType = ResponseType.json;
    dio.transformer = BackgroundTransformer()
      ..jsonDecodeCallback = (jsonString) {
        return compute((jsonStr) {
          final responseMap = jsonDecode(jsonString) as Map<String, dynamic>;
          if (responseMap['data'] != null) {
            return responseMap['data'];
          }
          return responseMap;
        }, jsonString);
      };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: requestInterceptor,
      onResponse: responseInterceptor,
      onError: handleErrorStatus,
    ));
  }
}
