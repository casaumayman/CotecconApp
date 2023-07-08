import 'package:coteccons_app/modules/update_task/update_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/modules/add_task/widgets/date_input.dart';
import 'package:coteccons_app/modules/add_task/widgets/dropdown_input.dart';
import 'package:coteccons_app/modules/add_task/widgets/number_input.dart';
import 'package:coteccons_app/modules/add_task/widgets/text_input.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class UpdateTaskScreen extends GetView<UpdateTaskController> {
  const UpdateTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      resizeToAvoidBottomInset: true,
      title: "Sửa công việc",
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
                  value: controller.projectId.value?.toString(),
                  disabled: true,
                  onChange: (id) {
                    controller.projectId.value = int.parse(id);
                  },
                )),
            // TextInput(label: "Dự án", value: controller.taskDetail.name),
            SizedBox(
              height: 10,
            ),
            Obx(() => DropDownInput(
                  items: controller.executors
                      .map((e) =>
                          DropdownItem(e.name ?? '', (e.id ?? 0).toString()))
                      .toList(),
                  label: "NTP/NCC",
                  value: controller.executorId.value?.toString(),
                  onChange: (id) {
                    controller.executorId.value = int.parse(id);
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
                    child: Obx(() => DateInput(
                          label: "Ngày bắt đầu",
                          value: controller.startTime.value,
                          onChange: (date) {
                            controller.startTime.value = date;
                          },
                        ))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Obx(() => DateInput(
                          label: "Ngày kết thúc",
                          value: controller.endTime.value,
                          onChange: (date) {
                            controller.endTime.value = date;
                          },
                        ))),
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
              child: Text("Cập nhật"),
              onPressed: controller.updateTask,
            )
          ],
        ),
      ),
    );
  }
}
