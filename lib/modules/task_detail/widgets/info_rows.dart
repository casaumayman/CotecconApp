import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/widgets/info_row.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

class InfoRows extends StatelessWidget {
  const InfoRows({super.key, required this.task});

  final TaskDetail? task;

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, runSpacing: 10, children: [
      InfoRow(label: "Dự án", value: task?.name ?? ''),
      InfoRow(label: "Nhà thầu", value: task?.executorName ?? ''),
      InfoRow(label: "Số lượng", value: (task?.quantity ?? 0).toString()),
      InfoRow(label: "Đơn giá", value: (task?.price ?? 0).toString()),
      InfoRow(label: "Ngày bắt đầu", value: task?.startTime ?? ''),
      InfoRow(label: "Ngày kết thúc", value: task?.endTime ?? ''),
      InfoRow(
          label: "Trạng thái",
          value: TaskStatusUtils.toStringLabel(task?.status)),
    ]);
  }
}
