import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  final ProjectRepository _projectRepository = Get.find();
  final ExecutorRepository _executorRepository = Get.find();
  final TaskRepository _taskRepository = Get.find();
  final projects = RxList<Project>();
  final executors = RxList<Executor>();

  var projectId = 0;
  var executorId = 0;
  DateTime? startTime;
  DateTime? endTime;
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final taskNameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void onReady() {
    _projectRepository.getList().then((value) {
      if (value == null) {
        return;
      }
      projects.addAll(value);
    });
    _executorRepository.getList().then((value) {
      if (value == null) {
        return;
      }
      executors.addAll(value);
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
          executorId: executorId,
          price: int.parse(priceController.text),
          projectId: projectId,
          quantity: int.parse(quantityController.text),
          startTime: startTime != null
              ? MyDateUtils.format(startTime!, format: "yyyy-MM-dd")
              : null));
      CommonWidget.toastSuccess("Thêm công việc thành công!");
      Get.back();
    } catch (e) {}
  }
}
