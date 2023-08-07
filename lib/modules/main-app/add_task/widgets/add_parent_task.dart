import 'package:coteccons_app/modules/main-app/add_task/add_task_controller.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentTaskInput extends GetView<AddTaskController> {
  const ParentTaskInput({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.parentTask == null) {
      return SizedBox();
    }
    return TextInput(
      label: "ID công việc cha",
      enabled: false,
      value: controller.parentTask!.id.toString(),
      controller: controller.parentIdController,
    );
  }
}
