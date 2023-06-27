import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:get/get.dart';

class AuthRepository {
  AuthRepository();

  final Dio apiProvider = Get.find();

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.post('/auth', data: data.toJson());
    return LoginResponse.fromJson(res.data);
  }
}
