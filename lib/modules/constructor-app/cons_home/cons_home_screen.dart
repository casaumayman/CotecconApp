import 'package:coteccons_app/modules/constructor-app/cons_home/cons_home.controller.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/shared.dart';
import './widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsHomeScreen extends GetView<ConsHomeController> {
  const ConsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Công việc",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        Expanded(
          child: SafeArea(
            top: false,
            child: RefreshIndicator(
                onRefresh: controller.fetchData,
                child: Obx(() {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: controller.tasks
                        .map((task) => TaskWidget(
                              task: task,
                              onTap: () {
                                Get.toNamed(Routes.TASK_DETAIL,
                                    arguments: task.id);
                              },
                            ))
                        .toList(),
                  );
                })),
          ),
        ),
      ]),
    );
  }
}
