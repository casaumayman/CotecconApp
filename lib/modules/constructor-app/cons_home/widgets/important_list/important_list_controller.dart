import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart';

class ImportantListController extends GetxController {
  final taskRepository = Get.find<TaskRepository>();
  final tasks = RxList<Task>();

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  Future<void> fetchData() async {
    final task = await taskRepository.getImportantList();
    tasks.clear();
    tasks.addAll(task ?? []);
  }
}
