import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task, required this.onTap});

  final Task task;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: hexToColor("#F9FBFC"),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              task.name ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: hexToColor("#171A1F")),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              task.project?.name ?? '',
              style: TextStyle(color: hexToColor("#9095A0")),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              task.executorName ?? '',
              style: TextStyle(color: hexToColor("#9095A0")),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 16,
                      color: hexToColor("#9095A0"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${task.startTime} - ${task.endTime}",
                      style: TextStyle(color: hexToColor("#9095A0")),
                    )
                  ],
                ),
                // TaskStatusWidget(status: task.status)
              ],
            )
          ]),
        ),
      ),
    );
  }
}
