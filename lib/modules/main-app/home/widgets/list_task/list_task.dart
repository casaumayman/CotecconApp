import 'package:coteccons_app/modules/main-app/home/widgets/list_task/list_task_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_task/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/routes/app_pages.dart';

import 'package:get/get.dart';

class ListTask extends GetView<ListTaskController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: RefreshIndicator(
            onRefresh: controller.fetchData,
            child: Obx(() {
              return ListView(
                padding: EdgeInsets.zero,
                children: controller.tasks
                    .map((task) => TaskWidget(
                          task: task,
                          onTap: () {
                            Get.toNamed(Routes.TASK_DETAIL, arguments: task.id);
                          },
                        ))
                    .toList(),
              );
            })),
      ),
    ]);
  }
}
