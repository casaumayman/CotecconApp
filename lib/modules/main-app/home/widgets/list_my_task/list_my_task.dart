import 'package:coteccons_app/modules/main-app/home/widgets/list_my_task/list_my_task_controller.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/routes/app_pages.dart';

import 'package:get/get.dart';

class ListMyPrivateTask extends GetView<ListMyTaskController> {
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
                      .map((task) => PrivateTaskWidget(
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
