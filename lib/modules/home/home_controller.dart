import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var storage = Get.find<SharedPreferences>();
  List<Task> taskList = [];

  @override
  void onInit() {
    var timeNow = DateTime.now();
    for (var i = 0; i < 10; i++) {
      taskList.add(Task("Project alpha", "Contructor name", "Job $i", timeNow,
          timeNow.add(Duration(days: 3)), TaskStatus.wait_approve));
    }
    super.onInit();
  }

  void logout() {
    storage.remove("token");
    Get.offNamed(Routes.LOGIN);
  }
}
