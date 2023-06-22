import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/home/home.dart';
import 'package:flutter_getx_boilerplate/modules/home/widgets/task_widget.dart';

import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("My Task"),
        actions: [
          IconButton(onPressed: controller.logout, icon: Icon(Icons.logout))
        ],
      ),
      body: ListView(
          children: controller.taskList
              .map((task) => TaskWidget(task: task))
              .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic here
          print('Button Pressed');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
