import 'package:coteccons_app/modules/main-app/home/widgets/list_audit_task/list_audit_task_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_audit_task/widgets/task_widget.dart';
import 'package:coteccons_app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ListAuditTask extends GetView<ListAuditTaskController> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    Color color = primaryColor;

    return Column(children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () {
              controller.goToAddScreen();
            },
            style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: color))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: color,
                ), // Replace `Icons.add` with your desired icon
                SizedBox(
                    width:
                        5), // Adjust the spacing between the icon and the button text
                Text(
                  "Thêm an toàn",
                  style: TextStyle(color: color),
                ), // Replace 'Add' with your desired button text
              ],
            ),
          )
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
                              Get.toNamed(Routes.AUDIT_TASK_DETAIL,
                                  arguments: task);
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
