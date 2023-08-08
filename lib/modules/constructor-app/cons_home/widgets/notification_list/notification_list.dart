import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/notification_list/notification_list_controller.dart';
import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationList extends GetView<NotificationListController> {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Thông báo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
      Expanded(
        child: SafeArea(
          top: false,
          child: RefreshIndicator(
              onRefresh: controller.fetchData,
              child: Obx(() {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: controller.notifications
                      .map((noti) => NotificationWidget(
                            notification: noti,
                          ))
                      .toList(),
                );
              })),
        ),
      ),
    ]);
  }
}
