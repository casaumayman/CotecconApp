import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SortTaskType { status, createdAt, completedAt, priority }

class SortTaskDialog extends StatelessWidget {
  SortTaskDialog({super.key});

  final Rx<SortTaskType?> _value = SortTaskType.priority.obs;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ưu tiên"),
      content: Obx(() => Column(mainAxisSize: MainAxisSize.min, children: [
            RadioListTile<SortTaskType>(
              title: const Text('Độ ưu tiên'),
              value: SortTaskType.priority,
              groupValue: _value.value,
              onChanged: (SortTaskType? value) {
                _value.value = value;
              },
            ),
            RadioListTile<SortTaskType>(
              title: const Text('Trạng thái'),
              value: SortTaskType.status,
              groupValue: _value.value,
              onChanged: (SortTaskType? value) {
                _value.value = value;
              },
            ),
            RadioListTile<SortTaskType>(
              title: const Text('Ngày tạo'),
              value: SortTaskType.createdAt,
              groupValue: _value.value,
              onChanged: (SortTaskType? value) {
                _value.value = value;
              },
            ),
            RadioListTile<SortTaskType>(
              title: const Text('Ngày hoàn thành'),
              value: SortTaskType.completedAt,
              groupValue: _value.value,
              onChanged: (SortTaskType? value) {
                _value.value = value;
              },
            ),
          ])),
      actions: [
        TextButton(
            onPressed: () {
              // _value.value = AddTaskType.public;
              Get.back();
            },
            child: Text(
              "Cancel",
            )),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK")),
      ],
    );
  }
}
