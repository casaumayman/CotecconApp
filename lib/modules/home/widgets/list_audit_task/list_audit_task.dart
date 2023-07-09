import 'package:coteccons_app/modules/home/widgets/add_task_button.dart';
import 'package:coteccons_app/modules/home/widgets/list_audit_task/list_audit_task_controller.dart';
import 'package:coteccons_app/modules/home/widgets/list_audit_task/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/routes/app_pages.dart';

import 'package:get/get.dart';

class ListAuditTask extends GetView<ListAuditTaskController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Kiểm soát",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          AddTaskButton(
            label: "Thêm kiểm soát",
            onPress: () {
              Get.toNamed(Routes.ADD_TASK);
            },
          ),
        ],
      ),
      Expanded(
        child: SafeArea(
          top: false,
          child: RefreshIndicator(
              onRefresh: () async {},
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
