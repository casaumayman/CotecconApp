import 'package:coteccons_app/modules/constructor-app/cons_home/cons_home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTab extends GetView<ConsHomeController> {
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
                  Icons.star_border_outlined,
                ),
                label: "Quan trọng"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.public_outlined,
                ),
                label: "Nhiệm vụ"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_outlined,
                ),
                label: "Thông báo"),
          ],
        ));
  }
}
