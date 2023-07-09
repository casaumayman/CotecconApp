import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:get/get.dart';

class ListAuditTaskController extends GetxController {
  final _auditTaskRepository = Get.find<AuditTaskRepository>();
  final tasks = RxList<AuditTask>();
  // final isCTCApp = false.obs;

  @override
  void onReady() {
    fetchData();
    // FlavorUtil.getFlavor().then((flavor) {
    //   if (flavor != null) {
    //     isCTCApp.value = flavor == Flavor.CTC;
    //   }
    // });
    super.onReady();
  }

  Future<void> fetchData() async {
    final task = await _auditTaskRepository.getList();
    tasks.clear();
    tasks.addAll(task ?? []);
  }

  Future<void> goToAddScreen() async {
    final data = await Get.toNamed(Routes.ADD_AUDIT);
    if (data == "success") {
      fetchData();
    }
  }
}
