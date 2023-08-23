import 'package:flutter/material.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';

class InfoRows extends StatelessWidget {
  const InfoRows({super.key, required this.task});

  final TaskDetail? task;

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, runSpacing: 10, children: [
      InfoRow(label: "Dự án", value: task?.name ?? ''),
      InfoRow(label: "Người thực hiện", value: task?.executor?.name ?? ''),
      InfoRow(
          label: "Số lượng tạm tính", value: (task?.quantity ?? 0).toString()),
      InfoRow(label: "Đơn giá tạm tính", value: (task?.price ?? 0).toString()),
      InfoRow(label: "Đơn vị tính", value: (task?.unit ?? 0).toString()),
      InfoRow(label: "Ngày bắt đầu", value: task?.startTime ?? ''),
      InfoRow(label: "Ngày kết thúc", value: task?.endTime ?? ''),
      InfoRow(
          label: "Trạng thái",
          value: TaskStatusUtils.toStringLabel(task?.status)),
      InfoRow(
          label: "Độ ưu tiên",
          value: TaskPriorityUtils.toStringLabel(task?.priorityLevel)),
      InfoRow(label: "Ghi chú", value: task?.description ?? '')
    ]);
  }
}
