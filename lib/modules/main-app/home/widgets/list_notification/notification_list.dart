import 'package:coteccons_app/modules/main-app/home/widgets/list_notification/notification_list_controller.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationList extends GetView<NotificationListController> {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
