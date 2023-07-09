import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart';

class ListAuditTaskController extends GetxController {
  final _auditTaskRepository = Get.find<AuditTaskRepository>();
  final tasks = RxList<AuditTask>();
  // final isCTCApp = false.obs;

  @override
  void onReady() {
    _auditTaskRepository.getList().then((taskList) {
      if (taskList != null) {
        tasks.addAll(taskList);
      }
    });
    // FlavorUtil.getFlavor().then((flavor) {
    //   if (flavor != null) {
    //     isCTCApp.value = flavor == Flavor.CTC;
    //   }
    // });
    super.onReady();
  }
}
