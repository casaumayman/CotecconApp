import 'package:coteccons_app/modules/add_my_task/add_my_task_controller.dart';
import 'package:get/get.dart';

class AddMyTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddMyTaskController());
  }
}