import 'package:coteccons_app/modules/private_task_detail/task_detail_controller.dart';
import 'package:get/get.dart';

class PrivateTaskDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivateTaskDetailController());
  }
}
