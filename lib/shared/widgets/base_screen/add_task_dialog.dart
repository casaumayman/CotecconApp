import 'package:coteccons_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AddTaskType { public, internal }

class AddtaskDialog extends StatelessWidget {
  AddtaskDialog({super.key});

  final Rx<AddTaskType?> _value = AddTaskType.public.obs;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Thêm việc"),
      content: Obx(() => Column(mainAxisSize: MainAxisSize.min, children: [
            RadioListTile<AddTaskType>(
              title: const Text('Việc nhà thầu'),
              value: AddTaskType.public,
              groupValue: _value.value,
              onChanged: (AddTaskType? value) {
                _value.value = value;
              },
            ),
            RadioListTile<AddTaskType>(
              title: const Text('Việc nội bộ'),
              value: AddTaskType.internal,
              groupValue: _value.value,
              onChanged: (AddTaskType? value) {
                _value.value = value;
              },
            ),
          ])),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel",
            )),
        TextButton(
            onPressed: () {
              Get.back();
              if (_value.value == AddTaskType.public) {
                Get.toNamed(Routes.ADD_TASK);
              } else {
                Get.toNamed(Routes.ADD_MY_PRIVATE_TASK);
              }
            },
            child: Text("OK")),
      ],
    );
  }
}
