import 'package:coteccons_app/modules/update_task/update_task_controller.dart';
import 'package:get/get.dart';

class UpdateTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UpdateTaskController());
  }
}
