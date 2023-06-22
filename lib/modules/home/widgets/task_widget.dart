import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/modules/home/widgets/info_row.dart';
import 'package:flutter_getx_boilerplate/modules/home/widgets/status_row.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          InfoRow(label: "Tên việc", value: task.jobName),
          InfoRow(label: "Dự án", value: task.projectName),
          InfoRow(label: "Nhà thầu", value: task.contractor),
          InfoRow(
              label: "Ngày bắt đầu", value: MyDateUtils.format(task.startTime)),
          InfoRow(
              label: "Ngày kết thúc", value: MyDateUtils.format(task.endTime)),
          StatusRow(status: task.status),
        ]),
      ),
    );
  }
}
