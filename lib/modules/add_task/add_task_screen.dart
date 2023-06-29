import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/add_task/add_task_controller.dart';
import 'package:flutter_getx_boilerplate/modules/add_task/widgets/date_input.dart';
import 'package:flutter_getx_boilerplate/modules/add_task/widgets/dropdown_input.dart';
import 'package:flutter_getx_boilerplate/modules/add_task/widgets/number_input.dart';
import 'package:flutter_getx_boilerplate/modules/add_task/widgets/text_input.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';

class AddTaskScreen extends GetView<AddTaskController> {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      resizeToAvoidBottomInset: true,
      title: "Thêm công việc",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => DropDownInput(
                  items: controller.projects
                      .map((p) =>
                          DropdownItem(p.name ?? '', (p.id ?? 0).toString()))
                      .toList(),
                  label: "Dự án",
                  onChange: (id) {
                    controller.projectId = int.parse(id);
                  },
                )),
            SizedBox(
              height: 10,
            ),
            Obx(() => DropDownInput(
                  items: controller.executors
                      .map((e) =>
                          DropdownItem(e.name ?? '', (e.id ?? 0).toString()))
                      .toList(),
                  label: "Nhà thầu",
                  onChange: (id) {
                    controller.executorId = int.parse(id);
                  },
                )),
            SizedBox(
              height: 10,
            ),
            TextInput(
              label: "Tên công việc",
              controller: controller.taskNameController,
            ),
            SizedBox(
              height: 10,
            ),
            NumberInput(
              label: "Số lượng",
              controller: controller.quantityController,
            ),
            SizedBox(
              height: 10,
            ),
            NumberInput(
              label: "Đơn giá",
              controller: controller.priceController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: DateInput(
                  label: "Ngày bắt đầu",
                  controller: controller.startTimeController,
                  onChange: (date) {
                    controller.startTime = date;
                  },
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: DateInput(
                  label: "Ngày kết thúc",
                  controller: controller.endTimeController,
                  onChange: (date) {
                    controller.endTime = date;
                  },
                )),
              ],
            ),
            // Spacer(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("Tạo công việc"),
              onPressed: controller.createTask,
            )
          ],
        ),
      ),
    );
  }
}
