import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/modules/private_task_detail/task_detail_controller.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends GetView<PrivateTaskDetailController> {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.isOwn) {
      return Row(
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
      );
    }
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  controller.changeStatus(TaskStatus.ACCEPTED);
                },
                child: Text("Hoàn tất")))
      ],
    );
  }
}
