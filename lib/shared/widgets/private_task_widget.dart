import 'package:flutter/material.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PrivateTaskWidget extends StatelessWidget {
  const PrivateTaskWidget({super.key, required this.task, required this.onTap});

  final PrivateTask task;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = task.status == TaskStatus.IMPLEMENTING
        ? (task.priorityLevel == TaskPriority.HIGH
            ? hexToColor("#f8cecc")
            : hexToColor("##fff2cc"))
        : hexToColor("#f5f5f5");
    final textColor = Colors.black;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
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
                  fontWeight: FontWeight.bold, fontSize: 17, color: textColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              task.project?.name ?? '',
              style: TextStyle(color: textColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              task.executor?.name ?? '',
              style: TextStyle(color: textColor),
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
                      color: textColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${task.startTime} - ${task.endTime}",
                      style: TextStyle(color: textColor),
                    )
                  ],
                ),
                // TaskStatusWidget(status: task.status)
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: RatingBarIndicator(
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                rating: (task.star ?? 0).toDouble(),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
