import 'package:coteccons_app/modules/add_audit_task/add_audit_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class AddAuditTaskScreen extends GetView<AddAuditTaskController> {
  const AddAuditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      resizeToAvoidBottomInset: true,
      title: "Thêm kiểm soát",
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
            TextInput(
              label: "Tên công việc",
              controller: controller.taskNameController,
            ),
            SizedBox(
              height: 10,
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
