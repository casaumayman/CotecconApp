import 'package:coteccons_app/api/repositories/task_repository.dart';
import 'package:coteccons_app/models/task.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:get/get.dart';

class ConsHomeController extends GetxController {
  final taskRepository = Get.find<TaskRepository>();
  final tasks = RxList<Task>();

  @override
  void onReady() {
    fetchData();
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
