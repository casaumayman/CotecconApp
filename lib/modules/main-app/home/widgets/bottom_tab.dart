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
                  Icons.public,
                ),
                label: "Giao việc"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                ),
                label: "Của tôi"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.task_sharp,
                ),
                label: "Được phân công"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.checklist,
                ),
                label: "Kiểm soát"),
          ],
        ));
  }
}
