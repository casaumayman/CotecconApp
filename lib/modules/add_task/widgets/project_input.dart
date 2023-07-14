import 'package:coteccons_app/modules/add_task/add_task_controller.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectInput extends GetView<AddTaskController> {
  const ProjectInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropDownInput(
          items: controller.projects
              .map((p) => DropdownItem(p.name ?? '', (p.id ?? 0).toString()))
              .toList(),
          label: "Dự án",
          disabled: controller.parentTask?.projectId != null,
          value: controller.parentTask?.projectId.toString(),
          onChange: (id) {
            controller.projectId = int.parse(id);
          },
        ));
  }
}
