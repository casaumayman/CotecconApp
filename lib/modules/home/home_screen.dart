import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/home/home.dart';
import 'package:flutter_getx_boilerplate/modules/home/widgets/add_task_button.dart';
import 'package:flutter_getx_boilerplate/modules/home/widgets/task_widget.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Công việc",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            AddTaskButton(
              onPress: () {
                Get.toNamed(Routes.ADD_TASK);
              },
            ),
          ],
        ),
        Expanded(
          child: SafeArea(
            top: false,
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView(
                padding: EdgeInsets.zero,
                children: controller.taskList
                    .map((task) => TaskWidget(task: task))
                    .toList(),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
