import 'package:coteccons_app/modules/main-app/home/home_controller.dart';
import 'package:coteccons_app/modules/main-app/home/widgets/sort_task_dialog.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolBar extends GetView<HomeController> {
  const ToolBar({super.key});

  static const _iconSize = 40.0;
  static const _spacing = 10.0;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: double.infinity,
      // height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Get.dialog(SortTaskDialog());
              },
              icon: Icon(
                Icons.sort,
                size: _iconSize,
                color: primaryColor,
              )),
          SizedBox(
            width: _spacing,
          ),
          Expanded(
              child: TextInput(
            controller: controller.searchController,
            placeholder: "Tên dự án, công việc, người phụ trách,...",
          )),
          SizedBox(
            width: _spacing,
          ),
          IconButton(
            onPressed: controller.onSearch,
            icon: Icon(
              Icons.search,
              size: _iconSize,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
