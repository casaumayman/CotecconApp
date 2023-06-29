import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final storage = Get.find<SharedPreferences>();
  final taskRepository = Get.find<TaskRepository>();
  final tasks = RxList<Task>();

  @override
  void onReady() {
    taskRepository.getList().then((taskList) {
      if (taskList != null) {
        tasks.addAll(taskList);
      }
    });
    super.onReady();
  }

  void logout() {
    storage.remove("token");
    Get.offNamed(Routes.LOGIN);
  }
}
