import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));
    var storage = Get.find<SharedPreferences>();
    try {
      if (storage.getString(StorageConstants.token) != null) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    } catch (e) {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
