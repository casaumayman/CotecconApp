import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:get/get.dart';

class ListMyPrivateTaskController extends GetxController {
  final _privateTaskRepository = Get.find<PrivateTaskRepository>();
  final tasks = RxList<PrivateTask>();
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
    final task = await _privateTaskRepository.getList();
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
