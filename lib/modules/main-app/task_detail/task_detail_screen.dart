import 'package:coteccons_app/modules/main-app/task_detail/widgets/comments.dart';
import 'package:coteccons_app/modules/main-app/task_detail/widgets/sub_task_action.dart';
import 'package:coteccons_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/models/task_detail.dart';
import 'package:coteccons_app/modules/main-app/task_detail/task_detail_controller.dart';
import 'package:coteccons_app/modules/main-app/task_detail/widgets/info_rows.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class TaskDetailScreen extends GetView<TaskDetailController> {
  TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final listImgOwner = (controller.taskDetail.value?.ownerImages ?? []);
      final listImgExec = (controller.taskDetail.value?.executorImages ?? []);
      final comments = controller.listComment.toList();

      return BaseScreen(
        appBar: CustomAppBar(
            title: controller.taskDetail.value?.name ?? "",
            actionIcon: Icon(Icons.edit),
            actionLabel: "Sửa công việc",
            onAction: controller.gotoEdit),
        title: controller.taskDetail.value?.name,
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
                  disabled: false,
                  onTap: controller.openCamera,
                ),
                ImagesInput(
                  label: "Ảnh từ constructor",
                  images: listImgExec,
                  disabled: true,
                  onTap: controller.openCamera,
                ),
                Comments(commemts: comments),
                SizedBox(
                  height: 10,
                ),
                SubTaskAction(),
                // SizedBox(
                //   height: 30,
                // ),
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
        ),
      );
    });
  }
}
