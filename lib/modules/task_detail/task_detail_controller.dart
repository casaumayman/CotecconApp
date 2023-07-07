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
  final Task task = Get.arguments;
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

  void openCamera() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      //send image
      _taskRepository.uploadTaskImage(task.id!, image).then((value) {
        fetchInfo();
        CommonWidget.toastSuccess("Thành công!");
      });
    }
  }

  void gotoEdit() async {
    if (taskDetail.value == null) {
      return;
    }
    Get.toNamed(Routes.UPDATE_TASK, arguments: taskDetail.value);
  }
}
