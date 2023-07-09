import 'package:coteccons_app/modules/audit_detail/audit_detail_controller.dart';
import 'package:get/get.dart';

class AuditDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuditDetailController());
  }
}
