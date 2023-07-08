import 'package:coteccons_app/models/models.dart';

class TaskPriorityUtils {
  static String toStringLabel(TaskPriority? priority) {
    switch (priority) {
      case TaskPriority.HIGH:
        return "Gấp";
      case TaskPriority.NORMAL:
        return "Bình thường";
      case TaskPriority.LOW:
        return "Không ưu tiên";
      default:
        return "";
    }
  }

  static String toStringJson(TaskPriority priority) {
    const taskPriorityEnumMap = {
      TaskPriority.HIGH: 'high',
      TaskPriority.NORMAL: 'normal',
      TaskPriority.LOW: 'low',
      TaskPriority.UNKNOWN: 'unknown',
    };
    return taskPriorityEnumMap[priority] ?? '';
  }
}
