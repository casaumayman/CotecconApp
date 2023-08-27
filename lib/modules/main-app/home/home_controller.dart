import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SortTaskType { status, createdAt, completedAt, priority }

class HomeController extends GetxController {
  final currentTabIndex = 0.obs;
  final searchController = TextEditingController();
  final Rx<SortTaskType?> sortType = SortTaskType.priority.obs;
  final searchText = "".obs;
  late final Worker tabIndexWorkder;

  // final

  @override
  void onInit() {
    tabIndexWorkder = ever(currentTabIndex, (callback) {});
    super.onInit();
  }

  void onSearch() {
    debugPrint("On search: ${searchController.text}");
    searchText.value = searchController.text;
  }

  void onSort(SortTaskType? type) {
    sortType.value = type;
    debugPrint("On sort: ${sortType.value}");
  }

  @override
  void onClose() {
    tabIndexWorkder.dispose();
    super.onClose();
  }
}
