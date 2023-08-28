import 'dart:async';

import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class ListTaskController extends GetxController {
  final taskRepository = Get.find<TaskRepository>();
  final homeController = Get.find<HomeController>();
  final tasks = RxList<Task>();
  List<Task> _originTasks = [];
  late final StreamSubscription<String>? _listenSearchSubscript;
  late final StreamSubscription<SortTaskType?>? _listenSortSubscript;

  @override
  void onReady() {
    fetchData();
    _listenSearchSubscript = homeController.searchText.listen((searchText) {
      _onSearch(searchText);
    });
    _listenSortSubscript = homeController.sortType.listen((type) {
      if (type != null) {
        _onSort(type);
      }
    });
    super.onReady();
  }

  void _onSearch(String text) {
    final filteredTask =
        TaskHelper.searchTask(originTasks: _originTasks, searchText: text);
    if (homeController.sortType.value != null) {
      final sortedTask = TaskHelper.sortTask(
          originTasks: filteredTask, type: homeController.sortType.value!);
      tasks.clear();
      tasks.addAll(sortedTask);
      return;
    }
    tasks.clear();
    tasks.addAll(filteredTask);
  }

  void _onSort(SortTaskType type) {
    final sortedTask = TaskHelper.sortTask(originTasks: tasks, type: type);
    tasks.clear();
    tasks.addAll(sortedTask);
  }

  Future<void> fetchData() async {
    _originTasks = await taskRepository.getList() ?? [];
    _onSearch(homeController.searchText.value);
    if (homeController.sortType.value != null) {
      _onSort(homeController.sortType.value!);
    }
  }

  Future<void> goToAddScreen() async {
    final data = await Get.toNamed(Routes.ADD_TASK);
    if (data == "success") {
      fetchData();
      // Duration(m)
    }
  }

  @override
  void onClose() {
    if (_listenSearchSubscript != null) {
      _listenSearchSubscript!.cancel();
    }
    if (_listenSortSubscript != null) {
      _listenSortSubscript!.cancel();
    }
    super.onClose();
  }
}
