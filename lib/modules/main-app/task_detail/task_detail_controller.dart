import 'package:coteccons_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TaskDetailController extends GetxController {
  final TaskRepository _taskRepository = Get.find();
  int taskId = Get.arguments;
  final taskDetail = Rx<TaskDetail?>(null);
  final listComment = RxList<Comment>([]);

  final commentInputController = TextEditingController();

  @override
  void onReady() {
    fetchData();
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
    var star = 0;
    Get.dialog(AlertDialog(
      title: Text("Đánh giá"),
      actions: [
        ElevatedButton(
            onPressed: () {
              _taskRepository.changeStatus(taskId, status, star).then((value) {
                fetchInfo();
                CommonWidget.toastSuccess("Thành công!");
              });
              Get.back();
            },
            child: Text("OK"))
      ],
      content: Container(
        alignment: Alignment.center,
        height: 40,
        child: RatingBar.builder(
          onRatingUpdate: (count) {
            star = count.toInt();
          },
          allowHalfRating: false,
          direction: Axis.horizontal,
          minRating: 1,
          maxRating: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
      ),
    ));
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

  void remind() async {
    var remindMessage = "";
    Get.dialog(AlertDialog(
      title: Text("Nhắc nhở"),
      actions: [
        ElevatedButton(
            onPressed: () {
              _taskRepository.remind(taskId, remindMessage).then((value) {
                CommonWidget.toastSuccess("Thành công!");
              });
              Get.back();
            },
            child: Text("OK"))
      ],
      content: Container(
        child: TextField(
            autofocus: true,
            maxLines: 5,
            onChanged: (v) {
              remindMessage = v;
            },
            decoration: InputDecoration(border: OutlineInputBorder())),
      ),
    ));
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
