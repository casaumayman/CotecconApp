import 'package:coteccons_app/modules/constructor-app/cons_task_detail/cons_task_detail_controller.dart';
import 'package:coteccons_app/modules/constructor-app/cons_task_detail/widgets/info_rows.dart';
import 'package:coteccons_app/modules/constructor-app/cons_task_detail/widgets/comments.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/models/task_detail.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class ConsTaskDetailScreen extends GetView<ConsTaskDetailController> {
  ConsTaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final listImgOwner = (controller.taskDetail.value?.ownerImages ?? []);
      final listImgExec = (controller.taskDetail.value?.executorImages ?? []);
      final comments = controller.listComment.toList();

      return BaseScreen(
        title: controller.taskDetail.value?.name,
        child: RefreshIndicator(
          onRefresh: controller.fetchData,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InfoRows(task: controller.taskDetail.value),
                ImagesInput(
                  label: "Ảnh từ CTC",
                  images: listImgOwner,
                  disabled: true,
                  onTap: controller.openCamera,
                ),
                ImagesInput(
                  label: "Ảnh từ constructor",
                  images: listImgExec,
                  disabled: false,
                  onTap: controller.openCamera,
                ),
                Comments(commemts: comments),
                SizedBox(
                  height: 10,
                ),
                SafeArea(
                    top: false,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.changeStatus(TaskStatus.REQUESTED);
                        },
                        child: Text(
                          "Hoàn tất",
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
        ),
      );
    });
  }
}
