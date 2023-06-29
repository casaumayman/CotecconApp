import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
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
