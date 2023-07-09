import 'package:coteccons_app/modules/home/home_controller.dart';
import 'package:coteccons_app/modules/home/widgets/bottom_tab.dart';
import 'package:coteccons_app/modules/home/widgets/list_audit_task/list_audit_task.dart';
import 'package:coteccons_app/modules/home/widgets/list_my_private_task/list_my_private_task.dart';
import 'package:coteccons_app/modules/home/widgets/list_private_task/list_private_task.dart';
import 'package:coteccons_app/modules/home/widgets/list_task/list_task.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Obx(() => _widgetMapping[controller.currentTabIndex.value]),
      bottomNavigationBar: BottomTab(),
    );
  }
}

List<Widget> _widgetMapping = [
  ListTask(),
  ListMyPrivateTask(),
  ListPrivateTask(),
  ListAuditTask(),
];
