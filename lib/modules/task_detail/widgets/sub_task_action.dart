import 'package:coteccons_app/modules/task_detail/task_detail_controller.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubTaskAction extends GetView<TaskDetailController> {
  const SubTaskAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() => controller.taskDetail.value?.parentTask != null
            ? ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.TASK_DETAIL,
                      arguments: controller.taskDetail.value!.parentTask!.id,
                      preventDuplicates: false);
                  // controller.fetchData();
                },
                child: Text("XEM NHIỆM VỤ CHÍNH"))
            : SizedBox()),
        Obx(() => controller.taskDetail.value?.childTask != null
            ? ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.TASK_DETAIL,
                      preventDuplicates: false,
                      // id: controller.taskDetail.value!.childTask!.id,
                      arguments: controller.taskDetail.value!.childTask!.id);
                  // controller.fetchData();
                },
                child: Text("XEM NHIỆM VỤ BA BÊN"))
            : SizedBox()),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_TASK,
                  arguments: controller.taskDetail.value);
            },
            child: Text("TẠO NHIỆM VỤ BA BÊN")),
      ],
    );
  }
}
