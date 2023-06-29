import 'package:flutter/widgets.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';

class TaskDetailController extends GetxController {
  final TaskRepository _taskRepository = Get.find();
  final Task task = Get.arguments;
  final taskDetail = Rx<TaskDetail?>(null);
  final listComment = RxList<Comment>([]);

  final commentInputController = TextEditingController();

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  void fetchData() {
    if (task.id == null) {
      return;
    }
    fetchInfo();
    fetchCemments();
  }

  void fetchInfo() {
    _taskRepository.getDetail(task.id!).then((taskRes) {
      if (taskRes == null) {
        return;
      }
      taskDetail.value = taskRes;
    });
  }

  void fetchCemments() {
    _taskRepository.getListComment(task.id!).then((comments) {
      if (comments != null) {
        listComment.clear();
        listComment.addAll(comments);
      }
    });
  }

  void sendComment(String message) {
    _taskRepository.sendComment(task.id!, message).then((value) {
      fetchCemments();
      commentInputController.text = "";
    });
  }

  void changeStatus(TaskStatus status) {
    _taskRepository.changeStatus(task.id!, status).then((value) {
      fetchInfo();
      CommonWidget.toastSuccess("Thành công!");
    });
  }
}
