import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/utils/flavor_util.dart';
import 'package:get/get.dart';

class ListTaskController extends GetxController {
  final taskRepository = Get.find<TaskRepository>();
  final tasks = RxList<Task>();
  final isCTCApp = false.obs;

  @override
  void onReady() {
    fetchData();
    FlavorUtil.getFlavor().then((flavor) {
      if (flavor != null) {
        isCTCApp.value = flavor == Flavor.CTC;
      }
    });
    super.onReady();
  }

  Future<void> fetchData() async {
    final task = await taskRepository.getList();
    tasks.clear();
    tasks.addAll(task ?? []);
  }

  Future<void> goToAddScreen() async {
    final data = await Get.toNamed(Routes.ADD_TASK);
    if (data == "success") {
      fetchData();
    }
  }
}
