import 'package:coteccons_app/modules/constructor-app/cons_home/cons_home.controller.dart';
import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/important_list/important_list_controller.dart';
import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/notification_list/notification_list_controller.dart';
import 'package:coteccons_app/modules/constructor-app/cons_home/widgets/public_task_list/public_task_controller.dart';
import 'package:get/get.dart';

class ConsHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConsHomeController());
    Get.put(PublicTaskListController());
    Get.put(ImportantListController());
    Get.put(NotificationListController());
  }
}
