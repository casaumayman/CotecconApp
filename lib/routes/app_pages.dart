import 'package:flutter_getx_boilerplate/modules/add_task/add_task.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/modules/home/home.dart';
import 'package:flutter_getx_boilerplate/modules/modules.dart';
import 'package:flutter_getx_boilerplate/modules/task_detail/task_detail.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.LOGIN, page: () => LoginScreen(), binding: AuthBinding()),
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: Routes.ADD_TASK,
        page: () => AddTaskScreen(),
        binding: AddTaskBinding()),
    GetPage(
        name: Routes.TASK_DETAIL,
        page: () => TaskDetailScreen(),
        binding: TaskDetailBinding()),
  ];
}
