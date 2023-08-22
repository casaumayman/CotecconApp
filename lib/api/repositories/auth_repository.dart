import 'dart:async';

import 'package:dio/dio.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart';

class AuthRepository {
  AuthRepository();

  final Dio apiProvider = Get.find();

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.post('/auth', data: data.toJson());
    return LoginResponse.fromJson(res.data);
  }

  Future<User?> getUserInfo() async {
    final res = await apiProvider.get('/me');
    return User.fromJson(res.data);
  }
}
