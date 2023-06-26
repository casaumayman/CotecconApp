import 'package:flutter_getx_boilerplate/modules/task_detail/task_detail_controller.dart';
import 'package:get/get.dart';

class TaskDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TaskDetailController());
  }
}
