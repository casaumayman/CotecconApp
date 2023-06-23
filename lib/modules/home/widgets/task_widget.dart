import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: hexToColor("#F9FBFC"),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            task.jobName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: hexToColor("#171A1F")),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            task.projectName,
            style: TextStyle(color: hexToColor("#9095A0")),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            task.contractor,
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
                    "${MyDateUtils.format(task.startTime)} - ${MyDateUtils.format(task.endTime)}",
                    style: TextStyle(color: hexToColor("#9095A0")),
                  )
                ],
              ),
              TaskStatusWidget(status: task.status)
            ],
          )
        ]),
      ),
    );
  }
}
