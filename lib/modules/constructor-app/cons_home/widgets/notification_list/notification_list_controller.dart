import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart';

class NotificationListController extends GetxController {
  final notificationRepository = Get.find<NotificationRepository>();
  final notifications = RxList<Notification>();

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  Future<void> fetchData() async {
    final task = await notificationRepository.getList();
    notifications.clear();
    notifications.addAll(task ?? []);
  }
}
