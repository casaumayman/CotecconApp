import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/models/task.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/widgets/info_row.dart';
import 'package:flutter_getx_boilerplate/shared/utils/utils.dart';

class InfoRows extends StatelessWidget {
  const InfoRows({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, runSpacing: 10, children: [
      InfoRow(label: "Dự án", value: task.projectName),
      InfoRow(label: "Nhà thầu", value: task.contractor),
      InfoRow(label: "Số lượng", value: task.jobName),
      InfoRow(label: "Đơn giá", value: task.jobName),
      InfoRow(label: "Ngày bắt đầu", value: MyDateUtils.format(task.startTime)),
      InfoRow(label: "Ngày kết thúc", value: MyDateUtils.format(task.endTime)),
      InfoRow(
          label: "Trạng thái",
          value: TaskStatusUtils.toStringLabel(task.status)),
    ]);
  }
}
