import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortTaskDialog extends GetView<HomeController> {
  SortTaskDialog({super.key});
  final Rx<SortTaskType?> _sortType = SortTaskType.priority.obs;

  @override
  Widget build(BuildContext context) {
    _sortType.value = controller.sortType.value;
    return AlertDialog(
      title: Text("Sắp xếp theo"),
      content: Obx(() {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          RadioListTile<SortTaskType>(
            title: const Text('Độ ưu tiên'),
            value: SortTaskType.priority,
            // groupValue: this._sortType,
            groupValue: _sortType.value,
            onChanged: (SortTaskType? value) {
              this._sortType.value = value;
            },
          ),
          RadioListTile<SortTaskType>(
            title: const Text('Trạng thái'),
            value: SortTaskType.status,
            groupValue: this._sortType.value,
            onChanged: (SortTaskType? value) {
              this._sortType.value = value;
            },
          ),
          RadioListTile<SortTaskType>(
            title: const Text('Ngày bắt đầu'),
            value: SortTaskType.createdAt,
            groupValue: this._sortType.value,
            onChanged: (SortTaskType? value) {
              this._sortType.value = value;
            },
          ),
          RadioListTile<SortTaskType>(
            title: const Text('Ngày kết thúc'),
            value: SortTaskType.completedAt,
            groupValue: this._sortType.value,
            onChanged: (SortTaskType? value) {
              this._sortType.value = value;
            },
          ),
        ]);
      }),
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
              controller.onSort(this._sortType.value);
            },
            child: Text("OK")),
      ],
    );
  }
}
