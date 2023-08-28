import 'package:flutter/material.dart';
import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class AddPrivateTaskController extends GetxController {
  final ProjectRepository _projectRepository = Get.find();
  final PrivateTaskRepository _privateTaskRepository = Get.find();
  final UserRepository _userRepository = Get.find();
  final projects = RxList<Project>();
  final executors = RxList<User>();
  final priority = "high".obs;

  var projectId = 0;
  var executorId = 0;
  DateTime? startTime;
  DateTime? endTime;
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final taskNameController = TextEditingController();
  final unitController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onReady() {
    _projectRepository.getList().then((value) {
      if (value == null) {
        return;
      }
      projects.addAll(value);
    });
    _userRepository.getUsers().then((value) {
      if (value == null) {
        return;
      }
      executors.addAll(value);
    });
    super.onReady();
  }

  void createTask() async {
    try {
      await _privateTaskRepository.create(CreateTaskRequest(
          name: taskNameController.text,
          endTime: endTime != null
              ? MyDateUtils.format(endTime!, format: "yyyy-MM-dd")
              : null,
          executorId: executorId,
          price: int.parse(priceController.text),
          projectId: projectId,
          unit: unitController.text,
          quantity: int.parse(quantityController.text),
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
