import 'package:coteccons_app/modules/main-app/add_my_task/add_my_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class AddMyTaskScreen extends GetView<AddMyPrivateTaskController> {
  const AddMyTaskScreen({super.key});

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
                      .map((e) => DropdownItem(e.name ?? '', (e.id).toString()))
                      .toList(),
                  label: "Người thực hiện",
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
              label: "Số lượng tạm tính",
              controller: controller.quantityController,
            ),
            SizedBox(
              height: 10,
            ),
            NumberInput(
              label: "Đơn giá tạm tính",
              controller: controller.priceController,
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              label: "Đơn vị tính",
              controller: controller.unitController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: DateInput(
                  label: "Ngày bắt đầu",
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
            Obx(() => DropDownInput(
                  items: [
                    DropdownItem("Gấp", "high"),
                    DropdownItem("Bình thường", "normal"),
                    DropdownItem("Không ưu tiên", "low")
                  ],
                  label: "Độ ưu tiên",
                  onChange: (id) {
                    controller.priority.value = id;
                  },
                  value: controller.priority.value,
                )),
            SizedBox(
              height: 10,
            ),
            TextInput(
              label: "Ghi chú",
              controller: controller.descriptionController,
            ),
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
