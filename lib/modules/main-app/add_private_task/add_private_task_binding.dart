import 'package:coteccons_app/modules/main-app/add_private_task/add_private_task_controller.dart';
import 'package:get/get.dart';

class AddPrivateTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddPrivateTaskController());
  }
}
