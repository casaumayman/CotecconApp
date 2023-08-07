import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_audit_task/list_audit_task_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_my_private_task/list_my_private_task_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_private_task/list_private_task.controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/list_task/list_task_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ListTaskController());
    Get.put(ListPrivateTaskController());
    Get.put(ListMyPrivateTaskController());
    Get.put(ListAuditTaskController());
  }
}
