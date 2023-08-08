import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/models/models.dart' as Models;
import 'package:get/get.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notification});

  final Models.Notification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: hexToColor("#F9FBFC"),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.NOTIFICATION_DETAIL, arguments: notification.id);
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              notification.title ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: hexToColor("#171A1F")),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              notification.reviewText ?? '',
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
                      "${notification.sendTime}",
                      style: TextStyle(color: hexToColor("#9095A0")),
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
