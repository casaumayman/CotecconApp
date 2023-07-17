import 'package:coteccons_app/modules/cons_home/cons_home.controller.dart';
import 'package:get/get.dart';

class ConsHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConsHomeController());
  }
}
