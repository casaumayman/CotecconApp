import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/models/comment.dart';
import 'package:flutter_getx_boilerplate/models/task.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/task_detail_controller.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/widgets/comments.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/widgets/images_input.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/widgets/info_rows.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';

class TaskDetailScreen extends GetView<TaskDetailController> {
  TaskDetailScreen({super.key});

  final Task task = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: task.jobName,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoRows(task: task),
            ImagesInput(label: "Ảnh từ CTC", images: [
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
            ]),
            ImagesInput(label: "Ảnh từ CON", disabled: true, images: [
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LftaBxgBW-4yUA1yDCQM98n2WGKtGxYyPama0WOG&s",
            ]),
            Comments(commemts: [
              Comment(
                  createdDate: DateTime.now(),
                  message: "Message 1",
                  userName: "Huy Tuan"),
              Comment(
                  createdDate: DateTime.now(),
                  message: "Message 2",
                  userName: "Huy Tuan 2")
            ]),
          ],
        ),
      ),
    );
  }
}
