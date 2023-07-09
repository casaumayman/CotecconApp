import 'package:coteccons_app/modules/home/widgets/list_task/list_task_controller.dart';
import 'package:coteccons_app/modules/home/widgets/add_task_button.dart';
import 'package:coteccons_app/modules/home/widgets/list_task/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/routes/app_pages.dart';

import 'package:get/get.dart';

class ListTask extends GetView<ListTaskController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Công việc",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Obx(() => controller.isCTCApp.value
              ? AddTaskButton(
                  onPress: controller.goToAddScreen,
                )
              : SizedBox()),
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
                              Get.toNamed(Routes.TASK_DETAIL, arguments: task);
                            },
                          ))
                      .toList(),
                );
              })),
        ),
      ),
    ]);
  }
}