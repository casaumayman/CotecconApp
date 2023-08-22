import 'dart:convert';

import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPopupMenu extends StatelessWidget {
  UserPopupMenu({super.key});
  final storage = Get.find<SharedPreferences>();

  void _logout() async {
    await Future.wait([
      storage.remove(StorageConstants.token),
      storage.remove(StorageConstants.userInfo)
    ]);
    await Get.offNamed(Routes.LOGIN, preventDuplicates: false);
  }

  @override
  Widget build(BuildContext context) {
    String? userJson = storage.getString(StorageConstants.userInfo);
    String username = "AB";
    if (userJson != null) {
      try {
        Map<String, dynamic> userMap = jsonDecode(userJson);
        User? user = User.fromJson(userMap);
        username = (user.name ?? user.email) ?? "AB";
      } catch (e) {
        _logout();
      }
    }
    // Get.offNamed(Routes.LOGIN);
    return PopupMenuButton(
      child: CircleAvatar(
        radius: 18,
        child: Text(
          username.substring(0, 2),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: Text(username),
            value: 'username',
          ),
          PopupMenuItem(
            child: Text('Đăng xuất'),
            value: 'logout',
            onTap: _logout,
          ),
        ];
      },
    );
  }
}
