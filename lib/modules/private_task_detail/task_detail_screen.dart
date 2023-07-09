import 'package:coteccons_app/modules/private_task_detail/task_detail_controller.dart';
import 'package:coteccons_app/modules/private_task_detail/widgets/actions.dart';
import 'package:coteccons_app/modules/private_task_detail/widgets/comments.dart';
import 'package:coteccons_app/modules/private_task_detail/widgets/info_rows.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class PrivateTaskDetailScreen extends GetView<PrivateTaskDetailController> {
  PrivateTaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final listImgOwner = (controller.taskDetail.value?.ownerImages ?? []);
      final listImgExec = (controller.taskDetail.value?.executorImages ?? []);
      final comments = controller.listComment.toList();

      return BaseScreen(
        title: controller.task.name,
        child: RefreshIndicator(
          onRefresh: controller.fetchData,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoRows(task: controller.taskDetail.value),
                ImagesInput(
                  label: "Ảnh từ CTC",
                  images: listImgOwner,
                  disabled: controller.isCTCApp.isFalse,
                  onTap: controller.openCamera,
                ),
                ImagesInput(
                  label: "Ảnh từ constructor",
                  images: listImgExec,
                  disabled: controller.isCTCApp.isTrue,
                  onTap: controller.openCamera,
                ),
                Comments(commemts: comments),
                SizedBox(
                  height: 30,
                ),
                SafeArea(top: false, child: ActionButtons())
              ],
            ),
          ),
        ),
      );
    });
  }
}
