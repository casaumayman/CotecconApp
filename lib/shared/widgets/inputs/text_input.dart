import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.label,
      this.value,
      this.controller,
      this.enabled});

  final String label;
  final String? value;
  final TextEditingController? controller;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      controller?.text = value!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
              color: hexToColor("#171A1F"), fontWeight: FontWeight.bold),
        ),
        Container(
          height: 40,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: hexToColor("#9095A0"))),
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              border: InputBorder.none,
              isDense: true,
            ),
            // textAlignVertical: TextAlignVertical.center,
          ),
        )
      ],
    );
  }
}
