import 'package:coteccons_app/modules/constructor-app/notification_detail/notification_detail_controller.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationDetailScreen extends GetView<NotificationDetailController> {
  const NotificationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final notification = controller.notification.value;
      return BaseScreen(
        title: controller.notification.value?.title ?? "",
        child: RefreshIndicator(
          onRefresh: controller.fetchData,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(direction: Axis.horizontal, runSpacing: 10, children: [
                  InfoRow(
                      label: "Người gửi",
                      value: notification?.sender.name ?? ''),
                  InfoRow(
                      label: "Ngày gửi", value: notification?.sendTime ?? ''),
                  InfoRow(label: "Tiêu đề", value: notification?.title ?? ''),
                ]),
                SizedBox(
                  height: 10,
                ),
                Text(notification?.message ?? ""),
                SizedBox(
                  height: 10,
                ),
                SafeArea(
                    top: false,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.gotoTaskDetail();
                        },
                        child: Text(
                          "XEM NHIỆM VỤ",
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
        ),
      );
    });
  }
}
