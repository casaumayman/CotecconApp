import 'package:coteccons_app/routes/app_pages.dart';
import 'package:coteccons_app/shared/utils/flavor_util.dart';
import 'package:flutter/widgets.dart';
import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TaskDetailController extends GetxController {
  final TaskRepository _taskRepository = Get.find();
  int taskId = Get.arguments;
  final taskDetail = Rx<TaskDetail?>(null);
  final listComment = RxList<Comment>([]);

  final commentInputController = TextEditingController();
  final isCTCApp = false.obs;

  @override
  void onReady() {
    fetchData();
    FlavorUtil.getFlavor().then((flavor) {
      if (flavor != null) {
        isCTCApp.value = flavor == Flavor.CTC;
      }
    });
    super.onReady();
  }

  Future<void> fetchData() async {
    taskId = Get.arguments;
    await Future.wait([fetchInfo(), fetchCemments()]);
  }

  Future<void> fetchInfo() async {
    final taskRes = await _taskRepository.getDetail(taskId);
    taskDetail.value = taskRes;
  }

  Future<void> fetchCemments() async {
    final comments = await _taskRepository.getListComment(taskId);
    if (comments != null) {
      listComment.clear();
      listComment.addAll(comments);
    }
  }

  void sendComment(String message) {
    _taskRepository.sendComment(taskId, message).then((value) {
      fetchCemments();
      commentInputController.text = "";
    });
  }

  void changeStatus(TaskStatus status) {
    _taskRepository.changeStatus(taskId, status).then((value) {
      fetchInfo();
      CommonWidget.toastSuccess("Thành công!");
    });
  }

  void openCamera() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      //send image
      _taskRepository.uploadTaskImage(taskId, image).then((value) {
        fetchInfo();
        CommonWidget.toastSuccess("Thành công!");
      });
    }
  }

  void gotoEdit() async {
    if (taskDetail.value == null) {
      return;
    }
    final data =
        await Get.toNamed(Routes.UPDATE_TASK, arguments: taskDetail.value);
    if (data == "success") {
      fetchData();
    }
  }
}
