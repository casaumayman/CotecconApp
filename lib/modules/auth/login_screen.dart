import 'package:flutter/material.dart';
import 'package:coteccons_app/modules/auth/widgets/login_form.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    // return SizedBox();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Image.asset("assets/images/logo.png"),
                    )),
                LoginForm(),
                // Spacer(
                //   flex: 1,
                // )
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
