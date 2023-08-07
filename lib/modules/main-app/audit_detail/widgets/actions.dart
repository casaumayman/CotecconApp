import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/modules/main-app/audit_detail/audit_detail_controller.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends GetView<AuditDetailController> {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
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
}
