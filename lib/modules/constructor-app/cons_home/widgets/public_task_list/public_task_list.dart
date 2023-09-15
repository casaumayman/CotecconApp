import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/public_task_list/public_task_controller.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicTaskList extends GetView<PublicTaskListController> {
  const PublicTaskList({super.key});

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
                                  arguments: task.id ??
                                      task.publicId ??
                                      task.privateId);
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
