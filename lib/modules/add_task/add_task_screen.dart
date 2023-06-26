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
      title: "Thêm công việc",
      child: Column(
        children: [
          DropDownInput(
            items: [],
            label: "Dự án",
          ),
          SizedBox(
            height: 10,
          ),
          DropDownInput(
            items: [],
            label: "Nhà thầu",
          ),
          SizedBox(
            height: 10,
          ),
          TextInput(
            label: "Tên công việc",
          ),
          SizedBox(
            height: 10,
          ),
          NumberInput(
            label: "Số lượng",
          ),
          SizedBox(
            height: 10,
          ),
          NumberInput(
            label: "Đơn giá",
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: DateInput(label: "Ngày bắt đầu")),
              SizedBox(
                width: 10,
              ),
              Expanded(child: DateInput(label: "Ngày kết thúc")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          DropDownInput(
            items: [],
            label: "Trạng thái",
          ),
          Spacer(),
          SafeArea(
              child: Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  "Huỷ",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: ElevatedButton(
                child: Text("Tạo công việc"),
                onPressed: () {},
              )),
            ],
          ))
        ],
      ),
    );
  }
}
