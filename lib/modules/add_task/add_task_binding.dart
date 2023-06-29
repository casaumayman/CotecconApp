import 'package:coteccons_app/modules/add_task/add_task_controller.dart';
import 'package:get/get.dart';

class AddTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddTaskController());
  }
}
