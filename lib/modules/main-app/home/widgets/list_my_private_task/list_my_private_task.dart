import 'package:coteccons_app/modules/main-app/home/widgets/list_my_private_task/list_my_private_task_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_my_private_task/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/routes/app_pages.dart';

import 'package:get/get.dart';

class ListMyPrivateTask extends GetView<ListMyPrivateTaskController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                              Get.toNamed(Routes.PRIVATE_TASK_DETAIL,
                                  arguments: {"task": task, "isOwn": true});
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
