import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/app_pages.dart';
import 'package:coteccons_app/shared/utils/flavor_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final storage = Get.find<SharedPreferences>();
  final taskRepository = Get.find<TaskRepository>();
  final tasks = RxList<Task>();
  final isCTCApp = false.obs;

  @override
  void onReady() {
    taskRepository.getList().then((taskList) {
      if (taskList != null) {
        tasks.addAll(taskList);
      }
    });
    FlavorUtil.getFlavor().then((flavor) {
      if (flavor != null) {
        isCTCApp.value = flavor == Flavor.CTC;
      }
    });
    super.onReady();
  }

  void logout() {
    storage.remove("token");
    Get.offNamed(Routes.LOGIN);
  }
}
