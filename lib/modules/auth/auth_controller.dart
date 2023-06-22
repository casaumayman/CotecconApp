import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

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
      final prefs = Get.find<SharedPreferences>();
      prefs.setString(StorageConstants.token, "token");
      Get.offNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
    loginUsernameController.dispose();
    loginPasswordController.dispose();
  }
}
