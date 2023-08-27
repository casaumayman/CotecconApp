import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTab extends GetView<HomeController> {
  const BottomTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() => BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: theme.primaryColor,
          currentIndex: controller.currentTabIndex.value,
          onTap: (idx) {
            controller.currentTabIndex.value = idx;
          },
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.create,
                ),
                label: "Giao việc"),
            BottomNavigationBarItem(
                icon: Icon(Icons.get_app), label: "Được giao"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Việc bản thân"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.safety_check,
                ),
                label: "An toàn"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: "Thông báo"),
          ],
        ));
  }
}
