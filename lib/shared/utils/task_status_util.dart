import 'package:coteccons_app/models/models.dart';

class TaskStatusUtils {
  static String toStringLabel(TaskStatus? status) {
    switch (status) {
      case TaskStatus.REQUESTED:
        return "Đã yêu cầu";
      case TaskStatus.ACCEPTED:
        return "Đã chấp nhận";
      case TaskStatus.CANCELED:
        return "Đã huỷ";
      case TaskStatus.COMPLETED:
        return "Đã hoàn thành";
      case TaskStatus.REJECTED:
        return "Đã từ chối";
      case TaskStatus.CREATED:
        return "Đã tạo";
      case TaskStatus.IMPLEMENTING:
        return "Đang thực hiện";
      default:
        return "";
    }
  }

  static String toStringJson(TaskStatus status) {
    const taskStatusEnumMap = {
      TaskStatus.REQUESTED: 'requested',
      TaskStatus.ACCEPTED: 'accepted',
      TaskStatus.REJECTED: 'rejected',
      TaskStatus.CANCELED: 'cancel',
      TaskStatus.COMPLETED: 'completed',
      TaskStatus.CREATED: 'created',
      TaskStatus.IMPLEMENTING: 'implementing',
    };
    return taskStatusEnumMap[status] ?? '';
  }
}
