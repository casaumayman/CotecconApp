import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/api/base_provider.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(BaseProvider().dio, permanent: true);
    Get.put(AuthRepository(), permanent: true);
  }
}
