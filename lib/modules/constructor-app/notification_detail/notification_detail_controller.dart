import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:get/get.dart';

class NotificationDetailController extends GetxController {
  final NotificationRepository _notiRepository = Get.find();
  int notificationId = Get.arguments;
  final notification = Rx<Notification?>(null);

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  Future<void> fetchData() async {
    final taskRes = await _notiRepository.getDetail(notificationId);
    notification.value = taskRes;
  }

  void gotoTaskDetail() async {
    if (notification.value?.publicTask.id == null) {
      return;
    }
    Get.toNamed(Routes.TASK_DETAIL,
        arguments: notification.value!.publicTask.id);
  }
}
