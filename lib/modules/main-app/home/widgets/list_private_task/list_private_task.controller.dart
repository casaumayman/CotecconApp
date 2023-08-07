import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart';

class ListPrivateTaskController extends GetxController {
  final _privateTaskRepository = Get.find<PrivateTaskRepository>();
  final tasks = RxList<PrivateTask>();
  // final isCTCApp = false.obs;

  @override
  void onReady() {
    _privateTaskRepository.getList().then((taskList) {
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