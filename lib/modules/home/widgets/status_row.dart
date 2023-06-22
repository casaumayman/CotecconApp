import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';

class StatusRow extends StatelessWidget {
  const StatusRow({super.key, required this.status});
  final TaskStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            "Trạng thái",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          flex: 30,
        ),
        Spacer(
          flex: 3,
        ),
        Expanded(flex: 70, child: TaskStatusWidget(status: status))
      ],
    );
  }
}
