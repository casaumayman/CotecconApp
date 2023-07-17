import 'package:coteccons_app/modules/modules.dart';
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
        name: Routes.ADD_MY_PRIVATE_TASK,
        page: () => AddMyTaskScreen(),
        binding: AddMyTaskBinding()),
    GetPage(
        name: Routes.ADD_AUDIT,
        page: () => AddAuditTaskScreen(),
        binding: AddAuditTaskBinding()),
    GetPage(
        name: Routes.UPDATE_TASK,
        page: () => UpdateTaskScreen(),
        binding: UpdateTaskBinding()),
    GetPage(
        name: Routes.TASK_DETAIL,
        page: () => TaskDetailScreen(),
        binding: TaskDetailBinding()),
    GetPage(
        name: Routes.PRIVATE_TASK_DETAIL,
        page: () => PrivateTaskDetailScreen(),
        binding: PrivateTaskDetailBinding()),
    GetPage(
        name: Routes.AUDIT_TASK_DETAIL,
        page: () => AuditDetailScreen(),
        binding: AuditDetailBinding()),
    GetPage(
      name: Routes.IMAGE_VIEW,
      page: () => ImageViewScreen(),
    ),
  ];

  static final consRoutes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.LOGIN, page: () => LoginScreen(), binding: AuthBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => ConsHomeScreen(),
        binding: ConsHomeBinding()),
    GetPage(
        name: Routes.TASK_DETAIL,
        page: () => ConsTaskDetailScreen(),
        binding: ConsTaskDetailBinding()),
    GetPage(
      name: Routes.IMAGE_VIEW,
      page: () => ImageViewScreen(),
    ),
  ];
}
