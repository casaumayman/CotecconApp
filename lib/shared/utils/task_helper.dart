import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:tiengviet/tiengviet.dart';

class TaskHelper {
  static List<Task> searchTask(
      {required List<Task> originTasks, String searchText = ""}) {
    final filteredTask = originTasks.where((task) {
      final searchTextNormalize = TiengViet.parse(searchText);
      final matchProjectName = TiengViet.parse(task.projectName ?? "")
          .toUpperCase()
          .contains(searchTextNormalize.toUpperCase());
      final matchCreator = TiengViet.parse(task.creator?.name ?? "")
          .toUpperCase()
          .contains(searchTextNormalize.toUpperCase());
      final matchExecutor = TiengViet.parse(task.executor?.name ?? "")
          .toUpperCase()
          .contains(searchTextNormalize.toUpperCase());
      final matchAccepter = TiengViet.parse(task.acceptor?.name ?? "")
          .toUpperCase()
          .contains(searchTextNormalize.toUpperCase());
      final matchName = TiengViet.parse(task.name ?? "")
          .toUpperCase()
          .contains(searchText.toUpperCase());
      return matchAccepter ||
          matchName ||
          matchCreator ||
          matchExecutor ||
          matchProjectName;
    }).toList();
    return filteredTask;
  }

  static List<Task> sortTask(
      {required List<Task> originTasks, required SortTaskType type}) {
    switch (type) {
      case SortTaskType.priority:
        return _sortByRules(originTasks: originTasks, rules: [
          SortTaskType.priority,
          SortTaskType.status,
          SortTaskType.completedAt,
          SortTaskType.createdAt
        ]);
      case SortTaskType.status:
        return _sortByRules(originTasks: originTasks, rules: [
          SortTaskType.status,
          SortTaskType.priority,
          SortTaskType.completedAt,
          SortTaskType.createdAt
        ]);
      case SortTaskType.createdAt:
        return _sortByRules(originTasks: originTasks, rules: [
          SortTaskType.createdAt,
          SortTaskType.status,
          SortTaskType.priority,
          SortTaskType.completedAt
        ]);
      case SortTaskType.completedAt:
        return _sortByRules(originTasks: originTasks, rules: [
          SortTaskType.completedAt,
          SortTaskType.status,
          SortTaskType.priority,
          SortTaskType.createdAt
        ]);
      default:
        return List.from(originTasks);
    }
  }

  static int _getPriorityNumValue(TaskPriority? priority) {
    Map<TaskPriority?, int> _priorityValueMapping = {
      TaskPriority.HIGH: 3,
      TaskPriority.NORMAL: 2,
      TaskPriority.LOW: 1,
      TaskPriority.UNKNOWN: 0,
      null: 0,
    };
    return _priorityValueMapping[priority]!;
  }

  static int _getStatusNumValue(TaskStatus? status) {
    final completedStatus = [
      TaskStatus.COMPLETED,
      TaskStatus.ACCEPTED,
      TaskStatus.APPROVED
    ];
    if (completedStatus.contains(status)) {
      return 1;
    }
    return 0;
  }

  static Map<SortTaskType, int Function(Task, Task)> _ruleOperator = {
    SortTaskType.priority: (t1, t2) {
      return _getPriorityNumValue(t2.priorityLevel) -
          _getPriorityNumValue(t1.priorityLevel);
    },
    SortTaskType.status: (p0, p1) {
      return _getStatusNumValue(p0.status) - _getStatusNumValue(p1.status);
    },
    SortTaskType.createdAt: (p0, p1) {
      final date1 = p0.startTime != null ? DateTime.parse(p0.startTime!) : null;
      final date2 = p1.startTime != null ? DateTime.parse(p1.startTime!) : null;
      if (date1 == null || date2 == null) {
        return 0;
      }
      if (date1.isAfter(date2)) {
        return -1;
      } else if (date1.isBefore(date2)) {
        return 1;
      } else {
        return 0;
      }
    },
    SortTaskType.completedAt: (p0, p1) {
      final date1 = p0.endTime != null ? DateTime.parse(p0.endTime!) : null;
      final date2 = p1.endTime != null ? DateTime.parse(p1.endTime!) : null;
      if (date1 == null || date2 == null) {
        return 0;
      }
      if (date1.isAfter(date2)) {
        return -1;
      } else if (date1.isBefore(date2)) {
        return 1;
      } else {
        return 0;
      }
    }
  };

  static List<Task> _sortByRules(
      {required List<Task> originTasks, List<SortTaskType> rules = const []}) {
    List<Task> sortedList = List.from(originTasks);
    sortedList.sort((t1, t2) {
      for (final rule in rules) {
        final operator = _ruleOperator[rule];
        if (operator != null) {
          final compare = operator(t1, t2);
          if (compare != 0) {
            return compare;
          }
        }
      }
      return 0;
    });
    return sortedList;
  }
}
