import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required this.onPress,
  });

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    Color color = hexToColor("#01BEB7");
    return OutlinedButton(
      onPressed: onPress,
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
            'Thêm công việc',
            style: TextStyle(color: color),
          ), // Replace 'Add' with your desired button text
        ],
      ),
    );
  }
}
