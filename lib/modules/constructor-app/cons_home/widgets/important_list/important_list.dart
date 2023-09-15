import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/important_list/important_list_controller.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coteccons_app/shared/widgets/task_widget.dart';

class ImportantList extends GetView<ImportantListController> {
  const ImportantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Quan trọng",
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
    ]);
  }
}
