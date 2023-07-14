import 'package:flutter/material.dart';
import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class AddAuditTaskController extends GetxController {
  final ProjectRepository _projectRepository = Get.find();
  final AuditTaskRepository _taskRepository = Get.find();
  final projects = RxList<Project>();
  final executors = RxList<Executor>();
  final priority = "high".obs;

  var projectId = 0;
  var executorId = 0;
  DateTime? startTime;
  DateTime? endTime;
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final taskNameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onReady() {
    _projectRepository.getList().then((value) {
      if (value == null) {
        return;
      }
      projects.addAll(value);
    });
    super.onReady();
  }

  void createTask() async {
    try {
      await _taskRepository.create(CreateTaskRequest(
          name: taskNameController.text,
          endTime: endTime != null
              ? MyDateUtils.format(endTime!, format: "yyyy-MM-dd")
              : null,
          projectId: projectId,
          priorityLevel: priority.value,
          description: descriptionController.text,
          startTime: startTime != null
              ? MyDateUtils.format(startTime!, format: "yyyy-MM-dd")
              : null));
      CommonWidget.toastSuccess("Thêm công việc thành công!");
      Get.back(result: "success");
    } catch (e) {}
  }
}
