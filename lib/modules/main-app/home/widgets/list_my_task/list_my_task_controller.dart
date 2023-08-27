import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:get/get.dart';

class ListMyTaskController extends GetxController {
  final _taskRepository = Get.find<TaskRepository>();
  final tasks = RxList<Task>();
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
    try {
      final task = await _taskRepository.getListMyTask();
      tasks.clear();
      tasks.addAll(task ?? []);
    } catch (e) {}
  }

  Future<void> goToAddScreen() async {
    final data = await Get.toNamed(Routes.ADD_MY_PRIVATE_TASK);
    if (data == "success") {
      fetchData();
    }
  }
}
