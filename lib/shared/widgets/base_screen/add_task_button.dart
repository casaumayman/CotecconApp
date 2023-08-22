import 'package:coteccons_app/shared/widgets/base_screen/add_task_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    return OutlinedButton(
      onPressed: () {
        Get.dialog(AddtaskDialog(), barrierDismissible: false);
      },
      style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: color))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add_circle_outline,
            color: color,
          ), // Replace `Icons.add` with your desired icon
          SizedBox(
              width:
                  5), // Adjust the spacing between the icon and the button text
          Text(
            "Thêm việc",
            style: TextStyle(color: color),
          ), // Replace 'Add' with your desired button text
        ],
      ),
    );
  }
}
