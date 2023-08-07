import 'package:coteccons_app/modules/constructor-app/cons_task_detail/cons_task_detail_controller.dart';
import 'package:get/get.dart';

class ConsTaskDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConsTaskDetailController());
  }
}
