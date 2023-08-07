import 'package:coteccons_app/modules/main-app/add_audit_task/add_audit_task_controller.dart';
import 'package:get/get.dart';

class AddAuditTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddAuditTaskController());
  }
}
