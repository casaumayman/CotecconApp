import 'package:flutter_getx_boilerplate/shared/constants/enums.dart';

class TaskStatusUtils {
  static String toStringLabel(TaskStatus status) {
    switch (status) {
      case TaskStatus.doing:
        return "Đang thực hiện";
      case TaskStatus.done:
        return "Đã xong";
      case TaskStatus.wait_approve:
        return "Chờ duyệt";
      default:
        return "Unknown";
    }
  }
}
