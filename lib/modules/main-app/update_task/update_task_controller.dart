import 'package:coteccons_app/models/request/update_task_request.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class UpdateTaskController extends GetxController {
  final ProjectRepository _projectRepository = Get.find();
  final ExecutorRepository _executorRepository = Get.find();
  final TaskRepository _taskRepository = Get.find();
  final TaskDetail taskDetail = Get.arguments;

  final projects = RxList<Project>();
  final executors = RxList<Executor>();
  final priority = "high".obs;
  final projectId = Rx<int?>(null);
  final executorId = Rx<int?>(null);
  final startTime = Rx<DateTime?>(null);
  final endTime = Rx<DateTime?>(null);

  final taskNameController = TextEditingController();
  final unitController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onReady() async {
    final serverData = await Future.wait(
        [_projectRepository.getList(), _executorRepository.getList()]);
    projects.addAll((serverData[0] as List<Project>?) ?? []);
    executors.addAll((serverData[1] as List<Executor>?) ?? []);
    _initValue();
    super.onReady();
  }

  void _initValue() {
    projectId.value = taskDetail.project?.id;
    executorId.value = taskDetail.executor?.id;
    taskNameController.text = taskDetail.name ?? "";
    quantityController.text = taskDetail.quantity?.toString() ?? "";
    priceController.text = taskDetail.price?.toString() ?? "";
    unitController.text = taskDetail.unit?.toString() ?? "";
    startTime.value = taskDetail.startTime != null
        ? DateTime.parse(taskDetail.startTime!)
        : null;
    endTime.value =
        taskDetail.endTime != null ? DateTime.parse(taskDetail.endTime!) : null;
    priority.value = taskDetail.priorityLevel != null
        ? TaskPriorityUtils.toStringJson(taskDetail.priorityLevel!)
        : "high";
    descriptionController.text = taskDetail.description ?? "";
  }

  void updateTask() async {
    try {
      await _taskRepository.update(
          taskDetail.id!,
          UpdateTaskRequest(
              name: taskNameController.text,
              endTime: endTime.value != null
                  ? MyDateUtils.format(endTime.value!, format: "yyyy-MM-dd")
                  : null,
              executorId: executorId.value,
              price: int.parse(priceController.text),
              unit: unitController.text,
              quantity: int.parse(quantityController.text),
              priorityLevel: priority.value,
              description: descriptionController.text,
              startTime: startTime.value != null
                  ? MyDateUtils.format(startTime.value!, format: "yyyy-MM-dd")
                  : null));
      CommonWidget.toastSuccess("Cập nhật công việc thành công!");
      Get.back(result: "success");
    } catch (e) {}
  }
}
