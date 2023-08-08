import 'package:coteccons_app/modules/constructor-app/cons_home/cons_home.controller.dart';
import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/important_list/important_list.dart';
import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/notification_list/notification_list.dart';
import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/public_task_list/public_task_list.dart';
import 'package:coteccons_app/shared/shared.dart';
import './widgets/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsHomeScreen extends GetView<ConsHomeController> {
  ConsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Obx(() => _widgetTab[controller.currentTabIndex.value]),
      bottomNavigationBar: BottomTab(),
    );
  }

  final _widgetTab = <Widget>[
    ImportantList(),
    PublicTaskList(),
    NotificationList()
  ];
}
