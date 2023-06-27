import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginUsernameController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void login(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      try {
        final res = await authRepository.login(LoginRequest(
            username: loginUsernameController.text,
            password: loginPasswordController.text));
        if (res?.token != null) {
          final prefs = Get.find<SharedPreferences>();
          prefs.setString("token", res!.token);
          Get.toNamed(Routes.HOME);
        }
      } catch (e) {}
    }
  }

  @override
  void onClose() {
    super.onClose();
    loginUsernameController.dispose();
    loginPasswordController.dispose();
  }
}
