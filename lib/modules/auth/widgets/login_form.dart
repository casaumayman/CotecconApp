import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/custom_input.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<AuthController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInput(
                  controller: controller.loginUsernameController,
                  label: "Tên đăng nhập",
                  icon: Icon(Icons.account_circle_outlined),
                  placeHolder: "Vui lòng nhập username"),
              SizedBox(
                height: 10,
              ),
              CustomInput(
                controller: controller.loginPasswordController,
                label: "Mật khẩu",
                icon: Icon(Icons.lock_outline),
                placeHolder: "Vui lòng nhập mật khẩu",
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => controller.login(context),
                  child: Text("Đăng nhập"))
            ],
          ),
        ));
  }
}
