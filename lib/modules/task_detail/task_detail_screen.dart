import 'package:flutter/material.dart';
import 'package:coteccons_app/models/task_detail.dart';
import 'package:coteccons_app/modules/task_detail/task_detail_controller.dart';
import 'package:coteccons_app/modules/task_detail/widgets/comments.dart';
import 'package:coteccons_app/modules/task_detail/widgets/images_input.dart';
import 'package:coteccons_app/modules/task_detail/widgets/info_rows.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class TaskDetailScreen extends GetView<TaskDetailController> {
  TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: controller.task.name,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => InfoRows(task: controller.taskDetail.value)),
            Obx(() {
              final listImg = (controller.taskDetail.value?.ownerImages ?? []);
              return ImagesInput(label: "Ảnh từ CTC", images: listImg);
            }),
            Obx(() {
              final listImg =
                  (controller.taskDetail.value?.executorImages ?? []);
              return ImagesInput(
                label: "Ảnh từ constructor",
                images: listImg,
                disabled: true,
              );
            }),
            Obx(() {
              final comments = controller.listComment.toList();
              return Comments(commemts: comments);
            }),
            SizedBox(
              height: 30,
            ),
            SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            controller.changeStatus(TaskStatus.REJECTED);
                          },
                          child: Text(
                            "Yêu cầu làm lại",
                            style: TextStyle(color: hexToColor("#081D4D")),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              controller.changeStatus(TaskStatus.ACCEPTED);
                            },
                            child: Text("Hoàn tất")))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
