import 'package:coteccons_app/modules/main-app/notification_detail/notification_detail_controller.dart';
import 'package:get/get.dart';

class NotificationDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NotificationDetailController());
  }
}
