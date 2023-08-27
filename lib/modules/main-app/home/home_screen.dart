import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/bottom_tab.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_assigned_task/list_assigned_task.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_audit_task/list_audit_task.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_my_task/list_my_task.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_task/list_task.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/tool_bar.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ToolBar(),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child:
                    Obx(() => _widgetMapping[controller.currentTabIndex.value]))
          ]),
      bottomNavigationBar: BottomTab(),
    );
  }
}

List<Widget> _widgetMapping = [
  ListTask(),
  ListAssignedTask(),
  ListMyPrivateTask(),
  ListAuditTask(),
  Text("Hehe")
];
