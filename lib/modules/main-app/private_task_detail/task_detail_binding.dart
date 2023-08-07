import 'package:coteccons_app/modules/main-app/private_task_detail/task_detail_controller.dart';
import 'package:get/get.dart';

class PrivateTaskDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivateTaskDetailController());
  }
}
