import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

class TaskStatusWidget extends StatelessWidget {
  const TaskStatusWidget({super.key, required this.status});

  final TaskStatus status;

  @override
  Widget build(BuildContext context) {
    String display = _displayText(status);
    return Chip(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      labelPadding: EdgeInsets.zero,
      label: Text(
        display,
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  String _displayText(TaskStatus status) {
    switch (status) {
      case TaskStatus.doing:
        return "Đang thực hiện";
      case TaskStatus.done:
        return "Đã xong";
      case TaskStatus.wait_approve:
        return "Chờ duyệt";
    }
  }
}
