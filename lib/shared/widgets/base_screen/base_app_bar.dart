import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarTitle(
            title: title,
          ),
          AppBarAction(
            title: title,
          )
        ],
      ),
    ));
  }
}

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
    this.title,
  });

  final String? title;

  void _onLogout() {
    var storage = Get.find<SharedPreferences>();
    storage.remove("token");
    Get.offNamed(Routes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return InkWell(
        onTap: _onLogout,
        child: Row(
          children: [
            Icon(Icons.logout),
            SizedBox(
              width: 10,
            ),
            Text(
              "Đăng xuất",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
    }
    return SizedBox();
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Text(
        title!,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      );
    }
    return Image.asset("assets/images/logo-white.png", height: 50);
  }
}
