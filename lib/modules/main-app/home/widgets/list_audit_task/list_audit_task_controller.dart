import 'dart:async';

import 'package:coteccons_app/api/api.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:coteccons_app/routes/routes.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class ListAuditTaskController extends GetxController {
  final _homeController = Get.find<HomeController>();
  final _auditTaskRepository = Get.find<AuditTaskRepository>();
  final tasks = RxList<AuditTask>();

  List<AuditTask> _originTasks = [];

  late final StreamSubscription<String>? _listenSearchSubscript;
  late final StreamSubscription<SortTaskType?>? _listenSortSubscript;

  @override
  void onReady() {
    fetchData();
    _listenSearchSubscript = _homeController.searchText.listen((searchText) {
      _onSearch(searchText);
    });
    _listenSortSubscript = _homeController.sortType.listen((type) {
      if (type != null) {
        _onSort(type);
      }
    });
    super.onReady();
  }

  void _onSearch(String text) {
    final filteredTask =
        AuditTaskHelper.searchTask(originTasks: _originTasks, searchText: text);
    if (_homeController.sortType.value != null) {
      final sortedTask = AuditTaskHelper.sortTask(
          originTasks: filteredTask, type: _homeController.sortType.value!);
      tasks.clear();
      tasks.addAll(sortedTask);
      return;
    }
    tasks.clear();
    tasks.addAll(filteredTask);
  }

  void _onSort(SortTaskType type) {
    final sortedTask = AuditTaskHelper.sortTask(originTasks: tasks, type: type);
    tasks.clear();
    tasks.addAll(sortedTask);
  }

  Future<void> fetchData() async {
    _originTasks = await _auditTaskRepository.getList() ?? [];
    _onSearch(_homeController.searchText.value);
    if (_homeController.sortType.value != null) {
      _onSort(_homeController.sortType.value!);
    }
  }

  Future<void> goToAddScreen() async {
    final data = await Get.toNamed(Routes.ADD_AUDIT);
    if (data == "success") {
      fetchData();
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
